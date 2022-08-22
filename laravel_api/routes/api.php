<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Auth\TokenController;
use App\Http\Controllers\ExerciseController;
use App\Http\Controllers\UserController;

/* |-------------------------- | API Routes |------------------------------------- | */

/* |-------------------------- | Mobile APP API Routes |-------------------------- | */

Route::middleware('auth:sanctum')->group(function () {

    Route::get('/auth/user', [UserController::class , 'getUser']);
    Route::get('/user/info', [UserController::class , 'index']);
    Route::get('/list/exercises', [ExerciseController::class , 'getAll']);

});

// Endpoints that don't need sanctum
// ***authentication by dio, mobile app***
Route::post('/auth/register', [TokenController::class , 'register']);
Route::post('/auth/token', [TokenController::class , 'store']);
Route::delete('/auth/token', [TokenController::class , 'destroy']);
// ***authentication by dio, mobile app***

/* |-------------------------- | Mobile APP API Routes |-------------------------- | */