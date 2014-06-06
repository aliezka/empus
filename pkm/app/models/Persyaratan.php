<?php

class Persyaratan extends Eloquent {
	protected $table = 'persyaratan';
	protected $fillable = array('title', 'order');
	public $timestamps = false;

	public function pelayanan() {
		return $this->belongsTo('Pelayanan', 'pelayanan_id');
	}
	
	public function desc() {
		return $this->hasOne('PersyaratanDesc', 'persyaratan_id');
	}

	public function img() {
		return $this->hasOne('PersyaratanImg', 'persyaratan_id');
	}
}