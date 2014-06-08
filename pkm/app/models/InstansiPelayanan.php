<?php

class InstansiPelayanan extends Eloquent {
	protected $table = 'instansi_pelayanan';
	protected $fillable = array('pelayanan_id');
	public $timestamps = false;

	public function instansi() {
		return $this->belongsTo('Instansi', 'instansi_id', 'id');
	}

	public function pelayanan() {
		return $this->belongsTo('Pelayanan', 'pelayanan_id', 'id');
	}
}