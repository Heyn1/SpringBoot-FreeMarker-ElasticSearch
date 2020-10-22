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
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="./img/apple-icon.png">
    <link rel="icon" type="image/png" href="./img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>
        企业需求搜索
    </title>
    <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport'/>
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
    <!--     Fonts and icons     -->
<#--    <link rel="stylesheet" type="text/css"-->
<#--          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons"/>-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!-- CSS Files -->
    <link href="../css/material-dashboard.css?v=2.1.2" rel="stylesheet"/>
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="demo/demo.css" rel="stylesheet"/>

    <script>
        demandInfo = function () {
            // var keyword = document.getElementById("search_keyword").value;
            window.location.href = "/demandinfo";
        }
    </script>
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
<#--                        <i class="material-icons">dashboard</i>-->
                        <p>查询理论成果</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="#">
<#--                        <i class="material-icons">person</i>-->
                        <p>查询应用领域</p>
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/index">
<#--                        <i class="material-icons">content_paste</i>-->
                        <p>搜索企业需求</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="#">
<#--                        <i class="material-icons">library_books</i>-->
                        <p>推荐企业需求</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-blue">
            <div class="container">
                <a class="navbar-brand" href="#">企业需求搜索</a>
                <div class="collapse navbar-collapse" id="navbarNav">

                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">注册</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">登陆</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
<#--                                <i class="material-icons">person</i>-->
                            </a>
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
<#--                            <a href="#" class="btn btn-blue dropdown-toggle pull-right" data-toggle="dropdown">-->
<#--                                需求主题-->
<#--                                <b class="caret"></b>-->
<#--                            </a>-->
<#--                            <ul class="dropdown-menu">-->
<#--                                <button class="dropdown-item" type="button">关键词</button>-->
<#--                                <button class="dropdown-item" type="button">需求来源</button>-->
<#--                                <button class="dropdown-item" type="button">需求类型</button>-->
<#--                            </ul>-->
                            <select name="sources" id="sources" class="custom-select sources" placeholder="Source Type">
                                <option value="require">需求主题</option>
                                <option value="company">公司名称</option>
                            </select>
                        </div>
                        <div class="col-md-9">
                            <form method="get" action="/search">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <input id="keyword" name="keyword" type="text" class="form-control"
                                                   placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <button class="btn btn-blue" type="submit">搜索一下</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="row">
                                            <#list category as item>
                                                <div class="form-check">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" type="checkbox" name="category"
                                                               id="check" value=${item.category}>
                                                        ${item.category} &nbsp; &nbsp;
                                                        <span class="form-check-sign">
                                                        <span class="check"></span>
                                                        </span>
                                                    </label>
                                                </div>
                                            </#list>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!--搜索框那一栏-->
                </div>
                <!--正在热搜-->
            </div>

            <#--            排序按钮-->
            <div class="container-fluid">
                <nav class="navbar navbar-expand-lg bg-blue">
                    <div class="container">
                        <a class="navbar-brand" href="#">排序方式</a>

                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav">
                                <#if order == 0>
                                    <li class="nav-item active">
                                        <a class="nav-link"
                                           href="/search?keyword=${keyword}&pageNum=1&pageSize=${result.data.pageSize?c}&order=0">
                                            综合
<#--                                            <i class="material-icons">south</i>-->
                                        </a>
                                    </li>
                                <#else >
                                    <li class="nav-item">
                                        <a class="nav-link"
                                           href="/search?keyword=${keyword}&pageNum=1&pageSize=${result.data.pageSize?c}&order=0">
                                            综合
<#--                                            <i class="material-icons">south</i>-->
                                        </a>
                                    </li>
                                </#if>
                                <#if order == 1>
                                    <li class="nav-item active">
                                        <a class="nav-link"
                                           href="/search?keyword=${keyword}&pageNum=1&pageSize=${result.data.pageSize?c}&order=1">
                                            相关度
<#--                                            <i class="material-icons">south</i>-->
                                        </a>
                                    </li>
                                <#else >
                                    <li class="nav-item">
                                        <a class="nav-link"
                                           href="/search?keyword=${keyword}&pageNum=1&pageSize=${result.data.pageSize?c}&order=1">
                                            相关度
<#--                                            <i class="material-icons">south</i>-->
                                        </a>
                                    </li>
                                </#if>
                                <#if order == 2>
                                    <li class="nav-item active">
                                        <a class="nav-link"
                                           href="/search?keyword=${keyword}&pageNum=1&pageSize=${result.data.pageSize?c}&order=2">
                                            时间
