<?php

class InstansiDesc extends Eloquent {
	protected $table = 'instansi_desc';
	protected $fillable = array('desc');
	public $timestamps = false;
	
	public function instansi() {
		return $this->belongsTo('Instansi', 'instansi_id', 'id');
	}
}