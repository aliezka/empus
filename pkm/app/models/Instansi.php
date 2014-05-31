<?php

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;

class Instansi extends Eloquent implements UserInterface, RemindableInterface {
	protected $table = 'instansi';
	protected $fillable = array('name');

	public function pelayanan() {
		return $this->hasMany('InstansiPelayanan', 'pelayanan_id');
	}

	public function desc() {
		return $this->hasOne('InstansiDesc', 'instansi_id');
	}

	public function img() {
		return $this->hasOne('InstansiImg', 'instansi_id');
	}
}