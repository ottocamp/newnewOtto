<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uid = (String)request.getAttribute("uid");
	
%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>

		
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
                                    <form action="<%= request.getContextPath() %>/pwdreset.user" method="post" onsubmit="return validate();">

                                        <div class="form-group m-b-20">
                                            <div class="col-xs-12">
                                                <label for="id" style="color: white;">비밀번호</label>
                                                <input class="form-control" name="pwd1" type="password" id="pwd1" required="" placeholder="" autocomplete="off">
                                            </div>
                                        </div>

                                        <div class="form-group m-b-20">
                                            <div class="col-xs-12">
                                                <label for="password" style="color: white;">비밀번호 확인</label>
                                                <input class="form-control" name="pwd2" type="password" required="" id="pwd2" placeholder="">
                                                <input type="text" name="uid" value="<%= uid %>" hidden="hidden">
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
                                                <button class="btn btn-lg btn-primary btn-block">비밀번호 변경</button>
                                            </div>
                                        </div>
											
                                    </form>
                                    
                                    
                                    <script>
                                
                                	function validate(){
                                		if(!(/^[a-z\d]{4,12}$/i.test($("input[name=pwd1]").val()))){
                                			alert('비밀번호는 영문과 숫자 4~12자리로  해주세요');
                                			return false;
                                		}
                                		
                                		if($("input[name=pwd1]").val() != $("input[name=pwd2").val()){
                                			alert('비밀번호 불일치');
                                			return false;
                                		}
                                		

                                		
                                			return true;
                                		}
                                    	
 
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