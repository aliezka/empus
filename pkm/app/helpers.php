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

	function opiniTag($Id) {
		$OpiniTag = OpiniTag::where('opini_id', '=', $Id)->firstOrFail();
		$Return = null;
		$Res = null;

		if ($OpiniTag->type == 'instansi_pelayanan') {
			$Res = InstansiPelayanan::find($OpiniTag->tag_id)->pelayanan_id;
			$Res = Pelayanan::find($Res)->name;
		} 

		$Instansi = Instansi::find($OpiniTag->instansi_id)->name;
		$Res = is_null($Res) ? $Instansi : $Instansi.' - '.$Res;

		return $Res;
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

	function humanTiming ($time)
	{

	    $time = time() - $time; // to get the time since that moment

	    $tokens = array (
	        31536000 => 'tahun',
	        2592000 => 'bulan',
	        604800 => 'minggu',
	        86400 => 'hari',
	        3600 => 'jam',
	        60 => 'menit',
	        1 => 'detik'
	    );

	    foreach ($tokens as $unit => $text) {
	        if ($time < $unit) continue;
	        if ($time > 604800) 
		        return date("Y-m-d", $time);
	        $numberOfUnits = floor($time / $unit);
	        return $numberOfUnits.' '.$text;
	    }

	}

	function checkImage ($img, $type='') {
		if(!is_null($img) && file_exists(asset("assets/img/{$type}/{$img}"))) 
			return asset("assets/img/{$type}/{$img}");
		else
			return Config::get("empus.{$type}_img");
	}

	function checkImageThumb ($img, $type='') {
		if(!is_null($img) && file_exists(asset("assets/img/{$type}/{$img}"))) 
			return asset("assets/img/{$type}/{$img}");
		else
			return Config::get("empus.{$type}_thumb_img");
	}
