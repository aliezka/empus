<?php

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;

class InstansiImg extends Eloquent implements UserInterface, RemindableInterface {
	protected $table = 'instansi_img';

	public function instansi() {
		return $this->belongsTo('Instansi', 'instansi_id', 'id');
	}
}