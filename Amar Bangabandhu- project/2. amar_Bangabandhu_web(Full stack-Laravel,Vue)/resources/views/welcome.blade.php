@extends('layouts.app')
@section('content')

    <button onclick="auth();">Auth</button>
    <button onclick="login();">Login</button>
    <button onclick="profile();">Profile</button>
@endsection

<script type="text/javascript">


    function auth(){
        axios.get('https://test.amarbangabandhu.app/sanctum/csrf-cookie').then(
            response =>{
                console.log(response);





            }
        );


    }



    function login(){
        axios.post('https://test.amarbangabandhu.app/api/v1/signin',{'bc_nid':'12345678911','password':'123456'}).then(
            response =>{
                console.log(response);
            }
        );
    }

    function profile(){
        axios.get('https://test.amarbangabandhu.app/api/v1/check').then(
            response =>{
                console.log(response);
            }
        );
    }



</script>

