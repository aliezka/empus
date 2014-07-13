<?php

class PersonImg extends Eloquent{
	protected $table 	  = "person_img";
	protected $fillable   = array("img");
	public    $timestamps = false;

	public function person(){
		return $this->belongsTo('Person', 'person_id', 'id');
	}
}

?>