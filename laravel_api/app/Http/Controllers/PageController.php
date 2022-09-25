<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PageController extends Controller
{
    public function dashboard()
    {

        return view('pages/home');
    }

    public function projectGithub()
    {

        return view('pages/home');
    }

    public function mobileAppLicense()
    {

        return view('pages/license');
    }

    public function runInstruction()
    {

        return view('pages/app');
    }

    public function links()
    {

        return view('pages/links');
    }
}
