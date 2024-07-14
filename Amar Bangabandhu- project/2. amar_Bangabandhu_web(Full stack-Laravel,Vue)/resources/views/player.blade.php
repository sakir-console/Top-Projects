@extends('layouts.app')

@section('styles')
    <link href="https://fonts.googleapis.com/css2?family=Hind+Siliguri:wght@500&display=swap" rel="stylesheet">


    <!-- Styles ok -->
    <link href="{{ asset('assets/player/plugins/custom/datatables/datatables.bundle.css') }}" rel="stylesheet"/>
    <!-- Plugin css -->
    <link href="{{ asset('assets/player/plugins/global/plugins.bundle.css') }}" rel="stylesheet"/>
    <!-- stylesheet -->
    <link href="{{ asset('assets/player/css/style.bundle.css') }}" rel="stylesheet"/>
@endsection
@section('title')আমার বঙ্গবন্ধু @endsection

@section('content')
    <!--begin::Body-->
    <body id="kt_body" style="background-image: url({{asset('assets/player/media/patterns/header-bg.jpg')}})" class="header-fixed header-tablet-and-mobile-fixed toolbar-enabled">
    <!--begin::Main-->
    <!--begin::Root-->
    <div class="d-flex flex-column flex-root">
        <!--begin::Page-->
        <div class="page d-flex flex-row flex-column-fluid">
            <!--begin::Wrapper-->
            <div class="wrapper d-flex flex-column flex-row-fluid" id="kt_wrapper">

                <player-nav></player-nav>

                <router-view class="mt-5"></router-view>

                <player-footer></player-footer>
            </div>
            <!--end::Wrapper-->
        </div>
        <!--end::Page-->
    </div>
    <!--end::Root-->

    </body>
    <!--end::Body-->



@endsection



@section('scripts')
    <script src="{{ asset('assets/js/jquery.js') }}"></script>

    <!-- popper -->
    <script src="{{ asset('assets/js/popper.min.js') }}"></script>
    <!-- bootstrap -->
    <script src="{{ asset('assets/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('assets/player/plugins/global/plugins.bundle.js') }}"></script>
    <script src="{{ asset('assets/player/js/scripts.bundle.js') }}"></script>


    <script src="{{ asset('assets/player/plugins/custom/datatables/datatables.bundle.js') }}"></script>
    <script src="{{ asset('assets/player/js/custom/pages/projects/list/list.js') }}"></script>
    <script src="{{ asset('assets/player/js/custom/pages/projects/users/users.js') }}"></script>
    <!-- Page js-->
    <script src="{{ asset('assets/player/js/custom/pages/projects/settings/settings.js') }}"></script>
    <script src="{{ asset('assets/player/js/custom/modals/new-target.js') }}"></script>
    <script src="{{ asset('assets/player/js/custom/widgets.js') }}"></script>

    <!-- main -->
    <script src="{{ asset('assets/js/main.js') }}"></script>
@endsection
