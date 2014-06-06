<?php

class PersyaratanImg extends Eloquent {
	protected $table = 'persyaratan_img';
	protected $fillable = array('img');
	public $timestamps = false;

	public function persyaratan() {
		return $this->belongsTo('Persyaratan', 'persyaratan_id', 'id');
	}
}