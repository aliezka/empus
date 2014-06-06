<?php

class ProsedurDesc extends Eloquent {
	protected $table = 'prosedur_desc';
	protected $fillable = array('desc');
	public $timestamps = false;
	
	public function prosedur() {
		return $this->belongsTo('Prosedur', 'prosedur_id', 'id');
	}
}