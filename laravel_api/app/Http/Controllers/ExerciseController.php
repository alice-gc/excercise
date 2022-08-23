<?php

namespace App\Http\Controllers;

use App\Models\Exercise;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ExerciseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    // return Exercise::all();
    // return 1;
    }

    public function getAll()
    {
        return Exercise::all();
    }

    public function save_day(Request $request)
    {
        // $request->validate([
        //     'fmc_token' => 'required',
        // ]);

        // $id = Auth::user()->id;

        return $request;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
    //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\exercise  $exercise
     * @return \Illuminate\Http\Response
     */
    public function show(exercise $exercise)
    {
    //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\exercise  $exercise
     * @return \Illuminate\Http\Response
     */
    public function edit(exercise $exercise)
    {
    //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\exercise  $exercise
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, exercise $exercise)
    {
    //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\exercise  $exercise
     * @return \Illuminate\Http\Response
     */
    public function destroy(exercise $exercise)
    {
    //
    }
}
