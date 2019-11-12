<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 게시글</title>
		<!-- jqury cdn -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/assets/images/favicon.ico">

        <!-- Bootstrap core CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/metisMenu.min.css" rel="stylesheet">
        <!-- Icons CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/icons.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/style.css" rel="stylesheet">

        <style>
            .board-wrapper{
                width: 90%;
                margin: 0 auto;
                /* border: 1px solid purple; */
            }

            .boardArea{
                margin: 10px 0;
                
                /* border: 1px solid red; */
            }

            .boardList{
                width: 95%;
                margin: 0 auto;

                background-color: white;
            }

            th{
                text-align: center;
                background-color: rgb(73, 73, 73);
                padding: 8px;
                font-size: 18px;
                color: white;
            }


            td{
                text-align: center;
                background-color: rgb(243, 243, 243);
                padding: 8px;

                border: 2px solid white;
            }

            th:first-of-type{
                border-radius: 3px 0 0 0;
            }

            th:last-of-type{
                border-radius: 0 3px 0 0;
            }

            tr:last-child td:first-child {
                border-radius: 0 0 0 6px;
            }
 
            tr:last-child td:last-child {
                border-radius: 0 0 6px 0;
            }



            .searchArea{
                display: inline-block;
                width: 60%;
            }
            
            .searchHeight{
                height: 36px;
                margin: 10px 0;
            }

            #selectArea{
                display: inline-block;
                width: 10%;
            }

            .selectTag, input{
                width: 100%;
            }

            #searchText{                                
                display: inline-block;
                width: 30%;
            }

            

            button{                                
                display: inline-block;
                width: 12%;

                background-color: gainsboro;
                border-radius: 5px;
                border: 1px solid rgb(197, 197, 243);

                color: darkblue;
            }
            
            #insertBtn{
                float: right;
                margin: 10px 20px;
                height: 45px;
                width: 20%;
            }

            button[type='button']{
                float: right;
                width: 50%;
                height: 100%;

                background-color: darkblue;
                color: aliceblue;
                float: right;
            }


            .pagingArea{
                width: 100%;

                text-align: center;
            }

            #buttonArea{
                display: inline-block;

                text-align: center;
            }
            
            #buttonArea button{
                float: left;
                position:relative;
                width: 36px;
                height: 36px;
                margin: 0 auto;
                padding: 0;
                
                border-radius: 0;
                background-color: white;
            }

            #buttonArea button:first-of-type{
                width: 75px;

                border-top-left-radius: 5px;
                border-bottom-left-radius: 5px;
            }

            #buttonArea button:last-of-type{
                width: 50px;

                border-top-right-radius: 5px;
                border-bottom-right-radius: 5px;
            }



            button{
				height:30px;
                width:80px;
				border-radius:5px;

                background-color: gainsboro;
                border-radius: 5px;
                border: 1px solid rgb(197, 197, 243);

                color: darkblue;
			}

            #titleArea{
                width: 95%;
                margin-right: 0;
            }

            #boardTitle{
                width: 50%;
            }

            #boardTitle a:first-of-type{
                margin-right: 8px;
            }

            #boardTitle a{
                color: gray;
            }

            #boardWriter{
                display: inline-block;
                width: 20%;
                margin: 0 10px;
            }

            #boardCount{
                display: inline-block;
                width: 8%;
                margin: 0 15px;
            }

            #deleteBoard{
                border: none;
                width: 4%;
                margin: 0;
            }

            #deleteBoard a{
                color: gray;
                margin: 0;
            }



            .contentText{
                white-space: pre-line;
            }

            .fontBorder{
                font-weight: bolder;
            }
            
            .float-left{
                float: left;
            }

            .float-right{
                float: right;
            }
            
            .display-inline{
                display: inline;
            }

            .display-inline-block{
                display: inline-block;
            }
        
            .textCenter{
                text-align: center;
            }
        
            .overflow-fixed{
                position: fixed;
            }
        </style>


</head>
<body>

