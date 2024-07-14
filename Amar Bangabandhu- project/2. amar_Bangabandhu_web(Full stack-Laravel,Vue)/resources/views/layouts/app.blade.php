<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/x-icon" href="assets/images/favicon.ico">
    <title>@yield('title', $page_title ?? '')</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    @yield('styles')

</head>
<body>
<div id="app">

    <main>
        @yield('content')
    </main>
</div>
@yield('scripts')
<!-- Scripts -->
<script src="{{ asset('js/app.js') }}"></script>

</body>
</html>
