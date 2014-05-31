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
Route::get('instansi', 'ListController@instansi');
Route::get('instansi/detail/{id}', 'DetailController@instansi');

// Pelayanan
Route::get('pelayanan', 'ListController@pelayanan');
Route::get('pelayanan/detail/{id}', 'DetailController@pelayanan');

// Berita
Route::get('berita', 'ListController@berita');
Route::get('berita/detail/{id}', 'DetailController@berita');

// Opini
Route::get('opini', 'ListController@opini');
Route::get('opini/detail/{id}', 'DetailController@opini');

// Login
Route::get('login', 'AccessController@login');
Route::post('login', 'AccessController@sLogin');

// Register
Route::get('register', 'AccessController@register');
Route::post('register', 'AccessController@sRegister');

// User
Route::get('user', 'ProfileController@detail');
Route::get('user/{id}', 'ProfileController@detail');

/*
END PUBLIC PAGE
*/

/*
ADMIN PAGE
*/

// Dashboard
Route::get('dashboard', 'DetailController@dashboard');

// Instansi
Route::get('dashboard/instansi', 'ListController@dInstansi');
Route::get('dashboard/instansi/form', 'FormController@instansi');
Route::post('dashboard/instansi/form', 'FormController@sInstansi');
Route::get('dashboard/instansi/form/{id}', 'DetailController@instansi');

// Pelayanan
Route::get('dashboard/pelayanan', 'ListController@dPelayanan');
Route::get('dashboard/pelayanan/form', 'FormController@pelayanan');
Route::post('dashboard/pelayanan/form', 'FormController@sPelayanan');
Route::get('dashboard/pelayanan/form/{id}', 'DetailController@pelayanan');

// Berita
Route::get('dashboard/berita', 'ListController@dBerita');
Route::get('dashboard/berita/form', 'FormController@berita');
Route::post('dashboard/berita/form', 'FormController@sBerita');
Route::get('dashboard/berita/form/{id}', 'DetailController@berita');

// Opini
Route::get('dashboard/opini', 'ListController@dOpini');
Route::get('dashboard/opini/form', 'FormController@opini');
Route::post('dashboard/opini/form', 'FormController@sOpini');
Route::get('dashboard/opini/form/{id}', 'DetailController@opini');

/*
END ADMIN PAGE
*/