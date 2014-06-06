<?php

class Pelayanan extends Eloquent {
	protected $table = 'pelayanan';
	protected $fillable = array('name');
	public $timestamps = false;

	public function desc() {
		return $this->hasOne('PelayananDesc', 'pelayanan_id');
	}

	public function persyaratan() {
		return $this->hasMany('Persyaratan', 'pelayanan_id');
	}
}