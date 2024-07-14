<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePerformancesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('performances', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->string('start_time',250);
            $table->string('duration',200)->nullable();
            $table->string('correct_ans','15')->nullable();
            $table->double('mark');
            $table->string('pr_dob','55');
            $table->string('pr_loc','55');
            $table->string('pr_group','55');
            $table->string('pr_grd_prf','115');
            $table->string('pr_gen','55');
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
        Schema::dropIfExists('performances');
    }
}
