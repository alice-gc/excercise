<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Distance extends Model
{
    use HasFactory;

    protected $fillable = [
        'distance in km',  //need to be nullable
        'distance in miles'    //need to be nullable
    ];
}
