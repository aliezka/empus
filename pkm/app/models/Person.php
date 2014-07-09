<?php

class Person extends Eloquent {
	protected $table = 'person';
	protected $fillable = array('name');

	public function user() {
		return $this->hasOne('User', 'person_id');
	}

	public function instansi() {
		return $this->hasOne('Instansi', 'person_id');
	}

	public function opini() {
		return $this->hasMany('Opini', 'person_id', 'id');
	}
}