<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Auth\TokenController;
use App\Http\Controllers\ExerciseController;
use App\Http\Controllers\UserController;

/* *   This file contains all API routes that user can access from the mobile device */

/* |-------------------------- | API Routes |------------------------------------- | */

/* |-------------------------- | Mobile APP API Routes |-------------------------- | */

//all routes in sanctum middleware can be accesed only with valid bearer token
//and usually performed operations relate to current authenticated user 
Route::middleware('auth:sanctum')->group(function () {
    // fetch user data
    Route::get('/auth/user', [UserController::class , 'getUser']);
    // fetch all exercises in db that are default 
    // or were created by authenticated user
    Route::get('/list/exercises', [ExerciseController::class , 'getAll']);
    // fetches weekly routine for a user and modifies response for mobile app
    Route::get('/list/exercises/user', [ExerciseController::class , 'getAllForUser']);
    // Takes day as request parametr and fetches routine for authenticated user
    // for given day and modifies response for mobile app
    Route::post('/list/exercises/byDay', [ExerciseController::class , 'getAllByDay']);
    // Takes day as request parametr and detaches (deletes entry) exercise
    // from specific day for authenticated user
    Route::delete('/list/exercises/DeletebyDay', [ExerciseController::class , 'DeleteByDay']);
    // Takes list of exercises and save them to given day
    Route::post('/saveDay', [ExerciseController::class , 'save_day']);
    // Populates weekly routine with recomended exercises
    Route::post('/save/init', [ExerciseController::class , 'save_init']);
    // Add new custom exercise to db
    Route::post('/list/exercises/addCustomExercise', [ExerciseController::class , 'addCustomExercise']);
    // fetches weekly exercise routine
    Route::get('checkForExercises', [ExerciseController::class , 'checkForExercises']);
});

// Endpoints that don't need sanctum
// ***authentication by dio, mobile app***

// register user to the database
Route::post('/auth/register', [TokenController::class , 'register']);
// log in user by authenticating device token 
Route::post('/auth/token', [TokenController::class , 'store']);
// deletes user token
Route::delete('/auth/token', [TokenController::class , 'destroy']);
// ***authentication by dio, mobile app***

/* |-------------------------- | Mobile APP API Routes |-------------------------- | */