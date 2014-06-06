<?php

class PelayananImg extends Eloquent {
	protected $table = 'pelayanan_img';
	protected $fillable = array('img');
	public $timestamps = false;

	public function pelayanan() {
		return $this->belongsTo('Pelayanan', 'pelayanan_id', 'id');
	}
}