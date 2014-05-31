<?php

class Person extends Eloquent {
	protected $table = 'person';
	protected $fillable = array('name');

	public function user() {
		return $this->hasOne('User', 'person_id');
	}
}