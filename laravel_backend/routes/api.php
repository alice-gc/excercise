<?php

use App\Http\Controllers\JobController;
use App\Http\Controllers\RequestFormController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SchoolController;

/* |-------------------------------------------------------------------------- | API Routes |-------------------------------------------------------------------------- | | Here is where you can register API routes for your application. These | routes are loaded by the RouteServiceProvider within a group which | is assigned the "api" middleware group. Enjoy building your API! | */

Route::middleware('auth:sanctum')->get('/auth/user', function (Request $request) {
    return $request->user();
});

Route::middleware('auth:sanctum')->get('/auth/login', function (Request $request) {
    return $request->user();
});

Route::middleware('auth:sanctum')->get('/auth/register', function (Request $request) {
    return $request->user();
});

Route::middleware('auth:sanctum')->get('/user/posts', function (Request $request) {
    return $request->user()->posts;
});

Route::post('/auth/token', [TokenController::class , 'store']);
Route::delete('/auth/token', [TokenController::class , 'destroy']);






Route::middleware('auth:sanctum')->group(function () {

    Route::resource('jobs', JobController::class);

});


Route::get('/school', [SchoolController::class , 'index']);

Route::middleware('auth:sanctum')->get('/request-form', function () {
    Route::resource('request_form', RequestFormController::class , 'show');
});

Route::middleware('auth:sanctum')->post('/send-request', function () {
    Route::resource('send_request', RequestFormController::class , 'store');
});
