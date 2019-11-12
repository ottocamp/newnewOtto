<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
	
		<!-- jqury cdn -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		<meta charset="utf-8" />
		<title>전체 매출내역 조회 페이지</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
		<meta content="Coderthemes" name="author" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/assets/images/favicon.ico">
		
		 <!--Morris Chart CSS -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/plugins/morris/morris.css">
		
		<!-- Bootstrap core CSS -->
		<link href="<%=request.getContextPath()%>/resources/assets/css/bootstrap.min.css" rel="stylesheet">
		<!-- MetisMenu CSS -->
		<link href="<%=request.getContextPath()%>/resources/assets/css/metisMenu.min.css" rel="stylesheet">
		<!-- Icons CSS -->
		<link href="<%=request.getContextPath()%>/resources/assets/css/icons.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link href="<%=request.getContextPath()%>/resources/assets/css/style.css" rel="stylesheet">
		
		<script type="text/javascript">
		
		window.onload = function(){
			
			$("#two19").click();
			
			
		}
		
		
		</script>
		
		
</head>
<body>

	<div id="page-wrapper">

		<!-- Top Bar Start -->
		<%@ include file="../common/topnavbar.jsp" %>
		<!-- Top Bar End -->


		<!-- Page content start -->
		<div class="page-contentbar">

			<!--left navigation start-->
			 <%@ include file="../common/adminSidebar.jsp" %>
			<!--left navigation end-->

			<!-- START PAGE CONTENT -->
			<div id="page-right-content">

				<div class="container">
					<div class="row">
						<div class="col-sm-12">
						<h4 class="m-t-0 header-title">오또캠프 전체 매출내역</h4>
							<div class="btn-group">
                                        <button type="button" class="btn btn-default" onclick="Sales(this);">2017</button>
                                        <button type="button" class="btn btn-default" onclick="Sales(this);">2018</button>
                                        <button type="button" class="btn btn-default" onclick="Sales(this);" id="two19">2019</button>
                                        <!-- <button type="button" class="btn btn-default" onclick="etcSales();">기타</button> -->
                                        &nbsp;&nbsp;<p style="display: none;">시작 일자 : </p><input type="date" style="height: 34px; display: none;" id="startDay">
                                        &nbsp;&nbsp;<p style="display: none;">종료 일자 : </p><input type="date" style="height: 34px; display: none;" id="endDay">                                       
                             </div>
                              &nbsp; <button type="button" class="btn btn-primary" style="display: none;" onclick="searchSales();">검색</button>
						</div>
					</div> <br><br>
					<!--end row -->


					<div class="row">
						<div class="col-sm-12">
						
						
						</div>
					</div>
					<!-- end row -->


					<div class="row">
						<div class="col-sm-12"></div>
					</div>


				</div>
				<!-- end container -->

				<div class="footer">
					<div class="pull-right hidden-xs">
						Project Completed <strong class="text-custom">39%</strong>.
					</div>
					<div>
						<strong>Simple Admin</strong> - Copyright © 2017
					</div>
				</div>
				<!-- end footer -->

			</div>
			<!-- End #page-right-content -->

		</div>
		<!-- end .page-contentbar -->
	</div>
	
	<script type="text/javascript">
	
	function Sales(value){
		
		var year = $(value).text();
		
		location.href="<%= request.getContextPath() %>/total.sa?year="+ year;
			
	}
	

	</script>
	
	<!-- js placed at the end of the document so the pages load faster -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/jquery-2.1.4.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/metisMenu.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/jquery.slimscroll.min.js"></script>

	<!--Morris Chart-->
	<script src="<%=request.getContextPath()%>/resources/assets/plugins/morris/morris.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/plugins/raphael/raphael-min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/pages/jquery.morris.init.js"></script>

    <!-- Flot chart -->
    <script src="<%=request.getContextPath()%>/resources/assets/plugins/flot-chart/jquery.flot.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/plugins/flot-chart/jquery.flot.time.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/plugins/flot-chart/jquery.flot.tooltip.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/plugins/flot-chart/jquery.flot.resize.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/plugins/flot-chart/jquery.flot.pie.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/plugins/flot-chart/jquery.flot.selection.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/plugins/flot-chart/jquery.flot.stack.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/plugins/flot-chart/jquery.flot.orderBars.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/plugins/flot-chart/jquery.flot.crosshair.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/pages/jquery.flot.init.js"></script>

    <!-- KNOB JS -->
    <!--[if IE]>
    <script type="text/javascript" src="assets/plugins/jquery-knob/excanvas.js"></script>
    <![endif]-->
    <script src="<%=request.getContextPath()%>/resources/assets/plugins/jquery-knob/jquery.knob.js"></script>

	<!-- App Js -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/jquery.app.js"></script>

	<script type="text/javascript">
            $('[data-plugin="knob"]').each(function(idx, obj) {
                $(this).knob();
             });
        </script>



</body>
</html>