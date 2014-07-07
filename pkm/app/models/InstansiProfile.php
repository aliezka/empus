<?php

class InstansiProfile extends Eloquent {
	protected $table = 'instansi_profile';
	protected $fillable = array('text');
	public $timestamps = false;

	public function instansi() {
		return $this->belongsTo('Instansi', 'instansi_id', 'id');
	}

	public function profile() {
		return $this->belongsTo('Profile', 'profile_id', 'id');
	}
}