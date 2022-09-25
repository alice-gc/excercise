<?php

namespace App\Http\Controllers;

use App\Models\Exercise;
use App\Models\User;
use App\Models\WeeklyExercises;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
/* *   This controller holds all functions related to managing  *   exercises by the user */
class ExerciseController extends Controller
{
    // fetches weekly exercise routine
    // for current authenticated user
    public function checkForExercises()
    {
        // get current user id
        $id = Auth::user()->id;

        // query db
        // get all from weekly Routine for user
        $exercise = WeeklyExercises::select('*')
            ->where('user_id', '=', $id)
            ->get();

        // return query result
        return $exercise;
    }

    // fetch all exercises in db that are default
    // or were created by authenticated user
    public function getAll()
    {
        // get current user id
        $id = Auth::user()->id;

        // query db
        // get all exercises that are default
        // or were created by user
        $exercises = Exercise::select('*')
            ->where('user_id', '=', null)
            ->orWhere('user_id', '=', $id)
            ->get();

        // return query result
        return $exercises;
    }

    // Takes day as request parametr and fetches routine for authenticated user
    // for given day and modifies response for mobile app
    public function getAllByDay(Request $request)
    {
        // get day from request
        $day = $request->all();
        // get current user id
        $id = Auth::user()->id;

        // query db
        // get all from weekly Routine for user
        // that have requested day of the week
        $exercises_pivot = WeeklyExercises::select('*')
            ->where('user_id', '=', $id)
            ->where('day', '=', $day)
            ->get();

        // create array to hold return values
        $exercises = [];

        // for all weekly exercises from the query
        // add to return array weekly exercise model exercise 
        // it has to be json encodable format
        foreach ($exercises_pivot as $item) {

            array_push($exercises,
                Exercise::select('*')
                ->where('id', $item->exercise_id)->get()->first());
        }
        // return modified list of exercises
        return $exercises;
    }

    //fetches weekly routine for a user and modifies response for mobile app (json formating)
    public function getAllForUser()
    {
        // get current user id
        $id = Auth::user()->id;

        // query db
        // get all from weekly Routine for user
        $exercises_pivot = WeeklyExercises::select('*')
            ->where('user_id', '=', $id)
            ->get();

        // map enum days to numbers
        $map = [
            'Monday' => 1,
            'Tuesday' => 2,
            'Wednesday' => 3,
            'Thursday' => 4,
            'Friday' => 5,
            'Saturday' => 6,
            'Sunday' => 7,
        ];

        // create array to hold return values
        $exercises = [];

        // for all weekly exercises from the query
        // add day number
        // add exercise model
        // it has to be json encodable format
        foreach ($exercises_pivot as $item) {

            $item->no = $map[$item->day];
            $item->exercise =
                Exercise::select('*')
                ->where('id', $item->exercise_id)->get()->first();

            array_push($exercises, $item);

        }
        // return modified list of exercises
        return $exercises_pivot;
    }

    // Takes list of exercises and save them to given day
    public function save_day(Request $request)
    {
        // save all exercises from request
        $data_list = $request->all();

        // form loop to add all exercise
        // from the request
        // to the database
        $arraySize = count($data_list);

        for ($i = 0; $i < $arraySize - 1; $i++) {

            $exercise = new WeeklyExercises();
            $exercise->user_id = Auth::id();
            $exercise->exercise_id = $data_list[$i];
            $exercise->day = $data_list['day'];
            $exercise->save();
        }
    // return "added";
    }

    // Add new custom exercise to db
    public function addCustomExercise(Request $request)
    {
        // get exercise data from request
        $data = $request->all();

        // create new object of Exercise class
        $exercise = new Exercise();
        // specify the author (current authenticated user)
        $exercise->user_id = Auth::id();
        // save exercise details
        $exercise->name = $data['name'];
        $exercise->desc = $data['desc'];
        // save entry to the database
        $exercise->save();

    // return "added";
    }

    // Populates weekly routine with recomended exercises
    public function save_init()
    {
        // this array holds hardcoded list of exercises
        // that is a recomended version of exercise routine
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

        // add entries to the pivot table
        // populate user's weekly routine
        // with recomended exercise setup
        foreach ($routine as $element) {
            // create new object of WeeklyExercise class
            $exercise = new WeeklyExercises();
            // specify the user
            $exercise->user_id = Auth::id();
            // specify exercise
            $exercise->exercise_id = $element['exercise_id'];
            // specify a day
            $exercise->day = $element['day'];
            // save entry to the database
            $exercise->save();
        }
    // return "init exercises added";
    }

    // Takes day as request parametr and detaches (deletes entry) exercise
    // from specific day for authenticated user
    public function DeleteByDay(Request $request)
    {
        // get exercise data from request
        $data = $request->all();

        // query the db
        // find specified entry
        // and drop it from database
        WeeklyExercises::Where('exercise_id', $data['index'])->first()
            ->delete();

    // return "deleted";
    }
}