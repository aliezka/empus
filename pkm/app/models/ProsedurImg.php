<?php

class ProsedurImg extends Eloquent {
	protected $table = 'prosedur_img';
	protected $fillable = array('img');
	public $timestamps = false;

	public function prosedur() {
		return $this->belongsTo('Prosedur', 'prosedur_id', 'id');
	}
}