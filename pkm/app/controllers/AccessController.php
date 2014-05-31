<?php

class AccessController extends BaseController {
	function __construct() {
		\Debugbar::enable();
	}

	public function login() {
		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('user.login');
	}

	public function sLogin() {
		$rules = array(
					'password' => 'required | min:6 ',
					'name' => 'min:3 | alpha_spaces '
				);

		$username = 
			empty(Input::get('name')) ? 
				array('username' => 'required | email ') : 
				array('username' => 'required | email | unique:user,email'); 
		
		$rules = $username + $rules;
		Debugbar::info($rules);
		
		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) { 
			Debugbar::info($validator->messages()->all());
			$Renderer = Debugbar::getJavascriptRenderer();
			
			Redirect::to('login')
				->withInput(Input::except('password'))
				->withErrors($validator);
		} else {
			if (!empty(Input::get('name'))) {
				$Person = new Person;
				$Person->name = Input::get('name');
				$Person->save();

				$User = new User;
				$User->username = $User->email = Input::get('username');
				$User->password = Hash::make(Input::get('password'));
				$User->person()->associate($Person);
				$User->save();

				$UserRole = new UserRole;
				$UserRole->user()->associate($User);
				// Citizen
				$UserRole->role_id = 2;
				$UserRole->Save();
			}

			$userData = array(
					'email' => Input::get('username'),
					'password' => Input::get('password')
				);

			Debugbar::info($userData);

			if (Auth::attempt($userData)) {
				Debugbar::info('Logged In');
				return Redirect::to('/');
			} else {
				Debugbar::info('Failed');
			}

			//return  Response::json(array('status' => 'OK', 'message' => 'Logged in'));
		}

		
		$Renderer = Debugbar::getJavascriptRenderer();

		Redirect::to('login')
				->withInput(Input::except('password'))
				->withErrors($validator);
	}
}