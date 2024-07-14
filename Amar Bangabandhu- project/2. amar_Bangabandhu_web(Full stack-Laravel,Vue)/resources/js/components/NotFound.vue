<template>
<div>	<!-- 404 Area Start -->
    <section class="four-zero-four">
        <img class="bg-img" src="assets/images/404-bg.png" alt="">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="content">
                        <img src="assets/images/404.png" alt="">
                        <div class="inner-content">
                            <h4 class="title">
                                দুঃখিত,
                                পেইজ টি খুজে পাওয়া যায় নি !
                            </h4>
                            <router-link class="mybtn1" :to="{name:'home'}"><i class="fas fa-angle-double-left"></i>  হোম এ যান </router-link>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 404 Area End -->
</div>
</template>

<script>
export default {
name: "NotFound"
}
</script>

<style scoped>

</style>
