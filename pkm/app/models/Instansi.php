<?php

class Instansi extends Eloquent {
	protected $table = 'instansi';
	protected $fillable = array('name');
	public $timestamps = false;

	public function pelayanan() {
		return $this->belongsToMany('Pelayanan', 'instansi_pelayanan', 'instansi_id', 'pelayanan_id');
	}

	public function pelList() {
		return $this->hasMany('InstansiPelayanan', 'instansi_id');
	}

	public function desc() {
		return $this->hasOne('InstansiDesc', 'instansi_id');
	}

	public function img() {
		return $this->hasOne('InstansiImg', 'instansi_id');
	}
}