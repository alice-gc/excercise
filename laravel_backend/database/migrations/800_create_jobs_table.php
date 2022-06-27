<?php

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
            $table->id();

            $table->unsignedInteger('teacher_profile_id')->nullable();
            $table->foreign('teacher_profile_id')
                ->references('id')
                ->on('teacher_datas')
                ->onDelete('cascade');

            $table->unsignedInteger('subject_id');
            $table->foreign('subject_id')
                ->references('id')
                ->on('subjects')
                ->onDelete('cascade');



            $table->unsignedInteger('keystage_id');
            $table->foreign('keystage_id')
                ->references('id')
                ->on('keystage')
                ->onDelete('cascade');


            $table->unsignedInteger('school_id');
            $table->foreign('school_id')
                ->references('id')
                ->on('schools')
                ->onDelete('cascade');

            $table->string('date');

            $table->string('time_boundries');


            $table->timestamps();
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
