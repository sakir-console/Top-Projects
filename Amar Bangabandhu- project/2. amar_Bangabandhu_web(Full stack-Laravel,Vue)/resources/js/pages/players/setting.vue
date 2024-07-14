<template>
<profile :key="profileUp">

    <!--begin::Toolbar-->
    <div class="toolbar py-5 py-lg-8" id="kt_toolbar">
        <!--begin::Container-->
        <div id="kt_toolbar_container" class="container-xxl d-flex flex-stack flex-wrap">
            <!--begin::Page title-->
            <div class="page-title d-flex flex-column me-1">
                <!--begin::Title-->
                <h1 class="d-flex text-white fw-bolder my-1 fs-3">Player Dashboard</h1>
                <!--end::Title-->

            </div>
            <!--end::Page title-->

        </div>
        <!--end::Container-->
    </div>
    <!--end::Toolbar-->
    <!--begin::Container-->
    <div id="kt_content_container" class="d-flex flex-column-fluid align-items-start container-xxl">
        <!--begin::Post-->
        <div class="content flex-row-fluid" id="kt_content">
            <!--begin::Navbar-->
            <div class="card mb-9">
                <div class="card-body pt-9 pb-0">

                    <head-details/>


                    <div class="separator"></div>
                    <!--begin::Nav wrapper-->
                    <div class="d-flex overflow-auto h-55px">
                        <!--begin::Nav links-->
                        <ul class="nav nav-stretch nav-line-tabs nav-line-tabs-2x border-transparent fs-5 fw-bolder flex-nowrap">
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
                            <!--end::Nav item-->
                        </ul>
                        <!--end::Nav links-->
                    </div>
                    <!--end::Nav wrapper-->
                </div>
            </div>
            <!--end::Navbar-->

            <!--begin::Card-->
            <div class="card">
                <!--begin::Card header-->
                <div class="card-header">
                    <!--begin::Card title-->
                    <div class="card-title fs-3 fw-bolder">Player Dashboard</div>

                    <!--end::Card title-->
                </div>
                <!--end::Card header-->
                <!--begin::Form-->
                <form @submit.prevent="updateProfile" class="form">
                    <!--begin::Card body-->
                    <div class="card-body p-9">
                        <!--begin::Row-->
                        <div class="row mb-5">
                            <!--begin::Col-->
                            <div class="col-xl-3">
                                <div class="fs-6 fw-bold mt-2 mb-3">Player Photo</div>
                            </div>
                            <!--end::Col-->
                            <!--begin::Col-->
                            <div class="col-lg-8">
                                <!--begin::Image input-->
                                <div class="image-input image-input-outline" data-kt-image-input="true" style="background-image: url('../assets/player/media/icons/add.png')">
                                    <!--begin::Preview existing avatar-->
                                    <div class="image-input-wrapper w-125px h-125px bgi-position-center" style="background-size: 75%; background-image: url('../assets/player/media/icons/add.png')"></div>
                                    <!--end::Preview existing avatar-->
                                    <!--begin::Label-->
                                    <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-white shadow" data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change avatar">
                                        ✎
                                        <!--begin::Inputs-->
                                        <input type="file" ref="photo" name="player_photo" accept=".png, .jpg, .jpeg" @change="onAvatarChange"/>
                                        <input type="hidden" name="player_photox" />
                                        <!--end::Inputs-->
                                    </label>
                                    <!--end::Label-->
                                    <!--begin::Cancel-->
                                    <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-white shadow" data-kt-image-input-action="cancel" data-bs-toggle="tooltip" title="Cancel avatar">
