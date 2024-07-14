<template>
    <div class="limiter">
        <div class="container-login100" style="background-image: url('admin-assets/auth/images/bd-bg.jpg');">
            <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                <form class="login100-form validate-form" @submit.prevent="auth">
					<span class="login100-form-title p-b-49">

						Administrative Login
					</span>

                    <div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
                        <span class="label-input100">Administrative Code</span>
                        <input v-model="admCode" class="input100" type="text" name="username" placeholder="Type your username">

                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Password is required">
                        <span class="label-input100">Password</span>
                        <input v-model="pass" class="input100" type="password" name="pass" placeholder="Type your password">

                    </div>

                    <div class="text-right p-t-8 p-b-31">
                        <font href="#" style="color:red">
                            {{msg}}
                        </font>
                    </div>

                    <div class="container-login100-form-btn">
                        <div class="wrap-login100-form-btn">
                            <div class="login100-form-bgbtn"></div>
                            <button class="login100-form-btn">
                                Login
                            </button>
                        </div>
                    </div>

                    <div class="txt1 text-center p-t-54 p-b-20">
						<span>
							Powered by: AmarBanagabandhu.app {{cook}}
						</span>
                    </div>


                </form>
            </div>
        </div>
    </div>

</template>

<script>


export default {
name: "auth",
    data(){
        return {
            admCode:'',
            pass:'',
            msg:'Use respective credentials',
            cook:'',
        }
    },
    methods: {
        auth(){
            let loginBtn = document.querySelector('.login100-form-btn');
            localStorage.setItem('myCat', 'Tom');


            loginBtn.innerHTML = "লগিন হচ্ছে";
            loginBtn.classList.add('spinning');
            this.cook=  localStorage.getItem('Modlog');

            axios.post(this.$api_url+'api/v1/signin',{'bc_nid':this.admCode,'password':this.pass}).then(
                response =>{
                    loginBtn.innerHTML = "অপেক্ষা করুন";
                    if(response.data['data']['Moderator']==true){
                        if(response.data['data']['Glob']==true) {
                            localStorage.setItem('Glob','true');

                        }
                        localStorage.setItem('Modlog','modlog');
                        localStorage.setItem('loc',response.data['data']['loc']);
                        window.location.href = '/admin/dashboard';
                    }

                    this.result = true;
                    console.log(response);
                    this.msg = response.data.message;

                }
            ).catch((error) => {
                loginBtn.classList.remove('spinning');
                loginBtn.innerHTML = "প্রবেশ করুন";
                this.msg = error.response.data.message;
                console.log(error.response);
            });
        }
    },

}
</script>

<style scoped>

.login100-form-btn.spinning {
    background-color: #212121;
    padding-right: 40px;
}
.login100-form-btn.spinning:after {
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
.login100-form-btn.spinning:before {
    content: "";
    width: 0px;
    height: 0px;
    border-radius: 50%;
    right: 6px;
    top: 50%;
    position: absolute;
    border: 2px solid #000000;
    border-right: 3px solid red;
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


</style>
