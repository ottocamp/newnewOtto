<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.*"%>
<%
	
	User loginUser = (User)session.getAttribute("loginUser");
			 
		int userNo = 9999;
		String userType = "";
		if(loginUser != null) {
			userNo = loginUser.getUserNo();
			userType = loginUser.getUserType();					
		}			

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
		<!-- jqury cdn -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
        <meta charset="utf-8" />
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   
   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/main/custom_tools/css/front.customizer.css' type='text/css' media='all' />

   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/main/js/vendor/magnific/magnific-popup.css' type='text/css' media='all' />
   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/main/js/vendor/swiper/idangerous.swiper.css' type='text/css' media='all' />
   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/main/js/vendor/revslider/rs-plugin/css/settings.css' type='text/css' media='all' />
   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/main/css/woo/woocommerce-layout.css' type='text/css' media='all' />
   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/main/css/woo/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)' />
   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/main/css/woo/woocommerce.css' type='text/css' media='all' />
   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/main/css/fontello/css/fontello.css' type='text/css' media='all' />
   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/main/css/style.css' type='text/css' media='all' />
   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/main/css/shortcodes.css' type='text/css' media='all' />
   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/main/css/core.animation.css' type='text/css' media='all' />
   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/main/css/woo/woo-style.css' type='text/css' media='all' />
   <link rel='stylesheet' href='<%= request.getContextPath() %>/resources/main/css/skin.css' type='text/css' media='all' />
   <style id='themerex-custom-style-inline-css' type='text/css'></style>
  

</head>

<body class="home page body_style_fullscreen body_filled article_style_stretch top_panel_opacity_transparent top_panel_over menu_right sidebar_hide">
   
   <div class="body_wrap">
      <div class="page_wrap">
         <div class="top_panel_fixed_wrap"></div>

