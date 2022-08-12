<?php

use App\Http\Controllers\JobController;
use App\Http\Controllers\RequestFormController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SchoolController;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use App\Http\Controllers\Auth\TokenController;
use App\Http\Controllers\UserController;

/* |-------------------------------------------------------------------------- | API Routes |-------------------------------------------------------------------------- | | Here is where you can register API routes for your application. These | routes are loaded by the RouteServiceProvider within a group which | is assigned the "api" middleware group. Enjoy building your API! | */

/* |-------------------------- | Mobile APP API Routes |-------------------------- | */

Route::middleware('auth:sanctum')->group(function () {

    Route::get('/auth/user', [UserController::class , 'getUser']);
    Route::get('/user/info', [UserController::class , 'index']);
});

// Endpoints that don't need sanctum
// ***authentication by dio, mobile app***
Route::post('/auth/register', [TokenController::class , 'register']);
Route::post('/auth/token', [TokenController::class , 'store']);
Route::delete('/auth/token', [TokenController::class , 'destroy']);
// ***authentication by dio, mobile app***

/* |-------------------------- | Mobile APP API Routes |-------------------------- | */