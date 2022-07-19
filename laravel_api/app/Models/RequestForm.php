<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RequestForm extends Model
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

    public function keystages() {
        return $this->belongsTo(Keystage::class);
    }

    public function subjects() {
        return $this->belongsTo(Subject::class);
    }

    public function school() {
        return $this->belongsTo(School::class);
    }

    public function user() {
        //unsure how to set this up with it taking in 2 users
        // in the same table as different participants
    }

}
