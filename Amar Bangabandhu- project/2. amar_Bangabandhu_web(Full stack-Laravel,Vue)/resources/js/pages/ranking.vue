<template>
    <div>
        <!-- Latest Activities Area Start -->
        <section class="activities">
            <img class="shape shape1" src="assets/images/people/shape1.png" alt="">
            <img class="shape shape2" src="assets/images/people/shape2.png" alt="">
            <img class="shape shape3" src="assets/images/people/shape3.png" alt="">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-md-10">
                        <div class="section-heading">
                            <h5 class="subtitle">
                                সেরা প্রতিযোগী তালিকা
                            </h5>

                            <p class="text">
                                সেরাদের তালিকায় আপনি আছেন তো?
                            </p>
                            <h5 class="subtitle">
                                {{msg}}
                            </h5>

                        </div>
                        <div class="row">

                            <div class="tab-menu-area col-lg-12">
                                <ul class="nav nav-lend mb-9" role="tablist">
                                    <form @submit.prevent="getPerformances">
                                        <li class="nav-item">
                                            <select v-model="selectedDis" class="select2 form-control" placeholder="Districts">
                                                <option value="" selected disabled hidden>জেলা নির্বাচন</option>

                                                <optgroup label="বরিশাল বিভাগ">
                                                    <option value="5"> বরিশাল</option>
                                                    <option value="41"> ঝালকাঠি</option>
                                                    <option value="42"> পটুয়াখালী</option>
                                                    <option value="43"> পিরোজপুর</option>
                                                    <option value="44"> ভোলা</option>
                                                    <option value="45"> বরগুনা</option>
                                                </optgroup>

                                                <optgroup label="চট্টগ্রাম বিভাগ">
                                                    <option value="2"> চট্টগ্রাম</option>
                                                    <option value="20"> চাঁদপুর</option>
                                                    <option value="21"> লক্ষ্মীপুর</option>
                                                    <option value="22"> কক্সবাজার</option>
                                                    <option value="23"> খাগড়াছড়ি</option>
                                                    <option value="24"> বান্দরবান</option>
                                                    <option value="17"> ফেনী</option>
                                                    <option value="18"> রাঙ্গামাটি</option>
                                                    <option value="15"> ব্রাহ্মণবাড়িয়া</option>
                                                    <option value="16"> কুমিল্লা</option>
                                                    <option value="19"> নোয়াখালী</option>
                                                </optgroup>

                                                <optgroup label="ঢাকা বিভাগ">
                                                    <option value="1"> ঢাকা</option>
                                                    <option value="11"> ফরিদপুর</option>
                                                    <option value="8"> গাজীপুর</option>
                                                    <option value="9"> গোপালগঞ্জ</option>
                                                    <option value="10"> কিশোরগঞ্জ</option>
                                                    <option value="12"> মানিকগঞ্জ</option>
                                                    <option value="49"> নরসিংদী</option>
                                                    <option value="50"> শরীয়তপুর</option>
                                                    <option value="51"> নারায়ণগঞ্জ</option>
                                                    <option value="52"> টাঙ্গাইল0</option>
                                                    <option value="53"> মাদারীপুর</option>
                                                    <option value="13"> মুন্সিগঞ্জ</option>
                                                    <option value="14"> রাজবাড়ী</option>
                                                </optgroup>

                                                <optgroup label="খুলনা বিভাগ">
                                                    <option value="4"> খুলনা</option>
                                                    <option value="32"> যশোর</option>
                                                    <option value="33"> সাতক্ষীরা</option>
                                                    <option value="34"> মেহেরপুর</option>
                                                    <option value="35"> নড়াইল</option>
                                                    <option value="36"> চুয়াডাঙ্গা</option>
                                                    <option value="37"> কুষ্টিয়া</option>
                                                    <option value="38"> মাগুরা</option>
                                                    <option value="39"> বাগেরহাট</option>
                                                    <option value="40"> ঝিনাইদহ</option>
                                                </optgroup>

                                                <optgroup label="ময়মনসিংহ বিভাগ">
                                                    <option value="7"> ময়মনসিংহ</option>
                                                    <option value="62"> শেরপুর</option>
                                                    <option value="63"> জামালপুর</option>
                                                    <option value="64"> নেত্রকোণা</option>
                                                </optgroup>

                                                <optgroup label="রাজশাহী বিভাগ">
                                                    <option value="3"> রাজশাহী</option>
                                                    <option value="25"> সিরাজগঞ্জ</option>
                                                    <option value="26"> পাবনা</option>
                                                    <option value="27"> বগুড়া</option>
                                                    <option value="28"> নাটোর</option>
                                                    <option value="29"> জয়পুরহাট</option>
                                                    <option value="30"> চাঁপাইনবাবগঞ্জ</option>
                                                    <option value="31"> নওগাঁ</option>
                                                </optgroup>

                                                <optgroup label="রংপুর বিভাগ">
                                                    <option value="60"> রংপুর</option>
                                                    <option value="54"> পঞ্চগড়</option>
                                                    <option value="55"> দিনাজপুর</option>
                                                    <option value="56"> লালমনিরহাট</option>
                                                    <option value="57"> নীলফামারী</option>
                                                    <option value="58"> গাইবান্ধা</option>
                                                    <option value="59"> ঠাকুরগাঁও</option>
                                                    <option value="61"> কুড়িগ্রাম</option>
                                                </optgroup>

                                                <optgroup label="সিলেট বিভাগ">
                                                    <option value="6"> সিলেট</option>
                                                    <option value="46"> মৌলভীবাজার</option>
                                                    <option value="47"> হবিগঞ্জ</option>
                                                    <option value="48"> সুনামগঞ্জ</option>
                                                </optgroup>
                                            </select>
                                        </li>
                                        <li class="nav-item">
                                            <select  v-model="selectedGrp" class="select2 form-control" placeholder="Group">
                                                <option value="" selected disabled hidden>প্রতিযোগী গ্রুপ</option>
                                                <optgroup label="প্রতিযোগি গ্রুপ নির্বাচন">
                                                    <option value="jnr">জুনিয়র</option>
                                                    <option value="yth">ইয়থ</option>
                                                    <option value="snr">সিনিয়র</option>
                                                </optgroup>
                                            </select>
                                        </li>
                                        <li class="nav-item">
                                            <select v-model="selectedGen" class="select2 form-control" placeholder="Gender">
                                                <option value="" selected disabled hidden>লিঙ্গ</option>
                                                <optgroup label="লিঙ্গ নির্বাচন">
                                                    <option value="1">পুরুষ</option>
                                                    <option value="2">মহিলা</option>
                                                    <option value="3">অন্যান্য</option>
                                                    <option value="male">male</option>
                                                </optgroup>
                                            </select>
                                        </li>
                                        <button class="mybtn1" type="submit" style="border-radius: 4px;margin: 3px;background-image: linear-gradient(to left, #2b60b0, #c60065);">
                                            তালিকা দেখুন
                                            <i class="fas fa-eye"></i></button>
                                    </form>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">

                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-all-bets" role="tabpanel" aria-labelledby="pills-all-bets-tab">
                                <div class="responsive-table">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th scope="col">সেরা ক্রম</th>
                                            <th scope="col">প্রতিযোগীর নাম</th>
                                            <th scope="col">জেলা</th>
                                            <th scope="col">প্রতিযোগীর গ্রুপ</th>
                                            <th scope="col">লিঙ্গ</th>
                                            <th scope="col">প্রাপ্ত নম্বর</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr v-for="(performance,index) in performances" :key="performance.id">
                                            <td>
                                                <i class="fas fa-star"></i>
                                                {{index+1}}
                                            </td>
                                            <td>
                                                {{performance.u_name}}
                                            </td>
                                            <td>
                                                {{performance.location}}
                                            </td>
                                            <td>
                                                <img src="assets/images/icon1.png" alt="">
                                                {{performance.group}}
                                            </td>
                                            <td> {{performance.gender}}</td>
                                            <td> {{performance.mark}}</td>

                                        </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </section>
        <!-- Latest Activities Area End -->


        <!-- Get Start Area Start -->
        <section class="get-start">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 d-flex align-self-center">
                        <div class="left-area">
                            <div class="section-heading">
                                <h5 class="subtitle">
                                    প্রতিযোগিতায় অংশগ্রহণ করুন, জিতুন পুরষ্কার
                                </h5>
                                <h2 class="title ">
                                    জানুন  এবং প্রতিযোগিতায়  জিতে নিন পুরষ্কার।
                                </h2>
                                <p class="text">
                                    বাঙালি জাতির পিতা বঙ্গবন্ধু শেখ মুজিবুর রহমানকে জানতে এবং আকর্ষণীয় পুরষ্কার জিততে অংশ গ্রহণ করুন "আমার বঙ্গবন্ধু" প্রতিযোগিতায়।
                                </p>
                                <a href="https://play.google.com/store/apps/details?id=com.amarbangabandhu.amar_bangabandhu" class="mybtn1" style="font-size: 22px;">এখনি শুরু করুন!</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="right-image">
                            <img src="assets/images/get-start.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Get Start Area End -->


    </div>
