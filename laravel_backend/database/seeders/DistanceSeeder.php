<?php

namespace Database\Seeders;

use App\Models\Distance;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DistanceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $distances = [
            [
                'distance' => '2'
            ],
            [
                'distance' => '5'
            ],
            [
                'distance' => '10'
            ],
            [
                'distance' => '15'
            ]
        ];

        foreach ($distances as $distance) {
            Distance::create($distance);
        }
    }
}
