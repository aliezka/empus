<?php

class InvolvedAs extends Eloquent {
	protected $table = 'involved_as';
	protected $fillable = array('involved_as');

	public function notification_list() {
		return $this->hasMany('NotificationList', 'role_id', 'id');
	}

	public function notification(){
		return $this->belongsToMany('Notification');
	}
}