<#--                                            <i class="material-icons">south</i>-->
                                        </a>
                                    </li>
                                <#else >
                                    <li class="nav-item">
                                        <a class="nav-link"
                                           href="/search?keyword=${keyword}&pageNum=1&pageSize=${result.data.pageSize?c}&order=2">
                                            时间
<#--                                            <i class="material-icons">south</i>-->
                                        </a>
                                    </li>
                                </#if>

                                <#if order == 3>
                                    <li class="nav-item active">
                                        <a class="nav-link"
                                           href="/search?keyword=${keyword}&pageNum=1&pageSize=${result.data.pageSize?c}&order=3">
                                            距离
<#--                                            <i class="material-icons">south</i>-->
                                        </a>
                                    </li>
                                <#else >
                                    <li class="nav-item">
                                        <a class="nav-link"
                                           href="/search?keyword=${keyword}&pageNum=1&pageSize=${result.data.pageSize?c}&order=3">
                                            距离
<#--                                            <i class="material-icons">south</i>-->
                                        </a>
                                    </li>
                                </#if>
                                <#if order == 4>
                                    <li class="nav-item active">
                                        <a class="nav-link"
                                           href="/search?keyword=${keyword}&pageNum=1&pageSize=${result.data.pageSize?c}&order=4">
                                            企业信用
<#--                                            <i class="material-icons">south</i>-->
                                        </a>
                                    </li>
                                <#else >
                                    <li class="nav-item">
                                        <a class="nav-link"
                                           href="/search?keyword=${keyword}&pageNum=1&pageSize=${result.data.pageSize?c}&order=4">
                                            企业信用
