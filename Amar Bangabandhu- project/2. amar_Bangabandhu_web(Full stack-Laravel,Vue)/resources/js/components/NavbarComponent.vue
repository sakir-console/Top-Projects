<template>
    <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
        <div class="container">
            <a class="navbar-brand" href=" ">

            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label=" ">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Left Side Of Navbar -->
                <ul class="navbar-nav me-auto">

                </ul>

                <!-- Left Side Of Navbar -->
                <ul class="navbar-nav mx-lg-auto ">
                    <!-- Authentication Links -->

                    <li class="nav-item">
                        <router-link class="nav-link" :to="{name:'home'}">Home </router-link>
                    </li>


                    <li class="nav-item">
                        <router-link class="nav-link" :to="{name:'score-board'}">Scoreboard </router-link>
                    </li>


                    <li class="nav-item">
                        <router-link class="nav-link" :to="{name:'prize'}">Prizes </router-link>
                    </li>

                    <li class="nav-item">
                        <router-link class="nav-link" :to="{name:'notice'}">Notices </router-link>
                    </li>


                    <li class="nav-item">
                        <router-link class="nav-link" :to="{name:'test'}">Test </router-link>
                    </li>




                </ul>  <!-- Right Side Of Navbar -->
                <ul class="navbar-nav ms-auto">
                    <!-- Authentication Links -->

                    <li class="nav-item">
                        <a class="nav-link" href=" ">Login</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="">Register</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>

                        </a>

                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="">
                             Logout
                            </a>

                            <form id="logout-form" action=" " method="POST" class="d-none">

                            </form>
                        </div>
                    </li>

                </ul>
            </div>
        </div>
    </nav>

</template>

<script>
export default {
    mounted() {
        console.log('Navbar mounted.')
    }
}
</script>
