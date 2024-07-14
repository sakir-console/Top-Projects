@extends('layouts.app')

@section('styles')
    <link href="https://fonts.googleapis.com/css2?family=Hind+Siliguri:wght@500&display=swap" rel="stylesheet">

    <link href="{{ asset('admin-assets/css/vendors_css.css') }}" rel="stylesheet"/>
    <!-- stylesheet -->
    <link href="{{ asset('admin-assets/css/style.css') }}" rel="stylesheet"/>
    <link href="{{ asset('admin-assets/css/skin_color.css') }}" rel="stylesheet"/>
@endsection
@section('title') Moderator Panel @endsection

@section('content')
    <body class="hold-transition light-skin sidebar-mini theme-primary fixed">

    <div class="wrapper">
        <!-- main head -->
        <ad-header></ad-header>
        <!-- main sidebar-->
        <ad-sidebar></ad-sidebar>

        <div class="content-wrapper">
            <div class="container-full">
                <!-- Main content -->
                <router-view class="mt-5"></router-view>
                <!-- /.content -->
            </div>
        </div>


        <!-- /footer -->
        <ad-footer></ad-footer>

    </div>
    </body>

@endsection



@section('scripts')



    <script src="{{ asset('admin-assets/js/vendors.min.js') }}"></script>
    <script src="{{ asset('admin-assets/icons/feather-icons/feather.min.js') }}"></script>
    <script src="{{ asset('admin-assets/js/template.js') }}"></script>


    <script src="../admin-assets/vendor_components/apexcharts-bundle/dist/apexcharts.js"></script>
    <script src="../admin-assets/vendor_components/easypiechart/dist/jquery.easypiechart.js"></script>
    <script src="../admin-assets/vendor_components/chart.js-master/Chart.min.js"></script>
    <script src="../admin-assets/vendor_components/d3/d3.min.js"></script>
    <script src="../admin-assets/vendor_components/d3/d3_tooltip.js"></script>
    <script src="../admin-assets/vendor_components/echarts/dist/echarts-en.min.js"></script>


    <script src="../admin-assets/js/pages/dashboard3.js"></script>
    <script src="../admin-assets/js/pages/chart-widgets.js"></script>
    <script src="../admin-assets/js/pages/chartjs-int.js"></script>
    <script src="../admin-assets/js/pages/echart-pie-doghnut.js"></script>
    <script src="../admin-assets/vendor_components/datatable/datatables.min.js"></script>
    <script src="../admin-assets/js/pages/data-table.js"></script>



    <!-- main -->
    <script src="{{ asset('assets/js/main.js') }}"></script>
@endsection
