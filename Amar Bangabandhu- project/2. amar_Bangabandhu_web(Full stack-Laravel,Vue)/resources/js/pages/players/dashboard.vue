<template>
<div>



    <!--begin::Container-->
    <div id="kt_content_container" class="d-flex flex-column-fluid align-items-start container-xxl">
        <!--begin::Post-->
        <div class="content flex-row-fluid" id="kt_content">
            <!--begin::Toolbar-->
            <div class="d-flex flex-wrap flex-stack pb-7">
                <!--begin::Title-->
                <div class="d-flex flex-wrap align-items-center my-1">
                    <h3 class="fw-bolder me-5 my-1">Dashboard</h3>

                </div>
                <!--end::Title-->

            </div>
            <!--end::Toolbar-->
            <!--begin::Navbar-->
            <div class="card mb-9">
                <div class="card-body pt-9 pb-0">
                    <head-details/>

                    <div class="separator"></div>
                    <!--begin::Nav wrapper-->
                    <div class="d-flex overflow-auto h-55px">
                        <!--begin::Nav links-->
                        <ul class="nav nav-stretch active nav-line-tabs nav-line-tabs-2x border-transparent fs-5 fw-bolder flex-nowrap">
                            <!--begin::Nav item-->
                            <li class="nav-item">
                                <router-link :to="{name:'pr-dash'}" class="nav-link text-active-primary me-6 active">Dashboard</router-link>
                            </li>
                            <!--end::Nav item-->

                            <!--begin::Nav item-->
                            <li class="nav-item">
                                <router-link :to="{name:'pr-rank'}" class="nav-link text-active-primary me-6">Scoreboard</router-link>
                            </li>
                            <!--end::Nav item-->

                            <!--end::Nav item-->
                            <!--begin::Nav item-->
                            <li class="nav-item">
                                <router-link :to="{name:'setting'}" class="nav-link text-active-primary me-6">Profile</router-link>
                            </li>
                        </ul>
                        <!--end::Nav links-->
                    </div>
                    <!--end::Nav wrapper-->
                </div>
            </div>
            <!--end::Navbar-->

            <!--begin::Tab Content-->
            <div class="tab-content">
                <!--begin::Tab pane-->
                <div id="kt_project_users_card_pane" class="tab-pane fade show active">
                    <!--begin::Row-->
                    <div class="row g-6 g-xl-9">
                        <!--begin::Col-->
                        <div  v-for="(performance,index) in performances" :key="performance.id" class="col-md-6 col-xxl-4">
                            <!--begin::Card-->
                            <div class="card">
                                <!--begin::Card body-->
                                <div class="card-body d-flex flex-center flex-column pt-12 p-9">
                                    <!--begin::Avatar-->
                                    <div class="symbol symbol-65px symbol-circle mb-5">
                                        <img  :src="'/assets/player/puzz.jpg'"  alt="image" />
                                        <div class="bg-success position-absolute border border-4 border-white h-15px w-15px rounded-circle translate-middle start-100 top-100 ms-n3 mt-n3"></div>
                                    </div>
                                    <!--end::Avatar-->
                                    <!--begin::Name-->
                                    <a href="#" class="fs-4 text-gray-800 text-hover-primary fw-bolder mb-0">{{performance.duration}} Sec</a>
                                    <!--end::Name-->
                                    <!--begin::Position-->
                                    <div class="fw-bold text-gray-400 mb-6">Taken time</div>
                                    <!--end::Position-->
                                    <!--begin::Info-->
                                    <div class="d-flex flex-center flex-wrap">
                                        <!--begin::Stats-->
                                        <div class="border border-gray-300 border-dashed rounded min-w-80px py-3 px-4 mx-2 mb-3">
                                            <div class="fs-6 fw-bolder text-gray-700 ml-4" style="margin-left: 10px;">{{performance.rank}}</div>
                                            <div class="fw-bold text-gray-400">Rank</div>
                                        </div>
                                        <!--end::Stats-->
                                        <!--begin::Stats-->
                                        <div class="border border-gray-300 border-dashed rounded min-w-80px py-3 px-4 mx-2 mb-3">
                                            <div class="fs-6 fw-bolder text-gray-700" style="width: 52px;height: 20px;overflow: hidden;text-overflow: ellipsis;">
                                                {{performance.mark}}</div>
                                            <div class="fw-bold text-gray-400">Score</div>
                                        </div>
                                        <!--end::Stats-->
                                        <!--begin::Stats-->
                                        <div class="border border-gray-300 border-dashed rounded min-w-80px py-3 px-4 mx-2 mb-3">
                                            <div class="fs-6 fw-bolder text-gray-700">{{performance.correct_ans}}</div>
                                            <div class="fw-bold text-gray-400">Quiz Correct</div>
                                        </div>
                                        <!--end::Stats-->
                                    </div>
                                    <!--end::Info-->
                                </div>
                                <!--end::Card body-->
                            </div>
                            <!--end::Card-->
                        </div>
                        <!--end::Col-->

                        <!--end::Col-->
                    </div>
                    <!--end::Row-->

                </div>
                <!--end::Tab pane-->

            </div>
            <!--end::Tab Content-->

        </div>
        <!--end::Post-->
    </div>
    <!--end::Container-->






</div>
</template>

<script>

export default {
    name: "dashboard",
    data() {
        return {
            selectedGen: '',
            result: false,
            msg: '',
            performances: [],
            rank:[]

        }
    },
    methods: {
        myPerformance() {
            let loc = localStorage.getItem('loc');
            axios.get(this.$api_url + 'api/v1/leaderboard', {
                params: { }
            }).then(
                response => {
                    this.result = true;
                    console.log(response);
                    this.performances = response.data.data;
                    this.msg = '';

                }
            ).catch((error) => {

                this.msg = error.response.data.message;
                console.log(error.response);
            });
        },


    },
    mounted() {
        this.myPerformance();
    }

}
</script>

<style scoped>

</style>