X
													</span>
                                    <!--end::Cancel-->

                                </div>
                                <!--end::Image input-->
                                <!--begin::Hint-->
                                <div class="form-text">Allowed file types: png, jpg, jpeg. Max: 250 Kb</div>
                                <!--end::Hint-->
                                <div v-if="showUploadProgress">
                                    Uploading: {{ uploadPercent }} %
                                </div>
                            </div>
                            <!--end::Col-->
                        </div>
                        <!--end::Row-->
                        <!--begin::Row-->
                        <div class="row mb-8">
                            <!--begin::Col-->
                            <div class="col-xl-3">
                                <div class="fs-6 fw-bold mt-2 mb-3">Full Name</div>
                            </div>
                            <!--end::Col-->
                            <!--begin::Col-->
                            <div class="col-xl-9 fv-row">
                                <input v-model="name" type="text" class="form-control form-control-solid" name="full_name" value="Award" />
                            </div>
                        </div>
                        <!--end::Row-->
                        <!--begin::Row-->
                        <div class="row mb-8">
                            <!--begin::Col-->
                            <div class="col-xl-3">
                                <div class="fs-6 fw-bold mt-2 mb-3">Phone Number</div>
                            </div>
                            <!--end::Col-->
                            <!--begin::Col-->
                            <div class="col-xl-9 fv-row">
                                <input v-model="phn" type="number" class="form-control form-control-solid" name="phone">
                            </div>
                        </div>	<!--begin::Row-->
                        <!--begin::Row-->
                        <div class="row mb-8">
                            <!--begin::Col-->
                            <div class="col-xl-3">
                                <div class="fs-6 fw-bold mt-2 mb-3">Email</div>
                            </div>
                            <!--end::Col-->
                            <!--begin::Col-->
                            <div class="col-xl-9 fv-row">
                                <input v-model="eml" type="email" class="form-control form-control-solid" name="email"/>
                            </div>
                        </div>	<!--begin::Row-->
                        <div class="row mb-8">
                            <!--begin::Col-->
                            <div class="col-xl-3">
                                <div class="fs-6 fw-bold mt-2 mb-3">Facebook</div>
                            </div>
                            <!--end::Col-->
                            <!--begin::Col-->
                            <div class="col-xl-9 fv-row">
                                <input v-model="fb" type="text" class="form-control form-control-solid" name="facebook" value="facebook.com/" />
                            </div>
                        </div>	<!--begin::Row-->
                        <div class="row mb-8">
                            <!--begin::Col-->
                            <div class="col-xl-3">
                                <div class="fs-6 fw-bold mt-2 mb-3">Blood Group</div>
                            </div>
                            <!--end::Col-->
                            <!--begin::Col-->
                            <div class="col-xl-9 fv-row">
                                <input v-model="bg" type="text" class="form-control form-control-solid" name="blood_grp" value=" " />
                            </div>
                        </div>	<div class="row mb-8">
                        <!--begin::Col-->
                        <div class="col-xl-3">
                            <div class="fs-6 fw-bold mt-2 mb-3">Institution</div>
                        </div>
                        <!--end::Col-->
                        <!--begin::Col-->
                        <div class="col-xl-9 fv-row">
                            <input v-model="inst" type="text" class="form-control form-control-solid" name="institution" value=" " />
                        </div>
                    </div>
                        <!--end::Row-->


                    </div>
                    <!--end::Card body-->
                    <!--begin::Card footer-->
                    <div v-if="err" class="card-footer d-flex justify-content-end py-6 px-9" style=" color: red; font-size: 17px;
">
                        <div class="row">{{msg}} :{{errMsg}} </div>
                    </div>
                    <div v-if="!err" class="card-footer d-flex justify-content-end py-6 px-9" style=" color: green; font-size: 17px;
">
                        <div class="row">{{msg}} </div>
                    </div>


                    <div class="card-footer d-flex justify-content-end py-6 px-9">

                        <button type="reset" class="btn btn-light btn-active-light-primary me-2">Discard</button>
                        <button type="submit" class="btn btn-primary" >Save Changes</button>
                    </div>
                    <!--end::Card footer-->
                </form>
                <!--end:Form-->
            </div>
            <!--end::Card-->
        </div>
        <!--end::Post-->
    </div>
    <!--end::Container-->




</profile>
</template>

<script>

export default {
    name: "setting",
    data() {
        return {
            uploadPercent: 0,
            showUploadProgress: false,
            processingUpload: false,
            name:'',
            fb:'',
            bg:'',
            inst:'',
            eml:'',
            phn:'',
            img:'',
            result: false,
            err:false,
            msg: '',
            errMsg:'',
            profileData: [],
            profileUp:0
        }
    },

    methods: {
        updateProfile(){
            if(this.$refs.photo){
                this.showUploadProgress = true
                this.processingUpload = true
                this.uploadPercent = 0
                let formData = new FormData()
                formData.append('player_photo', this.img)
                formData.append('full_name', this.name)
                formData.append('facebook', this.fb)
                formData.append('blood_grp', this.bg)
                formData.append('institution', this.inst)
                formData.append('email', this.eml)
                formData.append('phone', this.phn)
                axios.post(this.$api_url+'api/v1/update/profile', formData, {
                    onUploadProgress: (progressEvent) => {
                        this.uploadPercent = progressEvent.lengthComputable ? Math.round( (progressEvent.loaded * 100) / progressEvent.total ) : 0 ;
                    }
                }).then( (response) => {
                        this.err=false;
                        this.errMsg='',
                        this.msg=response.data.message;
                        this.showUploadProgress = false
                        this.processingUpload = false
                        this.$emit('imageUrl', response.data.secure_url )
                    this.profileUp += 1;
                })
                    .catch( (error) => {
                        if(error.response){
                            this.err=true;
                            this.errMsg=error.response.data.data;
                            console.log(error.message)
                            this.msg=error.response.data.message;
                        }else{
                            console.log(error)
                        }
                        this.showUploadProgress = false
                        this.processingUpload = false
                    })
            }
        },
        onAvatarChange(e) {
            this.img = e.target.files[0]

        },
        getProfile() {
            let loc = localStorage.getItem('loc');
            axios.get(this.$api_url + 'api/v1/profile', {
                params: {}
            }).then(
                response => {
                    this.result = true;
                    this.name=response.data.data[0].name
                    this.phn=response.data.data[0].mobile
                    this.eml=response.data.data[0].email
                    this.fb=response.data.data[0].fb
                    this.bg=response.data.data[0].blood_grp
                    this.inst=response.data.data[0].insit
                    console.log(response);
                    this.profileData = response.data['data'][0];
                    this.msg = '';
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











