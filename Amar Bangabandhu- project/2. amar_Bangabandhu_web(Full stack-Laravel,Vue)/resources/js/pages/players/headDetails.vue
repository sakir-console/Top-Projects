<template>
    <!--begin::Details-->
    <div class="d-flex flex-wrap flex-sm-nowrap mb-6">
        <!--begin::Image-->
        <div class="d-flex flex-center flex-shrink-0 bg-light rounded w-100px h-100px w-lg-150px h-lg-150px me-7 mb-4">
            <img class="mw-125px mw-lg-135px" v-bind:src=baseUrl+profileData.pp>
        </div>
        <!--end::Image-->
        <!--begin::Wrapper-->
        <div class="flex-grow-1">
            <!--begin::Head-->
            <div class="d-flex justify-content-between align-items-start flex-wrap mb-2">
                <!--begin::Details-->
                <div class="d-flex flex-column">
                    <!--begin::Status-->
                    <div class="d-flex align-items-center mb-1">
                        <a href="#" class="text-gray-800 text-hover-primary fs-2 fw-bolder me-3"> {{profileData['name']}}

                        </a>
                        <span class="badge badge-light-success me-auto"> Player</span>
                    </div>
                    <!--end::Status-->
                    <!--begin::Description-->
                    <div class="d-flex flex-wrap fw-bold mb-4 fs-5 text-gray-400">#{{profileData['location']}}</div>
                    <!--end::Description-->
                </div>
                <!--end::Details-->

            </div>
            <!--end::Head-->
            <!--begin::Info-->
            <div class="d-flex flex-wrap justify-content-start">
                <!--begin::Stats-->
                <div class="d-flex flex-wrap">
                    <!--begin::Stat-->
                    <div class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 me-6 mb-3">
                        <!--begin::Number-->
                        <div class="d-flex align-items-center">
                            <div class="fs-4 fw-bolder">{{profileData['location']}}</div>
                        </div>
                        <!--end::Number-->
                        <!--begin::Label-->
                        <div class="fw-bold fs-6 text-gray-400">Location</div>
                        <!--end::Label-->
                    </div>
                    <!--end::Stat-->
                    <!--begin::Stat-->
                    <div class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 me-6 mb-3">
                        <!--begin::Number-->
                        <div class="d-flex align-items-center">
                            <!--begin::Svg Icon | path: icons/duotune/arrows/arr065.svg-->
                            <span class="svg-icon svg-icon-3 svg-icon-danger me-2">
																<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																	<rect opacity="0.5" x="11" y="18" width="13" height="2" rx="1" transform="rotate(-90 11 18)" fill="black" />
																	<path d="M11.4343 15.4343L7.25 11.25C6.83579 10.8358 6.16421 10.8358 5.75 11.25C5.33579 11.6642 5.33579 12.3358 5.75 12.75L11.2929 18.2929C11.6834 18.6834 12.3166 18.6834 12.7071 18.2929L18.25 12.75C18.6642 12.3358 18.6642 11.6642 18.25 11.25C17.8358 10.8358 17.1642 10.8358 16.75 11.25L12.5657 15.4343C12.2533 15.7467 11.7467 15.7467 11.4343 15.4343Z" fill="black" />
																</svg>
															</span>
                            <!--end::Svg Icon-->
                            <div class="fs-4 fw-bolder" data-kt-countup="true" data-kt-countup-value="75">{{profileData['ttl_played']}}</div>
                        </div>
                        <!--end::Number-->
                        <!--begin::Label-->
                        <div class="fw-bold fs-6 text-gray-400">Total played</div>
                        <!--end::Label-->
                    </div>
                    <!--end::Stat-->
                    <!--begin::Stat-->
                    <div class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 me-6 mb-3">
                        <!--begin::Number-->
                        <div class="d-flex align-items-center">
                            <!--begin::Svg Icon | path: icons/duotune/arrows/arr066.svg-->
                            <span class="svg-icon svg-icon-3 svg-icon-success me-2">
																<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																	<rect opacity="0.5" x="13" y="6" width="13" height="2" rx="1" transform="rotate(90 13 6)" fill="black" />
																	<path d="M12.5657 8.56569L16.75 12.75C17.1642 13.1642 17.8358 13.1642 18.25 12.75C18.6642 12.3358 18.6642 11.6642 18.25 11.25L12.7071 5.70711C12.3166 5.31658 11.6834 5.31658 11.2929 5.70711L5.75 11.25C5.33579 11.6642 5.33579 12.3358 5.75 12.75C6.16421 13.1642 6.83579 13.1642 7.25 12.75L11.4343 8.56569C11.7467 8.25327 12.2533 8.25327 12.5657 8.56569Z" fill="black" />
																</svg>
															</span>
                            <!--end::Svg Icon-->
                            <div class="fs-4 fw-bolder" data-kt-countup="true" data-kt-countup-value="234.76"> {{rank['mark']}}</div>
                        </div>
                        <!--end::Number-->
                        <!--begin::Label-->
                        <div class="fw-bold fs-6 text-gray-400">Highest Score</div>
                        <!--end::Label-->
                    </div>
                    <!--end::Stat-->
                    <!--begin::Stat-->
                    <div class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 me-6 mb-3">
                        <!--begin::Number-->
                        <div class="d-flex align-items-center">
                            <!--begin::Svg Icon | path: icons/duotune/arrows/arr066.svg-->
                            <span class="svg-icon svg-icon-3 svg-icon-success me-2">
																<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																	<rect opacity="0.5" x="13" y="6" width="13" height="2" rx="1" transform="rotate(90 13 6)" fill="black" />
																	<path d="M12.5657 8.56569L16.75 12.75C17.1642 13.1642 17.8358 13.1642 18.25 12.75C18.6642 12.3358 18.6642 11.6642 18.25 11.25L12.7071 5.70711C12.3166 5.31658 11.6834 5.31658 11.2929 5.70711L5.75 11.25C5.33579 11.6642 5.33579 12.3358 5.75 12.75C6.16421 13.1642 6.83579 13.1642 7.25 12.75L11.4343 8.56569C11.7467 8.25327 12.2533 8.25327 12.5657 8.56569Z" fill="black" />
																</svg>
															</span>
                            <!--end::Svg Icon-->
                            <div class="fs-4 fw-bolder" data-kt-countup="true" data-kt-countup-value="156" >{{rank['rank']}}</div>
                        </div>
                        <!--end::Number-->
                        <!--begin::Label-->
                        <div class="fw-bold fs-6 text-gray-400">Global Rank</div>
                        <!--end::Label-->
                    </div>
                    <!--end::Stat-->
                </div>
                <!--end::Stats-->
                <!--begin::Users-->

                <!--end::Users-->
            </div>
            <!--end::Info-->
        </div>
        <!--end::Wrapper-->
    </div>
    <!--end::Details-->
</template>

<script>

export default {
    name: "headDetails",
    data() {
        return {
            baseUrl:'../uploads/images/pp/',
            selectedGen: '',
            result: false,
            msg: '',
            profileData: [],
            rank:[]

        }
    },
    methods: {
        getProfile() {
            let loc = localStorage.getItem('loc');
            axios.get(this.$api_url + 'api/v1/profile', {
                params: { }
            }).then(
                response => {
                    this.result = true;
                    console.log(response);
                    this.profileData = response.data['data'][0];
                    this.msg = '';


                    axios.get(this.$api_url + 'api/v1/leaderboard', {
                        params: {

                        }
                    }).then(
                        response => {

                            console.log(response);
                            this.rank = response.data['data'][0];

                        }
                    ).catch((error) => {

                        this.msg = error.response.data.message;
                        console.log(error.response);
                    });




                }
            ).catch((error) => {

                this.msg = error.response.data.message;
                console.log(error.response);
            });
        },


    },
    mounted() {
        this.getProfile();
    }



}
</script>

<style scoped>

</style>
