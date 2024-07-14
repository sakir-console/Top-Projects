<template>
    <!-- Team Area Start -->
    <section class="team">





        <div class="top-area">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-md-10">
                        <div class="section-heading">
                            <h5 class="subtitle">
                                আমার বঙ্গবন্ধু
                            </h5>
                            <h2 class="title">
                                ডেভলপার'স প্যানেল
                            </h2>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="team-members">
            <div class="container">
                <div class="row ">
                    <div class="col-lg-12">
                        <div class="team-member-inner">
                            <div class="row justify-content-center">
                                <div class="col-lg-3 col-md-6">
                                    <div class="single-team">
                                        <div class="image">

                                            <img src="assets/images/zahir.png" alt="">
                                            <div class="overlay"></div>
                                            <div class="content">
                                                <h4 class="name">
                                                    মো. জহিরুল ইসলাম
                                                </h4>
                                                <div class="designation">
                                                    মেন্টর
                                                </div>
                                                <div class="designation" style=" font-size: 13px; color:rgb(194 196 193)">
                                                    সহকারী অধ্যাপক, ড্যাফোডিল ইন্টারন্যাশনাল ইউনিভার্সিটি
                                                </div>
                                            </div>
                                        </div>
                                        <div class="social-area">
                                            <ul class="social-links">
                                                <li>
                                                    <a href="https://www.facebook.com/zahirul.iislam">
                                                        <i class="fab fa-facebook-f"></i>
                                                    </a>
                                                </li>

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="single-team">
                                        <div class="image">
                                            <img src="assets/images/dev/sakir.jpg" alt="">
                                            <div class="overlay"></div>
                                            <div class="content">
                                                <h4 class="name">
                                                    সাকায়েত সাকির
                                                </h4>
                                                <div class="designation">
                                                    ডেভলপার
                                                </div>
                                                <div class="designation" style=" font-size: 13px; color:rgb(194 196 193)">
                                                    চট্টগ্রাম প্রকৌশল বিশ্ববিদ্যালয়
                                                </div>
                                            </div>
                                        </div>
                                        <div class="social-area">
                                            <ul class="social-links">
                                                <li>
                                                    <a href="https://www.facebook.com/sakir.me">
                                                        <i class="fab fa-facebook-f"></i>
                                                    </a>
                                                </li>

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="single-team">
                                        <div class="image">
                                            <img src="assets/images/nokib.jpeg" alt="">
                                            <div class="overlay"></div>
                                            <div class="content">
                                                <h4 class="name">
                                                    তানজীম খান
                                                </h4>
                                                <div class="designation">
                                                    ডেভলপার
                                                </div>
                                                <div class="designation" style=" font-size: 13px; color:rgb(194 196 193)">
                                                    ড্যাফোডিল ইন্টারন্যাশনাল ইউনিভার্সিটি
                                                </div>
                                            </div>
                                        </div>
                                        <div class="social-area">
                                            <ul class="social-links">
                                                <li>
                                                    <a href="https://www.facebook.com/tanjimkhan.nokib.39">
                                                        <i class="fab fa-facebook-f"></i>
                                                    </a>
                                                </li>

                                            </ul>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>









                <div class="main-container">

                    <div class="cards">
                        <div class="card card-1">



                            <p class="card__apply">

                                <a class="card__link" href="#">
                                    Contact with us for development
                                   <i class="fas fa-arrow-right"></i></a>
                            </p>
                            <h2 class="card__title">  amarbangabandhu.app@gmail.com</h2>

                            <p class="card__apply">

                                <a class="card__link" href="#">
                                    <i class="fas fa-phone-square"></i>  Urgent Hotline:  +8801783435326
                                   </a>
                            </p>

                        </div>

                    </div>
                </div>



            </div>
        </div>
    </section>
    <!-- Team Area End -->
</template>

<script>
export default {
name: "developers"
}
</script>

<style scoped>

/* CARDS */

.cards {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.card {
    margin: 20px;
    padding: 20px;

    min-height: 200px;
    display: flex;
    grid-template-rows: 20px 50px 1fr 50px;
    border-radius: 10px;
    box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.25);
    transition: all 0.2s;
}

.card:hover {
    box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.4);
    transform: scale(1.01);
}

.card__link,
.card__exit,
.card__icon {
    position: relative;
    text-decoration: none;
    color: rgba(255, 255, 255, 0.9);
}

.card__link::after {
    position: absolute;
    top: 25px;
    left: 0;
    content: "";
    width: 0%;
    height: 3px;
    background-color: rgba(255, 255, 255, 0.6);
    transition: all 0.5s;
}

.card__link:hover::after {
    width: 100%;
}

.card__exit {
    grid-row: 1/2;
    justify-self: end;
}

.card__icon {
    grid-row: 2/3;
    font-size: 30px;
}

.card__title {
    grid-row: 3/4;
    font-weight: 400;
    color: #ffffff;
}

.card__apply {
    grid-row: 4/5;
    align-self: center;
}

/* CARD BACKGROUNDS */

.card-1 {
    background: radial-gradient(#03050f, #3fbafe);
}

.card-2 {
    background: radial-gradient(#fbc1cc, #fa99b2);
}

.card-3 {
    background: radial-gradient(#76b2fe, #b69efe);
}

.card-4 {
    background: radial-gradient(#60efbc, #58d5c9);
}

.card-5 {
    background: radial-gradient(#f588d8, #c0a3e5);
}

/* RESPONSIVE */

@media (max-width: 1600px) {
    .cards {
        justify-content: center;
    }
}

</style>
