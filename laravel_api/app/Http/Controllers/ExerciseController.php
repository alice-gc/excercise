<?php

namespace App\Http\Controllers;

use App\Models\Exercise;
use App\Models\User;
use App\Models\WeeklyExercises;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

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

        $id = Auth::user()->id;
        $exercises = Exercise::select('*')
            ->where('user_id', '=', null)
            ->orWhere('user_id', '=', $id)
            ->get();

        return $exercises;
    }

    public function getAllByDay(Request $request)
    {
        $data = $request->all();
        // return $request;

        $id = Auth::user()->id;

        $exercises = WeeklyExercises::select('*')
            ->where('user_id', '=', $id)
            ->where('day', '=', $data)
            // ->where('day', '=', "Monday")
            ->get();

        return $exercises;

    }


    public function save_day(Request $request)
    {
        $data_list = $request->all();
        $i = 1;
        foreach ($data_list as $data) {
            if ($i > 0) {
                $exercise = new WeeklyExercises();
                $exercise->user_id = Auth::id();
                $exercise->exercise_id = $data['id'];
                $exercise->day = $data['day'];

                // $this->create($exercise);
                $exercise->save(); // saved to database            }
            }
        }

        return "added";
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