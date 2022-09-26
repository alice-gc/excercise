<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
// Defines fillable rows in Exercise table 
// as well as relations:
// Exercise has many User class objects 
// and has many weeklyExercises class objects.
class Exercise extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'desc',
        'user',
    ];

    public function users()
    {
        return $this->hasMany(User::class);
    }

    public function weeklyExercises()
    {
        return $this->hasMany(WeeklyExercises::class);
    }
}