<#--                                            <i class="material-icons">south</i>-->
                                        </a>
                                    </li>
                                </#if>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>

            <div>
                <div style="width:70%;float:left;">
                    <#if result.data.size != 0>
                        <#list result.data.list as item>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header card-header-text card-header-blue">
                                                <div class="card-text">
                                                    <h4 class="card-title">
                                                        <a href="/demandsinfo?demandtitle=${item.demandTitle}&demanddetail=${item.companyName}">
                                                            ${item.demandTitle}
                                                        </a>
                                                    </h4>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div class="col-md-8">
                                                                <a href="CompanyTabels.html" class="card-text text-blue"
                                                                   target="_blank">需求来源：${item.companyName}</a>
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
                    <#else>
                        无相关需求
                    </#if>
                </div>

                <div class="col-md-12" style="width:30%;float:right;">
                    <div>

                        <div class="card">
                            <div class="card-header card-header-text card-header-blue">
                                <div class="card-text">
                                    <h4 class="card-title"> ${keyword}热度图 </h4>
                                </div>
                            </div>
                            <div id="main1" style="width: 100%;height:400px;"></div>
                            <script type="text/javascript">
                                // 基于准备好的dom，初始化echarts实例
                                var myChart = echarts.init(document.getElementById('main1'));

                                // 指定图表的配置项和数据
                                var obj = {}

                                <#list resultTimeStamp as item>
                                if (obj['${item}'])
                                    obj['${item}']++
                                else
                                    obj['${item}'] = 1
                                </#list>

                                var base = +new Date(1968, 9, 3);
                                var oneDay = 24 * 3600 * 1000;
                                var date = [];

                                var data = [Math.random() * 300];

                                function itostring(a) {
                                    switch (a) {
                                        case 1:
                                            return '01'
                                        case 2:
                                            return '02'
                                        case 3:
                                            return '03'
                                        case 4:
                                            return '04'
                                        case 5:
                                            return '05'
                                        case 6:
                                            return '06'
                                        case 7:
                                            return '07'
                                        case 8:
                                            return '08'
                                        case 9:
                                            return '09'
                                        case 10:
                                            return '10'
                                        case 11:
                                            return '11'
                                        case 12:
                                            return '12'
                                        case 13:
                                            return '13'
                                        case 14:
                                            return '14'
                                        case 15:
                                            return '15'
                                        case 16:
                                            return '16'
                                        case 17:
                                            return '17'
                                        case 18:
                                            return '18'
                                        case 19:
                                            return '19'
                                        case 20:
                                            return '20'
                                        case 21:
                                            return '21'
                                        case 22:
                                            return '22'
                                        case 23:
                                            return '23'
                                        case 24:
                                            return '24'
                                        case 25:
                                            return '25'
                                        case 26:
                                            return '26'
                                        case 27:
                                            return '27'
                                        case 28:
                                            return '28'
                                        case 29:
                                            return '29'
                                        case 30:
                                            return '30'
                                        case 31:
                                            return '31'
                                        case 2005:
                                            return '2005'
                                        case 2006:
                                            return '2006'
                                        case 2007:
                                            return '2007'
                                        case 2008:
                                            return '2008'
                                        case 2009:
                                            return '2009'
                                        case 2010:
                                            return '2010'
                                        case 2011:
                                            return '2011'
                                        case 2012:
                                            return '2012'
                                        case 2013:
                                            return '2013'
                                        case 2014:
                                            return '2014'
                                        case 2015:
                                            return '2015'
                                        case 2016:
                                            return '2016'
                                        case 2017:
                                            return '2017'
                                        case 2018:
                                            return '2018'
                                        case 2019:
                                            return '2019'
                                        case 2020:
                                            return '2020'
                                        case 2021:
                                            return '2021'
                                        case 2022:
                                            return '2022'
                                    }
                                }

                                var arr = []
                                for (var key in obj) {
                                    arr.push(key)
                                }
                                arr = arr.sort()
                                var newobj = {}

                                // Accurate to day
                                // for (i = 0; i < arr.length - 1; i++) {
                                //     var start = arr[i]
                                //     var end = arr[i + 1]
                                //     var cur = start
                                //
                                //     while (cur != end) {
                                //         var hotvalue = obj[start]
                                //         for (j = 1; j <= 2; j++) {
                                //             if (i - j >= 0)
                                //                 hotvalue += obj[arr[i - j]]
                                //             if (i + j < arr.length)
                                //                 hotvalue += obj[arr[i + j]]
                                //         }
                                //         newobj[cur] = hotvalue
                                //         var year = cur.substr(0, 4)
                                //         var month = cur.substr(5, 2)
                                //         var day = cur.substr(8, 2)
                                //         switch (month) {
                                //             case '01':
                                //                 if (day == '31') {
                                //                     day = '01'
                                //                     month = '02'
                                //                 }
                                //                 else {
                                //                     day = itostring(parseInt(day) + 1)
                                //                 }
                                //                 break;
                                //             case '02':
                                //                 if (day == '28') {
                                //                     day = '01'
                                //                     month = '03'
                                //                 }
                                //                 else {
                                //                     day = itostring(parseInt(day) + 1)
                                //                 }
                                //                 break;
                                //             case '03':
                                //                 if (day == '31') {
                                //                     day = '01'
                                //                     month = '04'
                                //                 }
                                //                 else {
                                //                     day = itostring(parseInt(day) + 1)
                                //                 }
                                //                 break;
                                //             case '04':
                                //                 if (day == '30') {
                                //                     day = '01'
                                //                     month = '05'
                                //                 }
                                //                 else {
                                //                     day = itostring(parseInt(day) + 1)
                                //                 }
                                //                 break;
                                //             case '05':
                                //                 if (day == '31') {
                                //                     day = '01'
                                //                     month = '06'
                                //                 }
                                //                 else {
                                //                     day = itostring(parseInt(day) + 1)
                                //                 }
                                //                 break;
                                //             case '06':
                                //                 if (day == '30') {
                                //                     day = '01'
                                //                     month = '07'
                                //                 }
                                //                 else {
                                //                     day = itostring(parseInt(day) + 1)
                                //                 }
                                //                 break;
                                //             case '07':
                                //                 if (day == '31') {
                                //                     day = '01'
                                //                     month = '08'
                                //                 }
                                //                 else {
                                //                     day = itostring(parseInt(day) + 1)
                                //                 }
                                //                 break;
                                //             case '08':
                                //                 if (day == '31') {
                                //                     day = '01'
                                //                     month = '09'
                                //                 }
                                //                 else {
                                //                     day = itostring(parseInt(day) + 1)
                                //                 }
                                //                 break;
                                //             case '09':
                                //                 if (day == '30') {
                                //                     day = '01'
                                //                     month = '10'
                                //                 }
                                //                 else {
                                //                     day = itostring(parseInt(day) + 1)
                                //                 }
                                //                 break;
                                //             case '10':
                                //                 if (day == '31') {
                                //                     day = '01'
                                //                     month = '11'
                                //                 }
                                //                 else {
                                //                     day = itostring(parseInt(day) + 1)
                                //                 }
                                //                 break;
                                //             case '11':
                                //                 if (day == '30') {
                                //                     day = '01'
                                //                     month = '12'
                                //                 }
                                //                 else {
                                //                     day = itostring(parseInt(day) + 1)
                                //                 }
                                //                 break;
                                //             case '12':
                                //                 if (day == '31') {
                                //                     year = itostring(parseInt(year) + 1)
                                //                     day = '01'
                                //                     month = '01'
                                //                 }
                                //                 else {
                                //                     day = itostring(parseInt(day) + 1)
                                //                 }
                                //                 break;
                                //         }
                                //         cur = year + '-' + month + '-' + day
                                //     }
                                //     // var tmp = arr[i]
                                //     // newobj[tmp] = obj[tmp]
                                // }

                                // Accurate to month
                                for (i = 0; i < arr.length; i++) {
                                    if (newobj[arr[i].substr(0, 7)])
                                        newobj[arr[i].substr(0, 7)] += obj[arr[i]]
                                    else
                                        newobj[arr[i].substr(0, 7)] = obj[arr[i]]
                                }

                                var xvalue = []
                                var yvalue = []

                                for (var i in newobj) {
                                    xvalue.push(i)
                                    yvalue.push(newobj[i])
                                }

                                option = {
                                    tooltip: {
                                        trigger: 'axis',
                                        position: function (pt) {
                                            return [pt[0], '10%'];
                                        }
                                    },
                                    xAxis: {
                                        type: 'category',
                                        boundaryGap: false,
                                        axisLabel: {
                                            show: true,
                                            interval: 2,
                                            rotate: 60
                                        },
                                        data: xvalue
                                    },
                                    yAxis: {
                                        type: 'value',
                                        boundaryGap: [0, '100%'],
                                        min: 0,
                                        max: 20
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
                                            // areaStyle: {
                                            //     color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                            //         offset: 0,
                                            //         color: 'rgb(255, 158, 68)'
                                            //     }, {
                                            //         offset: 1,
                                            //         color: 'rgb(255, 70, 131)'
                                            //     }])
                                            // },
                                            data: yvalue
                                        }
                                    ]

                                };

                                // 使用刚指定的配置项和数据显示图表。
                                myChart.setOption(option);
                            </script>

                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header card-header-text card-header-blue">
                            <div class="card-text">
                                <h4 class="card-title"> ${keyword}领域分布 </h4>
                            </div>
                        </div>
                        <div id="main" style="height: 100%;min-height:400px;"></div>
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
                            if (obj['${item}'])
                                obj['${item}']++
                            else
                                obj['${item}'] = 1
                            </#list>

                            for (i = 0; i < 5; i++) {
                                var name
                                var value = 0
                                for (var key in obj) {
                                    if (value < obj[key]) {
                                        name = key
                                        value = obj[key]
                                    }
                                }
                                var tmp = {}
                                tmp['value'] = value
                                tmp['name'] = name
                                data1.push(name)
                                data2.push(tmp)
                                obj[name] = 0
                            }

                            var option = {
                                tooltip: {
                                    trigger: 'item',
                                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                                },
                                legend: {
                                    orient: 'vertical',
                                    left: 'left',
                                    data: data1
                                },
                                series: [
                                    {
                                        name: '领域分布',
                                        type: 'pie',
                                        radius: '55%',
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

                            if (option && typeof option === "object") {
                                myChart.setOption(option, true);
                            }
                        </script>
                    </div>
                </div>
            </div>

        </div>

        <#if result.data.size != 0>
            <div style="clear:both;">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1"> 共${result.data.total}条 </a>
                        </li>
                        <#if result.data.isFirstPage==false>
                            <li class="page-item">
                                <a class="page-link" href="/search?function=${function}&keyword=${keyword}&pageNum=1&pageSize=${result.data.pageSize?c}"> 第一页 </a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="/search?function=${function}&keyword=${keyword}&pageNum=${result.data.prePage}&pageSize=${result.data.pageSize?c}">上一页</a>
                            </li>
                        </#if>

                        <#list result.data.navigatepageNums as element>
                            <#if element == result.data.pageNum>
                                <li class="page-item active">
                                    <span class="page-link">
                                        ${element}
                                        <span class="sr-only">
                                            (current)
                                        </span>
                                    </span>
<#--                                    <a class="page-link" href="/search?keyword=${keyword}&pageNum=${element}&pageSize=${result.data.pageSize?c}">${element}</a>-->
                                </li>
                            </#if>
                            <#if element != result.data.pageNum>
                                <li class="page-item">
                                    <a class="page-link" href="/search?function=${function}&keyword=${keyword}&pageNum=${element}&pageSize=${result.data.pageSize?c}">${element}</a>
                                </li>
                            </#if>
                        </#list>

                        <#if result.data.isLastPage==false>
                            <li class="page-item">
                                <a class="page-link" href="/search?function=${function}&keyword=${keyword}&pageNum=${result.data.nextPage}&pageSize=${result.data.pageSize?c}">下一页</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="/search?function=${function}&keyword=${keyword}&pageNum=${result.data.pages}&pageSize=${result.data.pageSize?c}">最后一页</a>
                            </li>
                        </#if>
                    </ul>
                </nav>
            </div>
        </#if>

        <#--        <div class="message" style="clear:both;">-->
        <#--            共<i class="blue">${result.data.total}</i>条记录，当前显示第&nbsp;<i-->
        <#--                class="blue">${result.data.pageNum}/${result.data.pages}</i>&nbsp;页-->
        <#--        </div>-->
<#--        <#if result.data.size != 0>-->
<#--            <div class="button-container" style="text-align:center;clear:both;">-->
<#--                <#if result.data.isFirstPage==false>-->
<#--                    <a href="/search?keyword=${keyword}&pageNum=1&pageSize=${result.data.pageSize?c}">-->
<#--                        <button class="btn btn-blue">第一页</button>-->
<#--                    </a>-->

<#--                    <a href="/search?keyword=${keyword}&pageNum=${result.data.prePage}&pageSize=${result.data.pageSize?c}">-->
<#--                        <button class="btn btn-blue">上一页</button>-->
<#--                    </a>-->
<#--                </#if>-->

<#--                <#list result.data.navigatepageNums as element>-->
<#--                    <#if element == result.data.pageNum>-->
<#--                        <a href="/search?keyword=${keyword}&pageNum=${element}&pageSize=${result.data.pageSize?c}">-->
<#--                            <button class="btn btn-blue disabled">${element}</button>-->
<#--                        </a>-->
<#--                    </#if>-->
<#--                    <#if element != result.data.pageNum>-->
<#--                        <a href="/search?keyword=${keyword}&pageNum=${element}&pageSize=${result.data.pageSize?c}">-->
<#--                            <button class="btn btn-blue">${element}</button>-->
<#--                        </a>-->
<#--                    </#if>-->
<#--                </#list>-->

<#--                <#if result.data.isLastPage==false>-->
<#--                    <a href="/search?keyword=${keyword}&pageNum=${result.data.nextPage}&pageSize=${result.data.pageSize?c}">-->
<#--                        <button class="btn btn-blue">下一页</button>-->
<#--                    </a>-->
<#--                    <a href="/search?keyword=${keyword}&pageNum=${result.data.pages}&pageSize=${result.data.pageSize?c}">-->
<#--                        <button class="btn btn-blue">最后一页</button>-->
<#--                    </a>-->
<#--                </#if>-->
<#--            </div>-->
<#--        </#if>-->


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
        <script src="http://api.map.baidu.com/api?v=2.0&ak=ol0KpqLuwSsAecB1gGPgOdRZeaqSofiP"></script>
        <script src="./demo/demo.js"></script>
        <script src="./js/echarts.min.js"></script>

        <script>
            $(document).ready(function () {
                // Javascript method's body can be found in assets/js/demos.js
                md.initDashboardPageCharts();

            });
        </script>
        <script>
            window.onload = function () {
            }

            getFloat = function (number, n) {
                n = n ? parseInt(n) : 0;
                if (n <= 0) return Math.round(number);
                number = Math.round(number * Math.pow(10, n)) / Math.pow(10, n);
                return number;
            };

            function getlocation() {
                var geolocation = new BMap.Geolocation();
                geolocation.getCurrentPosition(function (r) {
                    if (this.getStatus() == BMAP_STATUS_SUCCESS) {
                        var longitude = r.point.lng;
                        var latitude = r.point.lat;
                        $("#longitude").val(longitude);
                        $("#latitude").val(latitude);

                        window.location.href = "/search?keyword=${keyword}&longitude=" + longitude + "&latitude=" + latitude + "&order=3"
                    } else {
                        alert('failed' + this.getStatus());
                    }
                }, {enableHighAccuracy: true})
            }


        </script>


</body>

</html>