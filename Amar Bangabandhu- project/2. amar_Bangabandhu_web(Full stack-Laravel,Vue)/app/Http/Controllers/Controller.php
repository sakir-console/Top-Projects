<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;




    // Validation Helper
    protected function validateWithJson($data = [], $rules = [])
    {
        $validator = Validator::make($data, $rules);

        if ($validator->passes()) {
            return true;
        }
        return $validator->getMessageBag()->all();
    }

    // Success Result
    protected function responseWithSuccess($message = '', $data = [], $display = [], $code = 200)
    {

        return response()->json([
            'result' => true,

            'message' => $message,
            'data' => $data ?? "No data available",
            'display' => $display,
        ], $code,['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],JSON_UNESCAPED_UNICODE);

    }

    //Failure Result
    protected function responseWithError($message = '', $data = [], $code = 400)
    {
        return response()->json([
            'result' => false,
            'message' => $message,
            'data' => $data
        ], $code,['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],JSON_UNESCAPED_UNICODE);

    }


    // App pass Helper
    protected function securityPass($request)
    {
        $check=$request->absp;
        $checkPlay=$request->spofalgl;
        if ($check==='lh14fhw5ks2@gs.usiuc.uuiyds' && $checkPlay==='al.ds5gd#bng.feixz') {
            return true;
        }
        return false;
    }



    //Image(single) Upload Helper
    protected function imageUpload($request, $ImageName, $uploadDir)
    {
        if ($request->hasFile($ImageName)) {
            $Image = $request->file($ImageName);
            $ext = Str::lower($Image->getClientOriginalExtension());//Display File Extension
            $name = Str::random(15) . Str::limit($Image->getClientOriginalName(), 1, '');  // File new Name
            $file_name = $name . "." . $ext;  // Modified File Name
            $success = $Image->move(public_path('uploads/images/' . $uploadDir . '/'), $file_name); //Move Uploaded File(Upload_dir, File_name)

            if ($success) {
                return $file_name;
            } else {
                return false;
            }
        } else {
            return 'Select Image first';
        }

    }



    // OTP verification
    public function verifyOTP($contacts,$otp)
    {

        $check_otp=DB::table('otp_code')
            ->where('phone',$contacts)
            ->latest('id') ->value('otp_code');

        if ($check_otp===$otp){
            return true;
        }
        return false;
    }


    // Moderator pass Helper
    protected function modPass()
    {
        if (Auth::user()->tokenCan('role:AB_mod')) {
            return true;
        }
        return false;
    }


    // Admin pass Helper
    protected function adminPass()
    {
        if (Auth::user()->tokenCan('role:AB_admin')) {
            return true;
        }
        return false;
    }


    //#Data Search # Filter as Cat, subCat,Top--Sold,price
    protected function Filter($query, $request)
    {

        //---- Location wise
        if ($request->loc) {
            $query->where('pr_loc', $request->loc);
        }
        //----Group wise
        if ($request->grp) {
            $query->where('pr_group', $request->grp);
        }

        //----Guardian Profession wise
        if ($request->grd_pf) {
            $query->where('pr_grd_prf', $request->grd_pf);
        }

        //----Gender wise
        if ($request->gen) {
            $query->where('pr_gen', $request->gen);
        }



        $total = $query->count();
        $limit = $request->limit ?: 10;
        $page = $request->page && $request->page > 0 ? $request->page : 1;
        $offsetValue = ($page - 1) * $limit;
        $result = $query ->orderBy('mark','desc')->offset($offsetValue)->limit($limit)->get();

        $display = [
            "per_page" => $limit,
            "current_page" => $page,
            "last_page" => ceil($total / $limit),
            "total" => $total,
        ];
        return array('data' => $result, 'disp' => $display);
    }


    public function disBn($d)
    {

            switch ($d) {

                case 0:
                    return 'Molwa-Admin!';
                    break;
                case 1:
                    return 'ঢাকা!';
                    break;
                case 2:
                    return 'চট্টগ্রাম!';
                    break;
                case 3:
                    return 'রাজশাহী!';
                    break;
                case 4:
                    return 'খুলনা!';
                    break;
                case 5:
                    return 'বরিশাল!';
                    break;
                case 6:
                    return 'সিলেট!';
                    break;
                case 7:
                    return 'ময়মনসিংহ!';
                    break;
                case 8:
                    return 'গাজীপুর!';
                    break;
                case 9:
                    return 'গোপালগঞ্জ!';
                    break;
                case 10:
                    return 'কিশোরগঞ্জ!';
                    break;
                case 11:
                    return 'ফরিদপুর!';
                    break;
                case 12:
                    return 'মানিকগঞ্জ!';
                    break;
                case 13:
                    return 'মুন্সিগঞ্জ!';
                    break;
                case 14:
                    return 'রাজবাড়ী!';
                    break;
                case 15:
                    return 'ব্রাহ্মণবাড়িয়া!';
                    break;
                case 16:
                    return 'কুমিল্লা!';
                    break;
                case 17:
                    return 'ফেনী!';
                    break;
                case 18:
                    return 'রাঙ্গামাটি!';
                    break;
                case 19:
                    return 'নোয়াখালী!';
                    break;
                case 20:
                    return 'চাঁদপুর!';
                    break;
                case 21:
                    return 'লক্ষ্মীপুর!';
                    break;
                case 22:
                    return 'কক্সবাজার!';
                    break;
                case 23:
                    return 'খাগড়াছড়ি!';
                    break;
                case 24:
                    return 'বান্দরবান!';
                    break;
                case 25:
                    return 'সিরাজগঞ্জ!';
                    break;
                case 26:
                    return 'পাবনা!';
                    break;
                case 27:
                    return 'বগুড়া!';
                    break;
                case 28:
                    return 'নাটোর!';
                    break;
                case 29:
                    return 'জয়পুরহাট!';
                    break;
                case 30:
                    return 'চাঁপাইনবাবগঞ্জ!';
                    break;
                case 31:
                    return 'নওগাঁ!';
                    break;
                case 32:
                    return 'যশোর!';
                    break;
                case 33:
                    return 'সাতক্ষীরা!';
                    break;
                case 34:
                    return 'মেহেরপুর!';
                    break;
                case 35:
                    return 'নড়াইল!';
                    break;
                case 36:
                    return 'চুয়াডাঙ্গা!';
                    break;
                case 37:
                    return 'কুষ্টিয়া!';
                    break;
                case 38:
                    return 'মাগুরা!';
                    break;
                case 39:
                    return 'বাগেরহাট!';
                    break;
                case 40:
                    return 'ঝিনাইদহ!';
                    break;
                case 41:
                    return 'ঝালকাঠি!';
                    break;
                case 42:
                    return 'পটুয়াখালী!';
                    break;
                case 43:
                    return 'পিরোজপুর!';
                    break;
                case 44:
                    return 'ভোলা!';
                    break;
                case 45:
                    return 'বরগুনা!';
                    break;
                case 46:
                    return 'মৌলভীবাজার!';
                    break;
                case 47:
                    return 'হবিগঞ্জ!';
                    break;
                case 48:
                    return 'সুনামগঞ্জ!';
                    break;
                case 49:
                    return 'নরসিংদী!';
                    break;
                case 50:
                    return 'শরীয়তপুর!';
                    break;
                case 51:
                    return 'নারায়ণগঞ্জ!';
                    break;
                case 52:
                    return 'টাঙ্গাইল!';
                    break;
                case 53:
                    return 'মাদারীপুর!';
                    break;
                case 54:
                    return 'পঞ্চগড়!';
                    break;
                case 55:
                    return 'দিনাজপুর!';
                    break;
                case 56:
                    return 'লালমনিরহাট!';
                    break;
                case 57:
                    return 'নীলফামারী!';
                    break;
                case 58:
                    return 'গাইবান্ধা!';
                    break;
                case 59:
                    return 'ঠাকুরগাঁও!';
                    break;
                case 60:
                    return 'রংপুর!';
                    break;
                case 61:
                    return 'কুড়িগ্রাম!';
                    break;
                case 62:
                    return 'শেরপুর!';
                    break;
                case 63:
                    return 'জামালপুর!';
                    break;
                case 64:
                    return 'নেত্রকোণা!';
                    break;


                default:
                    return ' ';
            }

     }


    public function genBn($g)
    {

        switch ($g) {

            case 1:
                return 'পুরুষ!';
                break;
            case 2:
                return 'মহিলা!';
                break;
            case 3:
                return 'অন্যান্য!';
                break;

            default:
                return ' Gender';
        }

     }



    public function grpBn($g)
    {

        switch ($g) {

            case 'jnr':
                return 'জুনিয়র';
                break;
            case 'yth':
                return 'ইয়থ';
                break;
            case 'snr':
                return 'সিনিয়র';
                break;

            default:
                return ' Group';
        }

     }


    public function pfBn($p)
    {

        switch ($p) {

            case 1:
                return 'সেনাবাহিনী!';
                break;
            case 2:
                return 'নৌবাহিনী!';
                break;
            case 3:
                return 'বিমানবাহিনী!';
                break;
            case 4:
                return 'বিজিবি!';
                break;
            case 5:
                return 'র‍্যাব!';
                break;
            case 6:
                return 'পুলিশ!';
                break;
            case 7:
                return 'সরকারি চাকুরিজীবী!';
                break;
            case 8:
                return 'বেসরকারি চাকুরিজীবী!';
                break;
            case 9:
                return 'স্বাস্থ্যসেবা!';
                break;
            case 10:
                return 'প্রকৌশল!';
                break;
            case 11:
                return 'শিক্ষকতা!';
                break;
            case 12:
                return 'অন্যান্য!';
                break;

            default:
                return ' Workplace';
        }

     }


    //Send SMS
    public function sendSMS($msg,$mobile)
    {

        $url = "https://api.sms.net.bd/sendsms";
        $data = [
            "api_key" => "0xWL25onniyGg3dUHLP0hFYPXf9PimD2kU04wvsk",
            "to" =>$mobile,
            "msg" => $msg
        ];
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $response = curl_exec($ch);
        curl_close($ch);

        //Response
        return json_decode($response);

    }



}
