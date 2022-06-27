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
        Schema::create('teachers_travel_distance', function (Blueprint $table) {
            $table->increments('id');

            $table->integer('distance_id')->unsigned();

            $table->foreign('distance_id')->references('id')->on('distances')->onDelete('cascade');

            $table->unsignedInteger('teacher_profile_id');
            $table->foreign('teacher_profile_id')
                ->references('id')
                ->on('teachers_data')
                ->onDelete('cascade');

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
        Schema::dropIfExists('teachers_travel_distance');
    }
};
