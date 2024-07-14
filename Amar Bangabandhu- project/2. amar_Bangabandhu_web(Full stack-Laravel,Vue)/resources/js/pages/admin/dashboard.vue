<template>
    <section class="content">

        <div class="row align-items-end">
            <div class="col-xl-9 col-12">
                <div class="box bg-primary-light pull-up">
                    <div class="box-body p-xl-0">
                        <div class="row align-items-center">
                            <div class="col-12 col-lg-3"><img
                                src="/../admin-assets/images/svg-icon/color-svg/custom-14.svg"
                                alt=""></div>
                            <div class="col-12 col-lg-9">
                                <h2>Hello {{location}}, Welcome..</h2>
                                <p class="text-dark mb-0 fs-16">
                                    Dedicated to Father of nation, "Bangabandhu Sheikh Mujibur Rahman".
                                    Moderate the players of the district!
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-12">
                <div class="box bg-transparent no-shadow">
                    <div class="box-body p-xl-0 text-center">
                        <h3 class="px-30 mb-20">Know More<br>Global positions of participants</h3>

                    </div>
                </div>
            </div>
        </div>



        <section class="contentx">


            <div class="row">



                <div class="col-md-6 col-lg-4">
                    <div class="box box-body">
                        <div class="flexbox">
                            <div class="text-start">
                                <span>Junior player</span><br>
                                <span>
						<i class="ion-ios-arrow-up text-success"></i>
						<span class="fs-18 ms-1">{{jnr}}</span>
					  </span>
                            </div>
                            <div id="linechart2" ></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4">
                    <div class="box box-body bg-danger">
                        <div class="flexbox">
                            <div class="text-start">
                                <span>Youth player</span><br>
                                <span>
						<i class="ion-ios-arrow-up text-success"></i>
						<span class="fs-18 ms-1">{{yth}}</span>
					  </span>
                            </div>
                            <div id="barchart2"></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4">
                    <div class="box box-body bg-warning">
                        <div class="flexbox">
                            <div class="text-start">
                                <span>Senior player</span><br>
                                <span>
						<i class="ion-ios-arrow-up text-success"></i>
						<span class="fs-18 ms-1">{{snr}}</span>
					  </span>
                            </div>
                            <div id="discretechart2"></div>
                        </div>
                    </div>
                </div>






                <div class="col-md-6">
                    <div class="box bg-success-light">
                        <div class="box-body">
                            <div class="media align-items-center p-0">
                                <h3 class="mx-0 mb-5 fw-500">Registered Player</h3>
                            </div>
                            <div class="flexbox align-items-center mt-5">
                                <div>
                                    <h4 class="no-margin"><span>{{ttlpr}} player</span></h4>
                                </div>
                                <div class="text-end">
                                    <h4 class="no-margin"><span>Total registered player</span></h4>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer p-0 no-border bg-transparent">
                            <div class="chart"><canvas id="chartjs3" class="h-80"></canvas></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="box bg-primary-light">
                        <div class="box-body">
                            <div class="media align-items-center p-0">
                                <h3 class="mx-0 mb-5 fw-500">Played time</h3>
                            </div>
                            <div class="flexbox align-items-center mt-5">
                                <div>
                                    <h4 class="no-margin"><span>{{duration}} hours</span></h4>
                                </div>
                                <div class="text-end">
                                    <h4 class="no-margin"><span>Total spent time by players</span></h4>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer p-0 no-border bg-transparent">
                            <div class="chart"><canvas id="chartjs4" class="h-80"></canvas></div>
                        </div>
                    </div>
                </div>







                <div class="col-md-6 col-xl-4">

                    <!-- Bar chart in colored card -->
                    <div class="box bg-info">
                        <div class="box-body">
                            <div class="d-flex">
                                <h3 class="fw-600 mb-0">30</h3>
                            </div>

                            <div>
                                Quiz question
                                <div class="fs-16">Total</div>
                            </div>
                        </div>

                        <div class="container-fluid">
                            <div id="chart_bar_color"></div>
                        </div>
                    </div>
                    <!-- /bar chart in colored card -->

                </div>

                <div class="col-md-6 col-xl-4">

                    <!-- Line chart in colored card -->
                    <div class="box bg-warning">
                        <div class="box-body">
                            <div class="d-flex">
                                <h3 class="fw-600 mb-0">29</h3>
                            </div>

                            <div>
                                Total
                                <div class="fs-16"> Game Level</div>
                            </div>
                        </div>

                        <div id="line_chart_color"></div>
                    </div>
                    <!-- /line chart in colored card -->

                </div>

                <div class="col-md-6 col-xl-4">

                    <!-- Sparklines in colored card -->
                    <div class="box bg-primary">
                        <div class="box-body">
                            <div class="d-flex">
                                <h3 class="fw-600 mb-0">64</h3>

                            </div>

                            <div>
                                Total District
                                <div class="fs-16"> participants</div>
                            </div>
                        </div>

                        <div id="sparklines_color"></div>
                    </div>
                    <!-- /sparklines in colored card -->

                </div>
            </div>
            <!-- /widgets with charts -->


            <div class="row">
                <div class="col-md-6 col-lg-3">
                    <div class="box">
                        <div class="box-header no-border">
                            <h6>Total Participants</h6>
                            <div class="box-tools pull-right">
                                <ul class="card-controls">

                                    <li><a href="" class="link card-btn-reload" data-bs-toggle="tooltip"
                                           title="" data-bs-original-title="Refresh"><i
                                        class="fa fa-circle-thin"></i></a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="box-body">
                            <div class="flexbox">
                                <div id="barchart4"></div>
                                <div>
                                    <h3 class="countnm mb-5">{{ttlpr}}</h3>
                                    <p class="mb-0">Played</p>
                                    <p class="text-fade"><small>Players</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="box">
                        <div class="box-header no-border">
                            <h6>Total Male</h6>
                            <div class="box-tools pull-right">
                                <ul class="card-controls">

                                    <li><a href="" class="link card-btn-reload" data-bs-toggle="tooltip"
                                           title="" data-bs-original-title="Refresh"><i
                                        class="fa fa-circle-thin"></i></a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="box-body">
                            <div class="flexbox">
                                <div id="linearea3"></div>
                                <div>
                                    <h3 class="countnm mb-5">{{ttlml}}</h3>
                                    <p class="mb-0">Total</p>
                                    <p class="text-fade"><small>Male player</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="box">
                        <div class="box-header no-border">
                            <h6>Total Female</h6>
                            <div class="box-tools pull-right">
                                <ul class="card-controls">

                                    <li><a href="" class="link card-btn-reload" data-bs-toggle="tooltip"
                                           title="" data-bs-original-title="Refresh"><i
                                        class="fa fa-circle-thin"></i></a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="box-body">
                            <div class="flexbox">
                                <div id="linechart4"></div>
                                <div>
                                    <h3 class="countnm mb-5">{{ttlfl}}</h3>
                                    <p class="mb-0">Total</p>
                                    <p class="text-fade"><small>Female player</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="box">
                        <div class="box-header no-border">
                            <h6>Total custom</h6>
                            <div class="box-tools pull-right">
                                <ul class="card-controls">

                                    <li><a href="" class="link card-btn-reload" data-bs-toggle="tooltip"
                                           title="" data-bs-original-title="Refresh"><i
                                        class="fa fa-circle-thin"></i></a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="box-body">
                            <div class="flexbox">
                                <div id="discretechart4"></div>
                                <div>
                                    <h3 class="countnm mb-5">{{ttloth}}</h3>
                                    <p class="mb-0">Total</p>
                                    <p class="text-fade"><small>Custom player</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </section>


    </section>
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
            return ' No word';
    }
}
export default {
    name: "admin-dashboard",
    data(){
        return {
            admCode:'',
            pass:'',
            male:'43',
            msg:'Use respective credentials',
            duration:'',
            location:'',
            ttlpr:'',
            ttlml:'',
            ttlfl:'',
            ttloth:'',
            perpr:'',
            jnr:'',
            yth:'',
            snr:''

        }
    },
    methods: {

        stat(){
            axios.get(this.$api_url+'api/v1/mod/player/stat',).then(
                response =>{
                    this.duration= response.data['data']['duration'];
                    this.location= response.data['data']['location'];
                    this.ttlpr= response.data['data']['ttlpr'];
                    this.perpr= response.data['data']['perpr'];
                    this.ttlml= response.data['data']['male'];
                    this.ttlfl= response.data['data']['female'];
                    this.ttloth= response.data['data']['others'];
                    this.jnr= response.data['data']['junior'];
                    this.yth= response.data['data']['youth'];
                    this.snr= response.data['data']['senior'];


                    this.male=4;
                    this.result = true;
                    console.log(response);

                    $(function () {

                        'use strict';

                        var options = {
                            series: [{
                                name: 'Hours spent',
                                data: [78, 9, 2, 4, 7, 1, 6]
                            }],
                            chart: {
                                foreColor:"#bac0c7",
                                type: 'bar',
                                height: 200,
                                stacked: true,
                                toolbar: {
                                    show: false
                                },
                                zoom: {
                                    enabled: true
                                }
                            },
                            responsive: [{
                                breakpoint: 480,
                                options: {
                                    legend: {
                                        position: 'bottom',
                                        offsetX: -10,
                                        offsetY: 0
                                    }
                                }
                            }],
                            grid: {
                                show: true,
                                borderColor: '#f7f7f7',
                            },
                            colors:['#6993ff'],
                            plotOptions: {
                                bar: {
                                    horizontal: false,
                                    columnWidth: '20%',
                                    colors: {
                                        backgroundBarColors: ['#f0f0f0'],
                                        backgroundBarOpacity: 1,
                                    },
                                },
                            },
                            dataLabels: {
                                enabled: false
                            },

                            xaxis: {
                                categories: ['Mony', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                            },
                            legend: {
                                show: false,
                            },
                            fill: {
                                opacity: 1
                            }
                        };

                        var chart = new ApexCharts(document.querySelector("#charts_widget_one_chart"), options);
                        chart.render();




                        var options = {
                            series: [response.data['data']['junior'], response.data['data']['youth'], response.data['data']['senior']],
                            labels: [' Junior', ' Youth', ' Senior'],
                            chart: {
                                width:328,
                                type: 'donut',
                            },
                            dataLabels: {
                                enabled: false
                            },
                            responsive: [{
                                breakpoint: 480,
                                options: {
                                    chart: {
                                        width: 200
                                    },
                                    legend: {
                                        show: false
                                    }
                                }
                            }],
                            colors:['#04a08b', '#ec8000', '#FF4C52'],
                            legend: {
                                position: 'right',
                                height: 230,
                            }
                        };

                        var chart = new ApexCharts(document.querySelector("#charts_widget_two_chart"), options);
                        chart.render();


                        var options = {
                            chart: {
                                height: 180,
                                type: "radialBar"
                            },

                            series: [response.data['data']['perttl']],
                            colors: ['#0052cc'],
                            plotOptions: {
                                radialBar: {
                                    hollow: {
                                        margin: 15,
                                        size: "70%"
                                    },
                                    track: {
                                        background: '#ff9920',
                                    },

                                    dataLabels: {
                                        showOn: "always",
                                        name: {
                                            offsetY: -10,
                                            show: false,
                                            color: "#888",
                                            fontSize: "13px"
                                        },
                                        value: {
                                            color: "#111",
                                            fontSize: "30px",
                                            show: true
                                        }
                                    }
                                }
                            },

                            stroke: {
                                lineCap: "round",
                            },
                            labels: ["Progress"]
                        };

                        var chart = new ApexCharts(document.querySelector("#revenue5"), options);

                        chart.render();

                    });


                    $(function() {
                        "use strict";
                        // ------------------------------
                        // Basic pie chart
                        // ------------------------------
                        // based on prepared DOM, initialize echarts instance
                        var basicpieChart = echarts.init(document.getElementById('basic-pie'));
                        var option = {
                            // Add title
                            title: {
                                text: 'Top 5 Scored location',
                                subtext: 'Purely Fictitious',
                                x: 'center'
                            },

                            // Add tooltip
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b}: {c} ({d}%)"
                            },

                            // Add legend
                            legend: {
                                orient: 'vertical',
                                x: 'left',
                                data: [getLOC(response.data['data']['top_score_loc'][0]['pr_loc']),getLOC(response.data['data']['top_score_loc'][1]['pr_loc']), getLOC(response.data['data']['top_score_loc'][2]['pr_loc']),getLOC(response.data['data']['top_score_loc'][3]['pr_loc']), getLOC(response.data['data']['top_score_loc'][4]['pr_loc'])]
                            },

                            // Add custom colors
                            color: ['#689f38', '#38649f', '#389f99', '#ee1044', '#ff8f00'],

                            // Display toolbox
                            toolbox: {
                                show: true,
                                orient: 'vertical',
                                feature: {
                                    mark: {
                                        show: true,
                                        title: {
                                            mark: 'Markline switch',
                                            markUndo: 'Undo markline',
                                            markClear: 'Clear markline'
                                        }
                                    },
                                    dataView: {
                                        show: true,
                                        readOnly: false,
                                        title: 'View data',
                                        lang: ['View chart data', 'Close', 'Update']
                                    },
                                    magicType: {
                                        show: true,
                                        title: {
                                            pie: 'Switch to pies',
                                            funnel: 'Switch to funnel',
                                        },
                                        type: ['pie', 'funnel'],
                                        option: {
                                            funnel: {
                                                x: '25%',
                                                y: '20%',
                                                width: '50%',
                                                height: '70%',
                                                funnelAlign: 'left',
                                                max: 1548
                                            }
                                        }
                                    },
                                    restore: {
                                        show: true,
                                        title: 'Restore'
                                    },
                                    saveAsImage: {
                                        show: true,
                                        title: 'Same as image',
                                        lang: ['Save']
                                    }
                                }
                            },

                            // Enable drag recalculate
                            calculable: true,

                            // Add series
                            series: [{
                                name: 'Top Scored',
                                type: 'pie',
                                radius: '70%',
                                center: ['50%', '57.5%'],
                                data: [
                                    {value: 335, name: getLOC(response.data['data']['top_score_loc'][0]['pr_loc'])},
                                    {value: 310, name: getLOC(response.data['data']['top_score_loc'][1]['pr_loc'])},
                                    {value: 234, name: getLOC(response.data['data']['top_score_loc'][2]['pr_loc'])},
                                    {value: 135, name: getLOC(response.data['data']['top_score_loc'][3]['pr_loc'])},
                                    {value: 1548, name: getLOC(response.data['data']['top_score_loc'][4]['pr_loc'])}
                                ]
                            }]
                        };

                        basicpieChart.setOption(option);
                        // ------------------------------
                        // Basic pie chart
                        // ------------------------------
                        // based on prepared DOM, initialize echarts instance
                        var basicdoughnutChart = echarts.init(document.getElementById('basic-doughnut'));
                        var option = {
                            // Add title
                            title: {
                                text: 'Top 5 Location',
                                subtext: 'Central server data',
                                x: 'center'
                            },

                            // Add legend
                            legend: {
                                orient: 'vertical',
                                x: 'left',
                                data: [ getLOC(response.data['data']['Most_pr_loc'][0]['location']),  getLOC(response.data['data']['Most_pr_loc'][1]['location']), getLOC(response.data['data']['Most_pr_loc'][2]['location']),  getLOC(response.data['data']['Most_pr_loc'][3]['location']), getLOC(response.data['data']['Most_pr_loc'][4]['location'])]
                            },

                            // Add custom colors
                            color: ['#689f38', '#38649f', '#389f99', '#ee1044', '#ff8f00'],

                            // Display toolbox
                            toolbox: {
                                show: true,
                                orient: 'vertical',
                                feature: {
                                    mark: {
                                        show: true,
                                        title: {
                                            mark: 'Markline switch',
                                            markUndo: 'Undo markline',
                                            markClear: 'Clear markline'
                                        }
                                    },
                                    dataView: {
                                        show: true,
                                        readOnly: false,
                                        title: 'View data',
                                        lang: ['View chart data', 'Close', 'Update']
                                    },
                                    magicType: {
                                        show: true,
                                        title: {
                                            pie: 'Switch to pies',
                                            funnel: 'Switch to funnel',
                                        },
                                        type: ['pie', 'funnel'],
                                        option: {
                                            funnel: {
                                                x: '25%',
                                                y: '20%',
                                                width: '50%',
                                                height: '70%',
                                                funnelAlign: 'left',
                                                max: 1548
                                            }
                                        }
                                    },
                                    restore: {
                                        show: true,
                                        title: 'Restore'
                                    },
                                    saveAsImage: {
                                        show: true,
                                        title: 'Same as image',
                                        lang: ['Save']
                                    }
                                }
                            },

                            // Enable drag recalculate
                            calculable: true,

                            // Add series
                            series: [
                                {
                                    name: 'Marketing',
                                    type: 'pie',
                                    radius: ['50%', '70%'],
                                    center: ['50%', '57.5%'],
                                    itemStyle: {
                                        normal: {
                                            label: {
                                                show: true
                                            },
                                            labelLine: {
                                                show: true
                                            }
                                        },
                                        emphasis: {
                                            label: {
                                                show: true,
                                                formatter: '{b}' + '\n\n' + '{c} ({d}%)',
                                                position: 'center',
                                                textStyle: {
                                                    fontSize: '17',
                                                    fontWeight: '500'
                                                }
                                            }
                                        }
                                    },

                                    data: [
                                        {value: 335, name: getLOC(response.data['data']['Most_pr_loc'][0]['location'])},
                                        {value: 310, name: getLOC(response.data['data']['Most_pr_loc'][1]['location'])},
                                        {value: 234, name: getLOC(response.data['data']['Most_pr_loc'][2]['location'])},
                                        {value: 135, name: getLOC(response.data['data']['Most_pr_loc'][3]['location'])},
                                        {value: 1548, name: getLOC(response.data['data']['Most_pr_loc'][4]['location'])}
                                    ]
                                }
                            ]
                        };

                        basicdoughnutChart.setOption(option);
                        // ------------------------------

                        // ------------------------------
                        // pole chart
                        // ------------------------------
                        // based on prepared DOM, initialize echarts instance
                        var poleChart = echarts.init(document.getElementById('pole-chart'));
                        // Data style
                        var dataStyle = {
                            normal: {
                                label: {show: false},
                                labelLine: {show: false}
                            }
                        };

                        // Placeholder style
                        var placeHolderStyle = {
                            normal: {
                                color: 'rgba(0,0,0,0)',
                                label: {show: false},
                                labelLine: {show: false}
                            },
                            emphasis: {
                                color: 'rgba(0,0,0,0)'
                            }
                        };
                        var option = {
                            title: {
                                text: 'Gender wise',
                                subtext: 'Players',
                                x: 'center',
                                y: 'center',
                                itemGap: 10,
                                textStyle: {
                                    color: 'rgba(30,144,255,0.8)',
                                    fontSize: 19,
                                    fontWeight: '500'
                                }
                            },

                            // Add tooltip
                            tooltip: {
                                show: true,
                                formatter: "{a} <br/>{b}: {c} ({d}%)"
                            },

                            // Add legend
                            legend: {
                                orient: 'vertical',
                                x: document.getElementById('pole-chart').offsetWidth / 2,
                                y: 30,
                                x: '55%',
                                itemGap: 15,
                                data: ['Male','Female','Custom']
                            },

                            // Add custom colors
                            color: ['#689f38', '#38649f', '#ff8f00'],

                            // Add series
                            series: [
                                {
                                    name: '1',
                                    type: 'pie',
                                    clockWise: false,
                                    radius: ['75%', '90%'],
                                    itemStyle: dataStyle,
                                    data: [
                                        {
                                            value: 80,
                                            name: 'Male'
                                        },
                                        {
                                            value: 40,
                                            name: 'invisible',
                                            itemStyle: placeHolderStyle
                                        }
                                    ]
                                },

                                {
                                    name: '2',
                                    type:'pie',
                                    clockWise: false,
                                    radius: ['60%', '75%'],
                                    itemStyle: dataStyle,
                                    data: [
                                        {
                                            value: 50,
                                            name: 'Female'
                                        },
                                        {
                                            value: 40,
                                            name: 'invisible',
                                            itemStyle: placeHolderStyle
                                        }
                                    ]
                                },

                                {
                                    name: '3',
                                    type: 'pie',
                                    clockWise: false,
                                    radius: ['45%', '60%'],
                                    itemStyle: dataStyle,
                                    data: [
                                        {
                                            value: 10,
                                            name: 'Custom'
                                        },
                                        {
                                            value: 40,
                                            name: 'invisible',
                                            itemStyle: placeHolderStyle
                                        }
                                    ]
                                }
                            ]
                        };
                        poleChart.setOption(option);
                        // ------------------------------
                        // nightingale chart
                        // ------------------------------
                        // based on prepared DOM, initialize echarts instance
                        var nightingaleChart = echarts.init(document.getElementById('nightingale-chart'));
                        var option = {
                            title: {
                                text: "Guardian's Profession",
                                subtext: 'From central server',
                                x: 'center'
                            },

                            // Add tooltip
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b}: {c} ({d}%)"
                            },

                            // Add legend
                            legend: {
                                x: 'left',
                                y: 'top',
                                orient: 'vertical',
                                data:['Army','Navy','Air Force','BGB','RAB','Police','Engineer','Health\nservice','Teaching','Government\nemployee','Private\nemployee','Others']
                            },

                            color: ['#689f38', '#e4eaec', '#38649f', '#389f99', '#ee1044', '#ff8f00', '#673ab7', '#4974e0','#1EC625','#B01EC6','#E7359E','#632AE5'],

                            // Display toolbox
                            toolbox: {
                                show: true,
                                orient: 'vertical',
                                feature: {
                                    mark: {
                                        show: true,
                                        title: {
                                            mark: 'Markline switch',
                                            markUndo: 'Undo markline',
                                            markClear: 'Clear markline'
                                        }
                                    },

                                    magicType: {
                                        show: true,
                                        title: {
                                            pie: 'Switch to pies',
                                            funnel: 'Switch to funnel',
                                        },
                                        type: ['pie', 'funnel']
                                    },
                                    restore: {
                                        show: true,
                                        title: 'Restore'
                                    },
                                    saveAsImage: {
                                        show: true,
                                        title: 'Same as image',
                                        lang: ['Save']
                                    }
                                }
                            },

                            // Enable drag recalculate
                            calculable: true,

                            // Add series
                            series: [
                                {
                                    name: 'Figure',
                                    type: 'pie',
                                    radius: ['15%', '73%'],
                                    center: ['60%', '55%'],
                                    roseType: 'area',

                                    // Funnel
                                    width: '40%',
                                    height: '78%',
                                    x: '35%',
                                    y: '17.5%',
                                    max: 450,
                                    sort: 'ascending',

                                    data: [
                                        {value: 340, name: 'Army'},
                                        {value: 460, name: 'Navy'},
                                        {value: 350, name: 'Air Force'},
                                        {value: 150, name: 'BGB'},
                                        {value: 290, name: 'RAB'},
                                        {value: 250, name: 'Police'},
                                        {value: 300, name: 'Engineer'},
                                        {value: 410, name: 'Health\nservice'},
                                        {value: 150, name: 'Teaching'},
                                        {value: 250, name: 'Government\nemployee'},
                                        {value: 350, name: 'Private\nemployee'},
                                        {value: 450, name: 'Others'},
                                    ]
                                }
                            ]
                        };
                        nightingaleChart.setOption(option);


                        // ------------------------------
                        // bar-polar-stack-radial
                        // ------------------------------

                        var dom = document.getElementById("bar-polar-stack-radial");
                        var myChart = echarts.init(dom);
                        var app = {};
                        option = null;
                        app.title = 'Stacked bar chart in polar coordinate system';

                        option = {
                            color: ['#689f38', '#38649f', '#389f99'],
                            angleAxis: {
                                type: 'category',
                                data: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
                                z: 10
                            },
                            radiusAxis: {
                            },
                            polar: {
                            },
                            series: [{
                                type: 'bar',
                                data: [1, 2, 3, 4, 3, 5, 1],
                                coordinateSystem: 'polar',
                                name: 'A',
                                stack: 'a'
                            }, {
                                type: 'bar',
                                data: [2, 4, 6, 1, 3, 2, 1],
                                coordinateSystem: 'polar',
                                name: 'B',
                                stack: 'a'
                            }, {
                                type: 'bar',
                                data: [1, 2, 3, 4, 1, 2, 5],
                                coordinateSystem: 'polar',
                                name: 'C',
                                stack: 'a'
                            }],
                            legend: {
                                show: true,
                                data: ['A', 'B', 'C']
                            }
                        };
                        if (option && typeof option === "object") {
                            myChart.setOption(option, true);
                        }
                        //------------------------------------------------------
                        // Resize chart on menu width change and window resize
                        //------------------------------------------------------
                        $(function () {

                            // Resize chart on menu width change and window resize
                            $(window).on('resize', resize);
                            $(".sidebartoggler").on('click', resize);

                            // Resize function
                            function resize() {
                                setTimeout(function() {

                                    // Resize chart
                                    basicpieChart.resize();
                                    basicdoughnutChart.resize();
                                    customizedChart.resize();
                                    nestedChart.resize();
                                    poleChart.resize();
                                }, 200);
                            }
                        });
                    });







                }
            ).catch((error) => {

                this.msg = error.response.data.message;
                console.log(error.response);
            });
        },
        check(){

            axios.get(this.$api_url+'v1/check').then(
                response =>{

                    console.log(response);
                    this.msg = response.data.message;
                }
            ).catch((error) => {

                this.msg = error.response.data.message;
                console.log(error.response);
            });
        },
        dashRow1(){

        },


    },
    beforeMount(){
        this.stat();
        // End of use strict
        this.dashRow1();

    },
}







</script>

<style scoped>

</style>
