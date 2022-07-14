<?php

use App\Models\Keystage;
use App\Models\School;
use App\Models\Subject;
use App\Models\User;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jobs', function (Blueprint $table) {
            $table->increments('id');
            $table->string('date');
            $table->string('time_boundries');
            $table->timestamps();
            $table->foreignIdFor(User::class, column:'admin_id'); //unsure if this will work
            $table->foreignIdFor(User::class, column:'supply_id'); //ditto
            $table->foreignIdFor(Subject::class);
            $table->foreignIdFor(Keystage::class);
            $table->foreignIdFor(School::class);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('jobs');
    }
};
