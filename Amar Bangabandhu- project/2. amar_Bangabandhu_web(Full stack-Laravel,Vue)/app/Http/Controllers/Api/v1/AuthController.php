<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;


class AuthController extends Controller
{
    //Sign Up

    public function signUp(Request $request)
    {
        $rules = [
            'name' => 'string|required',
            'bc_nid' => 'required|unique:users,bc_nid|numeric|digits_between:10,17',
            'password' => 'required|min:6',
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|digits:11',
            'dob' => 'required',
            'location' => 'string|required',
            'gender' => 'string|required',
            'ref' => 'string',
        ];

        $response = $this->validateWithJSON($request->all(), $rules);
        $data = [];


        if ($response === true) {

            try {
                $dob_yr=explode("-", $request->dob)[0];
                $pr_age=now()->year-$dob_yr;
                $group= (0<=$pr_age && $pr_age<=10)?"jnr":((11<=$pr_age && $pr_age<=18)?"yth":((19<=$pr_age && $pr_age<=126)?"snr":"others"));


                $user = new User;
                $user->name = $request->name;
                $user->bc_nid = $request->bc_nid;
                $user->dob = $request->dob;
                $user->location = $request->location;
                $user->gender = $request->gender;
                $user->group = $group;
                $user->grdn_prf = $request->gdn_pfn;
                $user->password = bcrypt($request->password);
                $user->save();
                $last_user = $user->id;


                if($last_user){
                    $insertInfoRow = DB::table('users_info')->insert([
                        "user_id" => $last_user,
                        "email"=>null,
                        'mobile' => $request->phone,
                        "bg" => null,
                        "institution" => null,
                        "facebook" => null,
                        "photo" => null,
                        "ref" => $request->ref,
                    ]);
                }

                $token = $user->createToken('Token', ['role:fst_tkn'])->plainTextToken;
                $data['message'] = 'Successfully Created.';
                $data['grp'] = $group;
                $data['token'] = $token;
                return $this->responseWithSuccess('Registration successful', $data);

            } catch (\Exception $exception) {

                return $this->responseWithError($exception->getMessage());
            }
        }

        return $this->responseWithError('Validation failed', $response);

    }

