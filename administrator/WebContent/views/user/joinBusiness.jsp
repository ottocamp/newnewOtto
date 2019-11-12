<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-focus">
    <head>
        <meta charset="utf-8">
        <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"> -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <title>Codebase - Bootstrap 4 Admin Template &amp; UI Framework</title>

        <meta name="description" content="Codebase - Bootstrap 4 Admin Template &amp; UI Framework created by pixelcave and published on Themeforest">
        <meta name="author" content="pixelcave">
        <meta name="robots" content="noindex, nofollow">

        <!-- Open Graph Meta -->
        <meta property="og:title" content="Codebase - Bootstrap 4 Admin Template &amp; UI Framework">
        <meta property="og:site_name" content="Codebase">
        <meta property="og:description" content="Codebase - Bootstrap 4 Admin Template &amp; UI Framework created by pixelcave and published on Themeforest">
        <meta property="og:type" content="website">
        <meta property="og:url" content="">
        <meta property="og:image" content="">

        <!-- Icons -->
        <!-- The following icons can be replaced with your own, they are used by desktop and mobile browsers -->
        <link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/user/assets/media/favicons/favicon.png">
        <link rel="icon" type="image/png" sizes="192x192" href="<%= request.getContextPath() %>/resources/user/assets/media/favicons/favicon-192x192.png">
        <link rel="apple-touch-icon" sizes="180x180" href="<%= request.getContextPath() %>/resources/user/assets/media/favicons/apple-touch-icon-180x180.png">
        <!-- END Icons -->

        <!-- Stylesheets -->

        <!-- Fonts and Codebase framework -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli:300,400,400i,600,700">
        <link rel="stylesheet" id="css-main" href="<%= request.getContextPath() %>/resources/user/assets/css/codebase.min.css">

        <!-- You can include a specific file from css/themes/ folder to alter the default color theme of the template. eg: -->
        <!-- <link rel="stylesheet" id="css-theme" href="assets/css/themes/flat.min.css"> -->
        <!-- END Stylesheets -->
        
        <style>
        
        
        .toIn{
        	display: inline;

        }
        
        .col-12{
        	position: static;
        	margin-bottom: -10px;
        }
        
        #idcheck{
        	position: absolute;
        	left: 80%;
        	
        }
        
        #emailcheck{
        	position: absolute;
        	left: 80%;
        }
        
        
        </style>
        
        
        
        
        
        
        
        
        
    </head>
    <body>

        <!-- Page Container -->
        <!--
            Available classes for #page-container:

        GENERIC

            'enable-cookies'                            Remembers active color theme between pages (when set through color theme helper Template._uiHandleTheme())

        SIDEBAR & SIDE OVERLAY

            'sidebar-r'                                 Right Sidebar and left Side Overlay (default is left Sidebar and right Side Overlay)
            'sidebar-mini'                              Mini hoverable Sidebar (screen width > 991px)
            'sidebar-o'                                 Visible Sidebar by default (screen width > 991px)
            'sidebar-o-xs'                              Visible Sidebar by default (screen width < 992px)
            'sidebar-inverse'                           Dark themed sidebar

            'side-overlay-hover'                        Hoverable Side Overlay (screen width > 991px)
            'side-overlay-o'                            Visible Side Overlay by default

            'enable-page-overlay'                       Enables a visible clickable Page Overlay (closes Side Overlay on click) when Side Overlay opens

            'side-scroll'                               Enables custom scrolling on Sidebar and Side Overlay instead of native scrolling (screen width > 991px)

        HEADER

            ''                                          Static Header if no class is added
            'page-header-fixed'                         Fixed Header

        HEADER STYLE

            ''                                          Classic Header style if no class is added
            'page-header-modern'                        Modern Header style
            'page-header-inverse'                       Dark themed Header (works only with classic Header style)
            'page-header-glass'                         Light themed Header with transparency by default
                                                        (absolute position, perfect for light images underneath - solid light background on scroll if the Header is also set as fixed)
            'page-header-glass page-header-inverse'     Dark themed Header with transparency by default
                                                        (absolute position, perfect for dark images underneath - solid dark background on scroll if the Header is also set as fixed)

        MAIN CONTENT LAYOUT

            ''                                          Full width Main Content if no class is added
            'main-content-boxed'                        Full width Main Content with a specific maximum width (screen width > 1200px)
            'main-content-narrow'                       Full width Main Content with a percentage width (screen width > 1200px)
        -->
        <div id="page-container" class="main-content-boxed">

            <!-- Main Container -->
            <main id="main-container">

                <!-- Page Content -->
                <div class="bg-image" style="background-image: url('<%= request.getContextPath() %>/resources/user/assets/media/photos/photo34@2x.jpg');">
                    <div class="row mx-0 bg-earth-op">


                              <div class="hero-static col-md-6 col-xl-8 d-none d-md-flex align-items-md-end">
                            <div class="p-30 invisible" data-toggle="appear">
                                <p class="font-size-h3 font-w600 text-white mb-5">
                                   	 다양한 회원 혜택을 누리세요
                                </p>
                                <p class="font-size-h5 text-white">
                                    <i class="fa fa-angles-right"></i>  캠핑장 관리를 편하게~!
                                </p>
                                <p class="font-italic text-white-op">
                                    Copyright 오또캠프 &copy; <span class="js-year-copy"></span>
                                </p>
                            </div>
                        </div>
                                                <div class="hero-static col-md-6 col-xl-4 d-flex align-items-center bg-white" style="width: 10px">
                            <div class="content content-full">
                                <!-- Header -->
                                <div class="px-30 py-10"  align="center">
                                        <a href="<%= request.getContextPath() %>" class="text-success">
                                            <span><img src="<%= request.getContextPath() %>/resources/assets/images/logo_dark.png" alt="" height="70" width="150"></span>
                                        </a>
                                        <h3>사업자 회원 가입</h3>
                                </div>
                                <!-- END Header -->

                                <!-- Sign Up Form -->
                                <!-- jQuery Validation functionality is initialized with .js-validation-signup class in js/pages/op_auth_signup.min.js which was auto compiled from _es6/pages/op_auth_signup.js -->
                                <!-- For more examples you can check out https://github.com/jzaefferer/jquery-validation -->
                                 <form class="js-validation-signup" action="<%= request.getContextPath() %>/insert.user" method="post" onsubmit="return joinValidate();">
                                    <div class="block block-themed block-rounded block-shadow">
                                        <div class="block-content">
                                            <div class="form-group row" >
                                                <div class="col-12">
                                                    <label for="">이름</label>
                                                    <input type="text" class="form-control" id="signup-userid" name="uname" placeholder="이름은 한글로만2~6자 입력" required="required" autocomplete="off">
                                                    <p id="namep1" class="toIn">&nbsp;</p><p id="namep2" class="toIn">&nbsp;</p><p id="namep3" class="toIn">&nbsp;</p>
                                                </div>
                                            </div>
                                            <div class="form-group row" >
                                                <div class="col-12">
                                                    <label for="">아이디</label>
                                                    <input type="text" class="form-control" id="signup-username" name="uid" placeholder="아이디는 영소문자로 시작해서 4~12자 입력(숫자 포함 가능)" required autocomplete="off">
                                                     <p id="idp1" class="toIn">&nbsp;</p><p id="idp2" class="toIn">&nbsp;</p><p id="idp3" class="toIn">&nbsp;</p><p id="idp4" class="toIn">&nbsp;</p> <button type="button" class="btn btn-secondary btn-sm" id="idcheck" onclick="idCheck();">중복확인</button>
                                                </div>
                                            </div>
                                            <div class="form-group row" >
                                                <div class="col-12">
                                                    <label for="">이메일</label>
                                                    <input type="email" class="form-control" id="signup-email" name="uemail" placeholder="이메일 형식에 맞게 기입해주세요" required autocomplete="off">
                                                    <p id="emailp1" class="toIn">&nbsp;</p><p id="emailp2" class="toIn">&nbsp;</p><p id="emailp3" class="toIn">&nbsp;</p><p id="idp4" class="toIn">&nbsp;</p> <button type="button" class="btn btn-secondary btn-sm" id="emailcheck" onclick="emailCheck();">중복확인</button>
                                                </div>
                                            </div>
                                            <div class="form-group row" >
                                                <div class="col-12">
                                                    <label for="">전화번호</label>
                                                    <input type="text" class="form-control" id="signup-phone" name="uphone" placeholder="전화번호는 숫자로만 4~15자 입력" required autocomplete="nope">
                                                     <p id="phonep1" class="toIn">&nbsp;</p><p id="phonep2" class="toIn">&nbsp;</p><p id="phonep3" class="toIn">&nbsp;</p>                                              </div>
                                            </div>
                                            <div class="form-group row" >
                                                <div class="col-12">
                                                    <label for="">비밀번호</label>
                                                    <input type="password" class="form-control" id="signup-password" name="upwd" placeholder="비밀번호는 영문,숫자로 4~15자 입력" required>
                                                     <p id="pwdp1" class="toIn">&nbsp;</p><p id="pwdp2" class="toIn">&nbsp;</p><p id="pwdp3" class="toIn">&nbsp;</p>
                                                </div>
                                            </div>
                                            <div class="form-group row" >
                                                <div class="col-12">
                                                    <label for="">비밀번호 확인</label>
                                                    <input type="password" class="form-control" id="signup-password-confirm" name="upwd2" placeholder="비밀번호 확인" required>
                                                     <p id="pwdp22" class="toIn">&nbsp;</p>
                                                </div>
                                                <input type="text" name="utype" value="B"  hidden>
                                            </div>
                                            <div class="form-group row mb-0">
                                                <div class="col-sm-6 push">
                                                    <div class="custom-control custom-checkbox">
