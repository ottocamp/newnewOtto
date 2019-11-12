<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, reservation.model.vo.*, java.text.DecimalFormat"%>
<%
	ArrayList<Reservation> sList = (ArrayList<Reservation>)request.getAttribute("sList");
	ArrayList<ReservationCount> cList = (ArrayList<ReservationCount>)request.getAttribute("cList");
	DecimalFormat formatter = new DecimalFormat("###,###,###,###");
	String msg = (String)session.getAttribute("msg");
	
	String startDay = (String)request.getAttribute("startDay");
	String endDay = (String)request.getAttribute("endDay");
	String rMin = (String)request.getAttribute("rMin");
	String rMax = (String)request.getAttribute("rMax");
	String nArr = (String)request.getAttribute("nArr");
	
	for(Reservation re : sList){
		
		switch(re.getReStatus()){
		
		case "1" : re.setReStatus("결제완료"); break;
		case "2" : re.setReStatus("예약완료"); break;
		case "3" : re.setReStatus("예약취소"); break;
		case "4" : re.setReStatus("이용완료"); break;
		default : break;
		}	
	}
	
	String[] checkInterest = new String[4];
	
	if(nArr != null){
		String[] interests = nArr.split(",");
		
		for(int i = 0; i < interests.length; i++){
			switch(interests[i]){
			case "1" : checkInterest[0] = "checked"; break;
			case "2" : checkInterest[1] = "checked"; break;
			case "3" : checkInterest[2] = "checked"; break;
			case "4" : checkInterest[3] = "checked"; break;
 			}
		}
		
	}
	
	
	
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<title>예약 관리 검색페이지</title>
		<!-- jqury cdn -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
        <meta charset="utf-8" />
    
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/assets/images/favicon.ico">
        
          <!-- ION Slider -->
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/ion-rangeslider/ion.rangeSlider.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/ion-rangeslider/ion.rangeSlider.skinModern.css" rel="stylesheet" type="text/css"/>
        
        
         <!-- DataTables -->
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/scroller.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.colVis.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/fixedColumns.dataTables.min.css" rel="stylesheet" type="text/css"/>

        <!-- Bootstrap core CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/metisMenu.min.css" rel="stylesheet">
        <!-- Icons CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/icons.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/style.css" rel="stylesheet">

		 <!-- Sweet Alert -->
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/sweet-alert2/sweetalert2.min.css" rel="stylesheet" type="text/css">
		
		<style type="text/css">
		
		#rDetail:hover{
		cursor: pointer;
		text-decoration: underline;
		
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
      					 <h4 class="m-t-0 header-title">예약 검색 옵션 </h4>
      					 </div>
      					
      					</div>
      					
                        <div class="row">
                       
                        <form method="post" action="<%= request.getContextPath() %>/newReservation.li" onsubmit="return validate();">
                            <div class="col-lg-6" align="center">
                                <div class="card-box">
                                
                                <span style="font-weight: bold;">기본검색옵션</span><span style="float: right;" id="rDetail"></span>
                                <hr style="margin-top: 10px;">
                            		<div class="checkbox checkbox-inline checkbox-circle">
                                                <input type="checkbox" id="payment" name="progress" value="1">
                                                <label for="payment"> 결제완료 </label>
                                            </div>
                                     <div class="checkbox checkbox-inline checkbox-circle">
                                         <input type="checkbox" id="onreservation" name="progress" value="2">
                                         <label for="onreservation"> 예약완료 </label>
                                    	 </div>
                                     <div class="checkbox checkbox-inline checkbox-circle">
                                         <input type="checkbox" id="offreservation" name="progress" value="3">
                                         <label for="offreservation"> 예약취소 </label>
                                     	</div>
                                     <div class="checkbox checkbox-inline checkbox-circle">
                                         <input type="checkbox" id="complete" name="progress" value="4">
                                         <label for="complete"> 이용완료 </label>
                                     </div>
                                     <div class="checkbox checkbox-inline checkbox-circle">
                                         <input type="checkbox" id="pAll" name="" value="4">
                                         <label for="pAll"> 전체선택 </label>
                                     </div>
                            		<br><hr>
                            		시작일자  &nbsp;: &nbsp;<input type="date" style="height: 34px;" id="startDay" name="startDay">&nbsp;&nbsp;
                            		종료일자  &nbsp;: &nbsp;<input type="date" style="height: 34px;" id="endDay" name="endDay">
                            		<hr>
                            		결제금액 &nbsp;: &nbsp;<input type="text" id="rMin" name="rMin" placeholder="최소" style="width: 144.34px; height: 34px;">&nbsp; ~ &nbsp;<input type="text" id="rMax" name="rMax" placeholder="최대" style="width: 144.34; height: 34px;">
                                    <button type="submit" class="btn btn-primary" onclick="searchSales();" style="vertical-align: 0;">검색</button> 
                                    <hr>
                                </div>
                            </div>
                            
                            <div class="col-lg-6">
                                           <div class="card-box widget-inline">
									<div class="row">
										<div class="col-lg-6 col-sm-6">
											<div class="widget-inline-box text-center">
												<h3><i class="text-primary mdi mdi-check-circle-outline"></i> <b data-plugin="counterup" id="first">0건</b></h3>
												<p class="text-muted">결제완료</p>
											</div>
										</div>

										<div class="col-lg-6 col-sm-6">
											<div class="widget-inline-box text-center">
												<h3><i class="text-custom mdi mdi-calendar-check"></i> <b data-plugin="counterup" id="second">0건</b></h3>
												<p class="text-muted">예약완료</p>
											</div>
										</div>

										<div class="col-lg-6 col-sm-6">
											<div class="widget-inline-box text-center">
												<h3><i class="text-danger mdi mdi-delete-forever"></i> <b data-plugin="counterup" id="third">0건</b></h3>
												<p class="text-muted">예약취소</p>
											</div>
										</div>

										<div class="col-lg-6 col-sm-6">
											<div class="widget-inline-box text-center b-0">
												<h3><i class="text-info mdi mdi-black-mesa"></i> <b data-plugin="counterup" id="four">0건</b></h3>
												<p class="text-muted">이용완료</p>
											</div>
										</div>

									</div>
								</div>
                                        </div>
                            </form>
                        </div>

					<div class="row">
							<div class="col-sm-12">
							 <div class="card-box">
							 <div class="checkbox checkbox-inline checkbox-circle ">
                                              <input type="checkbox" id="payment" name="" value="1" disabled="disabled"  <%= checkInterest[0] %>>
                                                <label for=""> 결제완료 </label>
                                            </div>
                                     <div class="checkbox checkbox-inline checkbox-circle ">
                                         <input type="checkbox" id="onreservation" name="" value="2" disabled="disabled"  <%= checkInterest[1] %>>
                                         <label for=""> 예약완료 </label>
                                    	 </div>
                                     <div class="checkbox checkbox-inline checkbox-circle ">
                                         <input type="checkbox" id="offreservation" name="" value="3" disabled="disabled"  <%= checkInterest[2] %>>
                                         <label for=""> 예약취소 </label>
                                     	</div>
                                     <div class="checkbox checkbox-inline checkbox-circle ">
                                         <input type="checkbox" id="complete" name="" value="4" disabled="disabled"  <%= checkInterest[3] %>>
                                         <label for=""> 이용완료 </label>
                                     </div>
                                 	&nbsp;&nbsp;
                                 	<div class="checkbox checkbox-inline checkbox-circle " >
                                         <input type="checkbox" id="complete" name="" value="4" checked disabled="disabled">
                                         <label for="">날짜 : <%= startDay %>부터 <%= endDay %> </label>
                                     </div>
                                     &nbsp;&nbsp;
                                     <div class="checkbox checkbox-inline checkbox-circle ">
                                         <input type="checkbox" id="complete" name="" value="4" checked disabled="disabled">
                                         <label for="">금액 : <%= rMin %>원 ~ <%= formatter.format(Integer.parseInt(rMax)) %>원</label>
                                     </div>
                                 

                                 
                             
								<hr>
                                <div class="table-responsive m-b-20">
                                    

                                    <table id="datatable" class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th>결제일시</th>
                                            <th>예약번호</th>
                                            <th>회원이름</th>
                                            <th>연락처</th>
                                            <th>예약일자</th>
                                            <th>결제금액</th>
                                            <th>처리상태</th>
                                            <th>승인</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <% for(Reservation re : sList){ %>
											<tr id="usergrade">
												<td><%= re.getRePayDate() %></td>
												<td><%= re.getReNo() %></td>
												<td><%= re.getReName() %></td>
												<td><%= re.getRePhone() %></td>
												<td><%= re.getReDate() %></td>
												<td><%= formatter.format(re.getReCost()) %></td>
												
												<% if(re.getReStatus().equals("결제완료")) {%>
												<td class="text-primary"><%= re.getReStatus() %></td>
												<%}else if(re.getReStatus().equals("예약완료")) {%>
												<td class="text-custom"><%= re.getReStatus() %></td>
												<%}else if(re.getReStatus().equals("예약취소")) {%>
												<td class="text-danger"><%= re.getReStatus() %></td>
												<%}else{ %>
												<td class="text-info"><%= re.getReStatus() %></td>
												<%} %>
												
												<td><%if(re.getReStatus().equals("예약완료")) {%>
													<button type="button" class="btn btn-primary btn-xs" onclick="delete1(this);">취소하기</button>
												<%}else{ %>
													취소불가
												<%} %>												
												</td>	
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
                    </div> <!-- end footer -->

                </div>
                <!-- End #page-right-content -->

            </div>
            <!-- end .page-contentbar -->
        </div>

		<script type="text/javascript">
		
		
		document.getElementById('endDay').value = new Date().toISOString().substring(0, 10);
		
		$(function(){
			
			$("#pAll").change(function(){
		        if($(this).is(":checked")){
		        	 $("input[name=progress]").prop("checked",true);
		        }else{
		        	$("input[name=progress]").prop("checked",false);
		        }
		    });
			
			$("#rDetail").click(function(){
				
				 if($("#detailDiv").css("display") == "none"){   
				        jQuery('#detailDiv').css("display", "block");   
				    } else {  
				        jQuery('#detailDiv').css("display", "none");   
				    }

				
			})
			
		});
		
		function validate(){
			
			
			if(!($("input:checkbox[name='progress']").is(":checked"))){
				
				alert("예약진행상황을 선택해주세요");
				return false;	
			}
		
		
			var startDate = $( "#startDay" ).val(); //2017-12-10
	        var startDateArr = startDate.split('-');
	         
	        var endDate = $( "#endDay" ).val(); //2017-12-09
	        var endDateArr = endDate.split('-');
	                 
	        var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
	        var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
	        
	        if(startDate == ""){
	        	alert("시작날짜가 비어있습니다.");
	        	return false;
	        }
	        if(endDate == ""){
	        	alert("종료날짜가 비어있습니다.");
	        	return false;
	        }
	        
	         
	        if(startDateCompare.getTime() > endDateCompare.getTime()) {
	             
	            alert("시작날짜와 종료날짜를 확인해 주세요.");
	             
	            return false;
	        }
			
	        if($("#rMin").val().trim() == "" || isNaN($("#rMin").val()) == true ){
	        	
	        	alert("최소금액란을 확인해주세요");
	        	
	        	$("#rMin").focus();
	        	
	        	return false;
	        }
	        
 			if($("#rMax").val().trim() == "" || isNaN($("#rMax").val()) == true){
	        	
	        	alert("최대금액란을 확인해주세요.");
	        	
	        	$("#rMax").focus();
	        	
	        	return false;
	        }
	        
			if($("#rMin").val() > $("#rMax").val()){
				
				alert("최소금액이 최대금액보다 클 수 없습니다.");
				$("#rMin").focus();
				return false;
			}
  
			
			
			
			
		}
		
	function delete1(value){
			
		var reNo = $(value).parent().parent().children().eq(1).text()
		
			if(confirm("정말로 취소하시겠습니까?")){
				
				$.ajax({
					url : "<%= request.getContextPath() %>/delete.re",
					type : "post",
					data : {reNo:reNo},
					success : function(data){
						if(data == "fail"){
							alert("실패하였습니다.")
							
						}else{
							alert("성공하였습니다.");
							location.reload();
						}
	
					},
					error: function(){
						console.log('서버 통신 안됨');
					}
					
					
				});
				
				
				
			}
			
			
			
		}
	
	
	<%for(ReservationCount rc : cList){ %>
	
		if(<%= rc.getrReStatus() %> == 1){
			
			$("#first").html('');
			$("#first").text('<%= rc.getrCount() %>건');
						
		}else if(<%= rc.getrReStatus() %> == 2){
			
			$("#second").html('');
			$("#second").text('<%= rc.getrCount() %>건');
			
		}else if(<%= rc.getrReStatus() %> == 3){
			
			$("#third").html('');
			$("#third").text('<%= rc.getrCount() %>건');
		}else{
			$("#four").html('');
			$("#four").text('<%= rc.getrCount() %>건');
		}

	
	<%} %>
	
		</script>



        <!-- js placed at the end of the document so the pages load faster -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery-2.1.4.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/bootstrap.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/metisMenu.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.slimscroll.min.js"></script>

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

		<!-- Sweet-Alert  -->
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/sweet-alert2/sweetalert2.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/pages/jquery.sweet-alert.init.js"></script>

        <!-- App Js -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.app.js"></script>

		



</body>
</html>