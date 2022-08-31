<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WeeklyExercises extends Model
{
    use HasFactory;

    protected $fillable = [

        'user_id',
        'exercise_id',
        'day',
    ];


    public function users()
    {
        return $this->belongsToMany(User::class);
    }

    public function exercises()
    {
        return $this->belongsToMany(Exercise::class);
    }


}
