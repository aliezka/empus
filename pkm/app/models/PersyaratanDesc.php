<?php

class PersyaratanDesc extends Eloquent {
	protected $table = 'persyaratan_desc';
	protected $fillable = array('desc');
	public $timestamps = false;
	
	public function persyaratan() {
		return $this->belongsTo('Persyaratan', 'persyaratan_id', 'id');
	}
}