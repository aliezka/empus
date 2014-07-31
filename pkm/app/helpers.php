<?php
	function notified($Opini_id, $User_id) {
		$NotificationHistory = new NotificationHistory;

		$Notification = Notification::where('opini_id', '=', $Opini_id)->first();
		$User = User::findOrFail($User_id);
		
		$Not = $NotificationHistory->where('person_id', '=', $User->person_id)->where('notification_id', '=', $Notification->id)->first();
		
		$Not->notified = true;
		$Not->save();
	}

	function nstatus($Opini_id) {
		$Opini = Opini::findOrFail($Opini_id);
		
		$Type = Config::get('empus.opini_type'); 
		$Status = Config::get('empus.opini_status'); 
		
		$Message = "Status ".$Type[$Opini->type]." '".$Opini->title."', telah dirubah menjadi '".$Status[$Opini->status]."'";

		notify($Opini->id, $Message);
	}

	function nopini($Opini_id) {
		$Opini = Opini::findOrFail($Opini_id);
		$Message = 'Pengguna dengan nama '.Auth::user()->person->name.' ('.Auth::user()->username.') telah memasukan opini baru pada instansi '.$Opini->tag->instansi->name;

		notify($Opini->id, $Message);
	}

	function nkomentar($Komentar_id) {
		$Komentar = Komentar::findOrFail($Komentar_id);
		$Message = "Pengguna dengan nama ".Auth::user()->person->name.' telah memasukan komentar baru pada opini "'.$Komentar->opini->title.'"';

		notify($Komentar->opini->id, $Message);
	}

	function notify($Opini_id, $Message) {
		$Opini = Opini::findOrFail($Opini_id);

		$Notification = new Notification;
		if ($Not = $Notification->where('opini_id', '=', $Opini_id)->first()) {
			$Not->title = $Message;
			$Not->save();

			$Not->touch();
			$Notification = $Not;
		} else {
			$Notification->opini()->associate($Opini);
			$Notification->title = $Message;
			$Notification->save();
		}

		$NotificationInvolved = new NotificationInvolved;

		// Reporter
		if (!$Notification->involved->contains(1) && !$Notification->involved->contains(2)) {
			$Reporter = array();

			$Reporter['person_id'] = Auth::user()->person_id;
			$Reporter['involved_as_id'] = 2;
			$Reporter['notification_id'] = $Notification->id;

			$NotificationInvolved->insert($Reporter);
		}

		// Instansi Holder
		if (!$Notification->involved->contains(1)) {
			if (is_object($Opini->tag->instansi)) {
				if (is_object($Opini->tag->instansi->person)) {
					$Holder = array();

					$Holder['person_id'] = $Opini->tag->instansi->person->id;
					$Holder['involved_as_id'] = 1;
					$Holder['notification_id'] = $Notification->id;

					$NotificationInvolved->insert($Holder);
				}
			}
		} else {
			$Not = $Notification->involved_list()->where('involved_as_id', '=', 1)->first();
			if ($Not->person_id != $Opini->tag->instansi->person->id) {
				$Not->person_id = $Opini->tag->instansi->person->id;
				$Not->save();
			}
		}

		// Commenters
		$Reporter = $Notification->involved_list()->where('person_id', '=', Auth::user()->person_id)->first();
		if (!$Reporter) {
			$Commenters = array();
			
			$Commenters['person_id'] = Auth::user()->person_id;
			$Commenters['involved_as'] = 3;
			$Commenters['notification_id'] = $Notification->id;

			$NotificationInvolved->insert($Holder);
		}

		// History
		$NotificationHistory = new NotificationHistory;
		foreach ($NotificationInvolved->where('notification_id', '=', $Notification->id)->get() as $Each) {
			//var_dump($Each);
			$Notify = $NotificationHistory->where('notification_id', '=', $Notification->id)->where('person_id', '=', $Each->person_id)->first();
			if (!$Notify) {
				if ($Each->person_id != Auth::user()->person_id) {
					$Row = array();
					$Row['notification_id'] = $Notification->id;
					$Row['person_id'] = $Each->person_id;

					$NotificationHistory->insert($Row);
				}
			} else {
				if ($Notify->person_id != Auth::user()->person_id) {
					$Notify->notified = false;
					$Notify->save();
					$Notify->touch();
				}
			}
		}
	}

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
	    $diffTime = time() - $time; // to get the time since that moment
	    $tokens = array (
	        31536000 => 'tahun',
	        2592000 => 'bulan',
	        604800 => 'minggu',
	        86400 => 'hari',
	        3600 => 'jam',
	        60 => 'menit',
	        1 => 'detik'
	    );
	    $diffTime = abs($diffTime);
	    foreach ($tokens as $unit => $text) {
	        if ($diffTime < $unit) continue;
	        if ($diffTime > 604800) 
		        return date("d M Y", $time);

	        $numberOfUnits = floor($diffTime / $unit);
	        return $numberOfUnits.' '.$text.' yang lalu';
	    }

	}

	function checkImage ($img, $type='') {
		if(!is_null($img) && file_exists(public_path()."/assets/img/{$type}/{$img}")) 
			return asset("assets/img/{$type}/{$img}");
		else
			return Config::get("empus.{$type}_img");
	}

	function checkImageThumb ($img, $type='') {
		if(!is_null($img) && file_exists(public_path()."/assets/img/{$type}/{$img}")) 
			return asset("assets/img/{$type}/{$img}");
		else
			return Config::get("empus.{$type}_thumb_img");
	}
