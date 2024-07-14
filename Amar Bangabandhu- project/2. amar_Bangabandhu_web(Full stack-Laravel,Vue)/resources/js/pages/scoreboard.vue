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
                        <br/>
                            <h3 class="h3">
                                প্রতিযোগীর সাফলাঙ্ক্য
                            </h3>
                            <p class="text">
                                আপনার নেওয়া সময় এবং প্রশ্নের উত্তরের সমন্বয়ে প্রাপ্ত সেরা পাঁচ ফলাফলঃ
                            </p>
                            <h5 class="subtitle">
                                {{msg}}
                            </h5>
                        </div>
                        <div class="row">

                            <div class="tab-menu-area col-lg-12">
                                <ul class="nav nav-lend mb-9" role="tablist">
                                    <form @submit.prevent="getScore">
                            <span>
                            <input class="slide-up" v-model="bcnid"id="card" type="text" placeholder="জাতীয় পরিচয় পত্র/জন্ম সনদ নম্বর প্রদান করুন" />
                              <label for="card">পরিচয়পত্র/জন্মসনদ নম্বর</label>
                          </span>
                                        <button class="mybtn1" type="submit">সাফলাঙ্ক্য দেখুন
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
                                    <table class="table" v-show="result">
                                        <thead>
                                        <tr>
                                            <th scope="col">সেরা পাঁচ</th>
                                            <th scope="col"> <i class="fas fa-check"></i>  সঠিক উত্তর</th>
                                            <th scope="col">  <i class="fas fa-stopwatch"></i>  সময়(সেকেন্ড)</th>
                                            <th scope="col">নম্বর</th>
                                            <th scope="col">সমন্বিত ক্রম</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr v-for="(score,index) in scores" :key="score.id">
                                            <td>
                                                <i class="fas fa-hashtag"></i>
                                                {{index+1}}
                                            </td>
                                            <td>
                                                <i class="fas fa-check"></i>
                                                {{score.correct_ans }}
                                            </td>
                                            <td>{{score.duration }}</td>
                                            <td>
                                                <i class="fas fa-trophy"></i>
                                                {{score.mark }}
                                            </td>
                                            <td>{{score.globalRank}}</td>

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
            result:false,
            bcnid:'',
            msg:'',
            scores: [],
        }
    },
    methods: {
        getScore(){
            axios.get(this.$api_url+'api/v1/filter/performs', {
                params: {
                    pr: this.bcnid,
                }
            }).then(
                response =>{
                    this.result = true;
                    console.log(response);
                    this.scores = response.data.data;
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
