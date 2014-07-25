<?php

class NotificationInvolved extends Eloquent {
	protected $table = 'notification_involved';
	protected $fillable = array('involved_as', 'notified');
	public $timestamps = true;

	public function notification() {
		return $this->belongsTo('Notification', 'notification_id', 'id');
	}

	public function person() {
		return $this->belongsTo('Person', 'person_id', 'id');
	}
}