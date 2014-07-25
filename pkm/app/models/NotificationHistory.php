<?php

class NotificationHistory extends Eloquent {
	protected $table = 'notification_history';
	protected $fillable = array('notified');
	public $timestamps = true;

	public function notification() {
		return $this->belongsTo('Notification', 'notification_id', 'id');
	}

	public function person() {
		return $this->belongsTo('Person', 'person_id', 'id');
	}
}