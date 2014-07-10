<?php

class OpiniInstansi extends Eloquent {
	protected $table = 'opini_instansi';
	protected $fillable = array('pelayanan_id');
	public $timestamps = false;

	public function opini() {
		return $this->belongsTo('opini', 'opini_id', 'id');
	}

	public function instansi() {
		return $this->belongsTo('Instansi', 'instansi_id', 'id');
	}
}