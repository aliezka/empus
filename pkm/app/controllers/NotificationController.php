<?php

class NotificationController extends BaseController {
	function __construct() {
		\Debugbar::disable();
	}

	function opini($Opini_id) {
		$Opini = Opini::findOrFail($Opini_id);
		$Message = 'Pengguna dengan nama '.$Opini->person->name.' ('.$Opini->person->user->username.') telah memasukan opini baru pada instansi '.$Opini->tag->instansi->name;

		$this->notify($Opini->id, $Message);
	}

	function komentar($Komentar_id) {
		$Komentar = Komentar::findOrFail($Komentar_id);
		$Message = "Pengguna dengan nama ".Auth::user()->person->name.' telah memasukan komentar baru pada opini "'.$Komentar->opini->title.'"';

		$this->notify($Komentar->opini->id, $Message);
	}

	function notify($Opini_id, $Message) {
		$Opini = Opini::findOrFail($Opini_id);

		$Notification = new Notification;
		$Notification->opini()->associate($Opini);
		$Notification->title = $Message;
		$Notification->save();

		// Instansi Holder
		$Holder = null;
		Auth::user()->role->contains(1)
		if (!empty($Opini->tag->instansi->person)) {
			if (!empty($Opini->tag->instansi->person)) {
				$Holder['person_id'] = $Opini->tag->instansi->person->id;
				$Holder['involved_as'] = 1;
				$Holder['notification_id'] = $Notification->id;
			}
		}

		// Reporter
		$Reporter = array();
		$Reporter['person_id'] = $Opini->person_id;
		$Reporter['involved_as'] = 2;
		$Reporter['notification_id'] = $Notification->id;

		// Commenters
		$Commenters = array();
		if ($Opini->person_id != Auth::user()->person_id) {
			$Reporter['person_id'] = $Opini->person_id;
			$Reporter['involved_as'] = 3;
			$Reporter['notification_id'] = $Notification->id;
		}

		// Involved
		$NotificationInvolved = new NotificationInvolved;
		$NotificationInvolved->insert(array($Reporter, $Holder, $Commenters));

		// History
		$Notif
	}
}