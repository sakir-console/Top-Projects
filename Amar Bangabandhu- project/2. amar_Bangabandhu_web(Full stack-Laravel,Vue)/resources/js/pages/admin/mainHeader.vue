<template>
    <header class="main-header" v-cloak>
        <div class="d-flex align-items-center logo-box justify-content-start">
            <a href="#" class="waves-effect waves-light nav-link d-none d-md-inline-block mx-10 push-btn bg-transparent"
               data-toggle="push-menu" role="button">
                <span class="icon-Align-left"><span class="path1"></span><span class="path2"></span><span
                    class="path3"></span></span>
            </a>
            <!-- Logo -->
            <a :href="`dashboard`" class="logo">
                <!-- logo-->
                <div class="logo-lg">
                    <span class="light-logo"><img src="/../admin-assets/images/abb.png" alt="logo"></span>
                </div>
            </a>
        </div>
        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <div class="app-menu">
                <ul class="header-megamenu nav">
                    <li class="btn-group nav-item d-md-none">
                        <a href="#" class="waves-effect waves-light nav-link push-btn" data-toggle="push-menu"
                           role="button">
                            <span class="icon-Align-left"><span class="path1"></span><span class="path2"></span><span
                                class="path3"></span></span>
                        </a>
                    </li>
                    <li class="btn-group nav-item d-none d-xl-inline-block">
                        <a href="" class="waves-effect waves-light nav-link svg-bt-icon"
                           title="Public View">
                            <i class="icon-Home"><span class="path1"></span><span class="path2"></span></i>
                        </a>
                    </li>


                </ul>
            </div>

            <div class="navbar-custom-menu r-side">
                <ul class="nav navbar-nav">
                    <li class="btn-group nav-item d-lg-inline-flex d-none">
                        <a href="#" data-provide="fullscreen" class="waves-effect waves-light nav-link full-screen"
                           title="Full Screen">
                            <i class="icon-Expand-arrows"><span class="path1"></span><span class="path2"></span></i>
                        </a>
                    </li>


                    <!-- Control Sidebar Toggle Button -->
                    <li>
                        <a @click="logout" data-toggle="control-sidebar" title="Logout"
                           class="waves-effect waves-light">
                            <i class="fa fa-sign-out text-muted me-2"> <span class="path1"></span><span
                                class="path2"></span></i>
                        </a>
                    </li>

                </ul>
            </div>
        </nav>
    </header>

</template>

<script>

export default {
    name: "mainHeader",
    data() {
        return {
            admCode: '',
            pass: '',
            msg: 'Use respective credentials',

        }
    },
    methods: {
        logout() {
            localStorage.removeItem('Modlog');
            localStorage.removeItem('Glob');
            localStorage.removeItem('loc');
            window.location.href = '/admin-login';
        },

    },

}
</script>

<style scoped>

</style>
