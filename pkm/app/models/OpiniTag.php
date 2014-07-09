<?php

class OpiniTag extends Eloquent {
	protected $table = 'opini_tag';
	public $timestamps = false;
	
	public function opini() {
		return $this->belongsTo('Opini', 'opini_id', 'id');
	}

	public function instansi() {
		return $this->belongsTo('Instansi', 'instansi_id', 'id');
	}
}