<header class="top_panel_wrap" >
            <div class="menu_main_wrap logo_left with_text">
               <div class="menu_content_wrap clearfix">
                  <div class="logo">


                     <a href="<%= request.getContextPath() %>/views/mainPage/mainPage.jsp">

                        <img src="<%= request.getContextPath() %>/resources/main/images/11.png" width="200px" height="80px">
                     </a>
                  </div>
 
                  
                  <a href="#" class="menu_main_responsive_button icon-menu-1"></a>
                  <nav role="navigation" class="menu_main_nav_area">
                     <ul id="menu_main" class="menu_main_nav">
                        <li class="menu-item menu-item-has-children" id="boardMenu" >
                           <a href="#">게시판</a>
                           <ul class="sub-menu">
                              <li class="menu-item">
                                 <a href="<%= request.getContextPath() %>/list.bo?b_tag=0">공지사항</a>
                              </li>
                              <li class="menu-item">
                                 <a href="<%= request.getContextPath() %>/list.bo?b_tag=1">정보 공유</a>
                              </li>
                              <li class="menu-item">
                                 <a href="<%= request.getContextPath() %>/list.bo?b_tag=2">잡답 게시글</a>
                              </li>
                        
                           </ul>
                        </li>
                        <li class="menu-item menu-item-has-children" id="qnaMenu">
                           <a href="#">Q&A</a>
                           <ul class="sub-menu">
                              <li class="menu-item">
                                 <a href="<%= request.getContextPath() %>/freqList.qe">자주 묻는 문의</a>
                              </li>
                              
                            	<% if(userType.equals("A")) { %>
                             		<li class="menu-item">
                            			<a href="<%= request.getContextPath() %>/list.an" target="_self"><i class="mdi mdi-comment-check"></i> 답변하기</a>                        
                            	    </li>                 	
                            	<% }else if(userNo != 9999) { %> 
                            		
                              		<li class="menu-item">
                            			<a href="<%= request.getContextPath() %>/myList.qe" target="_self"><i class="mdi mdi-comment-text"></i> 내 문의</a>                                    
                            		</li>
			                        <li class="menu-item">
			                        	<a href="<%= request.getContextPath() %>/getName.ca">문의하기</a>
			                        </li>
			                        <% if(userType.equals("B")) { %>
	                             		<li class="menu-item">
	                            			<a href="<%= request.getContextPath() %>/list.an" target="_self"><i class="mdi mdi-comment-check"></i> 답변하기</a>                        
	                            	    </li>   
			                        <% } %>
			                        
                            	<% }else { %>
                              		<li class="menu-item">
                            			<a href="<%= request.getContextPath() %>/views/question/questionPwdCheckForm.jsp" target="_self"><i class="mdi mdi-comment-text"></i> 내 문의</a>                                    
                            		</li>
			                        <li class="menu-item">
			                        	<a href="<%= request.getContextPath() %>/getName.ca">문의하기</a>
			                        </li>
                            	<% } %>
                              </ul>

                              <li class="menu-item menu-item-has-children" id="userMenu" hidden>
                                 <a href="<%= request.getContextPath() %>/views/user/userUpdate.jsp">마이페이지</a>
                                 <ul class="sub-menu">
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
                                    <li class="menu-item menu-item-has-children" id="businessMenu" hidden>
                                        <a href="#">사업자관리페이지</a>
                                        <ul class="sub-menu">
                                           <li class="menu-item">
                                              <a href="<%=request.getContextPath()%>/reservation.ca">예약내역</a>
                                           </li>
                                           <li class="menu-item">
                                              <a href="">매출내역</a>
                                           </li>
                                           <li class="menu-item">
                                              <a href="<%=request.getContextPath()%>/views/camp/campInsertView.jsp">정보등록/수정</a>
                                           </li>
                                           <li class="menu-item">
                                              <a href="">문의답변</a>
                                           </li>                                 
                                           </ul>
                                    <li class="menu-item menu-item-has-children" id="adminMenu" hidden>
                                       <a href="<%=request.getContextPath()%>/main.li">관리자페이지</a>
                                       <ul class="sub-menu">
                                          <li class="menu-item">
                                             <a href="<%=request.getContextPath()%>/latestList.li">예약관리</a>
                                          </li>
                                          <li class="menu-item">
                                             <a href="<%=request.getContextPath()%>/userGrade.li">회원등급관리</a>
                                          </li>
                                          <li class="menu-item">
                                             <a href="<%= request.getContextPath() %>/views/sales/salesTotalView.jsp">매출내역확인</a>
                                          </li>
                                          <li class="menu-item">
                                             <a href="<%=request.getContextPath()%>/campList.cl">사업장관리</a>
                                          </li>   
                                             </ul>
                                        <li class="menu-item menu-item-has-children" id="loginMenu" hidden>
                                       <a href="<%= request.getContextPath() %>/views/user/login.jsp">로그인</a>
                                       <li class="menu-item menu-item-has-children" id="logoutMenu"   hidden>
                                       <a href="<%= request.getContextPath() %>/logout.user" >로그아웃</a>

											</ul>
										</div>
									</div>
								</li>
							</ul>
						</div>                    
                  </nav>
               </div>
            </div>
         </header>
         						<script>
										<% if(loginUser==null){ %>
         										$("#loginMenu").show();										
         								<% }else{ %>
         										<% if(loginUser.getUserType().equals("U")){ %>	
         										$("#userMenu").show();	 
         										$("#logoutMenu").show();	
         										<% }else if(loginUser.getUserType().equals("A")){ %>
         										$("#adminMenu").show();	 
         										$("#logoutMenu").show();
         										<%  }else if(loginUser.getUserType().equals("B")){%>
         										$("#businessMenu").show();	 
         										$("#logoutMenu").show();
         										
         										<%  }%>
         								<%  }%>
         						</script>
         

         <section id="mainslider_1" class="slider_wrap slider_fullscreen slider_engine_revo slider_alias_main mainslider_1">
            <div id="rev_slider_4_1_wrapper" class="rev_slider_wrapper fullscreen-container">
               <div id="rev_slider_4_1" class="rev_slider fullscreenbanner">
                  <ul>
                     <li data-transition="slotfade-horizontal" data-slotamount="7" data-masterspeed="300"  data-saveperformance="off" >
                        <img src="<%= request.getContextPath() %>/resources/main/images/1.jpg" alt="slider_1"  data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
                     </li>
                     <li data-transition="slotfade-horizontal" data-slotamount="7" data-masterspeed="300"  data-saveperformance="off" >
                        <img src="<%= request.getContextPath() %>/resources/main/images/2.jpg"  alt="slider_2"  data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
                     </li>
                     <li data-transition="slotfade-horizontal" data-slotamount="7" data-masterspeed="300"  data-saveperformance="off" >
                        <img src="<%= request.getContextPath() %>/resources/main/images/3.jpg"  alt="slider_3"  data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
                     </li>
                  </ul>
                  <div class="tp-static-layers" style="">
                     <div class="tp-caption black tp-fade tp-static-layer"
                        data-x="center" data-hoffset="1"
                        data-y="center" data-voffset="46"
                        data-speed="300"
                        data-start="500"
                        data-easing="Power3.easeInOut"
                        data-splitin="none"
                        data-splitout="none"
                        data-startslide="0"
                        data-endslide="2"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        data-endspeed="300"
						>
			
                        <div class="" style="background-color: rgba(0, 0, 0, 0.1);
    border-radius: 100%;
    box-sizing: border-box;
    padding: 55px;
    width: 686px;
    height: 686px;">
                           <form method="post" onsubmit="return validate();" action="<%= request.getContextPath() %>/location.li" style="background-color: rgba(0, 0, 0, 0.2);
    border-radius: 100%;
    overflow: visible;
    height: 100%;
    text-align: center;">

							
                                   <div class="date_time" style="padding-top: 160px;">
                               
	
                                       <input placeholder="체크인" class="" type="date" name="date_start" id="date_start" style="width: 30%; background: none; border: 3px solid #ffffff;
                                      color: #ffffff; font-size: 14px; height: 60px !important; box-sizing: border-box; margin: 0px 6px;" >
                                    
                                       <input placeholder="체크아웃" class="" type="date" name="date_end" id="date_end" style="width: 30%; background: none; border: 3px solid #ffffff;
                                      color: #ffffff; font-size: 14px; height: 60px !important; box-sizing: border-box; margin: 0px 6px;">
                                 
                                 </div>
                           
                                <br>
                              
                                 <select id="destinations" class="destinations" name="location" style="width: 62.5%; background: none; border: 3px solid #ffffff;
                                      color: #ffffff; font-size: 14px; height: 60px !important; box-sizing: border-box;">
                                    <option value="" disabled selected style="color: black">도착지</option>
                                    <option value="경기도" style="color: black">서울,경기도</option>
                                    <option value="강원도" style="color: black">강원도</option>
                                    <option value="충청도" style="color: black">충청도</option>
                                    <option value="전라도" style="color: black">전라도</option>
                                    <option value="경상도" style="color: black">경상도</option>
                                    <option value="제주도" style="color: black">제주도</option>
                                    
                                       
                                 </select>
                                 <br>
								 <br>
                                 
                                 <div class="sc_contact_form_button" style="text-align: center;">
									
									<button type="submit" style="width:30%;">검색하기</button>
									
                                 
								 <div class="result sc_infobox"></div>
							
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
				</div>
   
   <a href="#" class="scroll_to_top icon-up" title="Scroll to top"></a>
   <script type="text/javascript">
   function validate(){
	   
	   var destinations = $("#destinations").val();

	   var today = new Date();
	   var dd = today.getDate();
	   var mm = today.getMonth()+1; //January is 0!
	   var yyyy = today.getFullYear();

	   if(dd<10) {
	       dd='0'+dd
	   } 

	   if(mm<10) {
	       mm='0'+mm
	   } 

	   today = yyyy + '-' +mm+ '-' +dd;
	   
	   var todayDateArr = today.split('-');
	   
	   var startDate = $("#date_start").val(); //2017-12-10
       var startDateArr = startDate.split('-');
        
       var endDate = $("#date_end").val(); //2017-12-09
       var endDateArr = endDate.split('-');
                
       var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
       var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
       var todayDateCompare = new Date(todayDateArr[0], parseInt(todayDateArr[1])-1, todayDateArr[2]);
       
       
       if(startDate == ""){
       	alert("시작날짜가 비어있습니다.");
       	return false;
       }
       if(endDate == ""){
       	alert("종료날짜가 비어있습니다.");
       	return false;
       }
       
       if(startDateCompare.getTime() > endDateCompare.getTime()) {
            
           alert("시작날짜와 종료날짜를 확인해 주세요.");
            
           return false;
       }
       
       if(todayDateCompare.getTime() > startDateCompare.getTime()){
    	   
    	   alert("시작날짜가 오늘보다 작을수없습니다.");
    	   
    	   return false;
       }
	
       if(destinations == null){
    	   
    	   alert("목적지를 선택하세요");
    	   
    	   return false;
    	   
       }
       
       
       
	   
   }
   
   </script>

   
   

   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/main/js/vendor/jquery-1.11.3.min.js'></script>
   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/main/js/vendor/jquery-migrate.min.js'></script>

   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/main/js/vendor/revslider/rs-plugin/js/jquery.themepunch.tools.min.js'></script>
   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/main/js/vendor/revslider/rs-plugin/js/jquery.themepunch.revolution.min.js'></script>

   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/main/js/vendor/__packed.js'></script>
   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/main/js/vendor/picker/picker.js'></script>
   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/main/js/vendor/picker/picker.date.js'></script>
   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/main/js/vendor/picker/picker.time.js'></script>
   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/main/js/vendor/picker/picker.start.js'></script>

   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/main/js/custom/core.utils.min.js'></script>
   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/main/js/custom/core.init.min.js'></script>
   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/main/js/custom/shortcodes.min.js'></script>

   <script type='text/javascript' src='<%= request.getContextPath() %>/resources/main/js/custom/_main.js'></script>

   <!--<script type='text/javascript' src='custom_tools/js/front.customizer.js'></script>-->
   <!--<script type='text/javascript' src='custom_tools/js/skin.customizer.js'></script>-->


</body>
</html>