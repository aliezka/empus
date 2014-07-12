<?php

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;

class User extends Eloquent implements UserInterface, RemindableInterface {

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'user';

	/**
	 * The attributes excluded from the model's JSON form.
	 *
	 * @var array
	 */
	protected $hidden = array('password');

	/**
	 * Get the unique identifier for the user.
	 *
	 * @return mixed
	 */
	public function getAuthIdentifier()
	{
		return $this->getKey();
	}

	/**
	 * Get the password for the user.
	 *
	 * @return string
	 */
	public function getAuthPassword()
	{
		return $this->password;
	}

	/**
	 * Get the e-mail address where password reminders are sent.
	 *
	 * @return string
	 */
	public function getReminderEmail()
	{
		return $this->email;
	}

	/*
	Auth Addition
	*/

	public function getRememberToken() {
		return $this->remember_token;
	}

	public function setRememberToken($value) {
		$this->remember_token = $value;
	}

	public function getRememberTokenName() {
		return 'remember_token';
	}

	/*
	End Auth Addition
	*/

	/*
	Relating Model
	*/

	public function person() {
		return $this->belongsTo('Person', 'person_id');
	}

	public function rolList() {
		return $this->hasMany('UserRole', 'user_id', 'id');
	}

	public function role(){
		return $this->belongsToMany('Role', 'user_role', 'user_id', 'role_id');		
	}

	/*
	End Relating Model
	*/

	/**
	* Check if user has role
	* @param $r role to be checked
	* @return boole
	*/
	public function hasRole($r=""){
		$array[]=array();
		foreach($this->roles as $role)
			$array[] = $role->role;
		return in_array($r,$array);
	}
}