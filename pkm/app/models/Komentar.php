<?php

class Komentar extends Eloquent {
	protected $table = 'komentar';
	public $timestamps = true;

	public function opini() {
		return $this->belongsTo('Opini', 'opini_id');
	}

	public function person() {
		return $this->belongsTo('Person', 'person_id');
	}
	
	public function desc() {
		return $this->hasOne('KomentarDesc', 'komentar_id');
	}

	public function img() {
		return $this->hasOne('KomentarImg', 'komentar_id');
	}
}