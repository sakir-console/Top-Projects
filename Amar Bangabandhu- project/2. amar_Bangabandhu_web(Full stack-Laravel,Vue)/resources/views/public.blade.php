@extends('layouts.app')

@section('styles')
    <link href="https://fonts.googleapis.com/css2?family=Hind+Siliguri:wght@500&display=swap" rel="stylesheet">


    <!-- Styles ok -->
    <link href="{{ asset('assets/css/bootstrap.min.css') }}" rel="stylesheet"/>
    <!-- Plugin css -->
    <link href="{{ asset('assets/css/plugin.css') }}" rel="stylesheet"/>
    <!-- stylesheet -->
    <link href="{{ asset('assets/css/style.css') }}" rel="stylesheet"/>
    <!-- responsive -->
    <link href="{{ asset('assets/css/responsive.css') }}" rel="stylesheet"/>
@endsection
@section('title')আমার বঙ্গবন্ধু @endsection

@section('content')
<home-nav></home-nav>

<router-view class="mt-5"></router-view>


<home-footer></home-footer>
@endsection



@section('scripts')

    <script src="{{ asset('assets/js/jquery.js') }}"></script>
    <!-- popper -->
    <script src="{{ asset('assets/js/popper.min.js') }}"></script>
    <!-- bootstrap -->
    <script src="{{ asset('assets/js/bootstrap.min.js') }}"></script>
    <!-- plugin js-->
    <script src="{{ asset('assets/js/plugin.js') }}"></script>
    <!-- MpusemoverParallax JS-->
    <script src="{{ asset('assets/js/TweenMax.js') }}"></script>
    <script src="{{ asset('assets/js/mousemoveparallax.js') }}"></script>
    <!-- main -->

    <script src="{{ asset('assets/js/main.js') }}"></script>
@endsection
