<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.* , user.model.vo.*"%>
<%
	ArrayList<IpInfo> ipinfo =  (ArrayList<IpInfo>)request.getAttribute("ipinfo"); 
	String flag = (String)request.getAttribute("flag");
		
	String checkflag = ""; 
	
	if(flag.equalsIgnoreCase("N")){
		checkflag="checked";
	}
	
	
	

%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 메인 메뉴</title>
<!-- jqury cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script language="JavaScript" src="http://www.geoplugin.net/javascript.gp" type="text/javascript"></script>


<link rel="shortcut icon"
	href="<%= request.getContextPath() %>/resources/assets/images/favicon.ico">

<!-- DataTables -->
<link
	href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css">
<link
	href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/buttons.bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/responsive.bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/scroller.bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.colVis.css"
	rel="stylesheet" type="text/css">
<link
	href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/fixedColumns.dataTables.min.css"
	rel="stylesheet" type="text/css">



<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- Plugins css-->
<link
	href="<%= request.getContextPath() %>/resources/assets/plugins/bootstrap-tagsinput/css/bootstrap-tagsinput.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/resources/assets/plugins/switchery/switchery.min.css">
<link
	href="<%= request.getContextPath() %>/resources/assets/plugins/select2/css/select2.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%= request.getContextPath() %>/resources/assets/plugins/timepicker/bootstrap-timepicker.min.css"
	rel="stylesheet">
<link
	href="<%= request.getContextPath() %>/resources/assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css"
	rel="stylesheet">
<link
	href="<%= request.getContextPath() %>/resources/assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css"
	rel="stylesheet">
<link
	href="<%= request.getContextPath() %>/resources/assets/plugins/clockpicker/css/bootstrap-clockpicker.min.css"
	rel="stylesheet">
<link
	href="<%= request.getContextPath() %>/resources/assets/plugins/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">
<!-- Summernote css -->
<link
	href="<%= request.getContextPath() %>/resources/assets/plugins/summernote/summernote.css"
	rel="stylesheet" />


<!-- Bootstrap core CSS -->
<link
	href="<%= request.getContextPath() %>/resources/assets/css/bootstrap.min.css"
	rel="stylesheet">
<!-- MetisMenu CSS -->
<link
	href="<%= request.getContextPath() %>/resources/assets/css/metisMenu.min.css"
	rel="stylesheet">
<!-- Icons CSS -->
<link
	href="<%= request.getContextPath() %>/resources/assets/css/icons.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="<%= request.getContextPath() %>/resources/assets/css/style.css"
	rel="stylesheet">












<style type="text/css">
@
keyframes fadeInOpacity { 0%{
	opacity: 0
}

to {
	opacity: 1
}

}
:hover>*>.fbvd--wrapper {
	animation-name: fadeInOpacity;
	animation-duration: .3s;
	opacity: 1
}

.fbvd--wrapper {
	position: absolute;
	top: 10px;
	left: 10px;
	opacity: 0;
	text-align: center;
	margin: 0;
	z-index: 5
}

.fbvd--wrapper a {
	background:
		url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPjxzdmcgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiI+PHBhdGggZmlsbD0iIzRiNGY1NiIgZD0iTTggMTUuNWw3LjUtNy41aC00LjV2LThoLTZ2OGgtNC41eiI+PC9wYXRoPjwvc3ZnPg==)
		no-repeat 3px 4.55px;
	background-color: #fff;
	display: inline-block;
	font: 700 14px Helvetica, Arial, sans-serif;
	color: #4b4f56;
	text-decoration: none;
	vertical-align: middle;
	padding: 0px 8px 0px;
	margin-right: 8px;
	border-radius: 2px;
	line-height: 22px;
	padding-left: 19px;
	border: 1px solid #e7e7e7;
	background-size: 13px
}

.fbvd--wrapper a:last-child {
	margin-right: 0
}

.fbvd--wrapper a:hover {
	text-decoration: none
}

.fbvd--wrapper a:focus {
	box-shadow: 0 0 1px 2px rgba(88, 144, 255, .75), 0 1px 1px
		rgba(0, 0, 0, .15);
	outline: none
}

.fbvd--wrapper b {
	font-size: 13px;
	position: relative;
	top: 1px;
	color: #3b5998;
	font-weight: 400
}
</style>
<style type="text/css">
@
keyframes fadeInOpacity { 0%{
	opacity: 0
}

to {
	opacity: 1
}

}
:hover>*>.fbvd--wrapper {
	animation-name: fadeInOpacity;
	animation-duration: .3s;
	opacity: 1
}

