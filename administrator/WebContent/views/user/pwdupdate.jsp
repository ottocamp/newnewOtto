<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String msg = (String)request.getAttribute("msg");
%>  
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	var msg = "<%= msg %>";
	
	$(function(){
		if(msg != "null"){
			alert(msg);
		}
		if(msg=="비밀번호를 성공적으로 수정하였습니다."){
			window.close();
		}
	});
</script>
	
	        <link href="<%= request.getContextPath() %>/resources/assets/css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/metisMenu.min.css" rel="stylesheet">
        <!-- Icons CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/icons.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/style.css" rel="stylesheet">



</head>
<body>

	<div class="m-t-40 card-box">

                                <div class="account-content">
                                    <form action="<%= request.getContextPath() %>/updatepwd.user" method="post" onsubmit="return validate();">
			
                                        <div class="form-group m-b-20">
                                            <div class="col-xs-12">
                                                <label for="emailaddress">비밀번호 </label>
                                                <input class="form-control" type="password" name="pwd" required>
                                            </div>
                                        </div>

                                        <div class="form-group m-b-20">
                                            <div class="col-xs-12">                                               
                                                <label for="password">비밀번호 확인</label>
                                                <input class="form-control" type="password" name="pwd2" required>
                                            </div>
                                        </div>

                                        <div class="form-group m-b-30">
                                            <div class="col-xs-12">
                         
                                            </div>
                                        </div>

                                        <div class="form-group account-btn text-center m-t-10">
                                            <div class="col-xs-12">
                                                <button class="btn btn-lg btn-primary btn-block" type="submit">변경하기</button>
                                            </div>
                                        </div>

                                    </form>

                                    <div class="clearfix"></div>

                                </div>
                            </div>



	
	

	
	
	<script>
	
	function validate(){
		if(!(/^[a-z\d]{4,12}$/i.test($("input[name=pwd]").val()))){
			alert('비밀번호는 영문과 숫자 4~12자리로  해주세요');
			return false;
		}
		
		if($("input[name=pwd]").val() != $("input[name=pwd2").val()){
			alert('비밀번호 불일치');
			return false;
		}
		

		
			return true;
		}
	
	
	
	</script>

</body>
</html>