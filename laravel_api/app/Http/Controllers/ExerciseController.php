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

    public function checkForExercises()
    {
        $id = Auth::user()->id;

        $exercise = WeeklyExercises::select('*')
            ->where('user_id', '=', $id)
            ->get();

        // if ($exercise == 0) {
        //     return array('response' => 0);
        // }
        // else {
        //     return array('response' => 1);

        // }
        return $exercise;
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
        $id = Auth::user()->id;

        $exercises_pivot = WeeklyExercises::select('*')
            ->where('user_id', '=', $id)
            ->where('day', '=', $data)
            // ->where('day', '=', "Monday")
            ->get();

        $exercises = [];

        foreach ($exercises_pivot as $item) {

            array_push($exercises,
                Exercise::select('*')
                ->where('id', $item->exercise_id)->get()->first());
        }
        return $exercises;
    }


    public function getAllForUser()
    {

        $id = Auth::user()->id;

        $exercises_pivot = WeeklyExercises::select('*')
            ->where('user_id', '=', $id)
            ->get();

        // $map = [
        //     'Monday' => 1,
        //     'Tuesday' => 2,
        //     'Wednesday' => 3,
        //     'Thursday' => 4,
        //     'Friday' => 5,
        //     'Saturday' => 6,
        //     'Sunday' => 7,
        // ];

        // foreach ($exercises_pivot as $item) {

        //     $item->day = $map[$item->day];

        //     array_push($exercises, $item
        //     );

        // array_push($exercises,
        //     Exercise::select('*')
        //     ->where('id', $item->exercise_id)->get()->first());
        // }
        return $exercises_pivot;
    }

    public function save_day(Request $request)
    {
        $data_list = $request->all();

        // $keys = array_keys($data_list);
        $arraySize = count($data_list);

        for ($i = 0; $i < $arraySize - 1; $i++) {

            $exercise = new WeeklyExercises();
            $exercise->user_id = Auth::id();
            $exercise->exercise_id = $data_list[$i];
            $exercise->day = $data_list['day'];
            $exercise->save();
        }
        return "added";
    }


    public function addCustomExercise(Request $request)
    {
        $data = $request->all();

        $exercise = new Exercise();
        $exercise->user_id = Auth::id();
        $exercise->name = $data['name'];
        $exercise->desc = $data['desc'];
        $exercise->save();


        return "added";
    }


    public function save_init()
    {
        $id = Auth::user()->id;

        $routine = array(
            // Monday
            [
                'day' => 'Monday',
                'exercise_id' => 2,
            ],
            [
                'day' => 'Monday',
                'exercise_id' => 7
            ],
            // Tuesday
            [
                'day' => 'Tuesday',
                'exercise_id' => 4
            ],
            [
                'day' => 'Tuesday',
                'exercise_id' => 3
            ],
            // Wednesday
            [
                'day' => 'Wednesday',
                'exercise_id' => 5,
            ],
            [
                'day' => 'Wednesday',
                'exercise_id' => 6
            ],
            // Thursday
            [
                'day' => 'Thursday',
                'exercise_id' => 2
            ],
            [
                'day' => 'Thursday',
                'exercise_id' => 7
            ],
            // Friday
            [
                'day' => 'Friday',
                'exercise_id' => 4,
            ],
            [
                'day' => 'Friday',
                'exercise_id' => 3
            ],
            // Saturday
            [
                'day' => 'Saturday',
                'exercise_id' => 5
            ],
            [
                'day' => 'Saturday',
                'exercise_id' => 6
            ],
            // Sunday
            [
                'day' => 'Sunday',
                'exercise_id' => 8
            ],
        );


        $arraySize = count($routine);

        foreach ($routine as $element) {
            $exercise = new WeeklyExercises();
            $exercise->user_id = Auth::id();
            $exercise->exercise_id = $element['exercise_id'];
            $exercise->day = $element['day'];
            $exercise->save();

        }
        return "init exercises added";
    }


    public function DeleteByDay(Request $request)
    {

        $data = $request->all();

        WeeklyExercises::Where('exercise_id', $data['index'])->first()
            ->delete();

        return "deleted";

    }
}