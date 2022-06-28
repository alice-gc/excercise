<?php

namespace Database\Seeders;

use App\Models\Role;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $roles = [
            [
                'type' => 'Super Admin'
            ],
            [
                'type' => 'School Admin'
            ],
            [
                'type' => 'Supply Teacher'
            ]
        ];

        foreach ($roles as $role) {
            Role::create($role);
        }
    }
}
