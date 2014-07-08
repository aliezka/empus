<?php

class BeritaTag extends Eloquent {
	protected $table = 'berita_tag';
	public $timestamps = false;

	public function berita() {
		return $this->belongsTo('Berita', 'berita_id', 'id');
	}
}