</template>

<script>

export default {

    data(){
        return {
            selectedDis:'',
            selectedGrp:'',
            selectedGen:'',
            result:false,
            msg:'',
            performances: [],
        }
    },
    methods: {
        getPerformances(){
            axios.get(this.$api_url+'api/v1/view/performances', {
                params: {
                    loc: this.selectedDis,
                    grp: this.selectedGrp,
                    gen: this.selectedGen,
                    limit: 100
                }
            }).then(
                response =>{
                    this.result = true;
                    console.log(response);
                    this.performances = response.data.data;
                    this.msg='';
                }
            ).catch((error) => {

                this.msg = error.response.data.message;
                console.log(error.response);
            });
        }
    },

}

</script>

<style scoped>


.row span {
    position: relative;
    display: inline-block;
    margin: 10px 10px;
}

.basic-slide {
    display: inline-block;
    width: 215px;
    padding: 10px 0 10px 15px;
    font-family: "Open Sans", sans;
    font-weight: 400;
    color: #377D6A;
    background: #efefef;
    border: 0;
    border-radius: 3px;
    outline: 0;
    text-indent: 70px;
    transition: all .3s ease-in-out;
}
.basic-slide::-webkit-input-placeholder {
    color: #efefef;
    text-indent: 0;
    font-weight: 300;
}
.basic-slide + label {
    display: inline-block;
    position: absolute;
    top: 0;
    left: 0;
    padding: 10px 15px;
    text-shadow: 0 1px 0 rgba(19, 74, 70, 0.4);
    background: #7AB893;
    transition: all .3s ease-in-out;
    border-top-left-radius: 3px;
    border-bottom-left-radius: 3px;
}


