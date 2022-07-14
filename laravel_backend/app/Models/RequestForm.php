<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RequestForm extends Model
{
    use HasFactory;

    protected $fillable = [
        'school_id', //school the admin belongs to that created the job
        'subject_id', //subject to be taught
        'keystage_id', //keystage to be taught
        'date', //date the job is for
        'user_id', //admin that created the job posting
        'user_id' //teacher that accepts the job posting
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
