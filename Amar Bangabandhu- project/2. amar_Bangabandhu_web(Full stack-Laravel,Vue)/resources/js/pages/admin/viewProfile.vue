<template>
    <div>


        <section class="content">
            <div class="row">


                <div class="box">
                    <div class="box-header with-border">

                        <h2 style="text-align:center">{{profileData.name}}</h2>

                        <div class="card">
                            <img :src=baseUrl+profileData.pp alt="John" style="width:100%">

                            <p class="title">Location: {{profileData.location}}</p>
                            <p>Email: {{profileData.email}}</p>
                            <p>Group: {{profileData.group}}</p>
                            <p>Gender: {{profileData.gender}}</p>
                            <p>Own/Guardian Workplace: {{profileData.guardian_prf}}</p>
                            <p>DOB: {{profileData.dob}}</p>
                            <p>Blood: {{profileData.blood_grp}}</p>
                            <p>Institution: {{profileData.insit}}</p>

                            <p><button>Phone: {{profileData.mobile}}</button></p>
                        </div>


                    </div>
                </div>
            </div>

        </section>

    </div>
</template>

<script>

let urlParams = new URLSearchParams(window.location.search);
export default {
name: "viewProfile",
    data() {
        return {
            baseUrl:'../uploads/images/pp/',
            profileData:[]
        };
    },
    methods: {
        viewProfile() {
            let loc = localStorage.getItem('loc');
            axios.get(this.$api_url + 'api/v1/mod/player/profile', {
                params: {
                    id:urlParams.get('prid')
                }
            }).then(
                response => {
                    this.result = true;
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
    mounted(){

        this.viewProfile()
    }

}
</script>

<style scoped>
.card {
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    max-width: 390px;
    margin: auto;
    text-align: center;
    font-family: arial;
}

.title {
    color: grey;
    font-size: 18px;
}

button {
    border: none;
    outline: 0;
    display: inline-block;
    padding: 8px;
    color: white;
    background-color: #000;
    text-align: center;
    cursor: pointer;
    width: 100%;
    font-size: 18px;
}

a {
    text-decoration: none;
    font-size: 22px;
    color: black;
}

button:hover, a:hover {
    opacity: 0.7;
}
</style>
