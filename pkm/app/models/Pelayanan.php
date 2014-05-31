<?php

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;

class Pelayanan extends Eloquent implements UserInterface, RemindableInterface {
	protected $table = 'pelayanan';
	protected $fillable = array('name');
}