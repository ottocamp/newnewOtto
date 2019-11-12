<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
        <title>예약 내역 검색</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <link rel="shortcut icon" href="assets/images/favicon.ico">

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
	<div class="col-md-6 m-b-20">
		<h4 class="m-b-20 header-title">
			<b>예약목록 검색</b>
		</h4>

		<form method="post" class="form-horizontal m-t-10" role="form" action="<%= request.getContextPath() %>/reSim.rs">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-3 control-label">예약자명</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="inputtext3" name="re_name"
						placeholder="예약자명">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-3 control-label">비밀번호</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="inputPassword3" name="re_pw"
						placeholder="비밀번호">
				</div>
			</div>
			<div class="form-group">
				<label for="inputtext4" class="col-sm-3 control-label">예약자 전화번호</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="inputtext4" name="re_phone"
						placeholder="예약자 전화번호">
				</div>
			</div>
			<div class="form-group m-b-0">
				<div class="col-sm-offset-3 col-sm-9">
					<button type="submit" class="btn btn-info">검색</button>
				</div>
			</div>
		</form>
	</div>
	
	
	
	<button onclick="location.href='<%= request.getContextPath() %>/index.jsp'">홈으로 돌아가기</button>
	<button onclick="location.href='<%= request.getContextPath() %>/views/reservation/reservationSimpleListView.jsp'">예약확인 리스트로가기</button>




	<!-- js placed at the end of the document so the pages load faster -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery-2.1.4.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/bootstrap.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/metisMenu.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.slimscroll.min.js"></script>

        <!-- App Js -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.app.js"></script>
</body>
</html>