<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, user.model.vo.*, java.text.DecimalFormat"%>
<%
	
	ArrayList<User> UserList = (ArrayList<User>)request.getAttribute("UserList");
	
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

       <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/assets/images/favicon.ico">
  <!-- Plugins css-->
        <link href="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap-tagsinput/css/bootstrap-tagsinput.css" rel="stylesheet" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/plugins/switchery/switchery.min.css">
        <link href="<%=request.getContextPath()%>/resources/assets/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/resources/assets/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/assets/plugins/clockpicker/css/bootstrap-clockpicker.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
        <!-- Summernote css -->
        <link href="<%=request.getContextPath()%>/resources/assets/plugins/summernote/summernote.css" rel="stylesheet" />

		<!-- 썸머노트한글 -->
		<script src="<%=request.getContextPath()%>/resources/lang/summernote-ko-KR.js?after"></script>


        <!-- Bootstrap core CSS -->
        <link href="<%=request.getContextPath()%>/resources/assets/css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="<%=request.getContextPath()%>/resources/assets/css/metisMenu.min.css" rel="stylesheet">
        <!-- Icons CSS -->
        <link href="<%=request.getContextPath()%>/resources/assets/css/icons.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="<%=request.getContextPath()%>/resources/assets/css/style.css" rel="stylesheet">
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
                                    <h4 class="m-t-0">검색된 회원 총 : <%= UserList.size() %>명 <button type="button" class="btn btn-default " data-toggle="modal" data-target="#myModal" style="float: right;">상세보기</button></h4>
                                    <table class="table table table-hover m-0">
                                                <thead>
                                                    <tr>
                                                        <th>타입</th>
                                                        <th>이름</th>
                                                        <th>이메일주소</th>
                                                      	<th>등급</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <% if(UserList.size() <= 5){ %>
     											<% for(User u : UserList){ %>
                                                	<tr>
                                                	<th scope="row">
                                                		<% if(u.getUserType().equalsIgnoreCase("U")) {%>
                                                		회원
                                                		<%}else{ %>
                                                		사업자
                                                		<%} %>
                                                		</th>
                                                		<td><%= u.getUserName() %></td>
                                                		<td><%= u.getEmail() %></td>
                                                		<% if(u.getUserType().equalsIgnoreCase("U")) {%>
                                                		<td><%= u.getGrade() %></td>
                                                		<%}else{ %>
                                                		<td>없음</td>
                                                		<%} %>
                                                	</tr>
                                                <%} %>	
        										<%}else{ %>
        										<% for(int i = 0; i < 5; i++){ %>
                                                	<tr>
                                                	<th scope="row">
                                                		<% if(UserList.get(i).getUserType().equalsIgnoreCase("U")) {%>
                                                		회원
                                                		<%}else{ %>
                                                		사업자
                                                		<%} %>
                                                		</th>
                                                		<td><%= UserList.get(i).getUserName() %></td>
                                                		<td><%= UserList.get(i).getEmail() %></td>
                                                		
                                                		<% if(UserList.get(i).getUserType().equalsIgnoreCase("U")) {%>
                                                		<td><%= UserList.get(i).getGrade() %></td>
                                                		<%}else{ %>
                                                		<td>없음</td>
                                                		<%} %>
                                                	</tr>
                                                <%} %>	
        										
        										<%} %>
                                                </tbody>
                                            </table>
                                   
                                </div></div>
                            </form>
                        </div>
						
						<form method="get" action="mailSend.jsp" onsubmit="return validate2();">
						<div class="row">
                            <div class="col-sm-12">
                            <h4 class="header-title m-t-0">메일내용작성란 <button class="btn btn-default" style="margin-left: 1000px;">제출하기</button></h4>
                            <div class="card-box">
                                <div class="p-20 m-b-20">
                                
                                
									<input type="text" class="form-control" placeholder="제목을 입력하세요" id="mTitle">
									<hr>
									<div class="summernote">
										
                                        
									</div>
									
									
								</div>
								</div>
                            </div>
                        </div>
						</form>
						
					<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                    <h4>검색된 전체회원 리스트</h4>
                                                
                                                </div>
                                                <div class="modal-body">
                                         
                                                     <table class="table table table-hover m-0">
                                                <thead>
                                                    <tr>
                                                        <th>타입</th>
                                                        <th>이름</th>
                                                        <th>이메일주소</th>
                                                      	<th>등급</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                
     											<% for(User u : UserList){ %>
                                                	<tr>
                                                	<th scope="row">
                                                		<% if(u.getUserType().equalsIgnoreCase("U")) {%>
                                                		회원
                                                		<%}else{ %>
                                                		사업자
                                                		<%} %>
                                                		</th>
                                                		<td><%= u.getUserName() %></td>
                                                		<td><%= u.getEmail() %></td>
                                                		<% if(u.getUserType().equalsIgnoreCase("U")) {%>
                                                		<td><%= u.getGrade() %></td>
                                                		<%}else{ %>
                                                		<td>없음</td>
                                                		<%} %>
                                                	</tr>
                                                <%} %>	

                                                </tbody>
                                            </table>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default " data-dismiss="modal">Close</button>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->


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
		
		function validate2(){
			
			if($("#mTitle").val().trim() == ""){
				
				alert("제목을 입력하세요");
				return false;
			}
			
			var text1 = $(".summernote").text();
			
			console.log(text1);
			
			
			return false;
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
        <script src="<%=request.getContextPath()%>/resources/assets/plugins/summernote/summernote.js?after"></script>
		
		
        <!-- form advanced init js -->
        <script src="<%=request.getContextPath()%>/resources/assets/pages/jquery.form-advanced.init.js"></script>

        <!-- App Js -->
        <script src="<%=request.getContextPath()%>/resources/assets/js/jquery.app.js"></script>

        <script type="text/javascript">
            $(document).ready(function() {
                $('.form-validation').parsley();
                $('.summernote').summernote({
                    height: 350,                 // set editor height
                    minHeight: null,             // set minimum height of editor
                    maxHeight: null,             // set maximum height of editor
                    focus: false                 // set focus to editable area after initializing summernote
                });
            });
        </script>



</body>
</html>