<div id="page-wrapper">

            <!-- Top Bar Start -->
            <div class="topbar">

                <!-- LOGO -->
                <div class="topbar-left">
                    <div class="">
                        <a href="index.html" class="logo">
                            <img src="<%= request.getContextPath() %>/resources/assets/images/logo.png" alt="logo" class="logo-lg">
                            <img src="<%= request.getContextPath() %>/resources/assets/images/logo_sm.png" alt="logo" class="logo-sm hidden">
                        </a>
                    </div>
                </div>

                <!-- Top navbar -->
                <div class="navbar navbar-default" role="navigation">
                    <div class="container">
                        <div class="">

                            <!-- Mobile menu button -->
                            <div class="pull-left">
                                <button type="button" class="button-menu-mobile visible-xs visible-sm">
                                    <i class="fa fa-bars"></i>
                                </button>
                                <span class="clearfix"></span>
                            </div>

                            <!-- Top nav left menu -->
                            <ul class="nav navbar-nav hidden-sm hidden-xs top-navbar-items">
                                <li><a href="#">About</a></li>
                                <li><a href="#">Help</a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>

                            <!-- Top nav Right menu -->
                            <ul class="nav navbar-nav navbar-right top-navbar-items-right pull-right">
                                <li class="hidden-xs">
                                    <form role="search" class="navbar-left app-search pull-left">
                                         <input type="text" placeholder="Search<%= request.getContextPath() %>." class="form-control">
                                         <a href=""><i class="fa fa-search"></i></a>
                                    </form>
                                </li>
                                <li class="dropdown top-menu-item-xs">
                                    <a href="#" data-target="#" class="dropdown-toggle menu-right-item" data-toggle="dropdown" aria-expanded="true">
                                        <i class="mdi mdi-bell"></i> <span class="label label-danger">3</span>
                                    </a>
                                    <ul class="dropdown-menu p-0 dropdown-menu-lg">
                                        <!--<li class="notifi-title"><span class="label label-default pull-right">New 3</span>Notification</li>-->
                                        <li class="list-group notification-list" style="height: 267px;">
                                           <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 267px;"><div class="slimscroll" style="overflow: hidden; width: auto; height: 267px;">
                                               <!-- list item-->
                                               <a href="javascript:void(0);" class="list-group-item">
                                                  <div class="media">
                                                     <div class="media-left p-r-10">
                                                        <em class="fa fa-diamond bg-primary"></em>
                                                     </div>
                                                     <div class="media-body">
                                                        <h5 class="media-heading">A new order has been placed A new order has been placed</h5>
                                                        <p class="m-0">
                                                            <small>There are new settings available</small>
                                                        </p>
                                                     </div>
                                                  </div>
                                               </a>

                                               <!-- list item-->
                                               <a href="javascript:void(0);" class="list-group-item">
                                                  <div class="media">
                                                     <div class="media-left p-r-10">
                                                        <em class="fa fa-cog bg-warning"></em>
                                                     </div>
                                                     <div class="media-body">
                                                        <h5 class="media-heading">New settings</h5>
                                                        <p class="m-0">
                                                            <small>There are new settings available</small>
                                                        </p>
                                                     </div>
                                                  </div>
                                               </a>

                                               <!-- list item-->
                                               <a href="javascript:void(0);" class="list-group-item">
                                                  <div class="media">
                                                     <div class="media-left p-r-10">
                                                        <em class="fa fa-bell-o bg-custom"></em>
                                                     </div>
                                                     <div class="media-body">
                                                        <h5 class="media-heading">Updates</h5>
                                                        <p class="m-0">
                                                            <small>There are <span class="text-primary font-600">2</span> new updates available</small>
                                                        </p>
                                                     </div>
                                                  </div>
                                               </a>

                                               <!-- list item-->
                                               <a href="javascript:void(0);" class="list-group-item">
                                                  <div class="media">
                                                     <div class="media-left p-r-10">
                                                        <em class="fa fa-user-plus bg-danger"></em>
                                                     </div>
                                                     <div class="media-body">
                                                        <h5 class="media-heading">New user registered</h5>
                                                        <p class="m-0">
                                                            <small>You have 10 unread messages</small>
                                                        </p>
                                                     </div>
                                                  </div>
                                               </a>

                                                <!-- list item-->
                                               <a href="javascript:void(0);" class="list-group-item">
                                                  <div class="media">
                                                     <div class="media-left p-r-10">
                                                        <em class="fa fa-diamond bg-primary"></em>
                                                     </div>
                                                     <div class="media-body">
                                                        <h5 class="media-heading">A new order has been placed A new order has been placed</h5>
                                                        <p class="m-0">
                                                            <small>There are new settings available</small>
                                                        </p>
                                                     </div>
                                                  </div>
                                               </a>

                                               <!-- list item-->
                                               <a href="javascript:void(0);" class="list-group-item">
                                                  <div class="media">
                                                     <div class="media-left p-r-10">
                                                        <em class="fa fa-cog bg-warning"></em>
                                                     </div>
                                                     <div class="media-body">
                                                        <h5 class="media-heading">New settings</h5>
                                                        <p class="m-0">
                                                            <small>There are new settings available</small>
                                                        </p>
                                                     </div>
                                                  </div>
                                               </a>
                                           </div><div class="slimScrollBar" style="background: rgb(158, 165, 171); width: 5px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div><div class="slimScrollRail" style="width: 5px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
                                        </li>
                                        <!--<li>-->
                                            <!--<a href="javascript:void(0);" class="list-group-item text-right">-->
                                                <!--<small class="font-600">See all notifications</small>-->
                                            <!--</a>-->
                                        <!--</li>-->
                                    </ul>
                                </li>

                                <li class="dropdown top-menu-item-xs">
                                    <a href="" class="dropdown-toggle menu-right-item profile" data-toggle="dropdown" aria-expanded="true"><img src="<%= request.getContextPath() %>/resources/assets/images/users/avatar-1.jpg" alt="user-img" class="img-circle"> </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="javascript:void(0)"><i class="ti-user m-r-10"></i> Profile</a></li>
                                        <li><a href="javascript:void(0)"><i class="ti-settings m-r-10"></i> Settings</a></li>
                                        <li><a href="javascript:void(0)"><i class="ti-lock m-r-10"></i> Lock screen</a></li>
                                        <li class="divider"></li>
                                        <li><a href="javascript:void(0)"><i class="ti-power-off m-r-10"></i> Logout</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div> <!-- end container -->
                </div> <!-- end navbar -->
            </div>
            <!-- Top Bar End -->


            <!-- Page content start -->
            <div class="page-contentbar">

                <!--left navigation start-->
                <aside class="sidebar-navigation">
                    <div class="scrollbar-wrapper">
                        <div>
                            <button type="button" class="button-menu-mobile btn-mobile-view visible-xs visible-sm">
                                <i class="mdi mdi-close"></i>
                            </button>
                            <!-- User Detail box -->
                            <div class="user-details">
                                <div class="pull-left">
                                    <img src="<%= request.getContextPath() %>/resources/assets/images/users/avatar-1.jpg" alt="" class="thumb-md img-circle">
                                </div>
                                <div class="user-info">
                                    <a href="#">Stanley Jones</a>
                                    <p class="text-muted m-0">Administrator</p>
                                </div>
                            </div>
                            <!--- End User Detail box -->

                            <!-- Left Menu Start -->
                            <ul class="metisMenu nav" id="side-menu">
                                <li><a href="<%= request.getContextPath() %>"><i class="ti-home"></i> 관리자 메인 </a></li>

                                <li><a href="<%= request.getContextPath() %>/reservation.li"><span class="label label-custom pull-right">11</span> <i class="ti-paint-bucket"></i> 예약관리 </a></li>

                                <li>
                                    <a href="javascript: void(0);" aria-expanded="true"><i class="ti-light-bulb"></i> 내가 쓴 글 <span class="fa arrow"></span></a>
                                    <ul class="nav-second-level nav collapse" aria-expanded="false">
                                        <li><a href="#">내 게시글</a></li>
                                        <li><a href="#">내 댓글</a></li>
                                        <li><a href="#">내 문의</a></li>
                            
                                    </ul>
                                </li>

                                <li><a href="<%= request.getContextPath() %>/userGrade.li"><i class="ti-spray"></i> 회원등급관리 </a></li>

                                <li>
                                    <a href="javascript: void(0);" aria-expanded="true"><i class="ti-pencil-alt"></i> 공지사항 및 문의답변 <span class="fa arrow"></span></a>
                                    <ul class="nav-second-level nav collapse" aria-expanded="false">
                                        <li><a href="forms-general.html">공지사항</a></li>
                                        <li><a href="forms-advanced.html">문의답변</a></li>
                                    </ul>
                                </li>

                                <li class="">
                                    <a href="javascript: void(0);" aria-expanded="false"><i class="ti-menu-alt"></i> 매출내역확인 <span class="fa arrow"></span></a>
                                    <ul class="nav-second-level nav collapse" aria-expanded="false" style="height: 0px;">
                                        <li><a href="tables-basic.html">전체 매출내역</a></li>
                                        <li><a href="tables-advanced.html">사업장별 매출내역</a></li>
                                    </ul>
                                </li>

                           
                                <li class="">
                                    <a href="javascript: void(0);" aria-expanded="false"><i class="ti-files"></i> 사업장 관리 <span class="fa arrow"></span></a>
                                    <ul class="nav-second-level nav collapse" aria-expanded="false" style="height: 0px;">
                                        <li><a href="campList.cl">사업장 승인</a></li>
                                        <li><a href="pages-register.html">사업장 메뉴2</a></li>
                                        <li><a href="pages-forget-password.html">사업장 메뉴3</a></li>          
                                    </ul>
                                </li>

         
                            </ul>
                        </div>
                    </div><!--Scrollbar wrapper-->
                </aside>
                <!--left navigation end-->

                <!-- START PAGE CONTENT -->
                <div id="page-right-content">

                    <div class="container">
                        
                        <h2>게시글 관리</h2>
                        <br>

                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default display-inline-block" id="titleArea">
                                <div class="panel-heading" role="tab" id="heading1">
                                    <h4 class="panel-title">

                                        <div class="display-inline-block" id="boardTitle">
                                            <a href="#">용인에 괜찮은 곳 없음? [0]</a>
                                            <a href="#"><i class="mdi mdi-checkbox-multiple-blank-outline"></i></a>
                                        </div>
                                        <div class="display-inline" id="boardWriter">
                                            작성자 : 얍야엉
                                        </div>
                                        <div class="display-inline-block" id="boardCount">
                                            조회수 : 200
                                        </div>
                                        <div class="display-inline-block float-right" id="qesDate">
                                            작성일 : 2019-10-26
                                        </div>
                                    </h4>
                                </div>
                            </div>
                            <div class="panel panel-default display-inline-block textCenter" id="deleteBoard">
                                <a href="#"><i class="mdi mdi-delete" style="font-size: 25px;"></i></a>
                            </div>


                            <div class="panel panel-default display-inline-block"  id="titleArea">
                                <div class="panel-heading" role="tab" id="heading2">
                                    <h4 class="panel-title">

                                        <div class="display-inline-block" id="boardTitle">
                                            <a href="#">주말에 캠핑갔다온 썰푼다 [0]</a>
                                            <a href="#"><i class="mdi mdi-checkbox-multiple-blank-outline"></i></a>
                                        </div>
                                        
                                        <div class="display-inline" id="boardWriter">
                                            작성자 : 나니
                                        </div>

                                        <div class="display-inline" id="boardCount">
                                            조회수 : 24
                                        </div>
                                        <div class="display-inline float-right" id="qesDate">
                                            작성일 : 2019-10-26
                                        </div>
                                    </h4>
                                </div>
                            </div>
                            <div class="panel panel-default display-inline-block textCenter" id="deleteBoard">
                                <a href="#"><i class="mdi mdi-delete" style="font-size: 25px;"></i></a>
                            </div>

                            <div class="panel panel-default display-inline-block" id="titleArea">
                                <div class="panel-heading" role="tab" id="heading3">
                                    <h4 class="panel-title">

                                        <div class="display-inline-block" id="boardTitle">
                                            <a href="#">내일 예약인데 비오는거 실화냐 [0]</a>
                                            <a href="#"><i class="mdi mdi-checkbox-multiple-blank-outline"></i></a>
                                        </div>
                                        <div class="display-inline" id="boardWriter">
                                            작성자 : abdddda13
                                        </div>
                                        <div class="display-inline" id="boardCount">
                                            조회수 : 25
                                        </div>
                                        <div class="display-inline float-right" id="qesDate">
                                            작성일 : 2019-10-26
                                        </div>
                                    </h4>
                                </div>
                            </div>
                            <div class="panel panel-default display-inline-block textCenter" id="deleteBoard">
                                <a href="#"><i class="mdi mdi-delete" style="font-size: 25px;"></i></a>
                            </div>

                            <div class="panel panel-default display-inline-block" id="titleArea">
                                <div class="panel-heading" role="tab" id="heading4">
                                    <h4 class="panel-title">

                                        <div class="display-inline-block" id="boardTitle">
                                            <a href="#">요즘 게시판에 반말 너무 많지 않나요? [0]</a>
                                            <a href="#"><i class="mdi mdi-checkbox-multiple-blank-outline"></i></a>
                                        </div>
                                        <div class="display-inline" id="boardWriter">
                                            작성자 : 엉아1
                                        </div>
                                        <div class="display-inline" id="boardCount">
                                            조회수 : 12
                                        </div>
                                        <div class="display-inline float-right" id="qesDate">
                                            작성일 : 2019-10-26
                                        </div>
                                    </h4>
                                </div>
                            </div>
                            <div class="panel panel-default display-inline-block textCenter" id="deleteBoard">
                                <a href="#"><i class="mdi mdi-delete" style="font-size: 25px;"></i></a>
                            </div>
                            
                            <div class="panel panel-default display-inline-block" id="titleArea">
                                <div class="panel-heading" role="tab" id="heading5">
                                    <h4 class="panel-title">

                                        <div class="display-inline-block" id="boardTitle">
                                            <a href="#">캠핑 때려칩니다 [0]</a>
                                            <a href="#"><i class="mdi mdi-checkbox-multiple-blank-outline"></i></a>
                                        </div>
                                        <div class="display-inline" id="boardWriter">
                                            작성자 : 나니ㄹㄹ
                                        </div>
                                        <div class="display-inline" id="boardCount">
                                            조회수 : 159
                                        </div>
                                        <div class="display-inline float-right" id="qesDate">
                                            작성일 : 2019-10-26
                                        </div>
                                    </h4>
                                </div>
                            </div>
                            <div class="panel panel-default display-inline-block textCenter" id="deleteBoard">
                                <a href="#"><i class="mdi mdi-delete" style="font-size: 25px;"></i></a>
                            </div>
                        </div>

                        <br>

                        <div class="searchArea">
                            <form class="searchForm" role="search">
                                <div id="selectArea">
                                    <select class="selectTag searchHeight">
                                        <option id="serachTag" name="serachTag" value="title">제목</option>
                                        <option id="serachTag" name="serachTag" value="date">작성일</option>
                                        <option id="serachTag" name="serachTag" value="comment">댓글</option>
                                    </select>
                                </div>
                                <div id="searchText">
                                    <input type="text" class="searchHeight" placeholder="키워드를 입력하세요">
                                </div>

                                <button class="searchHeight fontBorder" type="submit">검색하기</button>
                            </form>
                        </div>
                        <br><br>

                        <div class="pagingArea">
                            <div id="buttonArea">
                                <button onclick="location.href='#'">Previous</button>
                                <button onclick="location.href='#'">1</button>
                                <button onclick="location.href='#'">2</button>
                                <button onclick="location.href='#'">3</button>
                                <button onclick="location.href='#'">4</button>
                                <button onclick="location.href='#'">5</button>
                                <button onclick="location.href='#'">Next</button>
                            </div>
                        </div>

                    </div>
                    <!-- end container -->

                    <div class="footer">
                        <div class="pull-right hidden-xs">
                            Project Completed <strong class="text-custom">39%</strong>.
                        </div>
                        <div>
                            <strong>Simple Admin</strong> - Copyright © 2017
                        </div>
                    </div> <!-- end footer -->

                </div>
                <!-- End #page-right-content -->

            </div>
            <!-- end .page-contentbar -->
        </div>


        <!-- js placed at the end of the document so the pages load faster -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery-2.1.4.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/bootstrap.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/metisMenu.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.slimscroll.min.js"></script>

        <!-- App Js -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.app.js"></script>

		
		

</body>
</html>