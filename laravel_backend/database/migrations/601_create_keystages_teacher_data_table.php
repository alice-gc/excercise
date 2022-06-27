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
        Schema::create('keystages_teacher_data', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('keystage_id')->unsigned();
            $table->foreign('keystage_id')->references('id')->on('keystages')->onDelete('cascade');
            $table->unsignedInteger('teacher_profile_id');
            $table->foreign('teacher_profile_id')
                ->references('id')
                ->on('teacher_data')
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
        Schema::dropIfExists('teachers_keystage_data');
    }
};