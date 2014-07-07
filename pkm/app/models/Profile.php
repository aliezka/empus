<?php

class Profile extends Eloquent {
	protected $table = 'profile';
	protected $fillable = array('text');

	public function instansi() {
		return $this->belongsToMany('Instansi', 'instansi_profile', 'instansi_id', 'profile_id');
	}

	public function instansi_list() {
		return $this->hasMany('InstansiProfile', 'profile_id');
	}
}