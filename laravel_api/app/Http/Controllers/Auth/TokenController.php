<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Auth\AuthenticationException;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class TokenController extends Controller
{
  //have to be authenticated to use this
  public function __construct()
  {
    $this->middleware(['auth:sanctum'])->only('destroy');
  }
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

  public function register(Request $request)
  {

    $validatedData = $request->validate([
      'email' => 'required|email',
      'password' => 'required',


    ]);

    $validatedData['password'] = Hash::make($validatedData['password']);

    User::updateOrCreate($validatedData);


    if (!auth()->attempt($request->only('email', 'password'))) {
      throw new AuthenticationException();
    }

    return [
      'token' => auth()->user()->createToken($request->deviceId)->plainTextToken
    ];
  }

  public function destroy(Request $request)
  {
    auth()->user()->tokens()->where('name', $request->deviceId)->delete();
  }
}