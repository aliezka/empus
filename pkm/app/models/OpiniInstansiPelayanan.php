<?php

class OpiniInstansiPelayanan extends Eloquent {
	protected $table = 'opini_instansi_pelayanan';
	protected $fillable = array('pelayanan_id');
	public $timestamps = false;

	public function opini() {
		return $this->belongsTo('opini', 'opini_id', 'id');
	}

	public function instansi_pelayanan() {
		return $this->belongsTo('InstansiPelayanan', 'instansi_pelayanan_id', 'id');
	}
}