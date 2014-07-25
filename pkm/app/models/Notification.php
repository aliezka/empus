<?php

class Notification extends Eloquent {
	protected $table = 'notification';
	protected $fillable = array('title');
	public $timestamps = true;

	public function opini() {
		return $this->belongsTo('Opini', 'opini_id', 'id');
	}

	public function involved() {
		return $this->belongsToMany('InvolvedAs', 'notification_involved', 'notification_id', 'involved_as_id');8
	}

	public function person() {
		return $this->belongsToMany('Person', 'notification_involved', '');
	}

	public function involved_list() {
		return $this->hasMany('NotificationInvolved', 'notification_id');
	}

	public function history() {
		return $this->hasMany('NotificationHistory', 'notification_id');
	}
}