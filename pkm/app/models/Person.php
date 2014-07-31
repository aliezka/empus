<?php

class Person extends Eloquent {
	protected $table = 'person';
	protected $fillable = array('name');

	public function user() {
		return $this->hasMany('User', 'person_id', 'id');
	}

	public function instansi() {
		return $this->hasOne('Instansi', 'person_id');
	}

	public function opini() {
		return $this->hasMany('Opini', 'person_id', 'id');
	}

	public function img() {
		return $this->hasOne('PersonImg', 'person_id');
	}

	public function notification_involved() {
		return $this->hasMany('NotificationInvolved', 'person_id', 'id');
	}

	public function notification_history() {
		return $this->hasMany('NotificationHistory', 'person_id', 'id');
	}
}