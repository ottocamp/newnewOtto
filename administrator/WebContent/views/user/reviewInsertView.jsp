<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String msg = (String)request.getAttribute("msg");
%>  


<html>
<head>
<meta charset="UTF-8">
<title>리뷰남기기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	var msg = "<%= msg %>";
	
	$(function(){
		if(msg != "null"){
			alert(msg);
		}
		if(msg=="리뷰 등록 성공"){
			window.close();
		}
	});
</script>
</head>
<body>
	<form action="<%= request.getContextPath() %>/insert.review" method="post">  <!-- onsubmit="return validate();" -->
	 <br>
	 번호<input type="number" name="reNo"><br>
	 캠핑장번호<input type="text" name="cName"><br>
	 캠핑장명<input type="text" name="cName"><br>
	 사용날짜<input type="text" name="reDate"><br> 
	 제목<input type="text" name="rTitle"><br>
	 내용<input type="text" name="rContent"><br>
	 별점<input type="number" name="rNum"><br>
	 
	 <button>제출</button>
	</form>
	


</body>
</html>