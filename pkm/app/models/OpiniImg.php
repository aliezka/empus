<?php

class OpiniImg extends Eloquent {
	protected $table = 'opini_img';
	protected $fillable = array('img');
	public $timestamps = false;

	public function opini() {
		return $this->belongsTo('Opini', 'opini_id', 'id');
	}
}