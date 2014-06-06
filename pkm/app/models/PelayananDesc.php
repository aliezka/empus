<?php

class PelayananDesc extends Eloquent {
	protected $table = 'pelayanan_desc';
	protected $fillable = array('desc');
	public $timestamps = false;
	
	public function pelayanan() {
		return $this->belongsTo('Pelayanan', 'pelayanan_id', 'id');
	}
}