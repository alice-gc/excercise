<?php

use App\Http\Controllers\PageController;
use Illuminate\Support\Facades\Route;

/* |-------------------------------------------------------------------------- | Web Routes |-------------------------------------------------------------------------- | | Here is where you can register web routes for your application. These | routes are loaded by the RouteServiceProvider within a group which | contains the "web" middleware group. Now create something great! | */

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/', [PageController::class , 'dashboard'])->name('dashboard.index');
Route::get('/projectGithub', [PageController::class , 'projectGithub'])->name('github');
Route::get('/mobileAppLicense', [PageController::class , 'mobileAppLicense'])->name('license');
Route::get('/runInstruction', [PageController::class , 'runInstruction'])->name('readme');
Route::get('/links', [PageController::class , 'links'])->name('links');
