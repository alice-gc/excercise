<?php
/**
 * Adds entries to the database that contains 
 * Core CALISTHENICS ROUTINE exercises
 * as well as additional calisthenic exercises that user may wish to add
 * 
 */
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
                'name' => 'Pushups',
                'desc' => 'Targets pectorals, triceps, and shoulders, but engages almost every muscle in our body.',
            ],
            [
                'name' => 'Squats',
                'desc' => 'Progressive squats work entire lower body—targeting the quads, hamstrings, glutes, and calves.',

            ],
            [
                'name' => 'Pullups',
                'desc' => 'Pulling and climbing are some of the most fundamental human movements.',

            ],
            [
                'name' => 'Bridges',
                'desc' => 'Trains spinal mobility and reverse the effects of sitting',

            ],
            [
                'name' => 'Twist Holds',
                'desc' => 'Regular twist holds help eliminate muscle imbalance and train the sides of our body.',
            ],
            [
                'name' => 'Leg Raises',
                'desc' => 'Not only do these strengthen your abdomen, but they build powerful, mobile hip flexors as well.',
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
