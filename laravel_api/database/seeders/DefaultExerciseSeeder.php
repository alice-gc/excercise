<?php

namespace Database\Seeders;

use App\Models\Exercise;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DefaultExerciseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //

        $exerciseList = [
            [
                'name' => 'Excercise name',
                'desc' => 'Perhaps the most famous calisthenics exercise',
            ],
            [
                'name' => 'Pushups',
                'desc' => 'desription description',
            ],
            [
                'name' => 'Squats',
                'desc' => 'desription description',

            ],
            [
                'name' => 'Pullups',
                'desc' => 'desription description',

            ],
            [
                'name' => 'Bridges',
                'desc' => 'desription description',

            ],
            [
                'name' => 'Twist Holds',
                'desc' => 'desription description',
            ],
            [
                'name' => 'Leg Raises',
                'desc' => 'desription description',
            ], [
                'name' => 'stretching',
                'desc' => 'relax and stretch',
            ],
            [
                'name' => 'Dips',
                'desc' => 'Build functional pressing',
            ],
            [
                'name' => 'Lunges',
                'desc' => 'Build lower body strength and mobility',
            ],
            [
                'name' => 'Clutch Flags',
                'desc' => 'Train the sides of your body',
            ],
            [
                'name' => 'Explosives',
                'desc' => 'Build speed and power',
            ],
            [
                'name' => 'Calf Raises',
                'desc' => 'Train your lower legs',
            ],
            [
                'name' => 'Elbow Lever',
                'desc' => 'Train your core',
            ],

        ];

        foreach ($exerciseList as $dbEntry) {
            Exercise::create($dbEntry);
        }
    }
}
