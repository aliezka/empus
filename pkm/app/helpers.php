<?php
	function beritaTag($Id) {
		$Berita = Berita::findOrFail($Id);
		$Return = null;

		foreach ($Berita->tag->all() as $count => $list) {
			$Return .= $count == 0 ? '' : ', ';
			if ($list->type == 'instansi') {
				$Res = Instansi::findOrFail($list->tag_id);
				$Return .= $Res->name;
			} else {
				$Res = Pelayanan::findOrFail($list->tag_id);
				$Return .= $Res->name;
			}
		}

		return $Return;
	}

	function getAnalytics(){
		$ga = new Gapi\Gapi('empusid@gmail.com','empus123456');

			$startDate = date ( 'Y-m-d', strtotime('-1 month' , strtotime ( date('Y-m-d'))));
			$endDate = date('Y-m-d');

			$data = $ga->requestReportData(88222517,array('date','year','month','day'),array('pageviews','visits'),'date',null,$startDate,$endDate);

			$aData = array();
			foreach ($data as $row) {
				$aData[] = array(
					'date'=>$row->getDate(),
					'year'=>$row->getYear(),
					'month'=>$row->getMonth(),
					'day'=>$row->getDay(),
					'pageViews'=>$row->getPageviews(),
					'visits'=>$row->getVisits());
			}

			$ga->requestReportData(88222517, 'year', array('pageviews', 'uniquePageviews', 'exitRate', 'avgTimeOnPage', 'entranceBounceRate'));

			$average = $ga->getResults();
			$arrAverage = array('pageviews'=>0, 'uniquePageviews'=>0, 'exitRate'=>0, 'avgTimeOnPage'=>0, 'entranceBounceRate'=>0);
			foreach($average as $avg){
				$arrAverage['pageviews'] += $avg->getPageviews();
				$arrAverage['uniquePageviews'] += $avg->getUniquepageviews();
				$arrAverage['avgTimeOnPage'] += $avg->getAvgtimeonpage();
				$arrAverage['entranceBounceRate'] += $avg->getEntrancebouncerate();
				$arrAverage['exitRate'] += $avg->getExitrate();
			}
			$data['average'] = $arrAverage;

			array_push($aData, $data['average']);

			echo json_encode($aData);
	}

	function routeClass()
	{
		$routeArray = Str::parseCallback(Route::currentRouteAction(), null);
	 
		if (last($routeArray) != null) {
			// Remove 'controller' from the controller name.
			$controller = str_replace('Controller', '', class_basename(head($routeArray)));
	 
			// Take out the method from the action.
			$action = str_replace(['get', 'post', 'patch', 'put', 'delete'], '', last($routeArray));
	 
			return Str::slug($controller . '-' . $action);
		}
	 
		return 'closure';
	}
