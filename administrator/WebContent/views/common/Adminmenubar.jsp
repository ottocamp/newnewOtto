<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, amain.model.vo.*, java.text.DecimalFormat" %>
	
<%

	ArrayList<MainAccumJoin> majList = (ArrayList<MainAccumJoin>)request.getAttribute("majList");
	ArrayList<MainBoardIndex> mbiList = (ArrayList<MainBoardIndex>)request.getAttribute("mbiList");
	ArrayList<MainIndexBar> mibList = (ArrayList<MainIndexBar>)request.getAttribute("mibList");
	ArrayList<MainJoinCount> mjcList = (ArrayList<MainJoinCount>)request.getAttribute("mjcList");
	
	DecimalFormat formatter = new DecimalFormat("#,###,###,###");


%>	
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>
<!-- jqury cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta charset="utf-8" />

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- 아이콘 cdn -->
		<script src="https://kit.fontawesome.com/ec9c0ffb05.js" crossorigin="anonymous"></script>

<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/assets/images/favicon.ico">

<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/resources/assets/css/bootstrap.min.css"
	rel="stylesheet">
<!-- MetisMenu CSS -->
<link
	href="<%=request.getContextPath()%>/resources/assets/css/metisMenu.min.css"
	rel="stylesheet">
<!-- Icons CSS -->
<link
	href="<%=request.getContextPath()%>/resources/assets/css/icons.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="<%=request.getContextPath()%>/resources/assets/css/style.css"
	rel="stylesheet">


