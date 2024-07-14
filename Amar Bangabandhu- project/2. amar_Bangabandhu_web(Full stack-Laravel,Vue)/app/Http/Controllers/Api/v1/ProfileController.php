<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Controller;
use App\Models\Performance;
use App\Models\Profile;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ProfileController extends Controller
{



    //Profile:: [PUBLIC]
    public function prProfilePub(Request $request)
    {

        try {
            $query = Profile::with('user')->where('user_id', $request->id)->get();
            $data = $query->map(function ($view) {
                return [
                    "user_id" => $view->user_id,
                    "name" => $view->user->name,
                    "gender" =>$view->user->gender,
                    "location" => $view->user->location,
                    "group" => $view->user->group,
                    "pp" => $view->photo,

                ];
            });
            if ($data) {
                return $this->responseWithSuccess('Player profile', $data);
            }



        } catch (\Exception $exception) {

            return $this->responseWithError($exception->getMessage());

        }
    }


    //Player OWN profile
    public function myProfile()
    {
        $user = Auth::user();

        try {

            $query = Profile::with('user')->where('user_id', $user->id)->get();

            $data = $query->map(function ($view) {
                return [
                    "user_id" => $view->user_id,
                    "name" => $view->user->name,
                    "gender" =>$view->user->gender,
                    "mobile" => $view->mobile,
                    "bc_nid" => $view->user->bc_nid,
                     "ttl_played"=>Performance::where('user_id', $view->user_id)->count(),

                    "location" => $this->disBn($view->user->location),
                    "group" => $view->user->group,
                    "dob" => $view->user->dob,
                    "guardian_prf" =>$view->user->grdn_prf,
                    "blood_grp" => $view->bg,
                    "email" => $view->email,
                    "insit" => $view->institution,
                    "fb" => $view->facebook,
                    "pp" => $view->photo,

                ];
            });
            if ($data) {
                return $this->responseWithSuccess('Performance list', $data);
            }



        } catch (\Exception $exception) {

            return $this->responseWithError($exception->getMessage());

        }
    }

    //Update  player profile
    public function updateProfile(Request $request)
    {

        $data = $request->all();
        $rules = [
            'full_name' => 'string|required|max:100',

            'email' => 'email',
            'facebook' => 'string|max:400|required',
            'blood_grp' => 'string|max:50',
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|digits:11',
            'institution' => 'string|max:400|required',
            'player_photo' => 'max:250'
        ];

        $response = $this->validateWithJSON($request->only('full_name', 'facebook','blood_grp','institution','player_photo','email','phone'), $rules);

        if ($response === true) {

            try {
                $user = Auth::user();
                $selected = DB::table('users_info')->where('user_id', $user->id)->first()->photo;

                $uploadImage = $this->imageUpload($request, 'player_photo', 'pp/'.$user->group);
                $updtPrimary = DB::table('users')
                    ->where('id', $user->id)
                    ->update([
                        'name' => $request->full_name,

                    ]);
                $updtSecondary = DB::table('users_info')
                    ->where('user_id', $user->id)
                    ->update([
                        'bg' => $request->blood_grp,
                        'email' => $request->email,
                        'mobile' => $request->phone,

                        'institution' => $request->institution,
                        'facebook' => $request->facebook,
                    ]);


                if ($request->hasFile('player_photo')) {
                    $updtPhoto = DB::table('users_info')
                        ->where('user_id', $user->id)
                        ->update([
                            'photo' => $user->group.'/'.$uploadImage,
                        ]);
                    if($updtPhoto && !is_null($selected)){
                        unlink(public_path('uploads/images/pp/'.$selected));
                    }
                }



                return $this->responseWithSuccess('Profile updated Successfully.');

            } catch (\Exception $exception) {

                return $this->responseWithError($exception->getMessage());

            }

        } else {

            return $this->responseWithError('Validation failed', $response);
        }

    }


}
