<?php

class Role extends Eloquent {
	protected $table = 'role';
	protected $fillable = array('role');

	public function user() {
		return $this->hasMany('UserRole', 'role_id', 'id');
	}
}