</head>
<body>

	<div id="page-wrapper">

		<!-- Top Bar Start -->
			<%@ include file="topnavbar.jsp" %>
		<!-- Top Bar End -->


		<!-- Page content start -->
		<div class="page-contentbar">

			<%@ include file="adminSidebar.jsp" %>

			<!-- START PAGE CONTENT -->
			<div id="page-right-content">

				<div class="container">
				
				
				
				
				
				
				
				
					<div class="row">
							<div class="col-sm-12">
								<div class="card-box widget-inline">
									<div class="row">
										<div class="col-lg-3 col-sm-6">
											<div class="widget-inline-box text-center">
												<h3 class="m-t-10"><i class="text-primary fas fa-won-sign"></i> <b data-plugin="counterup"><%= formatter.format(mibList.get(0).getmSales()) %>원</b></h3>
												<p class="text-muted">최근 한달간 매출액</p>
											</div>
										</div>

										<div class="col-lg-3 col-sm-6">
											<div class="widget-inline-box text-center">
												<h3 class="m-t-10"><i class="text-custom mdi mdi-airplay"></i> <b data-plugin="counterup"><%= mibList.get(0).getmPayCount() %>건</b></h3>
												<p class="text-muted">최근 한달간 이용건수</p>
											</div>
										</div>

										<div class="col-lg-3 col-sm-6">
											<div class="widget-inline-box text-center">
												<h3 class="m-t-10"><i class="text-info mdi mdi-black-mesa"></i> <b data-plugin="counterup"><%= mibList.get(0).getmJoinCount() %>명</b></h3>
												<p class="text-muted">최근 한달간 회원가입자수</p>
											</div>
										</div>

										<div class="col-lg-3 col-sm-6">
											<div class="widget-inline-box text-center b-0">
												<h3 class="m-t-10"><i class="text-danger mdi mdi-cellphone-link"></i> <b data-plugin="counterup"><%= mibList.get(0).getmApprovalCamp() %>개</b></h3>
												<p class="text-muted">승인 대기중인 사업장 수</p>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					<!--end row -->


					<div class="row">
                            <div class="col-lg-6">
                                <div class="card-box">
                                    <h4 class="m-t-0">최근 한달간 회원가입 추이</h4>
                                    <div class="text-center">
                                    <ul class="list-inline chart-detail-list">
                                            <li>
                                                <h5 class=""><i class="fa fa-circle m-r-10 text-danger"></i>일별 회원가입 수</h5>
                                            </li>
                                           
                                        </ul>
                                        <div id="chartContainer" style="height: 370px; width: 100%;"></div>
										<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                                    </div>
                                    
                                </div>
                            </div> <!-- end col -->

                            <div class="col-lg-6">
                                <div class="card-box">
                                    <h4 class="m-t-0">총 누적 가입자 수</h4>
                                    <div class="text-center">
                                    <ul class="list-inline chart-detail-list">
                                            <li>
                                                <h5 class=""><i class="fa fa-circle m-r-10 text-primary" aria-hidden="true"></i>년별 누적가입수</h5>
                                            </li>
                                           
                                        </ul>
                                       <div id="chartContainer1" style="height: 370px; width: 100%;"></div>
										<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                                    </div>
                                    
                                </div>
                            </div> 
                        </div>
					<!-- end row -->


					<div class="row">
                            <div class="col-sm-12">
                                <div class="card-box">
                                    <h4 class="m-t-0">최근 올라온 게시글 <button class="btn btn-default " data-toggle="modal" data-target="#myModal" style="float: right;" onclick="goBoard();">게시판으로 가기</button></h4>
                                    <div class="table-responsive" style="clear: both;">
                                        <table class="table table-hover mails m-0 table table-actions-bar">
                                            <thead>
                                                <tr>
    
                                                    <th>게시글 번호</th>
                                                    <th>제목</th>
                                                    <th>작성자</th>
                                                    <th>작성일</th>
                                                    <th>조회수</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                             <% for(int i = 0; i <5; i++){ %>
												<tr>
                                                	<td><%= mbiList.get(i).getmBno() %></td>
                                                	<td><%= mbiList.get(i).getmBtitle() %></td>
                                                	<td><%= mbiList.get(i).getmWriterName() %></td>
                                                	<td><%= mbiList.get(i).getmBdate() %></td>
                                                	<td><%= mbiList.get(i).getmBcount() %></td>
                                          		</tr>
											<%} %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
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
	
	window.onload = function () {

		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled: true,
			theme: "light2",
			title:{
				text: ""
			},
			axisX:{
				valueFormatString: "MMM DD",
				crosshair: {
					enabled: true,
					snapToDataPoint: true
				}
			},
			axisY: {
				title: "",
				crosshair: {
					enabled: true
				}
			},
			toolTip:{
				shared:true
			},  
			legend:{
				cursor:"pointer",
				verticalAlign: "bottom",
				horizontalAlign: "left",
				dockInsidePlotArea: true,
				itemclick: toogleDataSeries
			},
			data: [{
				type: "line",
				showInLegend: true,
				name: "회원가입 수",
				markerType: "circle",
				xValueFormatString: "MMM, DD",
				color: "#F08080",
				dataPoints: [
					<% for(MainJoinCount mjc : mjcList) {%>
					{ x: new Date("20" + <%= (mjc.getmJoinDate()).substring(0,2) %>, 
					<%= (mjc.getmJoinDate()).substring(3,5) %> -1, <%= (mjc.getmJoinDate()).substring(6,8) %>), y: <%= mjc.getmCount() %> },
					
					<%} %>
					
				]
			},
			{
				type: "",
				showInLegend: true,
				name: "Unique Visit",
				lineDashType: "dash",
				dataPoints: [
					
				]
			}]
		});
		chart.render();

		function toogleDataSeries(e){
			if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
				e.dataSeries.visible = false;
			} else{
				e.dataSeries.visible = true;
			}
			chart.render();
		}

		
		var chart = new CanvasJS.Chart("chartContainer1", {
			animationEnabled: true,  
			title:{
				text: ""
			},
			axisY: {
				title: "",
				valueFormatString: "###명",
				suffix: "",
				prefix: ""
			},
			data: [{
				type: "splineArea",
				color: "rgba(54,158,173,.7)",
				markerSize: 5,
				xValueFormatString: "YYYY",
				yValueFormatString: "#####명",
				dataPoints: [

					<% for(MainAccumJoin maj : majList){ %>
					{ x: new Date(<%= maj.getmJoinYear() %>, 0), y: <%= maj.getmAccumCount() %> },
					
					<%}%>
				]
			}]
			});
		chart.render();
		
		
		
		
		
		
		
		}
	
	
	function goBoard(){
		
		location.href = "<%= request.getContextPath() %>/list.bo?b_tag=2";
		
	}
	
	
	
	
	</script>


	<!-- js placed at the end of the document so the pages load faster -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/jquery-2.1.4.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/metisMenu.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/jquery.slimscroll.min.js"></script>

	<!-- App Js -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/jquery.app.js"></script>




</body>
</html>