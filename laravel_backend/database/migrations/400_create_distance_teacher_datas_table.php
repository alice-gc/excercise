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
        Schema::create('distance_teacher_datas', function (Blueprint $table) {
            $table->id();

            $table->unsignedInteger('distance_id');
            $table->foreign('distance_id')
                ->references('id')
                ->on('distances')
                ->onDelete('cascade');

            $table->unsignedInteger('teacher_profile_id');
            $table->foreign('teacher_profile_id')
                ->references('id')
                ->on('teacher_datas')
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
        Schema::dropIfExists('distance_teacher_datas');
    }
};
