<?php

class UserRole extends Eloquent {
	protected $table = 'user_role';
	protected $touches = array('user');
	public $timestamps = false;

	public function user() {
		return $this->belongsTo('User', 'user_id', 'id');
	}

	public function role() {
		return $this->belongsTo('Role', 'role_id', 'id');
	}
}