.fbvd--wrapper {
	position: absolute;
	top: 10px;
	left: 10px;
	opacity: 0;
	text-align: center;
	margin: 0;
	z-index: 5
}

.fbvd--wrapper a {
	background:
		url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPjxzdmcgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiI+PHBhdGggZmlsbD0iIzRiNGY1NiIgZD0iTTggMTUuNWw3LjUtNy41aC00LjV2LThoLTZ2OGgtNC41eiI+PC9wYXRoPjwvc3ZnPg==)
		no-repeat 3px 4.55px;
	background-color: #fff;
	display: inline-block;
	font: 700 14px Helvetica, Arial, sans-serif;
	color: #4b4f56;
	text-decoration: none;
	vertical-align: middle;
	padding: 0px 8px 0px;
	margin-right: 8px;
	border-radius: 2px;
	line-height: 22px;
	padding-left: 19px;
	border: 1px solid #e7e7e7;
	background-size: 13px
}

.fbvd--wrapper a:last-child {
	margin-right: 0
}

.fbvd--wrapper a:hover {
	text-decoration: none
}

.fbvd--wrapper a:focus {
	box-shadow: 0 0 1px 2px rgba(88, 144, 255, .75), 0 1px 1px
		rgba(0, 0, 0, .15);
	outline: none
}

