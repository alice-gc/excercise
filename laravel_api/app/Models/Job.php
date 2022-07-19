<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Job extends Model
{
    use HasFactory;

    protected $fillable = [
        'school_id',
        'subject_id',
        'keystage_id',
        'date',
        'user_id',
        'user_id'
    ];
}