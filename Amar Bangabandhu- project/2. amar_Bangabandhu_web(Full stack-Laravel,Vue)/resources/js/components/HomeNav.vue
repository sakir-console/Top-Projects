<template>
    <div>
    <!-- Header Area Start  -->
    <header class="header">
        <!-- Top Header Area Start -->
        <section class="top-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="content">
                            <div class="left-content">
                                <ul class="left-list">
                                    <li>
                                        <p style="font-size:18px;color:rgb(200 200 200)">
                                          শোনো, একটি মুজিবরের থেকে
                                            লক্ষ মুজিবরের কন্ঠস্বরের ধ্বনি, প্রতিধ্বনি...
                                        </p>
                                    </li>

                                </ul>
                            </div>
                            <div class="right-content">
                                <ul class="right-list">

                                    <li>
                                        <router-link class="sign-in" :to="{name:'dev'}">নির্মাতা<div class="mr-hover-effect"></div></router-link>

                                    </li>

                                    <li v-if="!isLogged">

                                        <a href="#" class="sign-in" data-toggle="modal" data-target="#login">
                                            <i class="fas fa-user"></i> প্লেয়ার লগইন
                                        </a>
                                    </li>
                                    <li v-if="isLogged">

                                        <a href="/player/dashboard">
                                            <i class="fas fa-puzzle-piece"></i> প্রতিযোগী ড্যাশবোর্ড
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Top Header Area End -->

        <!--Main-Menu Area Start-->
        <div class="mainmenu-area">
            <div class="container">
                <div class="row">
                    <div class="sticky" id = "myheader">
                        <img :src="'../assets/images/sb.png'"/>
                    </div>

                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <router-link  :to="{name:'home'}" class="navbar-brand">
                                <img src="assets/images/abb.png"  height="62px" alt="">
                            </router-link>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_menu" aria-controls="main_menu"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse fixed-height" id="main_menu">
                                <ul class="navbar-nav ml-auto">
                                    <li class="nav-item">

                                            <router-link class="nav-link" :to="{name:'home'}">হোম </router-link>

                                    </li>
                                    <li class="nav-item">
                                        <router-link class="nav-link" :to="{name:'score-board'}">সাফলাঙ্ক্য  <div class="mr-hover-effect"></div></router-link>

                                    </li>
                                    <li class="nav-item">
                                    <router-link class="nav-link" :to="{name:'ranking'}">সেরা প্রতিযোগী<div class="mr-hover-effect"></div></router-link>

                                </li>
                                    <li class="nav-item">
                                        <router-link class="nav-link" :to="{name:'prize'}">পুরস্কারসমূহ<div class="mr-hover-effect"></div></router-link>

                                    </li>


                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#"  role="button" data-toggle="dropdown" aria-haspopup="true"
                                           aria-expanded="false">
                                            প্রতিযোগিতা
                                            <div class="mr-hover-effect"></div>
                                        </a>
                                        <ul class="dropdown-menu" >
                                            <li>
                                                <router-link class="dropdown-item" :to="{name:'notice'}"> <i class="fa fa-angle-double-right"></i>নোটিশ  <div class="mr-hover-effect"></div>
                                            </router-link>
                                            </li>
                                            <li>
                                                <router-link class="dropdown-item" :to="{name:'rules'}"> <i class="fa fa-angle-double-right"></i>নিয়মাবলী<div class="mr-hover-effect"></div>
                                            </router-link>
                                            </li>
                                            <li>
                                                <router-link class="dropdown-item" :to="{name:'about'}"> <i class="fa fa-angle-double-right"></i>প্রতিযোগিতা সম্পর্কিত  <div class="mr-hover-effect"></div>
                                            </router-link>
                                            </li>
                                            <li>
                                                <router-link class="dropdown-item" :to="{name:'faq'}"> <i class="fa fa-angle-double-right"></i>সাধারণ জিজ্ঞাসা<div class="mr-hover-effect"></div>
                                            </router-link>
                                            </li>

                                        </ul>
                                    </li>