.fbvd--wrapper b {
	font-size: 13px;
	position: relative;
	top: 1px;
	color: #3b5998;
	font-weight: 400
}
</style>
</head>
<body cz-shortcut-listen="true">

	<div id="page-wrapper">

		<!-- Top Bar Start -->
		<%@ include file="../common/topnavbar.jsp" %>
		<!-- Top Bar End -->


		<!-- Page content start -->
		<div class="page-contentbar">

			<!--left navigation start-->
			<%@ include file="../common/userSidebar.jsp" %>
			<!--left navigation end-->

			<!-- START PAGE CONTENT -->
			<div id="page-right-content">

				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="p-0 text-center"></div>
							<!-- end card-box -->

						</div>
						<!-- end col -->
					</div>
					<!-- end row -->

					<div class="m-t-30">

						<div class="tab-content">
							<div class="tab-pane active" id="home-b1">
								<div class="row">
									<div class="col-md-4">
										<!-- Personal-Information -->
										<div class="panel panel-default panel-fill">
											<div class="panel-heading">
												<h3 class="panel-title">현재 로그인 정보</h3>
											</div>
											<div class="panel-body" id="ipi">
												<div class="m-b-20">
													<strong>접속국가</strong> <br>
													<p class="text-muted" id="ipc">&nbsp;</p>
												</div>
												<div class="m-b-20">
													<strong>지역</strong> <br>
													<p class="text-muted" id="ipr">&nbsp;</p>
												</div>
												<div class="m-b-20">
													<strong>아이피</strong> <br>
													<p class="text-muted" id="ipip">&nbsp;</p>
												</div>
											</div>
										</div>
										<!-- Personal-Information -->



										<!-- Social -->
										<div class="panel panel-default panel-fill">
											<div class="panel-heading">
												<h3 class="panel-title">해외 로그인 차단 관리</h3>
											</div>
											<div class="panel-body">
												<input id="ld1" type="checkbox"
													data-plugin="switchery" data-color="#1bb99a"
													data-switchery="true"
													style="display: none; display: inline;" <%= checkflag %>>
												<p id="ld2"></p>

											</div>
										</div>
										<!-- Social -->
									</div>

									<script>
        
           
                                        	$(function(){	
                                        		
                                        			var userNo = <%= loginUser.getUserNo() %>
                                        		
                                 
                                                    if($("#ld1").prop("checked")){
                                                        $("#ld2").text("해외 로그인 차단 중").css("color","green");
                                                    }else{
                                                    	$("#ld2").text("해외 로그인 허용 중").css("color","red");
                                                    }
                                                    
                                                    $("#desclist").click();
                                                    
                                                    $("#ld1").change(function(){
                                                        if($("#ld1").prop("checked")){
                                                           
                                                            
                                                            
                                            				$.ajax({
                                            					url : "<%= request.getContextPath() %>/block.user",
                                            					type : "post",
                                            					data : {flag:"N",userNo:userNo},
                                            					success: function(data){
                                            						
                                            						if(data=="success"){
                                            							alert("해외 로그인 차단설정이 성공적으로 이루졌습니다.");
                                            							 $("#ld2").text("해외 로그인 차단 중").css("color","green");
                                            						}else{
                                            							alert("해외 로그인 차단설정이 실패하였습니다.");
                                            						}
	
                                            					},
                                            					error: function(){
                                            						alert("통신 실패")
                                            					}
                                            				});
                
                                                        }else{
                                                        	
                                            				$.ajax({
                                            					url : "<%= request.getContextPath() %>/block.user",
                                            					type : "post",
                                            					data : {flag:"Y",userNo:userNo},
                                            					success: function(data){
                                            						
                                            						if(data=="success"){

                                                                    	alert("해외 로그인 접속 허용");
                                                                    	$("#ld2").text("해외 로그인 허용 중 ").css("color","red");
                                            							
                                            						}else{
                                            							alert("해외 로그인 접속허용 설정에 실패하였습니다.");
                                            						}
	
                                            					},
                                            					error: function(){
                                            						alert("통신 실패")
                                            					}
                                            				});
                                                        	
 	

                                                        }
                                                    	
                                                    	
                                                    });
                                                    
                                                    $('.form-validation').parsley();
                                                    $('.summernote').summernote({
                                                        height: 350,                 // set editor height
                                                        minHeight: null,             // set minimum height of editor
                                                        maxHeight: null,             // set maximum height of editor
                                                        focus: false                 // set focus to editable area after initializing summernote
                                                    });
                                                    
                                                    
                                                    //
                                                    
                                                    var country = geoplugin_countryName();
                                                    var region = geoplugin_region();
                                                    var ip = geoplugin_request(); 
                                                    
                                                    
                                                   setTimeout(function() {
                                                	   $("#ipc").text(country).css("color","green");
                                                	   $("#ipr").text(region).css("color","green");
                                                	   $("#ipip").text(ip).css("color","green");
                                                	   

                                          			  }, 500);
                                                    
                                                    
                                                    
                                                    
                                                    //
                                                    
        
                                        	});
                                        
                                        
                                        </script>


									<div class="col-md-8">
										<!-- Personal-Information -->
										<div class="panel panel-default panel-fill">
											<div class="panel-heading">
												<h3 class="panel-title">로그인 기록</h3>
											</div>
											<div class="panel-body">
												<div class="col-sm-12">


													<div class="table-responsive m-b-20">


														<div id="datatable_wrapper"
															class="dataTables_wrapper form-inline dt-bootstrap no-footer"
															style="width: 810px">
															<div class="row">
																<div class="col-sm-6">
																	<div class="dataTables_length" id="datatable_length"></div>
																</div>
															</div>
															<div class="row">
																<div class="col-sm-12">
																	<div id="datatable_wrapper"
																		class="dataTables_wrapper form-inline dt-bootstrap no-footer">
																		<div class="row">
																			<div class="col-sm-6">
																				<div class="dataTables_length" id="datatable_length">
																					<label></label>
																				</div>
																			</div>
																		</div>
																		<div class="row">
																			<div class="col-sm-12">
																				<div id="datatable_wrapper"
																					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
																					<div class="row">
																						<div class="col-sm-6">
																							<div class="dataTables_length"
																								id="datatable_length">
																								<label></label>
																							</div>
																						</div>
																						<div class="col-sm-6">
																							<div id="datatable_filter"
																								class="dataTables_filter">
																								<label></label>
																							</div>
																						</div>
																					</div>
																					<div class="row">
																						<div class="col-sm-12">
																							<table id="datatable"
																								class="table table-striped table-bordered dataTable no-footer"
																								role="grid" aria-describedby="datatable_info">
																								<thead>
																									<tr role="row">
																										<th class="sorting_desc" tabindex="0"
																											aria-controls="datatable" rowspan="1"
																											colspan="1"
																											aria-label="Name: activate to sort column ascending"
																											style="width: 234px;" aria-sort="descending" id="desclist">접속일시</th>
																										<th class="sorting" tabindex="0"
																											aria-controls="datatable" rowspan="1"
																											colspan="1"
																											aria-label="Position: activate to sort column ascending"
																											style="width: 343px;">아이피</th>
																										<th class="sorting" tabindex="0"
																											aria-controls="datatable" rowspan="1"
																											colspan="1"
																											aria-label="Office: activate to sort column ascending"
																											style="width: 185px;">접속국가</th>
																										<th class="sorting" tabindex="0"
																											aria-controls="datatable" rowspan="1"
																											colspan="1"
																											aria-label="Office: activate to sort column ascending"
																											style="width: 185px;">접속 성공 여부</th>
																									</tr>
																								</thead>


																								<tbody>

																									<% for(IpInfo i : ipinfo){ %>																								
																									<tr>
																										<td> <%= i.getDate() %></td>
																										<td> <%= i.getIp() %></td>
																										<td> <%= i.getCountry() %></td>
																										<td> <%= i.getSof() %></td>
																									</tr>																					
																									<% } %>
																									

																								</tbody>
																							</table>
																						</div>
																					</div>
																					<div class="row">
																						<div class="col-sm-6">
																							<div class="dataTables_info" id="datatable_info"
																								role="status" aria-live="polite">
																								</a>
																								</li>
																								</ul>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="row">
																			<div class="col-sm-6">
																				<div class="dataTables_info" id="datatable_info"
																					role="status" aria-live="polite"></div>
																			</div>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-sm-6"></div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- Personal-Information -->

									</div>

								</div>
							</div>
							<div class="tab-pane" id="profile-b1">
								<!-- Personal-Information -->
								<div class="panel panel-default panel-fill">
									<div class="panel-heading">
										<h3 class="panel-title">Edit Profile</h3>
									</div>
									<div class="panel-body">
										<form role="form">
											<div class="form-group">
												<label for="FullName">ㅈ</label> <input type="text"
													value="John Doe" id="FullName" class="form-control">
											</div>
											<div class="form-group">
												<label for="Email">Email</label> <input type="email"
													value="first.last@example.com" id="Email"
													class="form-control">
											</div>
											<div class="form-group">
												<label for="Username">Username</label> <input type="text"
													value="john" id="Username" class="form-control">
											</div>
											<div class="form-group">
												<label for="Password">Password</label> <input
													type="password" placeholder="6 - 15 Characters"
													id="Password" class="form-control">
											</div>
											<div class="form-group">
												<label for="RePassword">Re-Password</label> <input
													type="password" placeholder="6 - 15 Characters"
													id="RePassword" class="form-control">
											</div>
											<div class="form-group">
												<label for="AboutMe">About Me</label>
												<textarea style="height: 125px" id="AboutMe"
													class="form-control">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</textarea>
											</div>
											<button class="btn btn-primary waves-effect waves-light w-md"
												type="submit">Save</button>
										</form>

									</div>
								</div>
								<!-- Personal-Information -->
							</div>
						</div>
					</div>
				</div>
				<!-- end container -->

				<div class="footer">
					<div class="pull-right hidden-xs">
						
					</div>
					<div>
						<strong>OH ! DDO</strong> - Copyright © 2019
					</div>
				</div>
				<!-- end footer -->

			</div>
			<!-- End #page-right-content -->

		</div>
		<!-- end .page-contentbar -->
	</div>

	<!-- js placed at the end of the document so the pages load faster -->
	<script
		src="<%= request.getContextPath() %>/resources/assets/js/jquery-2.1.4.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/js/bootstrap.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/js/metisMenu.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/js/jquery.slimscroll.min.js"></script>

	<!-- Datatable js -->
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.bootstrap.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.buttons.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/buttons.bootstrap.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/jszip.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/pdfmake.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/vfs_fonts.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/buttons.html5.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/buttons.print.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.keyTable.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.responsive.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/responsive.bootstrap.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.scroller.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.colVis.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.fixedColumns.min.js"></script>

	<!-- init -->
	<script
		src="<%= request.getContextPath() %>/resources/assets/pages/jquery.datatables.init.js"></script>

	<!-- App Js -->
	<script
		src="<%= request.getContextPath() %>/resources/assets/js/jquery.app.js"></script>



	<!-- 버튼에관한 -->


	<!-- js placed at the end of the document so the pages load faster -->



	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/bootstrap-tagsinput/js/bootstrap-tagsinput.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/select2/js/select2.min.js"
		type="text/javascript"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/bootstrap-filestyle/js/bootstrap-filestyle.min.js"
		type="text/javascript"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/switchery/switchery.min.js"></script>
	<script type="text/javascript"
		src="<%= request.getContextPath() %>/resources/assets/plugins/parsleyjs/parsley.min.js"></script>

	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/moment/moment.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/timepicker/bootstrap-timepicker.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>


	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/assets/plugins/summernote/summernote.min.js"></script>

	<!-- form advanced init js -->


	<!-- App Js -->
	<script
		src="<%= request.getContextPath() %>/resources/	assets/js/jquery.app.js"></script>

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