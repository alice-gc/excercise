<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

// This model defines user weekly routine. Table WeeklyExercises holds all exercises that user has assigned to weekly exercise routine. It works as pivot table between User and Exercise list. 
// WeeklyExercises model defines relations: 
// belongs to many User objects 
class WeeklyExercises extends Model
{
    use HasFactory;

    protected $fillable = [

        'user_id',
        'exercise_id',
        'day',

        'no',
        'exercise'
    ];


    public function users()
    {
        return $this->belongsToMany(User::class);
    }

    public function exercises()
    {
        return $this->belongsTo(Exercise::class);
    }


}
