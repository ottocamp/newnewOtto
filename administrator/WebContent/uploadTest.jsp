<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.net.InetAddress"%>
<%
	InetAddress ip = InetAddress.getLocalHost();



	System.out.println(ip.getHostAddress());


%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
		<!-- jqury cdn -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
        <meta charset="utf-8" />
        <title>SimpleAdmin - Responsive Admin Dashboard Template</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        
</head>       
<body>	

	
<h3>screen 객체</h3>
        <p>웹 브라우저 화면이 아닌 운영체제 화면의 속성을 가지는 객체이다</p>
        <button onclick="test6();">실행확인</button>
        <script>
            function test6() {

                var popupX = (window.screen.width / 2) - (800 / 2);
                var popupY= (window.screen.height / 2) - (800 / 2);

                 window.open("<%= request.getContextPath() %>/views/reservation/reservationSimpleSearchView.jsp", '', 'height=800, width=800, left='+ popupX + ', top='+ popupY);

            }
		</script>


</body>
</html>