<!--                                    <li class="nav-item">
                                        <router-link class="nav-link" :to="{name:'contact'}">যোগাযোগ<div class="mr-hover-effect"></div></router-link>

                                    </li>-->
                                </ul>
                                <a href="#" class="mybtn1"  data-toggle="modal" data-target="#signin">গেম খেলুন</a>

                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="sticky" id = "myheader2">
            <img :src="'../assets/images/100-2.png'"/>
        </div>


        <!--Main-Menu Area Start-->
    </header>
    <!-- Header Area End  -->
    <!-- Login Area Start -->
    <div v-if="modalShow" class="modal fade login-modal" id="login" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <div class="modal-body">
                    <div class="logo-area">
                        <img class="logo" src="assets/images/abb.png" alt="">
                    </div>
                    <div class="header-area">
                        <h4 class="title">প্লেয়ার লগ ইন</h4>
                        <p class="sub-title">নিম্নোক্ত তথ্য গুলো প্রদান করুন</p>

                        <h5 style="color:#ff4b4b">
                            {{msg}}
                        </h5>
                    </div>
                    <div class="form-area">
                        <form @submit.prevent="playerLogin">
                            <div class="form-group">
                                <label for="login-input-email">জাতীয় পরিচয়পত্র/ জন্মসনদ নম্বর*</label>
                                <input v-model="bcNid" type="number" class="input-field" id="login_bc_nid"  placeholder="পরিচয়পত্র/ জন্মসনদ নম্বর প্রবেশ করুন">
                            </div>
                            <div class="form-group">
                                <label for="login-input-password">পিন নম্বর*</label>
                                <input v-model="password" type="password" class="input-field" id="password_log"  placeholder="পিন নম্বর প্রবেশ করুন">
                            </div>
                            <div class="form-group">
                                <div class="box">
                                    <div class="left">
                                        <input type="checkbox" class="check-box-field" id="input-save-password" checked>
                                        <label for="input-save-password">পুনরায় লগ ইন সংরক্ষণ</label>
                                    </div>
                                    <div class="right">
                                        <router-link :to="{name:'pinReset'}" data-dismiss="modal" aria-label="Close"> পিন মনে নেই?</router-link>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                               <center> <button class="twoToneButton" id="butlogin">প্রবেশ করুন</button></center>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- Login Area End -->

    <!-- SignIn Area Start -->
    <div class="modal fade login-modal sign-in" id="signin" tabindex="-1" role="dialog" aria-labelledby="signin" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered " role="document">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <div class="modal-body">
                    <div class="logo-area">
                        <img class="logo" src="assets/images/abb.png" alt="">
                    </div>
                    <div class="header-area">
                        <h4 class="title">
                            অন্ধকারে পুবাকাশে উঠবে আবার দিনমণি...
                           </h4>
                        <p class="sub-title">  <a href="https://play.google.com/store/apps/details?id=com.abb.amarbangabandhu.app" style="color: #ff6a00;">ডাউনলোড করুন</a></p>
                    </div>
                    <div class="form-area">
                        <img src="assets/gp.jpg"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- SignIn Area End -->
        <!-- Messenger Chat Plugin Code -->
        <div id="fb-root"></div>

        <!-- Your Chat Plugin code -->
        <div id="fb-customer-chat" class="fb-customerchat">
        </div>


    </div>
</template>

<script>

