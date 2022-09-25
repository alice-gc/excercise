<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Auth\AuthenticationException;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

/**
 * Controlls user registration, login
 * and token verification
 */

class TokenController extends Controller
{
  public function __construct()
  {
    $this->middleware(['auth:sanctum'])->only('destroy');
  }

  // log in user
  public function store(Request $request)
  {
    $this->validate($request, [
      'email' => 'required|email',
      'password' => 'required',
    ]);

    if (!auth()->attempt($request->only('email', 'password'))) {
      throw new AuthenticationException();
    }

    return [
      'token' => auth()->user()->createToken($request->deviceId)->plainTextToken
    ];
  }

  // register new user to database
  public function register(Request $request)
  {
    // check if request contains email and password
    $validatedData = $request->validate([
      'email' => 'required|email',
      'password' => 'required',
    ]);

    // hash and secure password
    $validatedData['password'] = Hash::make($validatedData['password']);

    // create a user
    User::updateOrCreate($validatedData);

    if (!auth()->attempt($request->only('email', 'password'))) {
      throw new AuthenticationException();
    }

    // create validation token out of device id
    return [
      'token' => auth()->user()->createToken($request->deviceId)->plainTextToken
    ];
  }

  // delete user token
  public function destroy(Request $request)
  {
    auth()->user()->tokens()->where('name', $request->deviceId)->delete();
  }
}