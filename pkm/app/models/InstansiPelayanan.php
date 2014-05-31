<?php

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;

class InstansiPelayanan extends Eloquent implements UserInterface, RemindableInterface {
	protected $table = 'instansi_pelayanan';

	public function insList() {
		return $this->belongsTo('Instansi', 'instansi_id', 'id');
	}

	public function pelList() {
		return $this->belongsTo('Pelayanan', 'pelayanan_id', 'id');
	}
}