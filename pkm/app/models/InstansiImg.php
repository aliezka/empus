<?php

class InstansiImg extends Eloquent {
	protected $table = 'instansi_img';
	protected $fillable = array('img');
	public $timestamps = false;

	public function instansi() {
		return $this->belongsTo('Instansi', 'instansi_id', 'id');
	}
}