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
                'desc' => 'desription description',
            ],
            [
                'name' => 'Excercise name 2',
                'desc' => 'desription description',
            ],
            [
                'name' => 'Excercise name 3',
                'desc' => 'desription description',
            ],
            [
                'name' => 'Excercise name 4',
                'desc' => 'desription description',
            ],
            [
                'name' => 'Excercise name 5',
                'desc' => 'desription description',
            ],

        ];

        foreach ($exerciseList as $dbEntry) {
            Exercise::create($dbEntry);
        }
    }
}
