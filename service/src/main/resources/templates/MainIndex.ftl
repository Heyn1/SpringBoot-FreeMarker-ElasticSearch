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
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="/img/apple-icon.png">
    <link rel="icon" type="image/png" href="/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>
        企业需求搜索
    </title>
    <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport'/>
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="/css/font.css" />
<#--    <link rel="stylesheet" type="text/css"-->
<#--          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons"/>-->
<#--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">-->
    <!-- CSS Files -->
    <link href="/css/material-dashboard.css?v=2.1.2" rel="stylesheet"/>
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="/demo/demo.css" rel="stylesheet"/>

    <script src="./js/core/jquery.min.js"></script>
    <script src="./js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts-all-3.js"></script>
<#--    <script src="https://wow.techbrood.com/libs/jquery/jquery-1.11.1.min.js"></script>-->
    <script>
        searchKeyword = function () {
            var keyword = document.getElementById("search_keyword").value;
            var selectItem = document.getElementById("selectPointOfInterest").value;
            if (selectItem=="require") {
                window.location.href = "/search?function=1&keyword=" + keyword;
            }
            else if (selectItem=="company") {
                window.location.href = "/search?function=2&keyword=" + keyword;
            }
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
                    <a class="nav-link" href="#">
<#--                        <i class="material-icons">dashboard</i>-->
<#--                        <img src="img/dashboard-24px.svg" alt="" style="vertical-align: middle"> -->
                        <embed src="img/dashboard-24px.svg" type="image/svg+xml" style="vertical-align: middle;"/>
                        <p style="display: inline; text-align: center; margin-left: 18px">查询理论成果</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="#">
<#--                        <i class="material-icons">person</i>-->
<#--                        <p>查询应用领域</p>-->
                        <embed src="img/person-24px.svg" type="image/svg+xml" style="vertical-align: middle;"/>
                        <p style="display: inline; text-align: center; margin-left: 18px">查询应用领域</p>
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#">
<#--                        <i class="material-icons">content_paste</i>-->
<#--                        <p>搜索企业需求</p>-->
                        <embed src="img/content_paste-24px.svg" type="image/svg+xml" style="vertical-align: middle;"/>
                        <p style="display: inline; text-align: center; margin-left: 18px">搜索企业需求</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="#">
<#--                        <i class="material-icons">library_books</i>-->
<#--                        <p>推荐企业需求</p>-->
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
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">首页 <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>

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
                                <embed src="img/person-24px-top.svg" type="image/svg+xml" style="vertical-align: middle;"/>
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
                        <div id="dropdown_select" class="col-md-3 dropdown">
<#--                            <a href="#" class="btn btn-blue dropdown-toggle pull-right" data-toggle="dropdown">-->
<#--                                需求主题-->
<#--                                <b class="caret"></b>-->
<#--                            </a>-->
<#--                            <ul class="dropdown-menu">-->
<#--                                <button class="dropdown-item" type="button">公司名称</button>-->
<#--                            </ul>-->

                            <label id="lblSelect" style="position: absolute; left: 140px;">
                                <select name="sources" id="selectPointOfInterest" title="Select points of interest nearby">
                                    <option value="require">需求主题</option>
                                    <option value="company">公司名称</option>
                                </select>
                            </label>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input id="search_keyword" type="text" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <button class="btn btn-blue" type="submit" onclick="searchKeyword()">搜索一下</button>
                        </div>
                    </div>
                    <!--搜索框那一栏-->
                    <!--正在热搜-->
                    <div class="row">
                        <div class="col-md-3">
                            <p class="text-blue pull-right ">正在热搜:</p>
                        </div>
                        <div class="col-md-6">
                            <div class="row">
                                <a class="text-blue" href="#">&nbsp&nbsp&nbsp神经活动模型&nbsp&nbsp</a>
                                <a class="text-blue" href="#">&nbsp&nbsp强度耦合&nbsp&nbsp</a>
                                <a class="text-blue" href="#">&nbsp&nbsp正则量子理论&nbsp&nbsp</a>
                                <a class="text-blue" href="#">&nbsp&nbsp后期氧处理&nbsp&nbsp</a>
                                <a class="text-blue" href="#">&nbsp&nbsp电流和差比值&nbsp&nbsp</a>
                            </div>
                        </div>
                        <div class="col-md-3"></div>
                    </div>
                    <!--正在热搜-->
                </div>

                <div class="card">
                    <div class="card-header card-header-text card-header-blue">
                        <div class="card-text">
                            <h4 class="card-title ">需求分类趋势</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="qushi" style="width: 100%;height:500px;">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--   Core JS Files   -->
<script src="./js/core/popper.min.js"></script>
<script src="./js/core/bootstrap-material-design.min.js"></script>
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
<!--  Google Maps Plugin    -->
<#--<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>-->
<!-- Chartist JS -->
<script src="./js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="./js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script src="./js/material-dashboard.js?v=2.1.2" type="text/javascript"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="./demo/demo.js"></script>
<#--<script src="./js/echarts.min.js"></script>-->

<script>
    $(document).ready(function () {
        $().ready(function () {
            $sidebar = $('.sidebar');

            $sidebar_img_container = $sidebar.find('.sidebar-background');

            $full_page = $('.full-page');

            $sidebar_responsive = $('body > .navbar-collapse');

            window_width = $(window).width();

            fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

            if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
                if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
                    $('.fixed-plugin .dropdown').addClass('open');
                }

            }

            $('.fixed-plugin a').click(function (event) {
                // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
                if ($(this).hasClass('switch-trigger')) {
                    if (event.stopPropagation) {
                        event.stopPropagation();
                    } else if (window.event) {
                        window.event.cancelBubble = true;
                    }
                }
            });

            $('.fixed-plugin .active-color span').click(function () {
                $full_page_background = $('.full-page-background');

                $(this).siblings().removeClass('active');
                $(this).addClass('active');

                var new_color = $(this).data('color');

                if ($sidebar.length != 0) {
                    $sidebar.attr('data-color', new_color);
                }

                if ($full_page.length != 0) {
                    $full_page.attr('filter-color', new_color);
                }

                if ($sidebar_responsive.length != 0) {
                    $sidebar_responsive.attr('data-color', new_color);
                }
            });

            $('.fixed-plugin .background-color .badge').click(function () {
                $(this).siblings().removeClass('active');
                $(this).addClass('active');

                var new_color = $(this).data('background-color');

                if ($sidebar.length != 0) {
                    $sidebar.attr('data-background-color', new_color);
                }
            });

            $('.fixed-plugin .img-holder').click(function () {
                $full_page_background = $('.full-page-background');

                $(this).parent('li').siblings().removeClass('active');
                $(this).parent('li').addClass('active');


                var new_image = $(this).find("img").attr('src');

                if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                    $sidebar_img_container.fadeOut('fast', function () {
                        $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                        $sidebar_img_container.fadeIn('fast');
                    });
                }

                if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                    var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                    $full_page_background.fadeOut('fast', function () {
                        $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                        $full_page_background.fadeIn('fast');
                    });
                }

                if ($('.switch-sidebar-image input:checked').length == 0) {
                    var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
                    var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                    $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                    $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                }

                if ($sidebar_responsive.length != 0) {
                    $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
                }
            });

            $('.switch-sidebar-image input').change(function () {
                $full_page_background = $('.full-page-background');

                $input = $(this);

                if ($input.is(':checked')) {
                    if ($sidebar_img_container.length != 0) {
                        $sidebar_img_container.fadeIn('fast');
                        $sidebar.attr('data-image', '#');
                    }

                    if ($full_page_background.length != 0) {
                        $full_page_background.fadeIn('fast');
                        $full_page.attr('data-image', '#');
                    }

                    background_image = true;
                } else {
                    if ($sidebar_img_container.length != 0) {
                        $sidebar.removeAttr('data-image');
                        $sidebar_img_container.fadeOut('fast');
                    }

                    if ($full_page_background.length != 0) {
                        $full_page.removeAttr('data-image', '#');
                        $full_page_background.fadeOut('fast');
                    }

                    background_image = false;
                }
            });

            $('.switch-sidebar-mini input').change(function () {
                $body = $('body');

                $input = $(this);

                if (md.misc.sidebar_mini_active == true) {
                    $('body').removeClass('sidebar-mini');
                    md.misc.sidebar_mini_active = false;

                    $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

                } else {

                    $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

                    setTimeout(function () {
                        $('body').addClass('sidebar-mini');

                        md.misc.sidebar_mini_active = true;
                    }, 300);
                }

                // we simulate the window Resize so the charts will get updated in realtime.
                var simulateWindowResize = setInterval(function () {
                    window.dispatchEvent(new Event('resize'));
                }, 180);

                // we stop the simulation of Window Resize after the animations are completed
                setTimeout(function () {
                    clearInterval(simulateWindowResize);
                }, 1000);

            });
        });
    });