<!--                                                         <input type="checkbox" class="custom-control-input" id="signup-terms" name="signup-terms">
                                                        <label class="custom-control-label" for="signup-terms">약관에 동의 합니다</label> -->
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 text-sm-right push">
<!--                                                  <a class="link-effect text-muted mr-10 mb-5 d-inline-block" href="op_auth_signin3.html">
                                                  <i class="fa fa-book text-muted mr-5"></i>약관 읽어보기
                                                </a> -->
                                              
                                                    
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="block-content bg-body-light">
                                            <div class="form-group text-center">
                                                
                                                    <button type="submit" class="btn btn-alt-success">가입하기</button>
                                                        		
                                                

                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <!-- END Sign Up Form -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END Page Content -->

            </main>
            <!-- END Main Container -->
        </div>
        <!-- END Page Container -->
        
        <script>
                                
                    			var idcheckFlag = false;
                    			var emailcheckFalg = false;
                                
                        		function joinValidate(){
                        			if(!(/^[가-힣]{2,6}$/.test($("input[name=uname]").val()))){
                        				alert('이름은 한글로만2~6자 입력');
                        				return false;
                        			}

                        			if(!(/^[a-z][a-z\d]{3,11}$/i.test($("input[name=uid]").val()))){
                        				alert('아이디는 영소문자로 시작해서 4~12자 입력(숫자 포함 가능)');
                        				return false;
                        			}
                        			
                        			if(!(/^[a-z\d]{4,12}$/i.test($("input[name=upwd]").val()))){
                        				alert('비밀번호는 영문 숫자 4~12자 입력');
                        				return false;
                        			}
                        			
                        			

                        			if($("input[name=upwd]").val() != $("input[name=upwd2").val()){
                        				alert('비밀번호 불일치');
                        				return false;
                        			}
                        			

                        			
                        			if(!(idcheckFlag && emailcheckFalg) ){
                        				alert('중복 체크를 하셔야 합니다');
                        				return false;
                        			}
                        			

                        			return true;
                        		}
                        		
                        		//이름 밑에 경고 등                       		
                        		$("input[name=uname]").keyup(function(){
                        			$("#namep1").text("이름은").css("color","green");
                        			
                        			if(!(/^[가-힣]+$/.test($("input[name=uname]").val()))){
                        				$("#namep2").text(" 한글로만 ").css("color","red");
                        			}else{
                        				$("#namep2").text(" 한글로만 ").css("color","green");
                        			}
                        			
                        			if($("input[name=uname]").val().length>=2 && $("input[name=uname]").val().length<=6 ){
                        				$("#namep3").text(" 2~6자 입력 ").css("color","green");
                        			}else{
                        				$("#namep3").text(" 2~6자 입력 ").css("color","red");
                        			}
	
                        		});
                        		
                        		
                        		//아이디 경고등   아이디는 영소문자로 시작해서 4~12자 입력(숫자 포함 가능)
                        		$("input[name=uid]").keyup(function(){
                        			$("#idp1").text("아이디는").css("color","green");
                        			$("#idp4").text("(숫자 포함 가능)").css("color","green");
                        			
                        			if(!(/^[a-z]/.test($("input[name=uid]").val()))){
                        				$("#idp2").text(" 영소문자로 시작해서 ").css("color","red");
                        			}else{
                        				$("#idp2").text(" 영소문자로 시작해서 ").css("color","green");
                        			}
                        			
                        			if($("input[name=uid]").val().length>=4 && $("input[name=uid]").val().length<=12 ){
                        				$("#idp3").text(" 4~12자 입력 ").css("color","green");
                        			}else{
                        				$("#idp3").text(" 4~12자 입력 ").css("color","red");
                        			}
                        			
                        			
	
                        		});
                        		
                        		//전화번호경고등
                        		$("input[name=uphone]").keyup(function(){
                        			$("#phonep1").text("전화번호는").css("color","green");
                        			
                        			if(!(/^[0-9]+$/.test($("input[name=uphone]").val()))){
                        				$("#phonep2").text(" 숫자로만 ").css("color","red");
                        			}else{
                        				$("#phonep2").text(" 숫자로만 ").css("color","green");
                        			}
                        			
                        			if($("input[name=uphone]").val().length>=4 && $("input[name=uphone]").val().length<=15 ){
                        				$("#phonep3").text(" 4~15자 입력 ").css("color","green");
                        			}else{
                        				$("#phonep3").text(" 4~15자 입력 ").css("color","red");
                        			}
	
                        		});
                        		
                        		//비밀번호 경고등
                        		$("input[name=upwd]").keyup(function(){
                        			$("#pwdp1").text("비밀번호는").css("color","green");
                        			
                        			if(!(/^[a-zA-Z0-9]+$/.test($("input[name=upwd]").val()))){
                        				$("#pwdp2").text(" 영문,숫자로 ").css("color","red");
                        			}else{
                        				$("#pwdp2").text(" 영문,숫자로").css("color","green");
                        			}
                        			
                        			if($("input[name=upwd]").val().length>=4 && $("input[name=upwd]").val().length<=15 ){
                        				$("#pwdp3").text(" 4~15자 입력 ").css("color","green");
                        			}else{
                        				$("#pwdp3").text(" 4~15자 입력 ").css("color","red");
                        			}
	
                        		});
                        		
                        		//비밀번호2 경고등
                        		$("input[name=upwd2]").keyup(function(){
                        			
                        			if($("input[name=upwd]").val() !=$("input[name=upwd2]").val() ){
                        				$("#pwdp22").text(" 비밀번호가 일치 하지 않습니다 ").css("color","red");
                        			}else{
                        				$("#pwdp22").text(" 비밀번호가 일치합니다 ").css("color","green");
                        			}
	
                        		});
                        		
                        		
                        		
                        		
                        		function idCheck(){
                        			var userId = $("input[name=uid]");

                     			
                        			if(!(/^[a-z][a-z\d]{3,11}$/i.test($("input[name=uid]").val()))){
                        				alert('아이디는 영소문자로 시작해서 4~12자 입력(숫자 포함 가능)');
                        				userId.focus();
                        			}else{
                        				$.ajax({
                        					url : "<%= request.getContextPath() %>/idCheck.user",
                        					type : "post",
                        					data : {userId:userId.val()},
                        					success: function(data){
                        						if (data == "fail"){
                        							alert("사용할 수 없는 아이디 입니다.")
                        							userId.focus();
                        						}else{
                        							if(confirm("사용 가능한 아이디 입니다. 사용하시겠습니까?")){
                        								userId.prop('readonly',true);
                        								$("#idcheck").prop("disabled",true);
                        								idcheckFlag=true;
                        							}else{
                        								userId.focus();
                        							}
                        							
                        						}
                        					},
                        					error: function(){
                        						console.log('서버 통신 안됨');
                        					}
                        				});	
                        			}
                        			
		
                        		}
                        		
                        		function emailCheck(){
                        			var userEmail = $("input[name=uemail]");
                        			
                        			
                        			if(!(/^[0-9a-zA-Z]{1,}@[0-9a-zA-Z]{1,}.[0-9a-zA-Z]{1,}$/.test($("input[name=uemail]").val()))){
                        				alert('이메일 형식에 맞게 입력해주세요');
                        				useruserEmail.focus();
                        			}else{
                        				$.ajax({
                        					url : "<%= request.getContextPath() %>/emailCheck.user",
                        					type : "post",
                        					data : {userEmail:userEmail.val()},
                        					success: function(data){
                        						if (data == "fail"){
                        							alert("사용할 수 없는 이메일 입니다.")
                        							userEmail.focus();
                        						}else{
                        							if(confirm("사용 가능한 이메일 입니다. 사용하시겠습니까?")){
                        								userEmail.prop('readonly',true);
                        								$("#emailcheck").prop("disabled",true);
                        								emailcheckFalg=true;
                        							}else{
                        								userEmail.focus();
                        							}
                        							
                        						}
                        					},
                        					error: function(){
                        						console.log('서버 통신 안됨');
                        					}
                        				});	
                        			}
                        		}
                        		
                        		
                        		
                        		
                        		
                                
                        		
   
                                </script>
        
        
        

        <!-- Terms Modal -->
        <div class="modal fade" id="modal-terms" tabindex="-1" role="dialog" aria-labelledby="modal-terms" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-slidedown" role="document">
                <div class="modal-content">
                    <div class="block block-themed block-transparent mb-0">
                        <div class="block-header bg-primary-dark">
                            <h3 class="block-title">Terms &amp; Conditions</h3>
                            <div class="block-options">
                                <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                                    <i class="si si-close"></i>
                                </button>
                            </div>
                        </div>
                        <div class="block-content">
                            <p>Potenti elit lectus augue eget iaculis vitae etiam, ullamcorper etiam bibendum ad feugiat magna accumsan dolor, nibh molestie cras hac ac ad massa, fusce ante convallis ante urna molestie vulputate bibendum tempus ante justo arcu erat accumsan adipiscing risus, libero condimentum venenatis sit nisl nisi ultricies sed, fames aliquet consectetur consequat nostra molestie neque nullam scelerisque neque commodo turpis quisque etiam egestas vulputate massa, curabitur tellus massa venenatis congue dolor enim integer luctus, nisi suscipit gravida fames quis vulputate nisi viverra luctus id leo dictum lorem, inceptos nibh orci.</p>
                            <p>Potenti elit lectus augue eget iaculis vitae etiam, ullamcorper etiam bibendum ad feugiat magna accumsan dolor, nibh molestie cras hac ac ad massa, fusce ante convallis ante urna molestie vulputate bibendum tempus ante justo arcu erat accumsan adipiscing risus, libero condimentum venenatis sit nisl nisi ultricies sed, fames aliquet consectetur consequat nostra molestie neque nullam scelerisque neque commodo turpis quisque etiam egestas vulputate massa, curabitur tellus massa venenatis congue dolor enim integer luctus, nisi suscipit gravida fames quis vulputate nisi viverra luctus id leo dictum lorem, inceptos nibh orci.</p>
                            <p>Potenti elit lectus augue eget iaculis vitae etiam, ullamcorper etiam bibendum ad feugiat magna accumsan dolor, nibh molestie cras hac ac ad massa, fusce ante convallis ante urna molestie vulputate bibendum tempus ante justo arcu erat accumsan adipiscing risus, libero condimentum venenatis sit nisl nisi ultricies sed, fames aliquet consectetur consequat nostra molestie neque nullam scelerisque neque commodo turpis quisque etiam egestas vulputate massa, curabitur tellus massa venenatis congue dolor enim integer luctus, nisi suscipit gravida fames quis vulputate nisi viverra luctus id leo dictum lorem, inceptos nibh orci.</p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-alt-success" data-dismiss="modal">
                            <i class="fa fa-check"></i> Perfect
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- END Terms Modal -->


        <!--
            Codebase JS Core

            Vital libraries and plugins used in all pages. You can choose to not include this file if you would like
            to handle those dependencies through webpack. Please check out assets/_es6/main/bootstrap.js for more info.

            If you like, you could also include them separately directly from the assets/js/core folder in the following
            order. That can come in handy if you would like to include a few of them (eg jQuery) from a CDN.

            assets/js/core/jquery.min.js
            assets/js/core/bootstrap.bundle.min.js
            assets/js/core/simplebar.min.js
            assets/js/core/jquery-scrollLock.min.js
            assets/js/core/jquery.appear.min.js
            assets/js/core/jquery.countTo.min.js
            assets/js/core/js.cookie.min.js
        -->
        <script src="<%= request.getContextPath() %>/resources/user/assets/js/codebase.core.min.js"></script>

        <!--
            Codebase JS

            Custom functionality including Blocks/Layout API as well as other vital and optional helpers
            webpack is putting everything together at assets/_es6/main/app.js
        -->
        <script src="<%= request.getContextPath() %>/resources/user/assets/js/codebase.app.min.js"></script>

        <!-- Page JS Plugins -->
        <script src="<%= request.getContextPath() %>/resources/user/assets/js/plugins/jquery-validation/jquery.validate.min.js"></script>

        <!-- Page JS Code -->
        <script src="<%= request.getContextPath() %>/resources/user/assets/js/pages/op_auth_signup.min.js"></script>
    </body>
</html>