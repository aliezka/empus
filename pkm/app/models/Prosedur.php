<?php

class Prosedur extends Eloquent {
	protected $table = 'prosedur';
	protected $fillable = array('title', 'order');
	public $timestamps = false;

	public function pelayanan() {
		return $this->belongsTo('Pelayanan', 'pelayanan_id');
	}

	public function desc() {
		return $this->hasOne('ProsedurDesc', 'prosedur_id');
	}

	public function img() {
		return $this->hasOne('ProsedurImg', 'prosedur_id');
	}
}