.skinny + label:after {
    top: 0;
    bottom: 0;
    background: #377D6A;
}

.skinny:focus,
.skinny:active {
    color: #377D6A;
    text-indent: 0;
    background: #fff;
}
.skinny:focus::-webkit-input-placeholder,
.skinny:active::-webkit-input-placeholder {
    color: #aaa;
}
.skinny:focus + label,
.skinny:active + label {
    transform: translateX(-100%);
}
.skinny:focus + label:after,
.skinny:active + label:after {
    transform: translateX(100%);
}

.slide-up {
    display: inline-block;
    width: 475px;
    padding: 10px 0 10px 15px;
    font-family: "Open Sans", sans;
    font-weight: 400;
    color: #377D6A;
    background: #efefef;
    border: 0;
    border-radius: 3px;
    outline: 0;
    text-indent: 80px;
    transition: all .3s ease-in-out;
}
.slide-up::-webkit-input-placeholder {
    color: #efefef;
    text-indent: 0;
    font-weight: 300;
}
.slide-up + label {
    display: inline-block;
    position: absolute;
    transform: translateX(0);
    top: 0;
    left: 0;
    padding: 10px 15px;
    text-shadow: 0 1px 0 rgba(19, 74, 70, 0.4);
    transition: all .3s ease-in-out;
    border-top-left-radius: 3px;
    border-bottom-left-radius: 3px;
    overflow: hidden;
}
.slide-up + label:before, .slide-up + label:after {
    content: "";
    position: absolute;
    right: 0;
    left: 0;
    z-index: -1;
    transition: all .3s ease-in-out;
}
.slide-up + label:before {
    top: 6px;
    left: 5px;
    right: 5px;
    bottom: 6px;
    background: #377D6A;
}
.slide-up + label:after {
    top: 0;
    bottom: 0;
    background: #377D6A;
}

span:nth-child(1) .slide-up {
    text-indent: 105px;
}

span:nth-child(3) .slide-up {
    text-indent: 125px;
}

span:nth-child(1) .slide-up:focus,
span:nth-child(1) .slide-up:active,
span:nth-child(3) .slide-up:focus,
span:nth-child(3) .slide-up:active {
    text-indent: 0;
}

.slide-up:focus,
.slide-up:active {
    color: #377D6A;
    text-indent: 0;
    background: #fff;
}
.slide-up:focus::-webkit-input-placeholder,
.slide-up:active::-webkit-input-placeholder {
    color: #aaa;
}
.slide-up:focus + label,
.slide-up:active + label {
    transform: translateY(-100%);
}
.slide-up:focus + label:before,
.slide-up:active + label:before {
    border-radius: 5px;
}
.slide-up:focus + label:after,
.slide-up:active + label:after {
    transform: translateY(100%);
}

.card-slide {
    display: inline-block;
    width: 215px;
    padding: 10px 0 10px 15px;
    font-family: "Open Sans", sans;
    font-weight: 400;
    color: #377D6A;
    background: #efefef;
    border: 0;
    border-radius: 3px;
    outline: 0;
    text-indent: 115px;
    transition: all .3s ease-in-out;
}
.card-slide::-webkit-input-placeholder {
    color: #efefef;
    text-indent: 0;
    font-weight: 300;
}
.card-slide + label {
    display: block;
    position: absolute;
    top: 0;
    left: 0;
    padding: 10px 15px;
    text-shadow: 0 1px 0 rgba(19, 74, 70, 0.4);
    background: #7AB893;
    transition: all .3s ease-in-out;
    border-top-left-radius: 3px;
    border-bottom-left-radius: 3px;
    transform-origin: right center;
    transform: perspective(300px) scaleX(1) rotateY(0deg);
}

