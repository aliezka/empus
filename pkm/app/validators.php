<?php

// alphabetic with spaces
Validator::extend('alpha_spaces', function($attribute, $value) {
	return preg_match('/^[\pL\s]+$/u', $value);
});

// old password checker
Validator::extend('old_password', function($attribute, $value) {
	if (Auth::user()) {
		Log::info('value : '.$value);
		Log::info('auth : '.Auth::user()->password);
		Log::info('hash : '.var_dump(Hash::check($value, Auth::user()->password)));
		return Hash::check($value, Auth::user()->password);
	}
	
	return false;
});