export default {

    data(){
        return {
            modalShow: true,
            bcNid:'',
            password:'',
            result:false,
            msg:'',
            performances: [],
            isLogged:false
        }
    },
    methods: {
        playerLogin(){
            let twoToneButton = document.querySelector('.twoToneButton');

            twoToneButton.innerHTML = "লগইন হচ্ছে";
            twoToneButton.classList.add('spinning');

            axios.post(this.$api_url+'api/v1/signin',
                {'bc_nid':this.bcNid,'password':this.password}).then(
                response =>{
                    twoToneButton.innerHTML = "অপেক্ষা করুন";

                    this.result = true;
                    console.log(response);
                    this.performances = response.data.data;
                    localStorage.setItem('PrLog','prLog');
                    window.location = "/player/dashboard";
                    $('.close').click();
                }
            ).catch((error) => {
                twoToneButton.classList.remove('spinning');
                twoToneButton.innerHTML = "প্রবেশ করুন";
                this.msg = error.response.data.message;
                console.log(error.response);
            });
        }
    },
    mounted(){

        if (localStorage.getItem('PrLog')==='prLog') {
           this.isLogged=true
        } else {
            this.isLogged=false
        }



        var chatbox = document.getElementById('fb-customer-chat');
        chatbox.setAttribute("page_id", "105803808608857");
        chatbox.setAttribute("attribution", "biz_inbox");

        window.fbAsyncInit = function() {
            FB.init({
                xfbml            : true,
                version          : 'v13.0'
            });
        };

        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));



    }
}
</script>

<style scoped>
div.sticky {
    position: -webkit-sticky; /* Safari */
    position: sticky;
    top: 0;
}
#myheader{
    position: fixed;
    right: 0;
    top: 0;
     width: 185px;
    padding:10px;
}
#myheader2{
    position: fixed;
    left: 68px;
    top: -18px;
    width: 157px;
    padding: 18px;
}

@media (max-width: 991px) {
    #myheader2 {
       display: none;
    }
    #myheader{
        display: none;
    }

}
.twoToneCenter {
    text-align: center;
    margin: 1em 0;
}
.twoToneButton {
    display: inline-block;
    outline: none;
    padding: 10px 20px;
    line-height: 1.4;
    background: #212121;
    background: linear-gradient(to bottom, #545454 0%, #474747 50%, #141414 51%, #1b1b1b 100%);
    border-radius: 4px;
    border: 1px solid #000000;
    color: #dadada;
    text-shadow: #000000 -1px -1px 0px;
    position: relative;
    transition: padding-right 0.3s ease;
    font-weight: 700;
    box-shadow: 0 1px 0 #6e6e6e inset, 0px 1px 0 #3b3b3b;
}
.twoToneButton:hover {
    box-shadow: 0 0 10px #080808 inset, 0px 1px 0 #3b3b3b;
    color: #f3f3f3;
}
.twoToneButton:active {
    box-shadow: 0 0 10px #080808 inset, 0px 1px 0 #3b3b3b;
    color: #ffffff;
    background: #080808;
    background: linear-gradient(to bottom, #3b3b3b 0%, #2e2e2e 50%, #141414 51%, #080808 100%);
}
.twoToneButton.spinning {
    background-color: #212121;
    padding-right: 40px;
}
.twoToneButton.spinning:after {
    content: '';
    right: 6px;
    top: 50%;
    width: 0;
    height: 0;
    box-shadow: 0px 0px 0 1px #080808;
    position: absolute;
    border-radius: 50%;
    -webkit-animation: rotate360 0.5s infinite linear, exist 0.1s forwards ease;
    animation: rotate360 0.5s infinite linear, exist 0.1s forwards ease;
}
.twoToneButton.spinning:before {
    content: "";
    width: 0px;
    height: 0px;
    border-radius: 50%;
    right: 6px;
    top: 50%;
    position: absolute;
    border: 2px solid #000000;
    border-right: 3px solid #27ae60;
    -webkit-animation: rotate360 0.5s infinite linear, exist 0.1s forwards ease;
    animation: rotate360 0.5s infinite linear, exist 0.1s forwards ease;
}
@-webkit-keyframes rotate360 {
    100% {
        transform: rotate(360deg);
    }
}
@keyframes rotate360 {
    100% {
        transform: rotate(360deg);
    }
}
@-webkit-keyframes exist {
    100% {
        width: 15px;
        height: 15px;
        margin: -8px 5px 0 0;
    }
}
@keyframes exist {
    100% {
        width: 15px;
        height: 15px;
        margin: -8px 5px 0 0;
    }
}
body {
    background: #212121;
}

</style>

