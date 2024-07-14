<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Controller;
use App\Models\Performance;
use App\Models\Profile;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ModeratorController extends Controller
{

    //PR Performances:: [Moderator]
    public function prPerformancesMod(Request $request)
    {
        try {


            $query = Performance::with('performer');
            //$mark = Performance::with('performer')->sum(DB::raw('duration*correct_ans'));

            $view = $this->Filter($query, $request);

            $data = $view['data']->map(function ($view) {
                return [
                    "id" => $view->id,
                    "user_id" => $view->user_id,
                    "u_name" => $view->performer->name,
                    "duration" => $view->duration,
                    "corr_ans" => $view->correct_ans,
                    "mark" =>$view->mark,
                    "location" => $this->disBn($view->pr_loc),
                    "group" =>$this->grpBn($view->pr_group),
                    "gender" =>$this->genBn($view->pr_gen),
                    "guardian_prf" =>$this->pfBn($view->pr_grd_prf),

                ];
            });
            if ($data) {
                return $this->responseWithSuccess('Performance list', $data, $view['disp']);
            }
        } catch (\Exception $exception) {

            return $this->responseWithError($exception->getMessage());

        }
    }



    //PR Profile:: [Moderator]
    public function prProfileMod(Request $request)
    {
        if ($this->modPass() === true) {

            try {
                $query = Profile::with('user')->where('user_id', $request->id)->get();
                $data = $query->map(function ($view) {
                    return [
                        "user_id" => $view->user_id,
                        "name" => $view->user->name,

                        "mobile" => $view->mobile,
                        "email" => $view->email,


                        "location" => $this->disBn($view->user->location),
                        "group" => $this->grpBn($view->user->group),
                        "gender" =>$this->genBn($view->user->gender),
                        "guardian_prf" =>$this->pfBn($view->user->grdn_prf),


                        "dob" => $view->user->dob,
                        "blood_grp" => $view->bg,
                        "insit" => $view->institution,
                        "fb" => $view->facebook,
                        "pp" => $view->photo,

                    ];
                });
                if ($data) {
                    return $this->responseWithSuccess('Player profile', $data);
                }



            } catch (\Exception $exception) {

                return $this->responseWithError($exception->getMessage());

            }

        } else {
            return $this->responseWithError('Access denied.');
        }
    }


    // View individual TOP performance[PUBLIC]
    public function playerStat(Request $request)
    {
        if ($this->modPass() === true) {

            $user = Auth::user();
            $location=$user->location;

            try {
                //Admin


            if($location=='0'){
                $junior = User::where('group','=','jnr')->count();
                $youth = User::where('group','=','yth')->count();
                $senior = User::where('group','=','snr')->count();
                $male = User::where('gender','=','1')->count();
                $female = User::where('gender','=','2')->count();
                $others = User::where('gender','=','3')->count();

                $ttlpr= User::count();
                $duration= DB::table('performances')->sum('duration');


            }else{


                $junior  = User::where('group','=','jnr')->where('location','=',$location)->count();
                $youth   = User::where('group','=','yth')->where('location','=',$location)->count();
                $senior  = User::where('group','=','snr')->where('location','=',$location)->count();
                $male    = User::where('gender','=','1')->where('location','=',$location)->count();
                $female  = User::where('gender','=','2')->where('location','=',$location)->count();
                $others  = User::where('gender','=','3')->where('location','=',$location)->count();

                $ttlpr   = User::where('location','=',$location)->count();
                $duration= DB::table('performances')->where('pr_loc', $location)->sum('duration');


            }



             //District

            $performances['junior']=$junior;
            $performances['youth']=$youth;
            $performances['senior']=$senior;
            $performances['male']=$male;
            $performances['female']=$female;
            $performances['others']=$others;
            $performances['location']=$this->disBn($location);
            $performances['duration']=round(($duration/3600),1);
            $performances['ttlpr']=$ttlpr;


            if ($performances) {
                return $this->responseWithSuccess('Successfully fetched.', $performances);
            }
            //  return $this->responseWithSuccess('Invalid data', $result);
        } catch (\Exception $exception) {

            return $this->responseWithError('Something went wrong!',$exception->getMessage());

        }
        } else {
            return $this->responseWithError('Access denied.');
        }

    }


}
