<?php

class Profile extends Eloquent {
	protected $table = 'profile';
	protected $fillable = array('profile');

	public function instansi() {
		return $this->hasMany('Instansi', 'profile_id', 'id');
	}
}