</script>

<script>
    $(document).ready(function () {
        // Javascript method's body can be found in assets/js/demos.js
        md.initDashboardPageCharts();

    });
</script>

<script type="text/javascript">
    var start = Date.parse(new Date());
    console.log("start: " + start);

    var myChart3 = echarts.init(document.getElementById('qushi'));

    var init = Date.parse(new Date());
    console.log("init: " + (init - start));

    var url4 = '/echartshow4?subname';
    console.log(url4);

    $.ajax({
        method: 'get',
        url: '/chart',
        dataType: 'json',
        success: function (data) {
            var category = [];
            var dataser = [];
            $.each(data, function (i, obj) {
                var t = [];
                t.push(obj.dates);
                t.push(obj.count);
                t.push(obj.category);
                dataser.push(t);
                category.push(obj.category)
            });
            // console.log(category);
            // console.log(dataser);

            var search = Date.parse(new Date());
            console.log("search: " + (search - init));

            option = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'line',
                        lineStyle: {
                            color: 'rgba(0,0,0,0.2)',
                            width: 1,
                            type: 'solid'
                        }
                    }
                },
                title: {
                    text: "",
                    top: 100,
                },
                legend: {
                    data: category,
                    textStyle: { //图例文字的样式
                        color: '#000000',
                        fontSize: 15
                    }
                },
                singleAxis: {
                    top: 50,
                    bottom: 50,
                    axisTick: {},
                    axisLabel: {},
                    type: 'time',
                    axisPointer: {
                        animation: true,
                        label: {
                            show: false
                        }
                    },
                    splitLine: {
                        show: true,
                        lineStyle: {
                            type: 'dashed',
                            opacity: 0.2
                        }
                    }
                },
                series: [
                    {
                        type: 'themeRiver',
                        emphasis: {
                            itemStyle: {
                                shadowBlur: 20,
                                shadowColor: 'rgba(0, 0, 0, 0.8)'
                            }
                        },
                        data: dataser,
                        label: {
                            normal: {
                                show: false
                            }
                        }
                    }
                ]
            };
            myChart3.setOption(option);

            var print = Date.parse(new Date());
            console.log("print: " + (print - search));
        }
    });


</script>


</body>

</html>
