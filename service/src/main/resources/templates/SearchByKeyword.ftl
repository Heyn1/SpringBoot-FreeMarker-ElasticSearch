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
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml" xmlns:sys="http://www.w3.org/1999/XSL/Transform"
      xmlns:form="http://www.w3.org/1999/xhtml" xmlns:c="http://mybatis.org/schema/mybatis-mapper">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="./img/apple-icon.png">
    <link rel="icon" type="image/png" href="./img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>
        企业需求搜索
    </title>
    <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
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
                    <!--  <a class="nav-link" href="./dashboard.html">-->
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
                                            <input id="keyword" name="keyword" type="text" class="form-control" placeholder="" value="${formKeyword}">
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
                                <#list category as item>
                                <a class="text-blue" href="/category?categoryId=${item.categoryId?c}&pageSize=${result.data.pageSize?c}" > &nbsp&nbsp ${item.category} &nbsp&nbsp</a>
                            </#list>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                </div>
                </div>
                <!--正在热搜-->
            </div>



            <div>
                <div style="width:70%;float:left;">
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
                                                                <p>发布日期：${item.createTime?string('yyyy-MM-dd')}</p>
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

                <div class="col-md-12" style="width:30%;float:right;">
                    <div>
                        <div class="card">
                            <div id="main1" style="width: 100%;height:400px;"></div>
                            <script type="text/javascript">
                                // 基于准备好的dom，初始化echarts实例
                                var myChart = echarts.init(document.getElementById('main1'));

                                // 指定图表的配置项和数据
                                var obj = {}

                                <#list resultTimeStamp as item>
                                    if(obj['${item}'])
                                        obj['${item}']++
                                    else
                                        obj['${item}'] = 1
                                </#list>
                                console.log(obj)

                                var base = +new Date(1968, 9, 3);
                                var oneDay = 24 * 3600 * 1000;
                                var date = [];

                                var data = [Math.random() * 300];

                                var arr = []
                                for (var key in obj) {
                                    arr.push(key)
                                }
                                arr = arr.sort()
                                var newobj = {}
                                for (var i in arr) {
                                    var tmp = arr[i]
                                    newobj[tmp] = obj[tmp]
                                }
                                for (var i in newobj) {
                                    date.push(i)
                                    data.push(newobj[i])
                                }

                                option = {
                                    tooltip: {
                                        trigger: 'axis',
                                        position: function (pt) {
                                            return [pt[0], '10%'];
                                        }
                                    },
                                    title: {
                                        left: 'center',
                                        text: '${keyword}热度图',
                                    },
                                    toolbox: {
                                        feature: {
                                            dataZoom: {
                                                yAxisIndex: 'none'
                                            },
                                            restore: {},
                                            saveAsImage: {}
                                        }
                                    },
                                    xAxis: {
                                        type: 'category',
                                        boundaryGap: false,
                                        data: date
                                    },
                                    yAxis: {
                                        type: 'value',
                                        boundaryGap: [0, '100%']
                                    },
                                    dataZoom: [{
                                        type: 'inside',
                                        start: 0,
                                        end: 10
                                    }, {
                                        start: 0,
                                        end: 10,
                                        handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                                        handleSize: '80%',
                                        handleStyle: {
                                            color: '#fff',
                                            shadowBlur: 3,
                                            shadowColor: 'rgba(0, 0, 0, 0.6)',
                                            shadowOffsetX: 2,
                                            shadowOffsetY: 2
                                        }
                                    }],
                                    series: [
                                        {
                                            name: '热度数据',
                                            type: 'line',
                                            smooth: true,
                                            symbol: 'none',
                                            sampling: 'average',
                                            itemStyle: {
                                                color: 'rgb(255, 70, 131)'
                                            },
                                            areaStyle: {
                                                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                                    offset: 0,
                                                    color: 'rgb(255, 158, 68)'
                                                }, {
                                                    offset: 1,
                                                    color: 'rgb(255, 70, 131)'
                                                }])
                                            },
                                            data: data
                                        }
                                    ]

                                };

                                // 使用刚指定的配置项和数据显示图表。
                                myChart.setOption(option);
                            </script>

                        </div>
                    </div>

                    <div class="card">
                                <div id="main"  style="height: 100%;min-height:400px;"></div>
                                <script type="text/javascript">
                                    // 基于准备好的dom，初始化ECharts实例
                                    var myChart = echarts.init(document.getElementById('main'));
                                    var app = {};
                                    option = null;
                                    // 指定图表的配置项和数据

                                    var data1 = []
                                    var data2 = []
                                    var obj = {}
                                    <#list resultCategory as item>
                                        if(obj['${item}'])
                                            obj['${item}']++
                                        else
                                            obj['${item}'] = 1
                                    </#list>
                                    for (var key in obj) {
                                        data1.push(key)
                                    }
                                    for (var i in obj) {
                                        var tmp = {}
                                        tmp['value'] = obj[i]
                                        tmp['name'] = i
                                        data2.push(tmp)
                                    }

                                    console.log(data1)
                                    console.log(data2)

                                    var option = {
                                        title : {
                                            text: '${keyword}领域分布',
                                            x: 'center'
                                        },
                                        tooltip: {
                                            trigger: 'item',
                                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                                        },
                                        legend: {
                                            orient: 'vertical',
                                            left: 'left',
                                            data: data1
                                        },
                                        series : [
                                            {
                                                name: '领域分布',
                                                type: 'pie',
                                                radius : '55%',
                                                center: ['50%', '60%'],
                                                data: data2,
                                                itemStyle: {
                                                    emphasis: {
                                                        shadowBlur: 10,
                                                        shadowOffsetX: 0,
                                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                    }
                                                }
                                            }
                                        ]
                                    };

                                    app.currentIndex = -1;

                                    setInterval(function () {
                                        var dataLen = option.series[0].data.length;
                                        // 取消之前高亮的图形
                                        myChart.dispatchAction({
                                            type: 'downplay',
                                            seriesIndex: 0,
                                            dataIndex: app.currentIndex
                                        });
                                        app.currentIndex = (app.currentIndex + 1) % dataLen;
                                        // 高亮当前图形
                                        myChart.dispatchAction({
                                            type: 'highlight',
                                            seriesIndex: 0,
                                            dataIndex: app.currentIndex
                                        });
                                        // 显示 tooltip
                                        myChart.dispatchAction({
                                            type: 'showTip',
                                            seriesIndex: 0,
                                            dataIndex: app.currentIndex
                                        });
                                    }, 1000);
                                    if (option && typeof option === "object") {
                                        myChart.setOption(option, true);
                                    }
                                </script>
                            </div>
                        </div>
            </div>

        </div>

        <div class="message" style="clear:both;">
            共<i class="blue">${result.data.total}</i>条记录，当前显示第&nbsp;<i
                class="blue">${result.data.pageNum}/${result.data.pages}</i>&nbsp;页
        </div>

        <div class="button-container" style="text-align:center;clear:both;">
            <#if result.data.isFirstPage==false>
            <a href="/search?keyword=${keyword}&pageNum=1&pageSize=${result.data.pageSize?c}">
                <button class="btn btn-blue">第一页</button>
            </a>

            <a href="/search?keyword=${keyword}&pageNum=${result.data.prePage}&pageSize=${result.data.pageSize?c}">
                <button class="btn btn-blue">上一页</button>
            </a>
        </#if>

        <#list result.data.navigatepageNums as element>
        <#if element == result.data.pageNum>
        <a href="/search?keyword=${keyword}&pageNum=${element}&pageSize=${result.data.pageSize?c}">
            <button class="btn btn-blue disabled">${element}</button>
        </a>
    </#if>
    <#if element != result.data.pageNum>
    <a href="/search?keyword=${keyword}&pageNum=${element}&pageSize=${result.data.pageSize?c}">
        <button class="btn btn-blue">${element}</button>
    </a>
