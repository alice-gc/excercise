<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = [
            [
                'email' => 'bob@gmail.com',
                'password' => '123456',
            ],
        ];

        foreach ($users as $dbEntry) {
            User::create($dbEntry);
        }
    }
}
