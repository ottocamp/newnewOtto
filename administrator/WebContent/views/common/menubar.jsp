<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

		<!-- jqury cdn -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
        <meta charset="utf-8" />
        <title>관리자 메인 페이지</title>
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
        
        <!-- 기운이형 상단 네브 링크 -->
        
        <link rel="icon" type="image/x-icon" href="<%= request.getContextPath() %>/resources/top_nav/images/favicon.ico" />
    
   
	   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/top_nav/custom_tools/css/front.customizer.css' type='text/css' media='all' />
	
	   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/top_nav/js/vendor/magnific/magnific-popup.css' type='text/css' media='all' />
	   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/top_nav/js/vendor/swiper/idangerous.swiper.css' type='text/css' media='all' />
	   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/top_nav/js/vendor/revslider/rs-plugin/css/settings.css' type='text/css' media='all' />
	   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/top_nav/css/woo/woocommerce-layout.css' type='text/css' media='all' />
	   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/top_nav/css/woo/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)' />
	   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/top_nav/css/woo/woocommerce.css' type='text/css' media='all' />
	   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/top_nav/css/fontello/css/fontello.css' type='text/css' media='all' />
	   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/top_nav/css/style.css' type='text/css' media='all' />
	   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/top_nav/css/shortcodes.css' type='text/css' media='all' />
	   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/top_nav/css/core.animation.css' type='text/css' media='all' />
	   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/top_nav/css/woo/woo-style.css' type='text/css' media='all' />
	   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/top_nav/css/skin.css' type='text/css' media='all' />
	
	   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/top_nav/css/responsive.css' type='text/css' media='all' />

	<style>
    #test{
        padding: 0;
        background: rgb(53, 53, 53);
        height: 70px;
             
    }

    #nav{
       margin-top: 12px;
    }
    
    #login{
        margin-top: 12px;
    }
    
    #loginA{
        margin-top: 0px;
    }

	#menu_main ul{
	 	background: rgb(53, 53, 53);
	}

	#side{
		width:100%;	
		background: rgb(53, 53, 53);
		 height: 70px;
	}
	
	#logo{	
		
		height: 70px;
	}
	
	#logo_box{
		position:absolute;
		margin:0px;
		padding:0px;	
		left:18px;
	}
	

    </style>

</head>
<body>

