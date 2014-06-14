<?php

class KomentarDesc extends Eloquent {
	protected $table = 'komentar_desc';
	protected $fillable = array('desc');
	public $timestamps = false;
	protected $touches = array('komentar');
	
	public function komentar() {
		return $this->belongsTo('Komentar', 'komentar_id', 'id');
	}
}