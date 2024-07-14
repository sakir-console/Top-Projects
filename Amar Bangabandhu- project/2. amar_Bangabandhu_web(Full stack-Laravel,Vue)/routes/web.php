<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/clear', function() {

    Artisan::call('cache:clear');
    Artisan::call('config:clear');
    Artisan::call('config:cache');
    Artisan::call('view:clear');

    return "Cleared!";

});


Route::get('/admin-login', function () {
    return view('administrativeAuth');
});




Route::get('/admin/{any}', function () {
    return view('admin');
})->where('any', '.*');


Route::get('/welcome', function () {
    return view('welcome');
});


Route::get('/player/{any}', function () {
    return view('player');
})->where('any', '.*');

Route::get('/{any}', function () {
    return view('public');
})->where('any', '.*');




