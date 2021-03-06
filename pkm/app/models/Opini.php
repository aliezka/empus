<?php

class Opini extends Eloquent {
	protected $table = 'opini';
	protected $fillable = array('title', 'type');
	public $timestamps = false;

	public function instansi_pelayanan() {
		return $this->belongsToMany('InstansiPelayanan', 'opini_instansi_pelayanan', 'opini_id', 'instansi_pelayanan_id');
	}

	public function instansi_pelayanan_list() {
		return $this->hasMany('OpiniInstansiPelayanan', 'opini_id');
	}

	public function komentar() {
		return $this->hasMany('Komentar', 'opini_id');
	}

	public function role(){
		return $this->belongsToMany('Role', 'user_role', 'user_id', 'role_id');		
	}

	public function notification(){
		return $this->hasMany('Notification', 'opini_id');
	}

	public function person() {
		return $this->belongsTo('Person', 'person_id', 'id');
	}

	public function desc() {
		return $this->hasOne('OpiniDesc', 'opini_id');
	}

	public function img() {
		return $this->hasOne('OpiniImg', 'opini_id');
	}

	public function tag() {
		return $this->hasOne('OpiniTag', 'opini_id');
	}
}