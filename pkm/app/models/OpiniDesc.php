<?php

class OpiniDesc extends Eloquent {
	protected $table = 'opini_desc';
	protected $fillable = array('desc');
	public $timestamps = false;
	
	public function opini() {
		return $this->belongsTo('Opini', 'opini_id', 'id');
	}
}