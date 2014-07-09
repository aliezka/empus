<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/', function()
{
	return View::make('hello');
});

/*
PUBLIC PAGE
*/

// Homepage
Route::get('home', 'ListController@index');

// Instansi
Route::get('instansi', 'ListController@pInstansi');
Route::get('instansi/{id}', 'DetailController@instansi');

// Pelayanan
Route::get('pelayanan', 'ListController@pPelayanan');
Route::get('pelayanan/{id}', 'DetailController@pelayanan');

// Berita
Route::get('berita', 'ListController@pBerita');
Route::get('berita/{id}', 'DetailController@berita');

// Opini
Route::get('opini', 'ListController@opini');
Route::get('opini/detail/{id}', 'DetailController@opini');

// Login
Route::get('login', 'AccessController@login');
Route::post('login', 'AccessController@sLogin');

// Logout
Route::get('logout', 'AccessController@logout');

// Register
Route::get('register', 'AccessController@register');
Route::post('register', 'AccessController@sRegister');

// User
Route::get('user', 'ProfileController@detail');
Route::get('user/{id}', 'ProfileController@detail');

// Whoami
Route::get('/whoami', array(function() {
			if (Auth::user())
				return  'Login as ' . Auth::user()->email .' '. Auth::user()->roles->first()->role ;
			else return 'Not yet login.';
		})
	);
/*
END PUBLIC PAGE
*/

/*
ADMIN PAGE
*/


// Dashboard
Route::get('dashboard', 'DetailController@dashboard');
Route::get('getAnalytics', 'DetailController@getAnalytics');

// Instansi
Route::get('dashboard/instansi', 'ListController@instansi');
// New Record
Route::get('dashboard/instansi/form', 'FormController@instansi');
Route::post('dashboard/instansi/form', 'FormController@sInstansi');
// Update Record
Route::get('dashboard/instansi/form/{id}', 'FormController@instansi');
Route::post('dashboard/instansi/form/{id}', 'FormController@sInstansi');

// Pelayanan
Route::get('dashboard/pelayanan', 'ListController@pelayanan');
// New Record
Route::get('dashboard/pelayanan/form', 'FormController@pelayanan');
Route::post('dashboard/pelayanan/form', 'FormController@sPelayanan');
// Update Record
Route::get('dashboard/pelayanan/form/{id}', 'FormController@pelayanan');
Route::post('dashboard/pelayanan/form/{id}', 'FormController@sPelayanan');

// Pelayanan - Persyaratan
// New Record
Route::get('dashboard/pelayanan/{pelayanan_id}/persyaratan/form', 'FormController@persyaratan');
Route::post('dashboard/pelayanan/{pelayanan_id}/persyaratan/form', 'FormController@sPersyaratan');
// Update Record
Route::get('dashboard/pelayanan/{pelayanan_id}/persyaratan/{persyaratan_id}', 'FormController@persyaratan');
Route::post('dashboard/pelayanan/{pelayanan_id}/persyaratan/{persyaratan_id}', 'FormController@sPersyaratan');

// Pelayanan - Prosedur
// New Record
Route::get('dashboard/pelayanan/{pelayanan_id}/prosedur/form', 'FormController@prosedur');
Route::post('dashboard/pelayanan/{pelayanan_id}/prosedur/form', 'FormController@sProsedur');
// Update Record
Route::get('dashboard/pelayanan/{pelayanan_id}/prosedur/{prosedur_id}', 'FormController@prosedur');
Route::post('dashboard/pelayanan/{pelayanan_id}/prosedur/{prosedur_id}', 'FormController@sProsedur');

// Berita
Route::get('dashboard/berita', 'ListController@berita');
// New Record
Route::get('dashboard/berita/form', 'FormController@berita');
Route::post('dashboard/berita/form', 'FormController@sBerita');
// Update Record
Route::get('dashboard/berita/form/{id}', 'FormController@berita');
Route::post('dashboard/berita/form/{id}', 'FormController@sBerita');

// Opini
Route::get('dashboard/opini', 'ListController@dOpini');
Route::get('dashboard/opini/form', 'FormController@opini');
Route::post('dashboard/opini/form', 'FormController@sOpini');
Route::get('dashboard/opini/form/{id}', 'DetailController@opini');

/*
END ADMIN PAGE
*/

/*
CITIZEN PAGE
*/

// Opni - Instansi Pelayanan
Route::get('opini/{object}/{id}/form', 'FormController@opini');
Route::post('opini/{object}/{id}/form', 'FormController@sOpini');

Route::get('komentar/{opini}/form', 'FormController@komentar');
Route::post('komentar/{opini}/form', 'FormController@sKomentar');

/*
END CITIZEN PAGE
*/