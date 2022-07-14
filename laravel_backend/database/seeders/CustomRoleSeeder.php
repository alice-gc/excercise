<?php

namespace Database\Seeders;

use App\Models\CustomRole;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CustomRoleSeeder extends Seeder
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
                'type' => 'Platform Admin' //me and alice
            ],
            [
                'type' => 'Super Admin' //LEA?
            ],
            [
                'type' => 'School Admin' //has more permissions than dept admin
            ],
            [
                'type' => 'Department Admin' //can only access the placements for their dept
            ],
            [
                'type' => 'Supply Teacher' //filling the role
            ]
        ];

        foreach ($roles as $role) {
            CustomRole::create($role);
        }
    }
}
