<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\School;

class SchoolSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $schoolList = [
            [
                'name' => 'Test School Name',
                'address' => 'Test School Address'
            ],
            [
                'name' => '2nd Test School Name',
                'address' => '2nd Test School Address'
            ],
            [
                'name' => 'Alway Primary School',
                'address' => 'Aberthaw Road, Newport, NP19 9QP'
            ],
            [
                'name' => 'Caerleon Lodge Hill Primary School',
                'address' => '2nd Test School Address'
            ], [
                'name' => ' Charles Williams Church in Wales Primary School ',
                'address' => 'Roman Way, Caerleon, Newport, NP18 3DY'
            ],
            [
                'name' => 'Clytha Primary School',
                'address' => 'High Street, Caerleon, Newport, NP18 1AZ'
            ]
        ];

        foreach ($schoolList as $school) {
            School::create($school);
        }
    }
}
