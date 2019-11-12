<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, coupon.model.vo.*, java.text.DecimalFormat"%>
<%
	String msg = (String)session.getAttribute("msg");
		
	ArrayList<Coupon> cList = (ArrayList<Coupon>)request.getAttribute("cList");
	DecimalFormat formatter = new DecimalFormat("##,###,###");

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
		
		#detailDiv{
		display: none;
		}
		
		</style>
		
	<script>
		var msg = "<%= msg %>";
		$(function(){
		if(msg != "null"){
			
			alert(msg);
			<% session.removeAttribute("msg"); %>
		}
		});
		
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
      					 <span style="font-size: 20px; font-weight: bold; line-height: 35px;">쿠폰 정보 </span><button class="btn btn-default " data-toggle="modal" data-target="#myModal" style="float: right;">추가하기</button>
      					 </div>
      					
      					</div>
      					<hr style="margin-bottom: 0px; margin-top: 12px;">
                       <div class="row">
                                       
                                        <div class="col-sm-12">
                                            <div class="card-box m-t-30">
                                                

                                                <ul class="nav nav-tabs tabs-bordered nav-justified">
                                                    <li class="active">
                                                        <a href="#profile-b2" data-toggle="tab" aria-expanded="true">
                                                            <span class="visible-xs"><i class="fa fa-home"></i></span>
                                                            <span class="hidden-xs">사용가능쿠폰</span>
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="#home-b2" data-toggle="tab" aria-expanded="false">
                                                            <span class="visible-xs"><i class="fa fa-user"></i></span>
                                                            <span class="hidden-xs">사용불가쿠폰</span>
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="#messages-b2" data-toggle="tab" aria-expanded="false">
                                                            <span class="visible-xs"><i class="fa fa-envelope-o"></i></span>
                                                            <span class="hidden-xs">기간만료예정</span>
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="#settings-b2" data-toggle="tab" aria-expanded="false">
                                                            <span class="visible-xs"><i class="fa fa-cog"></i></span>
                                                            <span class="hidden-xs">전체쿠폰</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div class="tab-pane" id="home-b2">
                                                   <% for(Coupon c : cList){ %>
                           		<% if(c.getProgress() < 0.00){ %>
                                <div class="card-box" style="width: 32.1%; display: inline-block; margin: 10px 10px 10px 0px;">
                                 <input type="hidden" value="<%= c.getcCode() %>"> 
                                     <button class="btn btn-sm btn-default pull-right" onclick="update(this);">자세히</button>
                                    <h6 class="text-muted m-t-0 text-uppercase"><%= c.getcStartDay().substring(0, 10) %>부터 <%= c.getcEndDay().substring(0,10) %>까지</h6>
                                    <h2 class="m-b-20"><span><%= c.getcName() %><br><%= formatter.format(c.getcDiscount()) %>원</span></h2> 
                                    <div class="progress progress-sm m-0">
          
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: <%= c.getProgress() %>%;">
                                            <span class="sr-only"><%= c.getProgress() %>% Complete</span>
                                        </div>
 
                                    </div>
                                </div>
                                <%} %>
                                
                 				<%} %>
                           		
                    
                                                    </div>
                                                    <div class="tab-pane active" id="profile-b2">
                                            <% for(Coupon c : cList){ %>
                           		<% if(c.getProgress() > 0.00){ %>
                                <div class="card-box" style="width: 32.1%; display: inline-block; margin: 10px 10px 10px 0px;">
                                 <input type="hidden" value="<%= c.getcCode() %>"> 
                                    <button class="btn btn-sm btn-default pull-right" onclick="update(this);">자세히</button>
                                    <h6 class="text-muted m-t-0 text-uppercase"><%= c.getcStartDay().substring(0, 10) %>부터 <%= c.getcEndDay().substring(0,10) %>까지</h6>
                                    <h2 class="m-b-20"><span><%= c.getcName() %><br><%= formatter.format(c.getcDiscount()) %>원</span></h2> 
                                    <div class="progress progress-sm m-0">
                                    
                                    <% if(c.getProgress() > 50.0) {%>
                                        <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: <%= c.getProgress() %>%;">
                                            <span class="sr-only"><%= c.getProgress() %>% Complete</span>
                                        </div>
                                    <%}else if(c.getProgress() > 20.0) {%>    
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: <%= c.getProgress() %>%;">
                                            <span class="sr-only"><%= c.getProgress() %>% Complete</span>
                                        </div>
                                    <%}else{ %>   
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: <%= c.getProgress() %>%;">
                                            <span class="sr-only"><%= c.getProgress() %>% Complete</span>
                                        </div>
                                    <%} %>
                                        
                                    </div>
                                </div>
                                <%} %>
                                
                 				<%} %>        
                               
                             
                                                    </div>
                                                    <div class="tab-pane" id="messages-b2">
                                                    <% for(Coupon c : cList){ %>
                           		<% if(c.getProgress() <= 20.0 && c.getProgress() >= 0.00){ %>
                                <div class="card-box" style="width: 32.1%; display: inline-block; margin: 10px 10px 10px 0px;">
                                 <input type="hidden" value="<%= c.getcCode() %>"> 
                                     <button class="btn btn-sm btn-default pull-right" onclick="update(this);">자세히</button>
                                    <h6 class="text-muted m-t-0 text-uppercase"><%= c.getcStartDay().substring(0, 10) %>부터 <%= c.getcEndDay().substring(0,10) %>까지</h6>
                                    <h2 class="m-b-20"><span><%= c.getcName() %><br><%= formatter.format(c.getcDiscount()) %>원</span></h2> 
                                    <div class="progress progress-sm m-0">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: <%= c.getProgress() %>%;">
                                            <span class="sr-only"><%= c.getProgress() %>% Complete</span>
                                        </div>   
                                    </div>
                                </div>
                                <%} %>
                                
                 				<%} %>
                                                    
                                                    </div>
                                                    <div class="tab-pane" id="settings-b2">
                                                    <% for(Coupon c : cList){ %>
                           		
                                <div class="card-box" style="width: 32.1%; display: inline-block; margin: 10px 10px 10px 0px;">
                                    <input type="hidden" value="<%= c.getcCode() %>"> 
                                     <button class="btn btn-sm btn-default pull-right" onclick="update(this);">자세히</button>
                                    <h6 class="text-muted m-t-0 text-uppercase"><%= c.getcStartDay().substring(0, 10) %>부터 <%= c.getcEndDay().substring(0,10) %>까지</h6>
                                    <h2 class="m-b-20"><span><%= c.getcName() %><br><%= formatter.format(c.getcDiscount()) %>원</span></h2> 
                                    <div class="progress progress-sm m-0">
                                    
                                    <% if(c.getProgress() > 50.0) {%>
                                        <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: <%= c.getProgress() %>%;">
                                            <span class="sr-only"><%= c.getProgress() %>% Complete</span>
                                        </div>
                                    <%}else if(c.getProgress() > 20.0) {%>    
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: <%= c.getProgress() %>%;">
                                            <span class="sr-only"><%= c.getProgress() %>% Complete</span>
                                        </div>
                                    <%}else{ %>   
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: <%= c.getProgress() %>%;">
                                            <span class="sr-only"><%= c.getProgress() %>% Complete</span>
                                        </div>
                                    <%} %>
                                        
                                    </div>
                                </div>
                                <%} %>
           
                                                    </div>
                                                </div>
                                            </div>
                                        </div> <!-- end col -->
                                    </div>
                       <form method="post" action="<%= request.getContextPath() %>/insertCoupon.ic" onsubmit="return validate();">
                       <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                    <h4>쿠폰 상세내역 작성하기</h4>
                                                </div>
                                                <div class="modal-body">
                                               	쿠폰 이름 : <input type="text" name="cName" id="cName" class="form-control" style="height: 36px; width: 150px; display: inline-block;">
                                               	 &nbsp;&nbsp;&nbsp;&nbsp;할인금액 :  <input type="text" name="cDiscount" id="cDiscount" class="form-control" style="height: 36px; width: 150px; display: inline-block;" >
                                               	<br><hr>
                                               	회원등급 : <div class="radio radio-inline">
                                               	&nbsp;&nbsp;
                                                <input type="radio" id="WELCOME" name="GRADE" value="D" >
                                                <label for="WELCOME"> WELCOME </label>
                                            </div>
                                            <div class="radio radio-inline radio-custom">
                                         <input type="radio" id="FAMILY" name="GRADE" value="C" >
                                         <label for="FAMILY" class="text-custom"> FAMILY </label>
                                    	 </div>
                                    	 <div class="radio radio-inline radio-info">
                                         <input type="radio" id="VIP" name="GRADE" value="B" >
                                         <label for="VIP" class="text-info"> VIP </label>
                                     	</div>
                                     	<div class="radio radio-inline radio-danger">
                                         <input type="radio" id="MVP" name="GRADE" value="A" >
                                         <label for="MVP" class="text-danger"> MVP </label>
                                     	</div>
                                  
                                     
                                     	<br><hr>
                            		시작일자  &nbsp;&nbsp;<input type="date" class="form-control" style="height: 36px; width: 155px; display: inline-block;" id="startDay" name="startDay" >&nbsp;&nbsp;
                            		부터  &nbsp;&nbsp;<input type="date" class="form-control" style="height: 36px; width: 155px; display: inline-block;" id="endDay" name="endDay">&nbsp;&nbsp;까지  
                                                   
                                                 
                                                </div>
                                                <div class="modal-footer">
                                                	
                                               		<button type="submit" class="btn btn-primary ">제출하기</button>
                                                    <button type="button" class="btn btn-default " data-dismiss="modal">닫기</button>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
                       </form>
  
                    </div>
                    <!-- end container -->

	<button class="btn btn-default " data-toggle="modal" data-target="#myModal_update" style="float: right; display: none;" id="updateModalBtn">수정하기</button>
					<!-- 수정하기 모달 -->
					<form method="post" action="<%= request.getContextPath() %>/updateCoupon.uc" onsubmit="return validate2();">
                       <div id="myModal_update" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                    <h4>코드번호 : <span id='update_code'></span></h4>
                                                    <input type="text" class="form-control" name="cCode" id='update_code1' readonly="readonly" style="height: 36px; width: 150px; display: none;"></input>
                                                </div>
                                                <div class="modal-body">
                                               	쿠폰 이름 : <input type="text" value="확인용" name="cName" id="cName" class="form-control" style="height: 36px; width: 150px; display: inline-block;">
                                               	 &nbsp;&nbsp;&nbsp;&nbsp;할인금액 :  <input type="text" name="cDiscount" id="cDiscount" class="form-control" style="height: 36px; width: 150px; display: inline-block;" >
                                               	<br><hr>
                                               	회원등급 : <div class="radio radio-inline">
                                               	&nbsp;&nbsp;
                                                <input type="radio" id="uWELCOME" name="GRADE" value="D" >
                                                <label for="uWELCOME"> WELCOME </label>
                                            </div>
                                            <div class="radio radio-inline radio-custom">
                                         <input type="radio" id="uFAMILY" name="GRADE" value="C" >
                                         <label for="uFAMILY" class="text-custom"> FAMILY </label>
                                    	 </div>
                                    	 <div class="radio radio-inline radio-info">
                                         <input type="radio" id="uVIP" name="GRADE" value="B" >
                                         <label for="uVIP" class="text-info"> VIP </label>
                                     	</div>
                                     	<div class="radio radio-inline radio-danger">
                                         <input type="radio" id="uMVP" name="GRADE" value="A" >
                                         <label for="uMVP" class="text-danger"> MVP </label>
                                     	</div>
                                  
                                     
                                     	<br><hr>
                            		시작일자  &nbsp;&nbsp;<input type="date" class="form-control" style="height: 36px; width: 155px; display: inline-block;" id="startDay" name="startDay" >&nbsp;&nbsp;
                            		부터  &nbsp;&nbsp;<input type="date" class="form-control" style="height: 36px; width: 155px; display: inline-block;" id="endDay" name="endDay">&nbsp;&nbsp;까지  
                                         <br><hr>
                                    	 남은일수: <span id='update_Remaining'></span>일   &nbsp;&nbsp; 지난일수: <span id='update_previus'></span>일    &nbsp;&nbsp; 전체일수: <span id='update_total'></span>일     
                                                 
                                                </div>
                                                <div class="modal-footer">
                                                	<button type="button" class="btn btn-danger" onclick="deleteBtn();">삭제하기</button>
                                               		<button type="submit" class="btn btn-primary ">수정하기</button>
                                                    <button type="button" class="btn btn-default " data-dismiss="modal">닫기</button>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
                       </form>




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
		
		document.getElementById('startDay').value = new Date().toISOString().substring(0, 10);
		
		
		window.onload = function(){

			
		}
		
		function deleteBtn(){
			
			var cCode = $("#update_code").text();
			
			location.href = "<%= request.getContextPath() %>/couponDelete.cd?cCode="+cCode;
			
		}
		
		
		
		
		function update(value){
			
			var cCode = $(value).parent().children().eq(0).val();
			
			
			
			<% for(Coupon c : cList){ %>
			
			if(cCode == '<%= c.getcCode() %>'){
				
				
				
				
				$("#myModal_update #cName").val('<%= c.getcName() %>');
				$("#myModal_update #cDiscount").val('<%= c.getcDiscount() %>');
				
				$('#myModal_update input[name="GRADE"]').each(function() {
					
					if($(this).val() == '<%= c.getcGrade() %>'){
						$(this).prop('checked', true);
						
					}
				    
				    
				});
				
				
				$("#myModal_update #startDay").val(new Date('<%= c.getcStartDay().substring(0,4) %>,<%= c.getcStartDay().substring(5,7) %>,<%= Integer.parseInt(c.getcStartDay().substring(8,10)) +1 %>').toISOString().substring(0, 10));
				$("#myModal_update #endDay").val(new Date('<%= c.getcEndDay().substring(0,4) %>,<%= c.getcEndDay().substring(5,7) %>,<%= Integer.parseInt(c.getcEndDay().substring(8,10)) +1 %>').toISOString().substring(0, 10));
				$("#update_code").text('<%= c.getcCode() %>');
				$("#update_code1").val('<%= c.getcCode() %>');
				$("#update_Remaining").text('<%= c.getRemaining() %>');
				$("#update_total").text('<%= c.getTotalRange() %>');
				$("#update_previus").text('<%= c.getPrevious() %>');
			}
			
		
			
			<% } %>
			
			
			
			$("#updateModalBtn").click();
			
			
			
		}
		
		
		
		
		$(function(){
			
			$("#pAll").change(function(){
		        if($(this).is(":checked")){
		        	 $("input[name=uType]").prop("checked",true);
		        }else{
		        	$("input[name=uType]").prop("checked",false);
		        }
		    });
			
			$("#gAll").change(function(){
		        if($(this).is(":checked")){
		        	 $("input[name=GRADE]").prop("checked",true);
		        }else{
		        	$("input[name=GRADE]").prop("checked",false);
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
			
			if($("#cName").val().trim() == ""){
				alert("쿠폰이름을 작성해주세요");
				
				$("#cName").focus();
				return false;
				
			}
			
			if($("#cDiscount").val().trim() == "" || isNaN($("#cDiscount").val()) == true ){
	        	
	        	alert("할인금액란을 확인해주세요");
	        	
	        	$("#cDiscount").focus();
	        	
	        	return false;
	        }
			

			if(!($("input:radio[name='GRADE']").is(":checked"))){
				
				alert("회원등급을 선택해주세요");
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
			
	        
			
		}
		
		function validate2(){
			
			if($("#myModal_update #cName").val().trim() == ""){
				alert("쿠폰이름을 작성해주세요");
				
				$("#myModal_update #cName").focus();
				return false;
				
			}
			
			if($("#myModal_update #cDiscount").val().trim() == "" || isNaN($("#myModal_update #cDiscount").val()) == true ){
	        	
	        	alert("할인금액란을 확인해주세요");
	        	
	        	$("#myModal_update #cDiscount").focus();
	        	
	        	return false;
	        }
			

			if(!($("#myModal_update input:radio[name='GRADE']").is(":checked"))){
				
				alert("회원등급을 선택해주세요");
				return false;	
			}
		
		
			var startDate = $( "#myModal_update #startDay" ).val(); //2017-12-10
	        var startDateArr = startDate.split('-');
	         
	        var endDate = $( "#myModal_update #endDay" ).val(); //2017-12-09
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
			
			
			
			
		}
		
	
		
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