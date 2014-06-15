<?php

class BeritaInstansi extends Eloquent {
	protected $table = 'berita_instansi';
	protected $touches = array('berita');
	public $timestamps = false;

	public function berita() {
		return $this->belongsTo('Berita', 'berita_id', 'id');
	}

	public function instansi() {
		return $this->belongsTo('Instansi', 'instansi_id', 'id');
	}
}