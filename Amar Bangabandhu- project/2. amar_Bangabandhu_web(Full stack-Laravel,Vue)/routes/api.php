<?php

use App\Http\Controllers\Api\v1\AuthController;
use App\Http\Controllers\Api\v1\ModeratorController;
use App\Http\Controllers\Api\v1\PerformanceController;
use App\Http\Controllers\Api\v1\ProfileController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});



//Public views
Route::group(['prefix' => 'v1'], function() {

    Route::post('/signup',[AuthController::class,'signUp']);
    Route::post('/signin',[AuthController::class,'signIn']);
    Route::get('/view/performances',[PerformanceController::class,'prPerformances']);
    //otp


    Route::post('/reset-otp',[AuthController::class,'resetOTP']);

    Route::post('/reset-password',[AuthController::class,'resetPassword']);


    Route::get('/filter/performs',[PerformanceController::class,'filterPerformance']);
    Route::get('/filter/performers',[PerformanceController::class,'filterPerformers']);
    Route::get('/player/profile',[ProfileController::class,'prProfilePub']);

});


//Authenticated Views
Route::group(['prefix' => 'v1','middleware' => ['auth:sanctum']], function() {

    Route::post('/logout',[AuthController::class,'logout']);
    Route::post('/adminLogged',[AuthController::class,'adminLogin']);
    Route::post('/modLogged',[AuthController::class,'modLogin']);
    Route::get('/playerLogged',function(){return true;});

    //Moderator

    Route::get('/mod/player/stat',[ModeratorController::class,'playerStat']);
    Route::get('/mod/player/profile',[ModeratorController::class,'prProfileMod']);
    Route::get('/mod/player/performances',[ModeratorController::class,'prPerformancesMod']);

    //User
    Route::get('/profile',[ProfileController::class,'myProfile']);
    Route::post('/update/profile',[ProfileController::class,'updateProfile']);

    //login check
    Route::post('/verify',[AuthController::class,'verify']);
    Route::post('/operation',[PerformanceController::class,'addPerformance']);
    Route::post('/play-start',[PerformanceController::class,'addPerforReq']);
    Route::get('/leaderboard',[PerformanceController::class,'myPerformance']);


});


