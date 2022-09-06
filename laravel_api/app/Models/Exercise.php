<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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