</#if>
</#list>

<#if result.data.isLastPage==false>
<a href="/search?keyword=${keyword}&pageNum=${result.data.nextPage}&pageSize=${result.data.pageSize?c}">
    <button class="btn btn-blue">下一页</button>
</a>
<a href="/search?keyword=${keyword}&pageNum=${result.data.pages}&pageSize=${result.data.pageSize?c}">
    <button class="btn btn-blue">最后一页</button>
</a>
</#if>
</div>


<!--                <div class="col-md-4">-->
<!--                <div class="card card-chart">-->
<!--                    <div class="card-header card-header-blue">-->

<!--                        <div  id="box" style="width: 300px;height: 300px;" ></div>-->
<!--                    </div>-->
<!--                    <div class="card-body">-->
<!--                        <h4 class="card-title text-dark">需求趋势图</h4>-->
<!--                    </div>-->
<!--                    <div class="card-footer">-->
<!--                        <div class="stats">-->
<!--                            &lt;!&ndash;                                    <i class="material-icons">access_time</i> update 1 days ago&ndash;&gt;-->
<!--                        </div>-->
<!--                    </div>-->
<!--                </div>-->

<!--                <div class="card mb-3">-->
<!--                    <img class="card-img-top" src="./img/kg1.jpg" rel="nofollow" alt="Card image cap">-->
<!--                    <div class="card-body">-->
<!--                        <h4 class="card-title">企业需求图</h4>-->
<!--                        &lt;!&ndash;                                <p class="card-text"><small class="text-muted">updated 1 days ago</small></p>&ndash;&gt;-->
<!--                    </div>-->
<!--                </div>-->

<!--            </div>-->

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

</body>

</html>