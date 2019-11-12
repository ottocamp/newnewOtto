<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, reservation.model.vo.ReservationSimple"%>
    
<%
	ArrayList<ReservationSimple> rsList = new ArrayList<ReservationSimple>();
%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <title>예약 내용 확인 페이지</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">
        <meta content="Coderthemes" name="author">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <link rel="<%= request.getContextPath() %>/resources/shortcut icon" href="assets/images/favicon.ico">

        <!-- Bootstrap core CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/metisMenu.min.css" rel="stylesheet">
        <!-- Icons CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/icons.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/style.css" rel="stylesheet">

    </head>
<body>
	<div class="m-b-20">
		<h5>Basic Example</h5>
		<p class="text-muted font-13 m-b-20">
			For basic styling—light padding and only horizontal dividers—add the
			base class
			<code>.table</code>
			to any
			<code>&lt;table&gt;</code>
			.
		</p>

		<table class="table m-0">

			<thead>
				<tr>
					<th>예약자</th>
					<th>연락처</th>
					<th>차량번호</th>
					<th>메모</th>
					<th>캠핑장</th>
					<th>사이트</th>
					<th>입장일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<!-- 포 이프문  : rsList 을 통한 출력. -->
					<th scope="row"></th>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
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