span:nth-child(2) .card-slide {
    text-indent: 55px;
}

span:nth-child(3) .card-slide {
    text-indent: 150px;
}

span:nth-child(2) .card-slide:focus,
span:nth-child(2) .card-slide:active,
span:nth-child(3) .card-slide:focus,
span:nth-child(3) .card-slide:active {
    text-indent: 0;
}

.card-slide:focus,
.card-slide:active {
    color: #377D6A;
    text-indent: 0;
    background: #fff;
    border-top-left-radius: 0;
    border-bottom-left-radius: 0;
}
.card-slide:focus::-webkit-input-placeholder,
.card-slide:active::-webkit-input-placeholder {
    color: #aaa;
}
.card-slide:focus + label,
.card-slide:active + label {
    transform: perspective(600px) translateX(-100%) rotateY(80deg);
}

.swing {
    display: inline-block;
    width: 215px;
    padding: 10px 0 10px 15px;
    font-family: "Open Sans", sans;
    font-weight: 400;
    color: #377D6A;
    background: #efefef;
    border: 0;
    border-radius: 3px;
    outline: 0;
    text-indent: 60px;
    transition: all .3s ease-in-out;
}
.swing::-webkit-input-placeholder {
    color: #efefef;
    text-indent: 0;
    font-weight: 300;
}
.swing + label {
    display: inline-block;
    position: absolute;
    top: 0;
    left: 0;
    padding: 10px 15px;
    text-shadow: 0 1px 0 rgba(19, 74, 70, 0.4);
    background: #7AB893;
    border-top-left-radius: 3px;
    border-bottom-left-radius: 3px;
    transform-origin: 2px 2px;
    transform: rotate(0);
    animation: swing-back .4s 1 ease-in-out;
}

@keyframes swing {
    0% {
        transform: rotate(0);
    }
    20% {
        transform: rotate(116deg);
    }
    40% {
        transform: rotate(60deg);
    }
    60% {
        transform: rotate(98deg);
    }
    80% {
        transform: rotate(76deg);
    }
    100% {
        transform: rotate(82deg);
    }
}
@keyframes swing-back {
    0% {
        transform: rotate(82deg);
    }
    100% {
        transform: rotate(0);
    }
}
.swing:focus,
.swing:active {
    color: #377D6A;
    text-indent: 0;
    background: #fff;
    border-top-left-radius: 0;
    border-bottom-left-radius: 0;
}
.swing:focus::-webkit-input-placeholder,
.swing:active::-webkit-input-placeholder {
    color: #aaa;
}
.swing:focus + label,
.swing:active + label {
    animation: swing 1.4s 1 ease-in-out;
    transform: rotate(82deg);
}

.balloon {
    display: inline-block;
    width: 215px;
    padding: 10px 0 10px 15px;
    font-family: "Open Sans", sans;
    font-weight: 400;
    color: #377D6A;
    background: #efefef;
    border: 0;
    border-radius: 3px;
    outline: 0;
    text-indent: 60px;
    transition: all .3s ease-in-out;
}
.balloon::-webkit-input-placeholder {
    color: #efefef;
    text-indent: 0;
    font-weight: 300;
}
.balloon + label {
    display: inline-block;
    position: absolute;
    top: 8px;
    left: 0;
    bottom: 8px;
    padding: 5px 15px;
    color: #032429;
    font-size: 11px;
    font-weight: 700;
    text-transform: uppercase;
    text-shadow: 0 1px 0 rgba(19, 74, 70, 0);
    transition: all .3s ease-in-out;
    border-radius: 3px;
    background: rgba(122, 184, 147, 0);
}
.balloon + label:after {
    position: absolute;
    content: "";
    width: 0;
    height: 0;
    top: 100%;
    left: 50%;
    margin-left: -3px;
    border-left: 3px solid transparent;
    border-right: 3px solid transparent;
    border-top: 3px solid rgba(122, 184, 147, 0);
    transition: all .3s ease-in-out;
}

.balloon:focus,
.balloon:active {
    color: #377D6A;
    text-indent: 0;
    background: #fff;
}
.balloon:focus::-webkit-input-placeholder,
.balloon:active::-webkit-input-placeholder {
    color: #aaa;
}
.balloon:focus + label,
.balloon:active + label {
    color: #fff;
    text-shadow: 0 1px 0 rgba(19, 74, 70, 0.4);
    background: #7ab893;
    transform: translateY(-40px);
}
.balloon:focus + label:after,
.balloon:active + label:after {
    border-top: 4px solid #7ab893;
}
</style>

