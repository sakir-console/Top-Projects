<template>
    <div>
        <!-- Breadcrumb Area Start -->
        <section class="breadcrumb-area bc-affiliate" style="padding: 119px 0px 0px;">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10">
                    <div class="section-heading">
                        <h5 class="subtitle">
                            একাউন্ট পিন রিসেট করুন
                        </h5>

                        <p class="text">
                            পিন রিসেট করতে, তথ্য গুলো যাচাই করুন

                        </p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Affiliate Program Area Start -->
        <section class="affiliate-program">
            <div class="container">

                <div class="container d-flex justify-content-center align-items-center" style="height:54vh">
                    <div class="position-relative">
                        <div v-if="!passChanged" class="card p-2 text-center">
                            নিবন্ধনকৃত একাউন্টের তথ্য যাচাই করুন
                            <input v-model="bcNID" class="m-2 text-center form-control rounded" type="number" id="BCNID"
                                   maxlength="17" placeholder="জন্মসনদ/পরিচয় পত্র নম্বর"/>

                            <div v-if="otpSec">

                                <h6>আপনার নিবন্ধনকৃত মোবাইল নম্বরে,
                                </h6>
                                <div><span>একটি OTP কোড পাঠানো হয়েছেঃ</span> <small>********{{phnL3}}</small></div>

                                <div id="otp" class="inputs d-flex flex-row justify-content-center mt-2">
                                    <input v-model="otpC1" class="m-2 text-center form-control rounded" type="text" id="first" maxlength="1"/>
                                    <input v-model="otpC2" class="m-2 text-center form-control rounded" type="text" id="second"
                                        maxlength="1"/>
                                    <input v-model="otpC3" class="m-2 text-center form-control rounded" type="text" id="third"
                                        maxlength="1"/>
                                    <input v-model="otpC4" class="m-2 text-center form-control rounded" type="text" id="fourth"
                                        maxlength="1"/>
                                    <input v-model="otpC5" class="m-2 text-center form-control rounded" type="text" id="fifth"
                                        maxlength="1"/>

                                </div>
                                <input v-model="newPass" class="m-2 text-center form-control rounded" type="text" id="newPass"
                                       maxlength="17" placeholder="নতুন একটি পিন প্রবেশ করুন"/>

                            </div>
{{msg}}

                            <div v-if="!otpSec" v-on:click="resetOTP" class="mt-4">
                                <button class="btn btn-danger px-4 validate">যাচাই করুন</button>
                            </div>
                            <div v-if="otpSec" @click="resetPass" class="mt-4">
                                <button class="btn btn-danger px-4 validate">সাবমিট করুন</button>
                            </div>
                        </div>
                        <div v-else class="card p-2 text-center">
                            সফলভাবে নতুন  পিন সেট হয়েছে।

                        </div>

                        <div class="card-2">
                            <div class="content d-flex justify-content-center align-items-center"><span>AmarBangabandhu</span>
                                <a href="#" class="text-decoration-none ms-3">.app</a></div>
                        </div>
                    </div>
                </div>


            </div>
        </section>
        <!-- Affiliate Program Area End -->
    </div>
</template>

<script>

document.addEventListener("DOMContentLoaded", function (event) {

    function OTPInput() {
        const inputs = document.querySelectorAll('#otp > *[id]');
        for (let i = 0; i < inputs.length; i++) {
            inputs[i].addEventListener('keydown', function (event) {
                if (event.key === "Backspace") {
                    inputs[i].value = '';
                    if (i !== 0) inputs[i - 1].focus();
                } else {
                    if (i === inputs.length - 1 && inputs[i].value !== '') {
                        return true;
                    } else if (event.keyCode > 47 && event.keyCode < 58) {
                        inputs[i].value = event.key;
                        if (i !== inputs.length - 1) inputs[i + 1].focus();
                        event.preventDefault();
                    } else if (event.keyCode > 64 && event.keyCode < 91) {
                        inputs[i].value = String.fromCharCode(event.keyCode);
                        if (i !== inputs.length - 1) inputs[i + 1].focus();
                        event.preventDefault();
                    }
                }
            });
        }
    }

    OTPInput();
});

export default {
    name: "pinReset",

    data() {
        return {
            otpSec: false,
            bcNID: '',
            phnL3:'',
            newPass:'',
            otpC1:'',
            otpC2:'',
            otpC3:'',
            otpC4:'',
            otpC5:'',
            result: false,
            msg: '',
            passChanged:false,
        }
    },
    methods: {
        resetOTP() {
            axios.post(this.$api_url + 'api/v1/reset-otp', {

                    "bcNid": this.bcNID,

            }).then(
                response => {
                    this.otpSec = true;
                    this.phnL3=response.data.data.phnL3;
                    console.log(response);
                    this.msg = console.log(response);
                }
            ).catch((error) => {

                this.msg = error.response.data.message;
                console.log(error.response);
            });
        },
        resetPass() {
            axios.post(this.$api_url + 'api/v1/reset-password', {
                    "bcNid": this.bcNID,
                    "new_password": this.newPass,
                    "otpCode": this.otpC1+this.otpC2+this.otpC3+this.otpC4+this.otpC5,
            }).then(
                response => {
                    this.passChanged=true
                    console.log(response);
                    this.msg = console.log(response);
                }
            ).catch((error) => {

                this.msg = error.response.data.message;
                console.log(error.response);
            });
        },
    },
}
</script>

<style scoped>

.height-100 {
    height: 100vh
}

.card {
    width: 400px;
    border: none;
    height: 365px;
    box-shadow: 3px 3px 14px 0px #68625f;
    z-index: 1;
    display: flex;
    justify-content: center;
    align-items: center
}

.card h6 {
    color: red;
    font-size: 20px
}

.inputs input {
    width: 40px;
    height: 40px
}

input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0
}

.card-2 {
    background-color: #fff;
    padding: 10px;
    width: 350px;
    height: 100px;
    bottom: -50px;
    left: 20px;
    position: absolute;
    border-radius: 5px
}

.card-2 .content {
    margin-top: 50px
}

.card-2 .content a {
    color: red
}

.form-control:focus {
    box-shadow: none;
    border: 2px solid red
}

.validate {
    border-radius: 20px;
    height: 40px;
    background-color: red;
    border: 1px solid red;
    width: 140px
}


</style>
