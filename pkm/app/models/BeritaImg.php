<?php

class BeritaImg extends Eloquent {
	protected $table = 'berita_img';
	protected $fillable = array('img');
	protected $touches = array('berita');
	public $timestamps = false;

	public function berita() {
		return $this->belongsTo('Berita', 'berita_id', 'id');
	}
}