<div id="page-wrapper">

            <!-- Top Bar Start -->
          	<div id="side">
          	<header class="top_panel_wrap">
            <div class="menu_main_wrap logo_left with_text" id="test">
               <div class="menu_content_wrap clearfix" id="content">
                  <div class="logo" id="logo_box">
                     <a href="main2.html">
                        <img src="<%= request.getContextPath() %>/resources/top_nav/images/11.png" width="200px" id="logo">
                     </a>
                  </div>
                  <div class="login_wrap" id="login">
                     <a href="#user-popUp" class="popup_link popup_login_link" id="loginA">
                        로그인
                     </a>
                     <div id="user-popUp" class="user-popUp mfp-with-anim mfp-hide">
                        <div class="sc_tabs">
                           <ul class="loginHeadTab">
                              <li>
                                 <a href="#loginForm" class="loginFormTab icon">로그인</a>
                              </li>
                              <li>
                                 <a href="#registerForm" class="registerFormTab icon">회원가입</a>
                              </li>
                           </ul>
                           <div id="loginForm" class="formItems loginFormBody popup_wrap popup_login">
                              <div class="form_left">
                                 <form action="#" method="post" name="login_form" class="popup_form login_form">
                                    <input type="hidden" name="redirect_to" value="#">
                                    <div class="icon popup_form_field login_field iconed_field icon-mail-1">
                                       <input type="text" id="log" name="log" value="" placeholder="아이디입력">
                                    </div>
                                    <div class="icon popup_form_field password_field iconed_field icon-lock-1">
                                       <input type="password" id="password" name="pwd" value="" placeholder="비밀번호">
                                    </div>
                                    <div class="popup_form_field remember_field">
                                       <a href="#" class="forgot_password">비밀번호를 잊어버리셨나요?</a>
                                       <input type="checkbox" value="forever" id="rememberme" name="rememberme">
                                       <label for="rememberme">아이디저장</label>
                                    </div>
                                    <div class="popup_form_field submit_field">
                                       <input type="submit" class="submit_button sc_button sc_button_square sc_button_style_filled sc_button_bg_link sc_button_size_medium" value="로그인">
                                    </div>
                                 </form>
                              </div>
                              <div class="form_right">
                                 <div class="login_socials_title">소셜 로그인</div>
                                 <div class="login_socials_list">
                                    <a href="#" class="iconLogin fb"></a>
                                    <a href="#" class="iconLogin tw"></a>
                                    <a href="#" class="iconLogin gg"></a>
                                 </div>
                                 <div class="login_socials_problem">
                                    <a href="#">로그인에 문제가 있습니까?</a>
                                 </div>
                                 <div class="result message_block"></div>
                              </div>
                           </div>
                           <div id="registerForm" class="formItems registerFormBody popup_wrap popup_registration">
                              <form name="registration_form" method="post" class="popup_form registration_form">
                                 <input type="hidden" name="redirect_to" value="#"/>
                                 <div class="form_left">
                                    <div class="icon popup_form_field login_field iconed_field icon-user-3">
                                       <input type="text" id="registration_username" name="registration_username"  value="" placeholder="아이디입력">
                                    </div>
                                    <div class="icon popup_form_field email_field iconed_field icon-mail-1">
                                       <input type="text" id="registration_email" name="registration_email" value="" placeholder="이메일주소입력">
                                    </div>
                                    <div class="popup_form_field agree_field">
                                       <input type="checkbox" value="agree" id="registration_agree" name="registration_agree">
                                       <label for="registration_agree">동의합니다</label> 
                                       <a href="#">동의약관</a>
                                    </div>
                                    <div class="popup_form_field submit_field">
                                       <input type="submit" class="submit_button sc_button sc_button_square sc_button_style_filled sc_button_bg_link sc_button_size_medium" value="회원가입">
                                    </div>
                                 </div>
                                 <div class="form_right">
                                    <div class="icon popup_form_field password_field iconed_field icon-lock-1">
                                       <input type="password" id="registration_pwd"  name="registration_pwd"  value="" placeholder="비밀번호">
                                    </div>
                                    <div class="icon popup_form_field password_field iconed_field icon-lock-1">
                                       <input type="password" id="registration_pwd2" name="registration_pwd2" value="" placeholder="비밀번호 재확인">
                                    </div>
                                    <div class="popup_form_field description_field">최소6글자이상입력해주세요</div>
                                 </div>
                              </form>
                              <div class="result messageBlock"></div>
                           </div>
                        </div>
                     </div>
                  </div>
                  
                  <a href="#" class="menu_main_responsive_button icon-menu-1"></a>
                  <nav role="navigation" class="menu_main_nav_area" id="nav">
                     <ul id="menu_main" class="menu_main_nav" >
                        <li class="menu-item menu-item-has-children" id="board">
                           <a href="#">게시판</a>
                           <ul class="sub-menu">
                              <li class="menu-item">
                                 <a href="">전체게시글</a>
                              </li>
                              <li class="menu-item">
                                 <a href="">리뷰 게시글</a>
                              </li>
                              <li class="menu-item">
                                 <a href="">잡답 게시글</a>
                              </li>
                              <li class="menu-item">
                                 <a href="">자주 묻는 질문</a>
                              </li>
                        
                           </ul>
                        </li>
                        <li class="menu-item menu-item-has-children" >
                           <a href="#">Q&A</a>
                           <ul class="sub-menu" >
                              <li class="menu-item">
                                 <a href="">Q&A작성글</a>
                              </li>
                              <li class="menu-item">
                                 <a href="">회원문의</a>
                              </li>
                              </ul>

                              <li class="menu-item menu-item-has-children">
                                 <a href="#">마이페이지</a>
                                 <ul class="sub-menu" >
                                    <li class="menu-item">
                                       <a href="">개인정보수정</a>
                                    </li>
                                    <li class="menu-item">
                                       <a href="">이용내역</a>
                                    </li>
                                    <li class="menu-item">
                                       <a href="">로그인관리</a>
                                    </li>
                                    <li class="menu-item">
                                       <a href="">리뷰및메모</a>
                                    </li>
                                    </ul>   
                                    <li class="menu-item menu-item-has-children">
                                        <a href="#">사업자관리페이지</a>
                                        <ul class="sub-menu" >
                                           <li class="menu-item">
                                              <a href="">예약내역</a>
                                           </li>
                                           <li class="menu-item">
                                              <a href="">매출내역</a>
                                           </li>
                                           <li class="menu-item">
                                              <a href="">정보등록/수정</a>
                                           </li>
                                           <li class="menu-item">
                                              <a href="">문의답변</a>
                                           </li>                                 
                                           </ul>
                                    <li class="menu-item menu-item-has-children">
                                       <a href="#">관리자페이지</a>
                                       <ul class="sub-menu" >
                                          <li class="menu-item">
                                             <a href="">매출내역</a>
                                          </li>
                                          <li class="menu-item">
                                             <a href="">회원등급관리</a>
                                          </li>
                                          <li class="menu-item">
                                             <a href="">문의내역관리</a>
                                          </li>
                                          <li class="menu-item">
                                             <a href="">게시물/댓글관리</a>
                                          </li>   
                                          <li class="menu-item">
                                             <a href="">예약관리</a>
                                          </li>   
                                             </ul>
                                        
                  </nav>
               </div>
            </div>
         </header>
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
                                    <a href="javascript: void(0);" aria-expanded="true"><i class="ti-light-bulb"></i> 게시판 관리 <span class="fa arrow"></span></a>
                                    <ul class="nav-second-level nav collapse" aria-expanded="false">
                                        <li><a href="components-range-slider.html">게시글 관리</a></li>
                                        <li><a href="components-alerts.html">댓글 관리</a></li>
                            
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
                        <div class="row">
							<div class="col-sm-12">
								
							</div>
						</div>
                        <!--end row -->


                        <div class="row">
                            <div class="col-lg-6">
                                
                            </div> <!-- end col -->

                            <div class="col-lg-6">
                                
                            </div> <!-- end col -->
                        </div> <!-- end row -->


                        <div class="row">
                            <div class="col-sm-12">
                                
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

		<!-- 기운이형 상단 네브바 js 링크 -->
		<script type='text/javascript' src='<%= request.getContextPath() %>/resources/top_nav/js/vendor/jquery-1.11.3.min.js'></script>
	   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/top_nav/js/vendor/jquery-migrate.min.js'></script>
	
	   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/top_nav/js/vendor/revslider/rs-plugin/js/jquery.themepunch.tools.min.js'></script>
	   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/top_nav/js/vendor/revslider/rs-plugin/js/jquery.themepunch.revolution.min.js'></script>
	
	   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/top_nav/js/vendor/__packed.js'></script>
	   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/top_nav/js/vendor/picker/picker.js'></script>
	   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/top_nav/js/vendor/picker/picker.date.js'></script>
	   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/top_nav/js/vendor/picker/picker.time.js'></script>
	   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/top_nav/js/vendor/picker/picker.start.js'></script>
	
	   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/top_nav/js/custom/core.utils.min.js'></script>
	   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/top_nav/js/custom/core.init.min.js'></script>
	   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/top_nav/js/custom/shortcodes.min.js'></script>
	
	   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/top_nav/js/custom/_main.js'></script>
		

</body>
</html>