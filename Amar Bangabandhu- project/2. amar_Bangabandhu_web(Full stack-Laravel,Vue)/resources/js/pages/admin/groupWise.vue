<template>
    <div>

        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="d-flex align-items-center">
                <div class="me-auto">
                    <h3 class="page-title">Data Tables</h3>
                    <div class="d-inline-block align-items-center">
                        <nav>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a></li>
                                <li class="breadcrumb-item" aria-current="page">Tables</li>
                                <li class="breadcrumb-item active" aria-current="page">Data Tables</li>
                            </ol>
                        </nav>
                    </div>
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
                        <select  v-model="selectedGrp" class="select2 form-control" placeholder="Group">
                            <option value="" selected disabled hidden>প্রতিযোগী গ্রুপ</option>
                            <optgroup label="প্রতিযোগি গ্রুপ নির্বাচন">
                                <option value="jnr">জুনিয়র</option>
                                <option value="yth">ইয়থ</option>
                                <option value="snr">সিনিয়র</option>
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
                            <h3 class="box-title">Top Performance- Group wise of {{ location }}</h3>
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
function getLOC(d){
    switch (parseInt(d)) {


        case 1:
            return 'Dhaka!';
            break;
        case 2:
            return 'Chittagong!';
            break;
        case 3:
            return 'Rajshahi!';
            break;
        case 4:
            return 'Khulna!';
            break;
        case 5:
            return 'Barisal!';
            break;
        case 6:
            return 'Sylhet!';
            break;
        case 7:
            return 'Mymensingh!';
            break;
        case 8:
            return 'Gazipur!';
            break;
        case 9:
            return 'Gopalganj!';
            break;
        case 10:
            return 'Kishoreganj!';
            break;
        case 11:
            return 'Faridpur!';
            break;
        case 12:
            return 'Manikganj!';
            break;
        case 13:
            return 'Munshiganj!';
            break;
        case 14:
            return 'Rajbari!';
            break;
        case 15:
            return 'Brahmanbaria!';
            break;
        case 16:
            return 'Comilla!';
            break;
        case 17:
            return 'Feni!';
            break;
        case 18:
            return 'Rangamati!';
            break;
        case 19:
            return 'Noakhali!';
            break;
        case 20:
            return 'Chandpur!';
            break;
        case 21:
            return 'Lakshmipur!';
            break;
        case 22:
            return 'Coxs Bazar!';
            break;
        case 23:
            return 'Khagrachhari!';
            break;
        case 24:
            return 'Bandarban!';
            break;
        case 25:
            return 'Sirajganj!';
            break;
        case 26:
            return 'Pabna!';
            break;
        case 27:
            return 'Bogra!';
            break;
        case 28:
            return 'Natore!';
            break;
        case 29:
            return 'Joypurhat!';
            break;
        case 30:
            return 'Chapainawabganj!';
            break;
        case 31:
            return 'Naogaon!';
            break;
        case 32:
            return 'Jessore!';
            break;
        case 33:
            return 'Satkhira!';
            break;
        case 34:
            return 'Meherpur!';
            break;
        case 35:
            return 'Narail!';
            break;
        case 36:
            return 'Chuadanga!';
            break;
        case 37:
            return 'Kushtia!';
            break;
        case 38:
            return 'Magura!';
            break;
        case 39:
            return 'Bagerhat!';
            break;
        case 40:
            return 'Jhenaidah!';
            break;
        case 41:
            return 'Jhalokati!';
            break;
        case 42:
            return 'Patuakhali!';
            break;
        case 43:
            return 'Pirojpur!';
            break;
        case 44:
            return 'Bhola!';
            break;
        case 45:
            return 'Barguna!';
            break;
        case 46:
            return 'Moulvibazar!';
            break;
        case 47:
            return 'Habiganj!';
            break;
        case 48:
            return 'Sunamganj!';
            break;
        case 49:
            return 'Narsingdi!';
            break;
        case 50:
            return 'Shariatpur!';
            break;
        case 51:
            return 'Narayanganj!';
            break;
        case 52:
            return 'Tangail!';
            break;
        case 53:
            return 'Madaripur!';
            break;
        case 54:
            return 'Panchagarh!';
            break;
        case 55:
            return 'Dinajpur!';
            break;
        case 56:
            return 'Lalmonirhat!';
            break;
        case 57:
            return 'Nilphamari!';
            break;
        case 58:
            return 'Gaibandha!';
            break;
        case 59:
            return 'Thakurgaon!';
            break;
        case 60:
            return 'Rangpur!';
            break;
        case 61:
            return 'Kurigram!';
            break;
        case 62:
            return 'Sherpur!';
            break;
        case 63:
            return 'Jamalpur!';
            break;
        case 64:
            return 'Netrokona!';
            break;


        default:
            return ' All players';
    }
}
export default {
    name: "groupWise",
    data() {
        return {
            glob:localStorage.getItem('Glob'),
            selectedDis:'',
            purl:'/admin/view?prid=',
            selectedGrp: '',
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
                    grp: this.selectedGrp,
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
