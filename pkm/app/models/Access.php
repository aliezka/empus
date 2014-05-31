<?php

class Access extends Eloquent {
	protected $table = 'access';

	public function user() {
		return $this->hasOne('Person', 'id');
	}

	public function role() {
		return $this->hasOne('Role', 'id');
	}
}