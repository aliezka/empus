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
					'name' => 'min:3 | alpha_spaces ',
					'username' => 'required | email '
				);
		
		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) { 
			Debugbar::info($validator->messages()->all());
			$Renderer = Debugbar::getJavascriptRenderer();
			
			return Redirect::to('login')
				->withInput(Input::except('password'))
				->withErrors($validator);
		} else {
			$userData = array(
					'email' => Input::get('username'),
					'password' => Input::get('password')
				);

			Debugbar::info($userData);

			if (Auth::attempt($userData)) {
				// Administrator
				if (Auth::user()->role->first()->id == 1) {
					return Redirect::intended('dashboard');
				} 
				// Government
				elseif (Auth::user()->role->first()->id == 3) {
					return Redirect::intended('gov');
				} 
				// Citizen
				else {
					return Redirect::intended('/');
				}
			} else {
				return Redirect::to('login')
					->withInput(Input::except('password'))
					->with('message', 'Username atau password tidak cocok.');
			}
		}
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

			Log::warning($validator->messages()->all());
			
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

	public function edit($Id = null) {
		$User = User::findOrFail($Id);

		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('user.edit')
			->with('User', $User);
	}

	public function sEdit($Id) {
		$User = User::findOrFail($Id);

		$rules = array(
					'name' => ' required | alpha_spaces | min:3 ',
					'name' => ' required | min:3 ',
					'old-password' => ' min:6 | old_password ',
					'new-password' => ' min:6 | required_with:old-password '
				);

		if (Input::get('username') != $User->username) {
			$rules += array('username' => ' required | email | unique:user,email');
		}

		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) {
			Debugbar::info($validator->messages()->all());
			$Renderer = Debugbar::getJavascriptRenderer();
			
			Log::warning($validator->messages()->all());
			
			return Redirect::back()
				->withInput(Input::except('password'))
				->withErrors($validator);
		} else { 
			Person::findOrFail(Auth::user()->person_id)->update(array('name' => Input::get('name')));
			$User->username = $User->email = Input::get('username');

			$User->password = $User->password;
			if (Input::get('new-password')) {
				$User->password = Hash::make(Input::get('new-password'));
			}

			$User->save();

			// Roles
			$Role  = array();
			$SRoles = $User->role;

			foreach ($SRoles as $S) {
				$Roles[] = $S->id;
			}

			$Diff = array_diff($Roles, Input::get('roles', array()));
			if (count($Diff) > 0) {
				$User->role_list()->delete($Diff);
			}

			if (count(Input::get('roles', array())) > 0) {
				foreach (Input::get('roles') as $p) {
					$rolList = new UserRole;
					$rolList->user()->associate($User);
					$rolList->role_id = $p;

					if (!$rolList->where('user_id', '=', $User->id)->where('role_id', '=', $p)->count() > 0) {
						$rolList->save();
					}
				}
			}
			// End Roles

			// Image
			if(Input::hasFile('image')){
				$FileName = $User->person->id;
				$FileName .= '.'.Input::file('image')->getClientOriginalExtension();

				Input::file('image')->move(Config::get('empus.path_person_img'), $FileName);

				if (PersonImg::where('person_id', '=', $User->person->id)->get()->count()>0) {
					PersonImg::where('person_id', '=', $User->person->id)->update(['img' => $FileName]);
				} else {
					$PersonImg = new PersonImg;
					$PersonImg->person()->associate($User->person);
					$PersonImg->img = $FileName;
					$PersonImg->save();
				}

			}
			// End Image
			return Redirect::back();
		}
	}

	public function logout(){
		Auth::logout();
		return Redirect::to('login');
	}
}