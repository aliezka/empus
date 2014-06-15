<?php

class BeritaPelayanan extends Eloquent {
	protected $table = 'berita_pelayanan';
	protected $touches = array('berita');
	public $timestamps = false;

	public function berita() {
		return $this->belongsTo('Berita', 'berita_id', 'id');
	}

	public function pelayanan() {
		return $this->belongsTo('Pelayanan', 'pelayanan_id', 'id');
	}
}