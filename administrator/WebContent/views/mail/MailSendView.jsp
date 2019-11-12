<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, user.model.vo.*, java.text.DecimalFormat"%>
<%
	String msg = (String)session.getAttribute("msg");
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
      					 <h4 class="m-t-0 header-title">메일 보내기 메뉴 </h4>
      					 </div>
      					
      					</div>
      					
                        <div class="row">
                       
                        <form method="post" action="<%= request.getContextPath() %>/MailList.li" onsubmit="return validate();">
                            <div class="col-lg-6" align="center">
                                <div class="card-box">
                                
                                 <span style="font-weight: bold;">회원검색하기</span><!-- <span style="float: right;" id="rDetail">상세검색</span>  -->
                                <hr style="margin-top: 10px;">
                            		<div class="checkbox checkbox-inline checkbox-circle">
                                                <input type="checkbox" id="B" name="uType" value="B">
                                                <label for="B"> 사업자 </label>
                                            </div>
                                     <div class="checkbox checkbox-inline checkbox-circle">
                                         <input type="checkbox" id="U" name="uType" value="U">
                                         <label for="U"> 회원 </label>
                                    	 </div>
                                   
                                     <div class="checkbox checkbox-inline checkbox-circle">
                                         <input type="checkbox" id="pAll" name="" value="">
                                         <label for="pAll"> 전체선택 </label>
                                     </div>
                                     <br><hr>
                                     <div class="checkbox checkbox-inline checkbox-circle">
                                                <input type="checkbox" id="WELCOME" name="GRADE" value="D">
                                                <label for="WELCOME"> WELCOME </label>
                                            </div>
                                     <div class="checkbox checkbox-inline checkbox-circle">
                                         <input type="checkbox" id="FAMILY" name="GRADE" value="C">
                                         <label for="FAMILY" class="text-custom"> FAMILY </label>
                                    	 </div>
                                     <div class="checkbox checkbox-inline checkbox-circle">
                                         <input type="checkbox" id="VIP" name="GRADE" value="B">
                                         <label for="VIP" class="text-info"> VIP </label>
                                     	</div>
                                     	<div class="checkbox checkbox-inline checkbox-circle">
                                         <input type="checkbox" id="MVP" name="GRADE" value="A">
                                         <label for="MVP" class="text-danger"> MVP </label>
                                     	</div>	
                                     <div class="checkbox checkbox-inline checkbox-circle">
                                         <input type="checkbox" id="gAll" name="GRADE" value="F">
                                         <label for="gAll"> 전체선택 </label>
                                     </div>
                            		<br><hr>
                            		가입일자  &nbsp;&nbsp;<input type="date" style="height: 34px;" id="startDay" name="startDay">&nbsp;&nbsp;
                            		부터  &nbsp;&nbsp;<input type="date" style="height: 34px;" id="endDay" name="endDay">&nbsp;&nbsp;까지
                            		
                            		
                            		
                                    <button type="submit" class="btn btn-primary" onclick="searchSales();" style="vertical-align: 0;">검색</button> 
                                    <hr>
                                </div>
                            </div>
                            
                            <div class="col-lg-6" id="detailDiv">
                                <div class="card-box">
                      
                                </div></div>
                            </form>
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
		
		window.onload = function(){
			
			$("input[name=GRADE]").prop("checked",true);
			$("input[name=GRADE]").prop("disabled",true);
			
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
			
			
			$("#U,#B,#pAll").change(function(){
							
			if($("#U").is(":checked") && !($("#B").is(":checked"))){
				
				$("input[name=GRADE]").prop("disabled",false);
			}else{
				
				$("input[name=GRADE]").prop("disabled",true);
			}
			
			})
			
			
			
			
			
		});
		
		function validate(){
			
			
			if(!($("input:checkbox[name='uType']").is(":checked"))){
				
				alert("회원타입을 선택해주세요");
				return false;	
			}
			
			if(!($("input:checkbox[name='GRADE']").is(":checked"))){
				
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
			
	        $("input[name=GRADE]").prop("disabled",false);
			
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