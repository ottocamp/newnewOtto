<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
	
%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾는 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		var msg = "<%= msg %>";
		$(function(){
		if(msg != "null"){
			
			alert(msg);
			<%-- <% session.removeAttribute("msg"); %> --%>
		}
		});
		
	</script>
		<!-- jqury cdn -->
		<script language="JavaScript" src="http://www.geoplugin.net/javascript.gp" type="text/javascript"></script>
		
        <meta charset="utf-8" />
        <title>SimpleAdmin - Responsive Admin Dashboard Template</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/assets/images/favicon.ico">

        <!-- Bootstrap core CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/bootstrap.min.css?after" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/metisMenu.min.css?after" rel="stylesheet">
        <!-- Icons CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/icons.css?after" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/style2.css?after" rel="stylesheet">

		<style>
			body{
					background: url('<%= request.getContextPath() %>/resources/user/images/loginback.jpg') no-repeat;
					background-size : cover;
			
			}
			.text-dark m-l-5{
				display: inline;	
			}
		
		</style>


    </head>


    <body>

        <!-- HOME -->
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">

                        <div class="wrapper-page">

                            <div class="m-t-40 card-box">
                                <div class="text-center">
                                    <h2 class="text-uppercase m-t-0 m-b-30">
                                        <a href="<%= request.getContextPath() %>" class="text-success">
                                            <span><img src="<%= request.getContextPath() %>/resources/assets/images/logo_dark.png" alt="" height="70" width="150"></span>
                                        </a>
                                    </h2>
                                    <!--<h4 class="text-uppercase font-bold m-b-0">Sign In</h4>-->
                                    <h4 style="color: white;">비밀번호를 재설정 할수 있습니다</h4>
                                    <br>
                                </div>
                                <div class="account-content">
                                    <form class="form-horizontal" method="post" action="<%= request.getContextPath() %>/pwdfind.user";>

                                        <div class="form-group m-b-20">
                                            <div class="col-xs-12">
                                                <label for="id" style="color: white;">아이디</label>
                                                <input class="form-control" name="userId" type="text" id="id1" required="" placeholder="" autocomplete="off">
                                            </div>
                                        </div>

                                        <div class="form-group m-b-20">
                                            <div class="col-xs-12">
                                                <label for="password" style="color: white;">이메일</label>
                                                <input class="form-control" name="userEmail" type="email" required="" id="email1" placeholder="" autocomplete="off">
                                            </div>
                                        </div>

                                        <div class="form-group m-b-30">
                                            <div class="col-xs-12">
                                                <div class="checkbox checkbox-primary">
<!--                                                     <input id="checkbox5" type="checkbox">
                                                    <label for="checkbox5">
                                                        Remember me
                                                    </label> -->
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group account-btn text-center m-t-10">
                                            <div class="col-xs-12">
                                                <button class="btn btn-lg btn-primary btn-block"">메일발송</button>
                                            </div>
                                        </div>
											
                                    </form>
                                    
                                    
                                    <script>
                                
                                    	

                                    	
                                    	
<%--                                     	function pwdmail(){
                                    		
                                        	var userId = $("#id1").val();
                                        	var userEmail = $("#email1").val();

                                        	
                                            $.ajax({
                                                url:"<%= request.getContextPath() %>/pwdfind.user",
                                                data:{userId:userId,userEmail:userEmail},
                                                type:"post",
                                                success:function(data){
                                               		if(data=="success"){
                                               			alert("이메일이 발송 되었습니다. 이메일을 확인하여 주세요")
                                               			location.href = "<%= request.getContextPath() %>/views/user/login.jsp";
                                               		}else if (data=="nodata"){
                                               			alert("일치하는 회원이 없습니다");
                                               		}
  	
                                                },
                                                error:function(){
                                                 console.log("통신실패");
                                                }
                                               });
                                    		
                                    		
                                    		
                                    	} --%>
                                    	
                                    	
                                    	
                                    

                                    	
                                    	
                                    
                                    
                                    </script>
                                    
                                    
                                    
                                    
                                    
                                    
                                    

                                    <div class="clearfix"></div>

                                </div>
                            </div>
                            <!-- end card-box-->


                        <!-- end wrapper -->

                    </div>
                </div>
            </div>
        </section>
        <!-- END HOME -->



        <!-- js placed at the end of the document so the pages load faster -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery-2.1.4.min.js?after"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/bootstrap.min.js?after"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/metisMenu.min.js?after"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.slimscroll.min.js?after"></script>

        <!-- App Js -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.app.js?after"></script>

    </body>
</html>