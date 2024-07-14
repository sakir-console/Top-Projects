<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Performance extends Model
{
    use HasFactory;


    public function performer()
    {
        return $this->belongsTo(User::class,'user_id');
    }
}
