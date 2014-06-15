<?php

class Pelayanan extends Eloquent {
	protected $table = 'pelayanan';
	protected $fillable = array('name');
	public $timestamps = false;

	public function berita() {
		return $this->belongsToMany('Berita', 'berita_pelayanan', 'pelayanan_id', 'berita_id');
	}

	public function berita_list() {
		return $this->hasMany('BeritaPelayanan', 'pelayanan_id');
	}

	public function desc() {
		return $this->hasOne('PelayananDesc', 'pelayanan_id');
	}

	public function persyaratan() {
		return $this->hasMany('Persyaratan', 'pelayanan_id');
	}
}