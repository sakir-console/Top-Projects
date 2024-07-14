<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Controller;
use App\Models\Performance;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PerformanceController extends Controller
{

    public function currentQuiz()
    {
        $user = Auth::user();
        $view=DB::table('performances')
            ->where('id',$user->id)
            ->where('correct_ans',null)
            ->first();

        if(!$view->exists() || $view->duration!=0){
            return 0;
        }
        return $view->id;
    }



    public function addPerforReq(Request $request)
    {
        try {

            $user = Auth::user();
            $insertPerformance = DB::table('performances')->insertGetId([
                'user_id' => $user->id,
                'duration' => 0,
                'start_time' => time(),
                'correct_ans' => null,
                'pr_dob' =>explode("-", $user->dob)[2] ,
                'pr_loc' => $user->location,
                'pr_group' => $user->group,
                'pr_grd_prf' => $user->grdn_prf,
                'pr_gen' => $user->gender,
                'mark'=>0

            ]);

            return $this->responseWithSuccess('Time Started!',$insertPerformance);

        } catch (\Exception $exception) {

            return $this->responseWithError($exception->getMessage());

        }


    }


    //Add Performance
    public function addPerformance(Request $request)
    {
        try {

            $user = Auth::user();


            $view=DB::table('performances')->where('id',$request->quiz_id)->first();

            if(is_null($view) || !is_null($view->correct_ans)||$view->duration!=0 || $view->user_id!=$user->id){
                return $this->responseWithError('Invalid Req!');

            }
            $duration=time()-$view->start_time;


            $corrected_ans= $this->correct_ans_count(json_decode($request->given_ans,true));
            $tf=(300-($duration/96))*0.4;

            if($tf<0){
                $tf=0;
            }

            DB::table('performances')->where('id',$request->quiz_id)->update([
                "correct_ans" =>$corrected_ans,
                "duration" => $duration,
                "mark"=>$tf+($corrected_ans*10*0.6)
            ]);


            return $this->responseWithSuccess('Thank You!',["corrected"=>$corrected_ans]);

        } catch (\Exception $exception) {

            return $this->responseWithError($exception->getMessage());

        }

    }


    public function correct_ans_count(array $ans):int
    {


        $corr_ans=[
            "J0001"=>3,
            "J0002"=>2,
            "J0003"=>3,
            "J0004"=>4,
            "J0005"=>4,
            "J0006"=>2,
            "J0x49"=>4,
            "J0x50"=>2,
            "J0x51"=>1,
            "J0x52"=>1,
            "J0x53"=>2,
            "J0x54"=>3,
            "J0x55"=>1,
            "J0x56"=>1,
            "J0x57"=>3,
            "J0x58"=>2,
            "J0x59"=>2,
            "J0x60"=>4,

            "J1007"=>3,
            "J1008"=>1,
            "J1009"=>1,
            "J1010"=>3,
            "J1011"=>3,
            "J1012"=>4,
            "J1x13"=>1,
            "J1x14"=>1,
            "J1x15"=>1,
            "J1x16"=>2,
            "J1x17"=>2,
            "J1x18"=>1,
            "J1x19"=>1,
            "J1x20"=>1,

            "J2013"=>1,
            "J2014"=>1,
            "J2015"=>2,
            "J2016"=>1,
            "J2017"=>1,
            "J2018"=>2,
            "J2x20"=>2,
            "J2x21"=>1,
            "J2x22"=>1,
            "J2x23"=>1,
            "J2x24"=>1,
            "J2x25"=>1,

            "J3019"=>2,
            "J3020"=>4,
            "J3021"=>3,
            "J3022"=>1,
            "J3023"=>3,
            "J3024"=>3,
            "J3x19"=>1,
            "J3x20"=>1,
            "J3x21"=>4,
            "J3x22"=>1,
            "J3x23"=>2,
            "J3x24"=>2,

            "J4025"=>4,
            "J4026"=>3,
            "J4027"=>3,
            "J4028"=>2,
            "J4029"=>3,
            "J40x7"=>1,
            "J40x8"=>3,
            "J40x9"=>2,
            "J40x10"=>4,
            "J40x11"=>2,
            "J40x12"=>1,
            "J40x13"=>3,
            "J40x14"=>2,
            "J40x15"=>2,
            "J40x16"=>2,
            "J40x17"=>4,
            "J40x18"=>1,
            "J40x19"=>1,
            "J40x20"=>1,
            "J40x21"=>1,
            "J40x22"=>1,
            "J40x23"=>2,
            "J40x24"=>2,
            "J40x25"=>2,

            "Y0001"=>3,
            "Y0002"=>2,
            "Y0003"=>3,
            "Y0004"=>4,
            "Y0005"=>4,
            "Y0006"=>2,
            "Y0x49"=>4,
            "Y0x50"=>2,
            "Y0x51"=>1,
            "Y0x52"=>1,
            "Y0x53"=>2,
            "Y0x54"=>3,
            "Y0x55"=>1,
            "Y0x56"=>1,
            "Y0x57"=>3,
            "Y0x58"=>2,
            "Y0x59"=>2,
            "Y0x60"=>4,

            "Y1007"=>3,
            "Y1008"=>1,
            "Y1009"=>1,
            "Y1010"=>3,
            "Y1011"=>3,
            "Y1012"=>4,
            "Y1x13"=>1,
            "Y1x14"=>1,
            "Y1x15"=>1,
            "Y1x16"=>2,
            "Y1x17"=>2,
            "Y1x18"=>1,
            "Y1x19"=>1,
            "Y1x20"=>1,

            "Y2013"=>1,
            "Y2014"=>1,
            "Y2015"=>2,
            "Y2016"=>1,
            "Y2017"=>1,
            "Y2018"=>2,
            "Y2x20"=>2,
            "Y2x21"=>1,
            "Y2x22"=>1,
            "Y2x23"=>1,
            "Y2x24"=>1,
            "Y2x25"=>1,

            "Y3019"=>2,
            "Y3020"=>4,
            "Y3021"=>3,
            "Y3022"=>1,
            "Y3023"=>3,
            "Y3024"=>3,
            "Y3x19"=>1,
            "Y3x20"=>1,
            "Y3x21"=>4,
            "Y3x22"=>1,
            "Y3x23"=>2,
            "Y3x24"=>2,

            "Y4025"=>4,
            "Y4026"=>3,
            "Y4027"=>3,
            "Y4028"=>2,
            "Y4029"=>3,
            "Y40x7"=>1,
            "Y40x8"=>3,
            "Y40x9"=>2,
            "Y40x10"=>4,
            "Y40x11"=>2,
            "Y40x12"=>1,
            "Y40x13"=>3,
            "Y40x14"=>2,
            "Y40x15"=>2,
            "Y40x16"=>2,
            "Y40x17"=>4,
            "Y40x18"=>1,
            "Y40x19"=>1,
            "Y40x20"=>1,
            "Y40x21"=>1,
            "Y40x22"=>1,
            "Y40x23"=>2,
            "Y40x24"=>2,
            "Y40x25"=>2,

            "S0001"=>3,
            "S0002"=>2,
            "S0003"=>3,
            "S0004"=>4,
            "S0005"=>4,
            "S0006"=>2,
            "S0x49"=>4,
            "S0x50"=>2,
            "S0x51"=>1,
            "S0x52"=>1,
            "S0x53"=>2,
            "S0x54"=>3,
            "S0x55"=>1,
            "S0x56"=>1,
            "S0x57"=>3,
            "S0x58"=>2,
            "S0x59"=>2,
            "S0x60"=>4,

            "S1007"=>3,
            "S1008"=>1,
            "S1009"=>1,
            "S1010"=>3,
            "S1011"=>3,
            "S1012"=>4,
            "S1x13"=>1,
            "S1x14"=>1,
            "S1x15"=>1,
            "S1x16"=>2,
            "S1x17"=>2,
            "S1x18"=>1,
            "S1x19"=>1,
            "S1x20"=>1,

            "S2013"=>1,
            "S2014"=>1,
            "S2015"=>2,
            "S2016"=>1,
            "S2017"=>1,
            "S2018"=>2,
            "S2x20"=>2,
            "S2x21"=>1,
            "S2x22"=>1,
            "S2x23"=>1,
            "S2x24"=>1,
            "S2x25"=>1,

            "S3019"=>2,
            "S3020"=>4,
            "S3021"=>3,
            "S3022"=>1,
            "S3023"=>3,
            "S3024"=>3,
            "S3x19"=>1,
            "S3x20"=>1,
            "S3x21"=>4,
            "S3x22"=>1,
            "S3x23"=>2,
            "S3x24"=>2,

            "S4025"=>4,
            "S4026"=>3,
            "S4027"=>3,
            "S4028"=>2,
            "S4029"=>3,
            "S40x7"=>1,
            "S40x8"=>3,
            "S40x9"=>2,
            "S40x10"=>4,
            "S40x11"=>2,
            "S40x12"=>1,
            "S40x13"=>3,
            "S40x14"=>2,
            "S40x15"=>2,
            "S40x16"=>2,
            "S40x17"=>4,
            "S40x18"=>1,
            "S40x19"=>1,
            "S40x20"=>1,
            "S40x21"=>1,
            "S40x22"=>1,
            "S40x23"=>2,
            "S40x24"=>2,
            "S40x25"=>2,






            "JE0001"=>3,
            "JE0002"=>2,
            "JE0003"=>3,
            "JE0004"=>4,
            "JE0005"=>4,
            "JE0006"=>2,
            "JE0x49"=>4,
            "JE0x50"=>2,
            "JE0x51"=>1,
            "JE0x52"=>4,
            "JE0x53"=>3,
            "JE0x54"=>1,
            "JE0x55"=>3,
            "JE0x56"=>1,
            "JE0x57"=>3,
            "JE0x58"=>1,
            "JE0x59"=>3,
            "JE0x60"=>2,

            "JE1007"=>3,
            "JE1008"=>1,
            "JE1009"=>1,
            "JE1010"=>3,
            "JE1011"=>3,
            "JE1012"=>4,
            "JE1x13"=>1,
            "JE1x14"=>3,
            "JE1x15"=>1,
            "JE1x16"=>2,
            "JE1x17"=>4,
            "JE1x18"=>2,
            "JE1x19"=>3,
            "JE1x20"=>1,

            "JE2013"=>2,
            "JE2014"=>1,
            "JE2015"=>2,
            "JE2016"=>1,
            "JE2017"=>1,
            "JE2018"=>2,
            "JE2x19"=>1,
            "JE2x20"=>2,
            "JE2x21"=>1,
            "JE2x22"=>4,
            "JE2x23"=>1,
            "JE2x24"=>3,
            "JE2x25"=>2,

            "JE3019"=>2,
            "JE3020"=>4,
            "JE3021"=>3,
            "JE3022"=>1,
            "JE3023"=>3,
            "JE3024"=>3,
            "JE3x19"=>1,
            "JE3x20"=>3,
            "JE3x21"=>4,
            "JE3x22"=>1,
            "JE3x23"=>3,
            "JE3x24"=>1,

            "JE4025"=>4,
            "JE4026"=>3,
            "JE4027"=>3,
            "JE4028"=>2,
            "JE4029"=>3,
            "JE40x7"=>1,
            "JE40x8"=>3,
            "JE40x9"=>4,
            "JE40x10"=>1,
            "JE40x11"=>3,
            "JE40x12"=>2,
            "JE40x13"=>4,
            "JE40x14"=>1,
            "JE40x15"=>3,
            "JE40x16"=>1,
            "JE40x17"=>1,
            "JE40x18"=>2,
            "JE40x19"=>1,
            "JE40x20"=>4,
            "JE40x21"=>2,
            "JE40x22"=>3,
            "JE40x23"=>1,
            "JE40x24"=>2,
            "JE40x25"=>4,


            "YE0001"=>3,
            "YE0002"=>2,
            "YE0003"=>3,
            "YE0004"=>4,
            "YE0005"=>4,
            "YE0006"=>2,
            "YE0x49"=>4,
            "YE0x50"=>2,
            "YE0x51"=>1,
            "YE0x52"=>4,
            "YE0x53"=>3,
            "YE0x54"=>1,
            "YE0x55"=>3,
            "YE0x56"=>1,
            "YE0x57"=>3,
            "YE0x58"=>1,
            "YE0x59"=>3,
            "YE0x60"=>2,

            "YE1007"=>3,
            "YE1008"=>1,
            "YE1009"=>1,
            "YE1010"=>3,
            "YE1011"=>3,
            "YE1012"=>4,
            "YE1x13"=>1,
            "YE1x14"=>3,
            "YE1x15"=>1,
            "YE1x16"=>2,
            "YE1x17"=>4,
            "YE1x18"=>2,
            "YE1x19"=>3,
            "YE1x20"=>1,

            "YE2013"=>2,
            "YE2014"=>1,
            "YE2015"=>2,
            "YE2016"=>1,
            "YE2017"=>1,
            "YE2018"=>2,
            "YE2x19"=>1,
            "YE2x20"=>2,
            "YE2x21"=>1,
            "YE2x22"=>4,
            "YE2x23"=>1,
            "YE2x24"=>3,
            "YE2x25"=>2,

            "YE3019"=>2,
            "YE3020"=>4,
            "YE3021"=>3,
            "YE3022"=>1,
            "YE3023"=>3,
            "YE3024"=>3,
            "YE3x19"=>1,
            "YE3x20"=>3,
            "YE3x21"=>4,
            "YE3x22"=>1,
            "YE3x23"=>3,
            "YE3x24"=>1,

            "YE4025"=>4,
            "YE4026"=>3,
            "YE4027"=>3,
            "YE4028"=>2,
            "YE4029"=>3,
            "YE40x7"=>1,
            "YE40x8"=>3,
            "YE40x9"=>4,
            "YE40x10"=>1,
            "YE40x11"=>3,
            "YE40x12"=>2,
            "YE40x13"=>4,
            "YE40x14"=>1,
            "YE40x15"=>3,
            "YE40x16"=>1,
            "YE40x17"=>1,
            "YE40x18"=>2,
            "YE40x19"=>1,
            "YE40x20"=>4,
            "YE40x21"=>2,
            "YE40x22"=>3,
            "YE40x23"=>1,
            "YE40x24"=>2,
            "YE40x25"=>4,


            "SE0001"=>3,
            "SE0002"=>2,
            "SE0003"=>3,
            "SE0004"=>4,
            "SE0005"=>4,
            "SE0006"=>2,
            "SE0x49"=>4,
            "SE0x50"=>2,
            "SE0x51"=>1,
            "SE0x52"=>4,
            "SE0x53"=>3,
            "SE0x54"=>1,
            "SE0x55"=>3,
            "SE0x56"=>1,
            "SE0x57"=>3,
            "SE0x58"=>1,
            "SE0x59"=>3,
            "SE0x60"=>2,

            "SE1007"=>3,
            "SE1008"=>1,
            "SE1009"=>1,
            "SE1010"=>3,
            "SE1011"=>3,
            "SE1012"=>4,
            "SE1x13"=>1,
            "SE1x14"=>3,
            "SE1x15"=>1,
            "SE1x16"=>2,
            "SE1x17"=>4,
            "SE1x18"=>2,
            "SE1x19"=>3,
            "SE1x20"=>1,

            "SE2013"=>2,
            "SE2014"=>1,
            "SE2015"=>2,
            "SE2016"=>1,
            "SE2017"=>1,
            "SE2018"=>2,
            "SE2x19"=>1,
            "SE2x20"=>2,
            "SE2x21"=>1,
            "SE2x22"=>4,
            "SE2x23"=>1,
            "SE2x24"=>3,
            "SE2x25"=>2,

            "SE3019"=>2,
            "SE3020"=>4,
            "SE3021"=>3,
            "SE3022"=>1,
            "SE3023"=>3,
            "SE3024"=>3,
            "SE3x19"=>1,
            "SE3x20"=>3,
            "SE3x21"=>4,
            "SE3x22"=>1,
            "SE3x23"=>3,
            "SE3x24"=>1,

            "SE4025"=>4,
            "SE4026"=>3,
            "SE4027"=>3,
            "SE4028"=>2,
            "SE4029"=>3,
            "SE40x7"=>1,
            "SE40x8"=>3,
            "SE40x9"=>4,
            "SE40x10"=>1,
            "SE40x11"=>3,
            "SE40x12"=>2,
            "SE40x13"=>4,
            "SE40x14"=>1,
            "SE40x15"=>3,
            "SE40x16"=>1,
            "SE40x17"=>1,
            "SE40x18"=>2,
            "SE40x19"=>1,
            "SE40x20"=>4,
            "SE40x21"=>2,
            "SE40x22"=>3,
            "SE40x23"=>1,
            "SE40x24"=>2,
            "SE40x25"=>4,

        ];


        $answers=0;
        foreach($ans as $question=>$a){
            if(isset($corr_ans[$question])&& $corr_ans[$question]===$a){

                $answers++;
            }
        }
        return $answers;
    }


    // View my performance
    public function myPerformance()
    {
        try {
            $user = Auth::user();
            $sql="SELECT *, (SELECT COUNT(id)+1 FROM performances WHERE mark >p.mark) AS rank FROM performances p WHERE user_id=$user->id ORDER BY rank asc LIMIT 6";
            $result=DB::select($sql);
            return $thisz->responseWithSuccess('Category successfully fetched.',$result);

        } catch (\Exception $exception) {

            return $this->responseWithError($exception->getMessage());

        }
    }




    // View individual performance[PUBLIC]
    public function filterPerformance(Request $request)
    {
        try {

            $user_id=DB::table('users')->where('bc_nid',$request->pr)->value('id');

            $sql="SELECT *, (SELECT COUNT(id)+1 FROM performances WHERE mark >p.mark) AS globalRank FROM performances p WHERE user_id=$user_id ORDER BY globalRank asc LIMIT 120;
";
            $result=DB::select($sql);

            if ($result) {
                return $this->responseWithSuccess('Successfully fetched.', $result);
            }
            return $this->responseWithSuccess('Invalid data', $result);
        } catch (\Exception $exception) {

            return $this->responseWithError('Something went wrong!',$exception->getMessage());

        }


    }


    // View individual TOP performance[PUBLIC]
    public function filterPerformers(Request $request)
    {
        try {

            $user=DB::table('users')->where('bc_nid',$request->bcn);

            $user_id=$user->value('id');
            $user_loc=$user->value('location');
            $user_grp=$user->value('group');
            $user_gen=$user->value('gender');

            $sql_global="SELECT
    *
FROM (SELECT *, RANK() OVER (ORDER BY t.mark DESC) AS globalRank
  FROM (SELECT * FROM performances) AS t) AS rt
WHERE
    rt.user_id = $user_id
ORDER BY mark desc
LIMIT 1
";


            $sql_gen="SELECT
    *
FROM (SELECT *, RANK() OVER (PARTITION BY t.pr_gen ORDER BY t.mark DESC) AS globalRank
  FROM (SELECT * FROM performances) AS t) AS rt
WHERE
    rt.user_id = $user_id AND
    rt.pr_gen = '$user_gen'
ORDER BY mark desc
LIMIT 1";


            $sql_grp="SELECT
    *
FROM (SELECT *, RANK() OVER (PARTITION BY t.pr_group ORDER BY t.mark DESC) AS globalRank
  FROM (SELECT * FROM performances) AS t) AS rt
WHERE
    rt.user_id = $user_id AND
    rt.pr_group = '$user_grp'
ORDER BY mark desc
LIMIT 1
    ";



            $sql_loc="SELECT
    *
FROM (SELECT *, RANK() OVER (PARTITION BY t.pr_loc ORDER BY t.mark DESC) AS dis_rank
  FROM (SELECT * FROM performances) AS t) AS rt
WHERE
    rt.user_id = $user_id AND
    rt.pr_loc ='$user_loc'
ORDER BY mark desc
LIMIT 1";



            $sql_loc_grp="SELECT
    *
FROM (SELECT *, RANK() OVER (PARTITION BY t.pr_loc,t.pr_group ORDER BY t.mark DESC) AS globalRank
  FROM (SELECT * FROM performances) AS t) AS rt
WHERE
    rt.user_id = $user_id AND
    rt.pr_group = '$user_grp' AND
    rt.pr_loc ='$user_loc'
ORDER BY mark desc
LIMIT 1
    ";



            $sql_loc_gen="SELECT
    *
FROM (SELECT *, RANK() OVER (PARTITION BY t.pr_loc,t.pr_gen ORDER BY t.mark DESC) AS globalRank
  FROM (SELECT * FROM performances) AS t) AS rt
WHERE
    rt.user_id = $user_id AND
    rt.pr_gen = '$user_gen' AND
    rt.pr_loc ='$user_loc'
ORDER BY mark desc
LIMIT 1";



            $sql_loc_grp_gen="SELECT
    *
FROM (SELECT *, RANK() OVER (PARTITION BY t.pr_loc,t.pr_group,t.pr_gen ORDER BY t.mark DESC) AS globalRank
  FROM (SELECT * FROM performances) AS t) AS rt
WHERE
    rt.user_id = $user_id AND
    rt.pr_loc ='$user_loc' AND
    rt.pr_group = '$user_grp' AND
    rt.pr_gen = '$user_gen'
ORDER BY mark desc
LIMIT 1
    ";


            $performances['Global']=DB::select($sql_global);
            $performances['Gender']=DB::select($sql_gen);
            $performances['Group']=DB::select($sql_grp);
            $performances['District']=DB::select($sql_loc);
            $performances['Dis_Grp']=DB::select($sql_loc_grp);
            $performances['Dis_Gen']=DB::select($sql_loc_gen);
            $performances['Dis_Grp_Gen']=DB::select($sql_loc_grp_gen);

            if ($performances) {
                return $this->responseWithSuccess('Successfully fetched.'.$user_grp, $xperformances);
            }
            //  return $this->responseWithSuccess('Invalid data', $result);
        } catch (\Exception $exception) {

            return $this->responseWithError('Something went wrong!',$exception->getMessage());

        }


    }


    //PR Performances:: [Public]
    public function prPerformances (Request $request)
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
                    //"duration" => $view->duration,
                    //"corr_ans" => $view->correct_ans,
                    "mark" =>$view->mark,
                    "location" => $this->disBn($view->pr_loc),
                    "group" =>$this->grpBn($view->pr_group),
                    "gender" =>$this->genBn($view->pr_gen),


                ];
            });
            if ($data) {
                return $thisz->responseWithSuccess('Performance list', $data, $view['disp']);
            }
        } catch (\Exception $exception) {

             return $this->responseWithError('প্রতিযোগিতা সমাপ্ত...মুক্তিযুদ্ধ বিষয়ক মন্ত্রণালয়ের অনুমোদন সাপেক্ষে শীঘ্রই চূড়ান্ত ফলাফল প্রকাশ করা হবে');

        }
    }


}
