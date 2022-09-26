<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     * fetes user specific data
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return User::where('id', Auth::id())->get();
    }

    public function getUser(Request $request)
    {
        return $request->user();
    }
}
