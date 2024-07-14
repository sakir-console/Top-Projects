<template>
    <div>

        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="d-flex align-items-center">
                <div class="me-auto">
                    <h3 class="page-title">Performance</h3>

                </div>

            </div>
        </div>

        <!-- Main content -->
        <section class="content">
            <div class="row">

                <form @submit.prevent="getPerform">
                    <li v-if="glob" class="nav-item">
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
                        <select  v-model="selectedPrn" class="select2 form-control" placeholder="Group">
                            <option value="" selected disabled hidden>প্রতিযোগী নিজ/অবিভাবকের কর্মক্ষেত্র </option>
                            <optgroup label="কর্মক্ষেত্র">
                                <option value="1">সেনাবাহিনী</option>
                                <option value="2">নৌবাহিনী</option>
                                <option value="3">বিমানবাহিনী</option>
                                <option value="4">বিজিবি</option>
                                <option value="5">র‍্যাব</option>
                                <option value="6">পুলিশ</option>
                                <option value="7">সরকারি চাকুরিজীবী</option>
                                <option value="8">বেসরকারি চাকুরিজীবী</option>
                                <option value="9">স্বাস্থ্যসেবা</option>
                                <option value="10">প্রকৌশল</option>
                                <option value="11">শিক্ষকতা</option>
                                <option value="12">অন্যান্য</option>
                            </optgroup>
                        </select>
                    </li>
                    <button class="mybtn1" type="submit" style="color: white;padding: 5px;border-radius: 4px;margin: 5px;background-image: linear-gradient(to left, rgb(96 120 103), rgb(153 178 192));">
                        তালিকা দেখুন
                    </button>
                </form>


                <div class="col-12">


                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">Top Performance- Parents workplace wise</h3>
                            <h6 class="box-subtitle">All the data are from central server</h6>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="table-responsive">
                                <table id="example"
                                       class="table table-bordered table-hover display nowrap margin-top-10 margin-bottom-10 w-p100c">
                                    <br>
                                    <caption>Powered by: amarbangabandhu.app</caption>
                                    <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Gender</th>
                                        <th>Group</th>
                                        <th>Location</th>
                                        <th>Guradian Profession</th>
                                        <th>Duration(Sec.)</th>
                                        <th>Correct ANS</th>
                                        <th>Total mark</th>
                                        <th>Rank in {{ location }}</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="(performance,index) in performances" :key="performance.id">
                                        <td><a v-bind:href=purl+performance.user_id>  {{performance.u_name}}</a></td>
                                        <td>{{ performance.gender }}</td>
                                        <td>{{ performance.group }}</td>
                                        <td>{{ performance.location }}</td>
                                        <td>{{ performance.guardian_prf }}</td>
                                        <td>{{ performance.duration }}</td>
                                        <td>{{ performance.corr_ans }}</td>
                                        <td>{{ performance.mark }}</td>
                                        <td>{{ index + 1 }}</td>

                                    </tr>
                                    <tr>

                                    </tr>


                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th>Name</th>
                                        <th>Gender</th>
                                        <th>Group</th>
                                        <th>Location</th>
                                        <th>Guradian</th>
                                        <th>Duration(Sec.)</th>
                                        <th>Correct ANS</th>
                                        <th>Total mark</th>
                                        <th>Rank in {{ location }}</th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
</template>

<script>

export default {
    name: "parentsWise",
    data() {
        return {
            glob:localStorage.getItem('Glob'),
            selectedDis:'',
            purl:'/admin/view?prid=',
            selectedPrn: '',
            result: false,
            msg: '',
            performances: [],
            location: ''
        }
    },
    methods: {
        getPerform() {
            let loc = localStorage.getItem('loc');
            axios.get(this.$api_url + 'api/v1/mod/player/performances', {
                params: {
                    loc:this.selectedDis==''?localStorage.getItem('loc'):this.selectedDis,
                    grd_pf: this.selectedPrn,
                    limit: 150,
                }
            }).then(
                response => {
                    this.result = true;
                    console.log(response);
                    this.performances = response.data.data;
                    this.location = this.selectedDis==''?localStorage.getItem('loc')?getLOC(localStorage.getItem('loc')):'All players':response.data['data'][0]['location'];
                    this.msg = '';
                }
            ).catch((error) => {

                this.msg = error.response.data.message;
                console.log(error.response);
            });
        },



    },


    mounted() {
        this.getPerform();
    }


}
</script>

<style scoped>

</style>
