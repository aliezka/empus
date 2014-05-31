<?php

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;

class InstansiDesc extends Eloquent implements UserInterface, RemindableInterface {
	protected $table = 'instansi_desc';
	
	public function instansi() {
		return $this->belongsTo('Instansi', 'instansi_id', 'id');
	}
}