    //Sign In
    public function signIn(Request $request)
    {

        $rules = [
            'bc_nid' => 'required',
            'password' => 'string|required|min:6'
        ];

        $response = $this->validateWithJSON($request->all(), $rules);
        $data = [];


        if ($response === true) {

            try {
                if (Auth::attempt([
                    'bc_nid' => $request->bc_nid,
                    'password' => $request->password,
                    'id' => [611,613,614,615,616,617,618,626,627,628,629,736,737,738,739,740,741,742,743,744,745,746,747,748,749,750,751,752,753,754,755,756,757,758,759,760,761,762,763,764,765,766,767,768,769,770,771,772,773,774,775,776,777,778,779,780,781,782,783,784,785,786,787,788,789,22975]

                ])) {

                    $user = Auth::user();
                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;
                    return $this->responseWithSuccess('Moderator Login successful', $data);

                } elseif (
                    $request->bc_nid =='molwa-admin' &&
                    $request->password == '112233'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022165261623',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['Glob'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Molwa Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Barisal-Admin' &&
                    $request->password == '20528200'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520008200',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Barisal Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Jhalokati-Admin' &&
                    $request->password == '20528400'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520008400',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Jhalokati Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Patuakhali-Admin' &&
                    $request->password == '20528600'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520008600',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Patuakhali Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Pirojpur-Admin' &&
                    $request->password == '20528500'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520008500',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Pirojpur Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Bhola-Admin' &&
                    $request->password == '20528300'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520008300',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Bhola Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Barguna-Admin' &&
                    $request->password == '20528700'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520008700',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Barguna Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Chittagong-Admin' &&
                    $request->password == '20524202'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520004202',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Chittagong Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Chandpur-Admin' &&
                    $request->password == '20523600'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520003600',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Chandpur Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Lakshmipur-Admin' &&
                    $request->password == '20523700'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520003700',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Lakshmipur Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Coxsbazar-Admin' &&
                    $request->password == '20524700'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520004700',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Coxsbazar Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Khagrachhari-Admin' &&
                    $request->password == '20524000'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520004400',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Khagrachhari Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Bandarban-Admin' &&
                    $request->password == '20524600'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520004600',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Bandarban Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Feni-Admin' &&
                    $request->password == '20523900'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520003900',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Feni Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Rangamati-Admin' &&
                    $request->password == '20524500'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520004500',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Rangamati Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Brahmanbaria-Admin' &&
                    $request->password == '20523400'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520003400',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Brahmanbaria Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Comilla-Admin' &&
                    $request->password == '20523500'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520003500',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Comilla Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Noakhali-Admin' &&
                    $request->password == '20523800'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520003800',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Noakhali Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Dhaka-Admin' &&
                    $request->password == '20521206'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520001206',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Dhaka Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Faridpur-Admin' &&
                    $request->password == '20527870'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520007870',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Faridpur Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Gazipur-Admin' &&
                    $request->password == '20527830'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520007830',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Gazipur Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Gopalganj-Admin' &&
                    $request->password == '20528102'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520008102',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Gopalganj Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Kishoreganj-Admin' &&
                    $request->password == '20522302'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520002301',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Kishoreganj Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Manikganj-Admin' &&
                    $request->password == '20521804'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520001804',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Manikganj Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Narsingdi-Admin' &&
                    $request->password == '20521600'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520001600',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Narsingdi Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Shariatpur-Admin' &&
                    $request->password == '20528000'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520008000',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Shariatpur Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Narayanganj-Admin' &&
                    $request->password == '20521400'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520001400',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Narayanganj Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Tangail-Admin' &&
                    $request->password == '20521900'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520001900',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Tangail Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Madaripur-Admin' &&
                    $request->password == '20527900'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520007900',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Madaripur Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Munshiganj-Admin' &&
                    $request->password == '20521500'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520001500',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Munshiganj Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Rajbari-Admin' &&
                    $request->password == '20521530'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520001530',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Rajbari Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Khulna-Admin' &&
                    $request->password == '20529000'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520009000',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Khulna Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Jessore-Admin' &&
                    $request->password == '20529340'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520009340',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Jessore Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Satkhira-Admin' &&
                    $request->password == '20529310'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520009310',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Satkhira Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Meherpur-Admin' &&
                    $request->password == '20527220'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520009320',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Meherpur Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Narail-Admin' &&
                    $request->password == '20527220'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520007220',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Narail Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Chuadanga-Admin' &&
                    $request->password == '20527210'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520007210',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Chuadanga Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Kushtia-Admin' &&
                    $request->password == '20529240'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520009240',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Kushtia Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Magura-Admin' &&
                    $request->password == '20529280'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520009280',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Magura Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Bagerhat-Admin' &&
                    $request->password == '20529300'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520009300',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Bagerhat Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Jhenaidah-Admin' &&
                    $request->password == '20527300'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520007300',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Jhenaidah Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Mymensingh-Admin' &&
                    $request->password == '20522200'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520002200',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Mymensingh Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Sherpur-Admin' &&
                    $request->password == '20522150'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520002150',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Sherpur Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Jamalpur-Admin' &&
                    $request->password == '20522000'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520002000',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Jamalpur Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Netrokona-Admin' &&
                    $request->password == '20522400'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520002400',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Netrokona Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Rajshahi-Admin' &&
                    $request->password == '20526000'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520006000',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Rajshahi Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Sirajganj-Admin' &&
                    $request->password == '20526700'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520006700',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Sirajganj Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Pabna-Admin' &&
                    $request->password == '20526620'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520006620',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Pabna Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Bogra-Admin' &&
                    $request->password == '20525800'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520005800',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Bogra Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Natore-Admin' &&
                    $request->password == '20525890'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520005890',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Natore Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Joypurhat-Admin' &&
                    $request->password == '20525940'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520005940',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Joypurhat Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Chapainawabganj-Admin' &&
                    $request->password == '20526310'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520006310',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Chapainawabganj Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Naogaon-Admin' &&
                    $request->password == '20526500'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520006500',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Naogaon Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Rangpur-Admin' &&
                    $request->password == '20525400'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520005400',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Rangpur Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Panchagarh-Admin' &&
                    $request->password == '20525000'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520005000',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Panchagarh Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Dinajpur-Admin' &&
                    $request->password == '20525280'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520005280',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Dinajpur Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Lalmonirhat-Admin' &&
                    $request->password == '20525500'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520005500',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Lalmonirhat Admin Login successful', $data);

                }


                elseif (
                    $request->bc_nid =='Nilphamari-Admin' &&
                    $request->password == '20525300'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520005300',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Nilphamari Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Gaibandha-Admin' &&
                    $request->password == '20525750'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520005750',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Gaibandha Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Thakurgaon-Admin' &&
                    $request->password == '20525103'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520005103',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Thakurgaon Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Kurigram-Admin' &&
                    $request->password == '20525600'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520005600',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Kurigram Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Sylhet-Admin' &&
                    $request->password == '20523100'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520003100',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Sylhet Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Moulvibazar-Admin' &&
                    $request->password == '20523250'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520003250',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Moulvibazar Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Habiganj-Admin' &&
                    $request->password == '20523370'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520003370',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Habiganj Admin Login successful', $data);

                }

                elseif (
                    $request->bc_nid =='Sunamganj-Admin' &&
                    $request->password == '20523080'

                ) {
                    Auth::attempt([
                        'bc_nid' => '2022520003080',
                        'password' => $request->password,

                    ]);

                    $user = Auth::user();

                    $token = $user->createToken('Token', ['role:AB_mod'])->plainTextToken;

                    $data['Moderator'] = true;
                    $data['grp'] = $user->group;
                    $data['loc'] = $user->location;

                    $data['token'] = $token;

                    return $this->responseWithSuccess('Sunamganj Admin Login successful', $data);

                }

                elseif (Auth::attempt([
                    'bc_nid' => $request->bc_nid,
                    'password' => $request->password,

                ])) {

                    $user = Auth::user();
                    $data['grp'] = $user->group;
                    $token = $user->createToken('Token', ['role:player'])->plainTextToken;
                    $data['user'] = $user;
                    $data['token'] = $token;

                    return $this->responseWithSuccess('Login successful', $data);
                } else {

                    return $this->responseWithError('Invalid Credentials');

                }


            } catch (\Exception $exception) {

                return $this->responseWithError($exception->getMessage());
            }
        }

        return $this->responseWithError('Validation failed', $response);
    }

    //Change password

    public function resetPassword(Request $request)
    {
        $rules = [
            'bcNid' => 'required|numeric|digits_between:10,17',
            'new_password' => 'required|min:6',
            'otpCode'=>'required'
        ];

        $user_id=DB::table('users')->where('bc_nid',$request->bcNid)->value('id');
        $phn=DB::table('users_info')->where('user_id',$user_id)->value('mobile');


        $response = $this->validateWithJSON($request->all(), $rules);
        $otpVerify = $this->verifyOTP($phn, $request->otpCode);
        $data = [];


        if ($response === true) {


            if($otpVerify===true){

                try {

                    User::where('bc_nid', $request->bcNid)
                        ->update(['password' => Hash::make($request->new_password)]);


                    $data['otp'] = "OTP Verified Successfully";

                    return $this->responseWithSuccess('Password changed successful', $data);

                } catch (\Exception $exception) {

                    return $this->responseWithError($exception->getMessage());
                }


            }else{
                return $this->responseWithError('OTP verification failed.');
            }}

        return $this->responseWithError('Validation failed', $response);

    }


    public function verify()
    {
        return $this->responseWithSuccess('Login successful');
    }


    public function logout()
    {



        try {

            auth()->user()->tokens()->delete();
            return $this->responseWithSuccess('Logout Successful');


        } catch (\Exception $exception) {

            return $this->responseWithError($exception->getMessage());
        }






    }


    public function resetOTP(Request $request)
    {
        $otp = rand(10000, 99999);
        $msg="প্রিয় প্রতিযোগী,\n'আমার বঙ্গবন্ধু'- একাউন্টের পাসওয়ার্ড রিসেট কোডঃ ".$otp;
        $bc_nid=$request->bcNid;

        $user_id=DB::table('users')->where('bc_nid',$request->bcNid)->value('id');


        if($user_id){
            $phn=DB::table('users_info')->where('user_id',$user_id)->value('mobile');
            $check_otp=DB::table('otp_code')
                ->where('phone',$phn);
            if($check_otp->count()<2){
                $store_otp=DB::table('otp_code')->insert([
                    "otp_code"=>$otp,
                    "phone"=>$phn,
                ]);
                $phnL3=substr($phn,-3);
                $sendOtpCode = $this->sendSMS($msg,$phn);

                $stat= $sendOtpCode->msg;

                if ($sendOtpCode->error===0){
                    return $this->responseWithSuccess('Reset OTP has been sent.',["phnL3"=>$phnL3,"otp-msg"=>$stat]);
                }else{
                    return $this->responseWithError("Unable to send OTP","ERROR: $stat");
                }

            }else{
                return $this->responseWithError("Cant send anymore otp");

            }
        }else{

            return $this->responseWithError("No account found.");

        }
    }




    // Admin pass Helper
    public function modLogin()
    {
        if (Auth::user()->tokenCan('role:AB_mod')) {
            return true;
        }
        return false;
    }


    // Admin pass
    public function adminLogin()
    {
        if (Auth::user()->tokenCan('role:AB_admin')) {
            return true;
        }
        return false;
    }













}

