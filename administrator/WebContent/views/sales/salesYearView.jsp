<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, sales.model.vo.*, java.text.DecimalFormat"%>	
<%
 	ArrayList<CampSales> csList = (ArrayList<CampSales>)request.getAttribute("csList");
	ArrayList<CampYearSales> cyList = (ArrayList<CampYearSales>)request.getAttribute("cyList");
	ArrayList<CampMonthSales> cmList = (ArrayList<CampMonthSales>)request.getAttribute("cmList");
	ArrayList<CampDaySales> cdList = (ArrayList<CampDaySales>)request.getAttribute("cdList");
	
	DecimalFormat formatter = new DecimalFormat("#,###,###,###");
	
	String startDate = (String)request.getAttribute("startDate");
	String endDate = (String)request.getAttribute("endDate");
%>	
	
	
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
	
		<!-- jqury cdn -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		<meta charset="utf-8" />
		<title>사업장별 매출 조회 페이지</title>
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta
			content="A fully featured admin theme which can be used to build CRM, CMS, etc."
			name="description" />
		<meta content="Coderthemes" name="author" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/assets/images/favicon.ico">
		
		 <!--Morris Chart CSS -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/plugins/morris/morris.css">
		
		
        <!-- Plugins css-->
        <link href="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap-tagsinput/css/bootstrap-tagsinput.css" rel="stylesheet" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/plugins/switchery/switchery.min.css">
        <link href="<%=request.getContextPath()%>/resources/assets/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/resources/assets/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/assets/plugins/clockpicker/css/bootstrap-clockpicker.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
        
        <!-- DataTables -->
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/scroller.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.colVis.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/fixedColumns.dataTables.min.css" rel="stylesheet" type="text/css"/>
 
        <!-- Summernote css -->
        <link href="<%=request.getContextPath()%>/resources/assets/plugins/summernote/summernote.css" rel="stylesheet" />
		
		<!-- Bootstrap core CSS -->
		<link href="<%=request.getContextPath()%>/resources/assets/css/bootstrap.min.css" rel="stylesheet">
		<!-- MetisMenu CSS -->
		<link href="<%=request.getContextPath()%>/resources/assets/css/metisMenu.min.css" rel="stylesheet">
		<!-- Icons CSS -->
		<link href="<%=request.getContextPath()%>/resources/assets/css/icons.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link href="<%=request.getContextPath()%>/resources/assets/css/style.css" rel="stylesheet">
	
		
		<style type="text/css">
		#detailTr:hover{
			background: #c4dbf4;
		
		}	
		</style>



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
						<h4 class="m-t-0 header-title">사업장별 매출정보 메뉴</h4>
							<div class="btn-group">
                                        <button type="button" class="btn btn-default" onclick="daySales();">일별</button>
                                        <button type="button" class="btn btn-default" onclick="monthSales();">월별</button>
                                        <button type="button" class="btn btn-default" onclick="yearSales();">년별</button>
                                        &nbsp;&nbsp;시작 일자 : <input type="date" style="height: 34px;" id="startDay">
                                        &nbsp;&nbsp;종료 일자 : <input type="date" style="height: 34px;" id="endDay">                                       
                             </div>
                            &nbsp; <button type="button" class="btn btn-primary" onclick="searchSales();">검색</button>
						</div>
					</div> <br><br>
					<!--end row -->

	
					<!-- end row -->



					<div class="row" id="Year_Sales">
						<div class="col-sm-12">
						<h4 class="m-t-0 header-title"><%= startDate %> ~ <%= endDate %> || 년도별 매출 내역</h4>
						 <div class="table-responsive m-b-20">
						 <table id="datatable-buttons" name="year" class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                        	<th>캠핑장명</th>
                                            <th>날짜</th>
                                            <th>매출액</th>
                                            <th>수수료</th>
                                            <th>순이익</th>
                                            <th>결제건수</th> 
                                             <th>상세보기</th>                        
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <% for(CampYearSales cy : cyList) { %>
                                       <tr id="detailTr">
                                       <input type="hidden" value="<%= cy.getsCampCode() %>">
		                                       <td><%= cy.getsCampName() %></td>
		                                       <td><%= cy.getsYear() %></td>
		                                       <td><%= formatter.format(cy.getsCost()) %></td>
		                                       <td><%= formatter.format(Math.round(cy.getsCost()*0.15)) %></td>
		                                       <td><%= formatter.format(Math.round(cy.getsCost() * 0.85)) %></td>
		                                       <td><%= cy.getsCount() %></td>
		                                       <td><button class="btn btn-primary btn-xs" data-toggle="modal" data-target=".bs-example-modal-lg" id="detailModal" onclick="dayDetail(this);">상세보기</button></td></tr>
		                                       
                         				</tr>
                                      	<%} %>
                                        </tbody>
                                    </table>
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
	
	<!--  Modal content for the above example -->
    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myLargeModalLabel">Large modal</h4>
                </div>
                <div class="modal-body">
               
               <div class="table-responsive m-b-20">
				 	<table class="table table-hover table-bordered">
                              <thead>
                                  <tr>
                                        	<th>캠핑장명</th>
                                            <th>날짜</th>
                                            <th>매출액</th>
                                            <th>수수료</th>
                                            <th>순이익</th>
                                            <th>결제건수</th>                             
                                        </tr>
                                  </thead>

                                  <tbody id="dayDetailBody">
                               
                                
                                  </tbody>
                              </table>
                     </div>
                 <div></div>
                           
        	<div id="chartContainer" style="height: 370px; width: 50%; float: left;"></div>
			<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>	
			        
			        <div style="width: 41%; height: 370px; float: right;">
			 		     <div class="card-box" style="width: 100%; height: 50%; margin: 0;">
                       	<i class="fa fa-info-circle text-muted pull-right inform" data-toggle="tooltip" data-placement="top" title="" data-original-title="순이익는 매출액의 85%입니다."></i>
                       	<h4 class="m-t-0 text-dark">월 평균 순이익</h4>
                       	<h2 class="text-primary text-center m-b-30 m-t-30" style="color: #fa5555">₩<span data-plugin="counterup" id="MonthEa"></span></h2>
                       	<p class="text-muted m-b-0" id="MonthAv"><span class="pull-right"><i class="fa fa-caret-up text-primary m-r-5"></i>10.25%</span></p>
                       </div>
			         <div class="card-box" style="width: 100%; height: 50%; margin: 0;">
                       	<i class="fa fa-info-circle text-muted pull-right inform" data-toggle="tooltip" data-placement="top" title="" data-original-title="수수료는 매출액의 15%입니다."></i>
                       	<h4 class="m-t-0 text-dark">월 평균 수수료</h4>
                       	<h2 class="text-primary text-center m-b-30 m-t-30">₩<span data-plugin="counterup" id="earning"></span></h2>
                       	<p class="text-muted m-b-0" id="averageview"><span class="pull-right"><i class="fa fa-caret-up text-primary m-r-5"></i>10.25%</span></p>
                       </div>
                       
                </div>
  			<div style="clear: both;"></div> 
			                	         
                </div>
                     
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
	
	
	
	<script type="text/javascript">
	
	$(function(){	
		index = "";
	})	
	 function daySales(){	
		index = "일별";			
	} 	 
	 function monthSales(){		
		 index = "월별";				
	} 	 
	 function yearSales(){		 
		 index = "년별";				
	}  	 
	 function searchSales(){
		 
			if(index == ""){
				 
				 alert("일/월/년을 선택해주세요");
				 
				 return; 
			 }
		 
		 var startDate = $( "#startDay" ).val(); //2017-12-10
	        var startDateArr = startDate.split('-');
	         
	        var endDate = $( "#endDay" ).val(); //2017-12-09
	        var endDateArr = endDate.split('-');
	                 
	        var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
	        var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
	        
	        if(startDate == ""){
	        	alert("시작날짜가 비어있습니다.");
	        	return;
	        }
	        if(endDate == ""){
	        	alert("종료날짜가 비어있습니다.");
	        	return;
	        }
	         
	        if(startDateCompare.getTime() > endDateCompare.getTime()) {
	             
	            alert("시작날짜와 종료날짜를 확인해 주세요.");
	             
	            return;
	        }

	        
	        
		switch(index){
		
		case "일별" : location.href="<%=request.getContextPath()%>/salesDay.sd?day="+startDate+","+endDate; break;
		case "월별" : location.href="<%=request.getContextPath()%>/salesMonth.sm?day="+startDate+","+endDate; break;
		case "년별" : location.href="<%=request.getContextPath()%>/salesYear.sy?day="+startDate+","+endDate; break;
		
		}
		 
	 }

	 document.getElementById('endDay').value = new Date().toISOString().substring(0, 10);
	 
	 function dayDetail(value){
		 
		  $title = $("#myLargeModalLabel");
		  $title.html('');
		  $body = $("#dayDetailBody");
		  $body.html(''); 
		  
		  var code = $(value).parent().parent().children().eq(0).val();
		  var campName = $(value).parent().parent().children().eq(1).text();
		  var fullday = $(value).parent().parent().children().eq(2).text();
		  var yearEarning1 = $(value).parent().parent().children().eq(3).text();
		  var yearEarning = removeComma(yearEarning1);
		  
		  var year = fullday;
		 	  
		  total = $(value).parent().parent().children().eq(6).text();
		  card = 0;
		  cash = 0;
		  sum = 0; 
		  index = 0;
		  
		  $title.text(year + "년 " + campName + "의 상세매출");
		  
		  <%-- var nDate = "<%= csList.get(0).getsPayDate() %>" ; --%>
		  	  		  
			<% for(CampMonthSales cm : cmList) {  %>
		  		
		  	if((<%= cm.getsCampCode() %> == code) && ("<%= cm.getsMonth().substring(0,4) %>" == fullday)){
		  		
		  		$tr = $("<tr>");
		  		$td0 = $("<td>").text("<%= cm.getsCampName() %>");
		  		$td1 = $("<td>").text("<%= cm.getsMonth() %>");
		  		$td2 = $("<td>").text("<%= formatter.format(cm.getsCost()) %>");
		  		$td3 = $("<td>").text("<%= formatter.format(Math.round(cm.getsCost()*0.15)) %>");
		  		$td4 = $("<td>").text("<%= formatter.format(Math.round(cm.getsCost() * 0.85)) %>");
		  		$td5 = $("<td>").text("<%= cm.getsCount() %>");
		  			  		
		  		$tr.append($td0);
		  		$tr.append($td1);
		  		$tr.append($td2);
		  		$tr.append($td3);
		  		$tr.append($td4);
		  		$tr.append($td5);
		  			  		
		  		$body.append($tr);	  	
		  		
		  		index++;
		  	}
			  
		 <% } %> 
		 
		 
		 <% for(CampSales cs : csList){ %>
	  		
		  	if((<%= cs.getsCampCode() %> == code) && ("<%= cs.getsPayDate().substring(0,4) %>" == fullday)){
				
		  		sum += <%= cs.getsCost() %>
		  		
		  		switch("<%= cs.getsPayType() %>"){
		  		
		  		case "현금" : cash++; break;
		  		case "카드" : card++; break;
		  			  		
		  		}	
		  			  		
		  	}
			  
		<% } %> 
		 
	
		 var chart = new CanvasJS.Chart("chartContainer", {
				animationEnabled: true,
				title: {
					text: "결제타입비율"
				},
				data: [{
					type: "pie",
					startAngle: 240,
					yValueFormatString: "##0.00\"%\"",
					indexLabel: "{label} {y}",
					dataPoints: [
						{y: (card/total) * 100, label: "카드 : " + card + "건"},
						{y: (cash/total) * 100, label: "현금 : " + cash + "건"}	
							
					]
				}]
			});
			chart.render();
			
			
			var average = Math.round(sum/total);
			var eargning = Math.round(average * 0.15);
			
			var comAver = comma(average);
			var earAver = comma(eargning);
		
			var MonthEarning = Math.round(yearEarning/index); // 월평균 매출액, 금액표시 x 
			var finalMonthEarn = comma(MonthEarning); // 월평균 매출액, 금액표시 o
			
			var MonthProfit = Math.round(MonthEarning * 0.85); // 월평균 순이익, 금액표시 x
			var finalMonthProfit = comma(MonthProfit); // 월평균 순이익, 금액표시 o
			
			var Monthcommit = Math.round(MonthEarning * 0.15); // 월평균 수수료, 금액표시 x
			var finalMonthcommit = comma(Monthcommit);
			
			$("#earning").text(finalMonthcommit);
			$("#averageview").text("월 평균매출액 : " + finalMonthEarn);
			
			$("#MonthEa").text(finalMonthProfit);
			$("#MonthAv").text("월 평균매출액 : " + finalMonthEarn);
			
			
			
	 }	 
	 
	 function comma(num){
		    var len, point, str; 
		       
		    num = num + ""; 
		    point = num.length % 3 ;
		    len = num.length; 
		   
		    str = num.substring(0, point); 
		    while (point < len) { 
		        if (str != "") str += ","; 
		        str += num.substring(point, point + 3); 
		        point += 3; 
		    } 
		     
		    return str;
		 
		}
	 
	 function removeComma(str){

			n = parseInt(str.replace(/,/g,""));

			return n;

	}


	 
	 
	</script>
	
	<!-- js placed at the end of the document so the pages load faster -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/jquery-2.1.4.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/metisMenu.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/jquery.slimscroll.min.js"></script>

	 <script src="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap-tagsinput/js/bootstrap-tagsinput.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/assets/plugins/select2/js/select2.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap-filestyle/js/bootstrap-filestyle.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/resources/assets/plugins/switchery/switchery.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/assets/plugins/parsleyjs/parsley.min.js"></script>

        <script src="<%=request.getContextPath()%>/resources/assets/plugins/moment/moment.js"></script>
     	<script src="<%=request.getContextPath()%>/resources/assets/plugins/timepicker/bootstrap-timepicker.js"></script>
     	<script src="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
     	<script src="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
     	<script src="<%=request.getContextPath()%>/resources/assets/plugins/clockpicker/js/bootstrap-clockpicker.min.js"></script>
     	<script src="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
        <script src="<%=request.getContextPath()%>/resources/assets/plugins/summernote/summernote.min.js"></script>

	<!-- Datatable js -->
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.bootstrap.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.buttons.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/buttons.bootstrap.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/jszip.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/pdfmake.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/vfs_fonts.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/buttons.html5.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/buttons.print.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.keyTable.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.responsive.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/responsive.bootstrap.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.scroller.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.colVis.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.fixedColumns.min.js"></script>

		<!-- init -->
        <script src="<%= request.getContextPath() %>/resources/assets/pages/jquery.datatables.init.js"></script>
        
      
  	<!-- form advanced init js -->
        <script src="<%=request.getContextPath()%>/resources/assets/pages/jquery.form-advanced.init.js"></script>
        
    

	<!-- App Js -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/jquery.app.js"></script>




</body>
</html>