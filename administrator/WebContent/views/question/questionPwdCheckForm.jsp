<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String msg = (String)session.getAttribute("msg");
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>OttOCamp</title>
		<!-- jqury cdn -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script>
			var msg = "<%= msg %>";
			
			$(function(){
				if(msg != "null"){
					alert(msg);
					<% session.removeAttribute("msg"); %>
				}
			})
			
		
		</script>

		
		
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
            #page-right-content .container{
                margin: 5% 0;
            }

            #infoArea label{
                box-sizing: border-box;
                width: 30%;
            }

            #infoArea input{
                height: 100%;
                width: 40%;

                padding: 5px 0;
            }
            

            #btnArea button:first-child{
                box-sizing: border-box;
                margin-left: 50px;
                margin-top: 5px;
                margin-right: 5px;
                margin-bottom: 5px;

                padding: 12px;
                width: 25%;
            }

            #btnArea button:nth-child(2){
                box-sizing: border-box;
                margin: 5px;

                padding: 12px;
                width: 25%;
            }

            .qes-side a:first-of-type{
                display: inline-block;
                width: auto;
            }

            
            .qes-side > i:hover{
                color: brown;
                cursor: pointer;
            }


            .text-center{
                text-align: center;
            }


            .margin-top-10{
                margin-top: 10px;   
            }

            .margin-top-20{
                margin-top: 20px;   
            }

            .margin-top-30{
                margin-top: 30px;   
            }
            
            .margin-top-50{
                margin-top: 50px;   
            }

            .fontBorder{
                font-weight: bolder;
            }
            
        </style>
	</head>
	<body>

		<div id="page-wrapper">
		
		            <!-- Top Bar Start -->
		            <%@ include file="../common/topnavbar.jsp" %>
		            <!-- Top Bar End -->

					<% 
						int userNo = 9999;
						String userType = "";
						if(loginUser != null) {
							userNo = loginUser.getUserNo();
							userType = loginUser.getUserType();					
						}				
					%>
		
		            <!-- Page content start -->
		            <div class="page-contentbar">
		
		                <!--left navigation start-->
						<%@ include file="../common/questionSidebar.jsp" %>
		                <!--left navigation end-->
		                
		                 <!-- START PAGE CONTENT -->
                <div id="page-right-content">

                    <div class="container">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2 text-center">
                                <h2>문의 시 입력한 임시 아이디와 비밀번호를 입력하세요</h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2 col-md-offset-9">
                                <h5><a href="<%= request.getContextPath() %>/views/user/login.jsp">로그인</a>하러 가기</h5>                                
                            </div>
                        </div>
                        
                        <form class="row margin-top-50" id="infoArea" method="post" action="<%= request.getContextPath() %>/checkPwd.qe" onsubmit="return checkInfo();">
                            <div class="col-md-5 col-md-offset-4 margin-top-10">
                                <label class="h4 fontBorder">임시 ID</label>
                                <input type="text" id="memId" name="memId">
                            </div>
                            
                            <div class="col-md-5 col-md-offset-4 margin-top-10">
                                    <label class="h4 fontBorder">임시 비밀번호</label>
                                    <input type="password" id="memPwd" name="memPwd">
                            </div>

                            <div class="col-md-4 col-md-offset-4 margin-top-30" id="btnArea">
                                <button type="button" class="btn btn-secondary fontBorder" onclick="location.href='<%= request.getContextPath() %>/freqList.qe'"> Q&A로</button>
                                <button type="submit" class="btn btn-primary fontBorder"> 확인 </button>
                            </div>
                        </form>
                        
                        
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
	
		<script>
			function checkInfo(){
				var memId = $("#memId").val();
				var memPwd = $("#memPwd").val();
				
				if(memId == "" || memPwd == "") {
					
					alert("임시ID 또는 비밀번호를 입력하세요");
					$("#memId").focus();
					
					return false;
				
				}
				
				return true;
			}
		</script>


 
        <!-- js placed at the end of the document so the pages load faster -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery-2.1.4.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/bootstrap.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/metisMenu.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.slimscroll.min.js"></script>

        <!-- App Js -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.app.js"></script>

		
	</body>
</html>