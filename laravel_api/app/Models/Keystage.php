<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Keystage extends Model
{
    use HasFactory;

    protected $fillable = [
        'age group'
    ];

    public function users()
    {
        return $this->belongsToMany(User::class);
    }
}


