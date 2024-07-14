@extends('layouts.app')

@section('styles')
    <link href="https://fonts.googleapis.com/css2?family=Hind+Siliguri:wght@500&display=swap" rel="stylesheet">

    <link href="{{ asset('admin-assets/auth/css/util.css') }}" rel="stylesheet"/>
    <link href="{{ asset('admin-assets/auth/css/main.css') }}" rel="stylesheet"/>




@endsection
@section('title') Administrative Auth @endsection

@section('content')

<admin-auth/>
@endsection


