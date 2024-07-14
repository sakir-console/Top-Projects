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
                                    <router-link :to="{name:'pr-dash'}" class="nav-link text-active-primary me-6">Dashboard</router-link>
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

                <!--begin::Table-->
                <div class="card card-flush mt-6 mt-xl-9">
                    <!--begin::Card header-->
                    <div class="card-header mt-5">
                        <!--begin::Card title-->
                        <div class="card-title flex-column">
                            <h3 class="fw-bolder mb-1">Scoreboard</h3>
                            <div class="fs-6 text-gray-400">My all performances</div>
                        </div>
                        <!--begin::Card title-->

                    </div>
                    <!--end::Card header-->
                    <!--begin::Card body-->
                    <div class="card-body pt-0">
                        <!--begin::Table container-->
                        <div class="table-responsive">
                            <!--begin::Table-->
                            <table id="kt_profile_overview_table" class="table table-row-bordered table-row-dashed gy-4 align-middle fw-bolder">
                                <!--begin::Head-->
                                <thead class="fs-7 text-gray-400 text-uppercase">
                                <tr>
                                    <th class="min-w-250px">Taken Time (Seconds)</th>
                                    <th class="min-w-150px">Correct Quiz Ans</th>
                                    <th class="min-w-90px">Score</th>
                                    <th class="min-w-90px">Rank</th>

                                </tr>
                                </thead>
                                <!--end::Head-->
                                <!--begin::Body-->
                                <tbody class="fs-6">
                                <tr v-for="(performance,index) in performances" :key="performance.id">
                                    <td>
                                        <!--begin::User-->
                                        <div class="d-flex align-items-center">
                                            <!--begin::Wrapper-->
                                            <div class="me-5 position-relative">
                                                <!--begin::Avatar-->
                                                <div class="symbol symbol-35px symbol-circle">
                                                    <span class="badge badge-light-success fw-bolder px-4 py-3"># {{ index + 1 }}</span>
                                                </div>
                                                <!--end::Avatar-->
                                            </div>
                                            <!--end::Wrapper-->
                                            <!--begin::Info-->
                                            <div class="d-flex flex-column justify-content-center">

                                                <div class="fw-bold text-gray-400">{{performance.duration}} Seconds</div>
                                            </div>
                                            <!--end::Info-->
                                        </div>
                                        <!--end::User-->
                                    </td>
                                    <td>{{performance.correct_ans}}</td>

                                    <td>
                                        <span class="badge badge-light-danger fw-bolder px-4 py-3">{{performance.mark}}</span>
                                    </td>
                                    <td>
                                        <span class="badge badge-light-success fw-bolder px-4 py-3">{{performance.rank}}</span>
                                    </td>

                                </tr>



                                </tbody>
                                <!--end::Body-->
                            </table>
                            <!--end::Table-->
                        </div>
                        <!--end::Table container-->
                    </div>
                    <!--end::Card body-->
                </div>
                <!--end::Card-->
            </div>
            <!--end::Post-->
        </div>
        <!--end::Container-->






    </div>
</template>


<script>

export default {
    name: "prRanking",
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
