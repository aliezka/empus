<?php

class AccessController extends BaseController {
	function __construct() {
		\Debugbar::disable();
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
			
			return Redirect::to('login')
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

		return Redirect::to('login')
				->withInput(Input::except('password'))
				->with('message', 'Username atau password tidak cocok.');
	}

	public function register() {
		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('user.register');
	}

	public function sRegister() {
		$rules = array(
					'name' => ' required | alpha_spaces | min:3 ',
					'username' => ' required | email | unique:user,email',
					'password' => ' required | min:6 | confirmed:password_confirmation '
				);
		
		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) { 
			Debugbar::info($validator->messages()->all());
			$Renderer = Debugbar::getJavascriptRenderer();
			
			return Redirect::to('register')
				->withInput(Input::except('password'))
				->withErrors($validator);
		} else { 
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

			$userData = array(
					'email' => $User->email,
					'password' => Input::get('password')
				);

			Debugbar::info($userData);

			if (Auth::attempt($userData)) {
				Debugbar::info('Logged In');
				return Redirect::to('/');
			} else {
				Debugbar::info('Failed');
			}

			$Renderer = Debugbar::getJavascriptRenderer();
		}
	}
}