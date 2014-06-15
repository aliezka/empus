<?php

class BeritaDesc extends Eloquent {
	protected $table = 'berita_desc';
	protected $fillable = array('desc');
	protected $touches = array('berita');
	public $timestamps = false;
	
	public function berita() {
		return $this->belongsTo('Berita', 'berita_id', 'id');
	}
}