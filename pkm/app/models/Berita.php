<?php

class Berita extends Eloquent {
	protected $table = 'berita';
	protected $fillable = array('title');
	public $timestamps = true;

	public function pelayanan() {
		return $this->belongsToMany('Pelayanan', 'berita_pelayanan', 'berita_id', 'pelayanan_id');
	}

	public function instansi() {
		return $this->belongsToMany('Instansi', 'berita_instansi', 'berita_id', 'instansi_id');
	}

	public function pelayanan_list() {
		return $this->hasMany('BeritaPelayanan', 'berita_id');
	}

	public function instansi_list() {
		return $this->hasMany('BeritaInstansi', 'berita_id');
	}

	public function desc() {
		return $this->hasOne('BeritaDesc', 'berita_id');
	}

	public function img() {
		return $this->hasOne('BeritaImg', 'berita_id');
	}
}