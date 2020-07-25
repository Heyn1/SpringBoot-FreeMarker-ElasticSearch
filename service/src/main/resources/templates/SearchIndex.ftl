<!--
=========================================================
Material Dashboard - v2.1.2
=========================================================

Product Page: https://www.creative-tim.com/product/material-dashboard
Copyright 2020 Creative Tim (https://www.creative-tim.com)
Coded by Creative Tim

=========================================================
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="./img/apple-icon.png">
    <link rel="icon" type="image/png" href="./img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>
        企业需求搜索
    </title>
    <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!-- CSS Files -->
    <link href="../css/material-dashboard.css?v=2.1.2" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="demo/demo.css" rel="stylesheet" />
</head>

<body class="">

<div class="wrapper ">
    <div class="sidebar" data-color="blue" data-background-color="white" data-image="./img/sidebar-1.jpg">
        <!--
          Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"
          Tip 2: you can also add an image using data-image tag
      -->
        <div class="logo"><a href="#" class="simple-text logo-normal">
                科技大数据检索查询系统
            </a></div>
        <div class="sidebar-wrapper">
            <ul class="nav">
                <li class="nav-item ">
                    <!--                    <a class="nav-link" href="./dashboard.html">-->
                    <a class="nav-link" href="#">
                        <i class="material-icons">dashboard</i>
                        <p>查询理论成果</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="#">
                        <i class="material-icons">person</i>
                        <p>查询应用领域</p>
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/index">
                        <i class="material-icons">content_paste</i>
                        <p>搜索企业需求</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="#">
                        <i class="material-icons">library_books</i>
                        <p>推荐企业需求</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-blue" >
            <div class="container">
                <a class="navbar-brand" href="#" >企业需求搜索</a>
                <div class="collapse navbar-collapse" id="navbarNav">

                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">注册</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">登陆</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="material-icons" >person</i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- End Navbar -->
        <div class="content_NoMargin">
            <div class="container-fluid">
                <div class="card">
                    <!--企业需求搜索的标题-->
                    <div class="row">
                        <div class="col-md-4">
                        </div>
                        <div class="col-md-4">
                            <div class="typography-line">
                                <h2 class="text-center">
                                    企业需求搜索
                                </h2>
                            </div>

                        </div>
                        <div class="col-md-4">
                        </div>
                    </div>
                    <!--企业需求搜索的标题-->

                    <!--搜索框那一栏-->
                    <div class="row">
                        <div class="col-md-3 dropdown ">
                            <a href="#" class="btn btn-blue dropdown-toggle pull-right" data-toggle="dropdown">
                                需求主题
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <button class="dropdown-item" type="button">关键词</button>
                                <button class="dropdown-item" type="button">需求来源</button>
                                <button class="dropdown-item" type="button">需求类型</button>
                            </ul>
                        </div>

                        <div class="col-md-9">
                            <form method="post" action="/search">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <input id="keyword" name="keyword" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <button class="btn btn-blue" type="submit">搜索一下</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--搜索框那一栏-->
                    <!--行业分类-->
                    <div class="row">
                        <div class="col-md-3">
                            <p class="text-blue pull-right " >行业分类:</p>
                        </div>
                        <div class="col-md-6">
                            <div class="row">
                                <#list category as item >
                                    <a class="text-blue" href="/category?categoryId=${item.categoryId?c}&pageNum=1&pageSize=${result.data.pageSize?c}" > &nbsp&nbsp ${item.category} &nbsp&nbsp</a>
                                </#list>
                            </div>
                        </div>
                        <div class="col-md-3"></div>
                    </div>
                </div>
                <!--搜索结果-->
                <div>
                    <div class="row">
                        <#list result.data.list as item>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header card-header-text card-header-blue">
                                                <div class="card-text">
                                                    <h4 class="card-title"> ${item.demandTitle}</h4>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div class="col-md-8">
                                                                <a href="CompanyTabels.html" class="card-text text-blue" target="_blank">需求来源：${item.companyName}</a>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <p class="card-text">资助金额：${item.money}</p>
                                                            </div>
                                                        </div>
                                                        <p class="card-text">需求摘要：
                                                            <#if (item.demandDetail??&&item.demandDetail?length>100) >
                                                                ${item.demandDetail?substring(0,99)}...
                                                            <#else>
                                                                ${item.demandDetail}
                                                            </#if>
                                                        </p>
                                                        <p class="card-text">
                                                        <p>发布日期：2020-04-01</p>
                                                        <span class="pull-right"> 联系方式：${item.phone}</span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </#list>
                    </div>
                    <!--分页组件-->



                    <!--                    <div class="col-md-4">-->
                    <!--                        <div class="card card-chart">-->
                    <!--                            <div class="card-header card-header-blue">-->
                    <!--                                &lt;!&ndash;                                class="ct-chart" id="dailySalesChart"&ndash;&gt;-->
                    <!--                                <div  id="box" style="width: 300px;height: 300px;" ></div>-->
                    <!--                            </div>-->
                    <!--                            <div class="card-body">-->
                    <!--                                <h4 class="card-title text-dark">需求趋势图</h4>-->
                    <!--                            </div>-->
                    <!--                            <div class="card-footer">-->
                    <!--                                <div class="stats">-->
                    <!--                                    &lt;!&ndash;                                    <i class="material-icons">access_time</i> update 1 days ago&ndash;&gt;-->
                    <!--                                </div>-->
                    <!--                            </div>-->
                    <!--                        </div>-->

                    <!--                        <div class="card mb-3">-->
                    <!--                            <img class="card-img-top" src="./img/kg1.jpg" rel="nofollow" alt="Card image cap">-->
                    <!--                            <div class="card-body">-->
                    <!--                                <h4 class="card-title">企业需求图</h4>-->
                    <!--                                &lt;!&ndash;                                <p class="card-text"><small class="text-muted">updated 1 days ago</small></p>&ndash;&gt;-->
                    <!--                            </div>-->
                    <!--                        </div>-->

                    <!--                    </div>-->

                </div>
            </div>
        </div>
    </div>
</div>

<!--   Core JS Files   -->
<script src="./js/core/jquery.min.js"></script>
<script src="./js/core/popper.min.js"></script>
<script src="./js/core/bootstrap-material-design.min.js"></script>
<script src="./js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!-- Plugin for the momentJs  -->
<script src="./js/plugins/moment.min.js"></script>
<!--  Plugin for Sweet Alert -->
<script src="./js/plugins/sweetalert2.js"></script>
<!-- Forms Validations Plugin -->
<script src="./js/plugins/jquery.validate.min.js"></script>
<!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
<script src="./js/plugins/jquery.bootstrap-wizard.js"></script>
<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script src="./js/plugins/bootstrap-selectpicker.js"></script>
<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
<script src="./js/plugins/bootstrap-datetimepicker.min.js"></script>
<!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
<script src="./js/plugins/jquery.dataTables.min.js"></script>
<!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
<script src="./js/plugins/bootstrap-tagsinput.js"></script>
<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="./js/plugins/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
<script src="./js/plugins/fullcalendar.min.js"></script>
<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
<script src="./js/plugins/jquery-jvectormap.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="./js/plugins/nouislider.min.js"></script>
<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<!-- Library for adding dinamically elements -->
<script src="./js/plugins/arrive.min.js"></script>
<!-- Chartist JS -->
<script src="./js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="./js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script src="./js/material-dashboard.js?v=2.1.2" type="text/javascript"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="./demo/demo.js"></script>
<script src="./js/echarts.min.js"></script>

<script>
    $(document).ready(function() {
        // Javascript method's body can be found in assets/js/demos.js
        md.initDashboardPageCharts();

    });
</script>

<!--<script>-->
<!--    var myChart=echarts.init(document.getElementById("box"));-->
<!--    //指定图表的配置项和数据-->
<!--    var option={-->
<!--        title: {-->
<!--            text: '需求趋势图',-->
<!--            textStyle: {-->
<!--                color:'#ffffff'-->
<!--            }-->
<!--        },-->
<!--        tooltip: {-->
<!--            trigger: 'axis'-->
<!--        },-->
<!--        xAxis: {-->
<!--            name:'月(2019年）',-->
<!--            nameLocation:'middle',-->
<!--            nameGap:'25',-->
<!--            data:["2","4","6","8","10","12"],-->
<!--            axisLine:{-->
<!--                lineStyle:{-->
<!--                    color:'#FFFFFF'-->
<!--                }-->
<!--            }-->
<!--        },-->
<!--        yAxis: {-->
<!--            type: 'value',-->
<!--            name:'热度',-->
<!--            axisLine:{-->
<!--                lineStyle:{-->
<!--                    color:'#FFFFFF'-->
<!--                }-->
<!--            }-->
<!--        },-->
<!--        series: [-->
<!--            {-->
<!--                name: '2019年',-->
<!--                type: 'line',-->
<!--                // stack: '总量',-->
<!--                color:'white',-->
<!--                data: [120, 160, 240, 200, 280, 310]-->
<!--            },-->
<!--        ]-->
<!--    };-->
<!--    //使用刚刚指定的配置项和数据项显示图表-->
<!--    myChart.setOption(option);-->
<!--</script>-->

<script type="text/javascript">




</script>




</body>

</html>