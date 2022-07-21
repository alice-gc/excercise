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

/* |-------------------------------------------------------------------------- | API Routes |-------------------------------------------------------------------------- | | Here is where you can register API routes for your application. These | routes are loaded by the RouteServiceProvider within a group which | is assigned the "api" middleware group. Enjoy building your API! | */

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/sanctum/token', function (Request $request) {
    $request->validate([
        'email' => 'required|email',
        'password' => 'required',
        'device_name' => 'required',
    ]);

    $user = User::where('email', $request->email)->first();

    if (!$user || !Hash::check($request->password, $user->password)) {
        throw ValidationException::withMessages([
            'email' => ['The provided credentials are incorrect.'],
        ]);
    }

    return $user->createToken($request->device_name)->plainTextToken;
});


Route::middleware('auth:sanctum')->get('/user/revoke', function (Request $request) {

    $user = $request->user();

    $user->tokens()->delete();

    return 'tokens are deleted';
});

Route::middleware('auth:sanctum')->get('/auth/user', function (Request $request) {
    return $request->user();
});

Route::middleware('auth:sanctum')->get('/auth/login', function (Request $request) {
    return $request->user();
});



// Route::middleware('auth:sanctum')->get('/user/posts', function (Request $request) {
//     return $request->user()->posts;
// });




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


// Endpoints that don't need sanctum

Route::post('/auth/register', [TokenController::class , 'register']);

Route::post('/auth/token', [TokenController::class , 'store']);