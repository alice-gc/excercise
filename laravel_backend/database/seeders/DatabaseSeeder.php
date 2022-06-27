<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            DistanceSeeder::class,
            JobSeeder::class,
            KeystageSeeder::class,
            RoleSeeder::class,
            SchoolAdminSeeder::class,
            SchoolSeeder::class,
            SubjectSeeder::class,
            TeacherDataSeeder::class,
            UserSeeder::class
        ]);
    }
}
