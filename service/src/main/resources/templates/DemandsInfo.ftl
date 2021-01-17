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
<#--    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>-->
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts-all-3.js"></script>
    <!--     Fonts and icons     -->
<#--    <link rel="stylesheet" type="text/css"-->
<#--          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons"/>-->
<#--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">-->
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
<#--                            <i class="material-icons">dashboard</i>-->
<#--                            <p>查询理论成果</p>-->
                            <embed src="img/dashboard-24px.svg" type="image/svg+xml" style="vertical-align: middle;"/>
                            <p style="display: inline; text-align: center; margin-left: 18px">查询理论成果</p>
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="#">
<#--                            <i class="material-icons">person</i>-->
<#--                            <p>查询应用领域</p>-->
                            <embed src="img/person-24px.svg" type="image/svg+xml" style="vertical-align: middle;"/>
                            <p style="display: inline; text-align: center; margin-left: 18px">查询应用领域</p>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/index">
<#--                            <i class="material-icons">content_paste</i>-->
<#--                            <p>搜索企业需求</p>-->
                            <embed src="img/content_paste-24px.svg" type="image/svg+xml" style="vertical-align: middle;"/>
                            <p style="display: inline; text-align: center; margin-left: 18px">搜索企业需求</p>
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="#">
<#--                            <i class="material-icons">library_books</i>-->
<#--                            <p>推荐企业需求</p>-->
                            <embed src="img/library_books-24px.svg" type="image/svg+xml" style="vertical-align: middle;"/>
                            <p style="display: inline; text-align: center; margin-left: 18px">推荐企业需求</p>
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
<#--                                    <i class="material-icons">person</i>-->
                                    <embed src="img/person-24px-top.svg" type="image/svg+xml" style="vertical-align: middle;"/>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content_NoMargin">
                <div>
                    <div>
                        <div class="col-md-12">
                            <div class="row">
                                <div class="card">
                                    <h3 class="title" align="center">
                                        ${demandTitle}
                                    </h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="row">
                                <div class="card">
                                    <div class="card-header card-header-text card-header-blue">
                                        <div class="card-text">
                                            需求详情
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                    <td class="text-center"> 公司名称 </td>
                                                    <td>${companyName}</td>
                                                    <td> 联系方式 </td>
                                                    <td>${phoneNum}</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center"> 需求类别 </td>
                                                    <td>${demandType}</td>
                                                    <td> 时间 </td>
                                                    <td>${createTime}</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center"> 行业类别 </td>
                                                    <td>${category}</td>
                                                    <td> 薪资 </td>
                                                    <td>${money}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header card-header-text card-header-blue">
                                        <div class="card-text">
                                            需求描述
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="card-text">${demandDetail}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

<#--                    <div class="col-md-12" style="width:40%;float:right;">-->
<#--                        <div>-->
<#--                            <div class="card">-->
<#--                                <div class="card-header card-header-text card-header-blue">-->
<#--                                    <div class="card-text">-->
<#--                                        <h4 class="card-title">${termName}</h4>-->
<#--                                    </div>-->
<#--                                </div>-->
<#--                                <div class="card-body">-->
<#--                                    <div align="center">-->
<#--                                        <img class="img" src="${termImage}">-->
<#--                                    </div>-->
<#--                                </div>-->
<#--                            </div>-->
<#--                        </div>-->

<#--                        <div class="card">-->
<#--                            <div class="card-header card-header-text card-header-blue">-->
<#--                                <div class="card-text">-->
<#--                                    <h4 class="card-title">${termName}介绍</h4>-->
<#--                                </div>-->
<#--                            </div>-->
<#--                            <div class="card-body">-->
<#--                                <div class="card-text">${termIntro}</div>-->
<#--                            </div>-->
<#--                        </div>-->
<#--                    </div>-->
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
            <script src="http://api.map.baidu.com/api?v=2.0&ak=ol0KpqLuwSsAecB1gGPgOdRZeaqSofiP"></script>
            <script src="./demo/demo.js"></script>
<#--            <script src="./js/echarts.min.js"></script>-->

            <script>
                $(document).ready(function () {
                    // Javascript method's body can be found in assets/js/demos.js
                    md.initDashboardPageCharts();

                });
            </script>
        </div>
    </div>
</body>


</html>