<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="grade.model.vo.*, java.util.*, java.text.DecimalFormat"%>
<%
	String msg = (String)session.getAttribute("msg");	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 정보 등록 페이지</title>
		<!-- jqury cdn -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
        <meta charset="utf-8" />
        <title>SimpleAdmin - Responsive Admin Dashboard Template</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/assets/images/favicon.ico">
        
        <!-- DataTables -->
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/scroller.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.colVis.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/datatables/fixedColumns.dataTables.min.css" rel="stylesheet" type="text/css"/>
		
		 <!-- Plugins css-->
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/bootstrap-tagsinput/css/bootstrap-tagsinput.css" rel="stylesheet" />
        <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/assets/plugins/switchery/switchery.min.css">
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
		<link href="<%= request.getContextPath() %>/resources/assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
		<link href="<%= request.getContextPath() %>/resources/assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
		<link href="<%= request.getContextPath() %>/resources/assets/plugins/clockpicker/css/bootstrap-clockpicker.min.css" rel="stylesheet">
		<link href="<%= request.getContextPath() %>/resources/assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
		
		
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
		#usergrade:hover{
			background: #c4dbf4;	
		}
		
		#sa-success{
			display:none;
		}
		
		.form-control {
			display:inline-block;
		}
		
		.siteoptions2, .siteoptions3 {
			display: none;
		}
		
		</style>
		
	<script type="text/javascript">
	var msg = "<%= msg %>";
	$(function(){
		if(msg != "null"){
			
			$("#sa-success").click();
			<% session.removeAttribute("msg"); %>
		}
	});
	
	$(function(){
		
		$("#addOption1").click(function(){
			
			 if($(".siteoptions2").css("display") == "none"){   
				 	$(".siteoptions2").show();   
			    } else {  
			    	$(".siteoptions2").hide(); 
			    }  
		})
		
		$("#addOption2").click(function(){
			
			 if($(".siteoptions3").css("display") == "none"){   
				 	$(".siteoptions3").show();   
			    } else {  
			    	$(".siteoptions3").hide(); 
			    }  
		})
		
	})
	
	
	/* function addOption() {
		alert("dkdk");
		
		 if($(".siteoptions2").css("display") == "none"){   
			 	$(".siteoptions2").show();   
		    } else {  
		    	$(".siteoptions2").hide(); 
		    }  

	}; */
	
	


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
                <%@ include file="../common/campSidebar.jsp" %>
                <!--left navigation end-->

                <!-- START PAGE CONTENT -->
                <div id="page-right-content">

                   <div class="container">
					<div class="row">
						<div class="col-sm-12">
							<h4 class="m-b-20 header-title">캠핑장 정보 등록</h4>

							<!-- 1_1. 등록 폼 시작 -->
							<div class="row">
								<div class="col-md-6">
									<form class="form-horizontal" role="form" id="campInsertForm"
									action="<%= request.getContextPath() %>/insert.ca" method="post" enctype="multipart/form-data">
										
										<div class="form-group">
											<label class="col-md-2 control-label">캠핑장 이름</label>
											<div class="col-md-10">
												<input type="text" class="form-control" name="campName">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label">사업자 번호</label>
											<div class="col-md-10">
												<input type="text" class="form-control" name="operatorNo">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label">사업자 이름</label>
											<div class="col-md-10">
												<input type="text" class="form-control" name="operatorName">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label">주소</label>
											<div class="col-md-10">
												<input type="text" class="form-control"
													placeholder="정확한 주소를 입력해주세요." name="campAddress">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label">전화번호</label>
											<div class="col-md-10">
												<input type="text" class="form-control" name="campPhone">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label">홈페이지 주소</label>
											<div class="col-md-10">
												<input type="text" class="form-control" value="htttp://" name="campUrl">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">테마 선택</label>
											<div class="col-sm-10">
												<select class="form-control" name="campTheme">
													<option id="mountain" value="1">산</option>
													<option id="river" value="2">강</option>
													<option id="sea" value="3">바다</option>
													<option id="etc" value="4">기타</option>
												</select>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-2 control-label">사이트 정보</label>
											<div class="col-sm-10">
												<div class="siteoptions">
													<button type="button" class="btn btn-secondary btn-sm" id="addOption1">+</button>
														<select class="form-control" name="siteoption">
															<option>사이트 명</option>
															<option value="ST1">파쇄석(소)</option>
															<option value="ST2">파쇄석(대)</option>
															<option value="ST3">글램핑</option>
															<option value="ST4">카라반</option>
															<option value="ST5">팬션</option>
															<option value="ST6">데크</option>
															<option value="ST7">기타</option>
													</select>
												
												
													<input id="siteprice" type="text" class="form-control" name="siteprice" placeholder="가격(원)" size="3">
													<input id="sitecount" type="text" class="form-control" name="sitecount" placeholder="보유 수량" size="3">
													<input id="personcost" type="text" class="form-control" name="personcost" placeholder="추가인원요금(원)">
													<input id="mindate" type="text" class="form-control" name="mindate" placeholder="최소숙박기간">
													<input id="maxdate" type="text" class="form-control" name="maxdate" placeholder="최대숙박기간">
													<input id="personlimit" type="text" class="form-control" name="personlimit" placeholder="최대숙박인원(명)">
													
												</div>
												
												
											
												
											</div>
										</div> 
										
										
										<div class="form-group">
											<label class="col-md-2 control-label">추가 옵션 정보</label>
											
										</div>
										
										<div class="form-group">
											<label class="col-md-2 control-label">차량 추가 비용</label>
											<div class="col-md-10">
												<input type="text" class="form-control" name="carcost" >
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-md-2 control-label">추가 비용</label>
											<div class="col-md-10">
												<input type="text" class="form-control" name="additionalcost" >
											</div>
										</div>


										<div class="m-b-20">
											<label class="col-md-2 control-label">시설현황 선택</label>
											<div class="col-sm-10">
												<table class="table table-bordered m-0">

													<tbody>
														<tr>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="전기"> 
																	<label for="checkbox-15">전기</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-14" type="checkbox" name="optional" value="샤워실"> <label
																		for="checkbox-14">샤워실</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="수세식"> <label
																		for="checkbox-15">수세식</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="화로사용"> <label
																		for="checkbox-15">화로사용</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="와이파이"> <label
																		for="checkbox-15">와이파이</label>
																</div>
															</td>
														</tr>
														<tr>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="동계가능"> <label
																		for="checkbox-15">동계가능</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="팬션민박"> <label
																		for="checkbox-15">팬션/민박</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="데크"> <label
																		for="checkbox-15">데크</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="잔디"> <label
																		for="checkbox-15">잔디</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="카라반"> <label
																		for="checkbox-15">카라반</label>
																</div>
															</td>
														</tr>
														<tr>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="글램핑"> <label
																		for="checkbox-15">글램핑</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="온수"> <label
																		for="checkbox-15">온수</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="난로대여"> <label
																		for="checkbox-15">난로대여</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="파쇄석"> <label
																		for="checkbox-15">파쇄석</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="썰매장"> <label
																		for="checkbox-15">썰매장</label>
																</div>
															</td>
														</tr>
														<tr>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="물놀이가능"> <label
																		for="checkbox-15">물놀이가능</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="애견가능"> <label
																		for="checkbox-15">애견가능</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="놀이터"> <label
																		for="checkbox-15">놀이터</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="낚시"> <label
																		for="checkbox-15">낚시</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="매점"> <label
																		for="checkbox-15">매점</label>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										
										<div class="row">
											<div class="col-sm-12">
											
												<div class="p-20 m-b-20">

													<div class="row">
														

															<div class="">

																	<div class="form-group">
																		<label class="col-md-2 control-label">예약가능시작일</label>
																		<div class="col-sm-10">
																			<input type="text" class="form-control"
																				placeholder="mm/dd/yyyy" id="datepicker-autoclose" name="availableDate">
																			<span class="input-group-addon bg-custom b-0"><i
																				class="mdi mdi-calendar text-white"></i></span>
																		</div>
																	</div>
															</div>
													
														<div class="col-sm-10">
															<label class="col-md-2 control-label">포스팅 제휴 여부</label>

															<div class="radio radio-info radio-inline">
																<input type="radio" id="inlineRadio1" value="1"
																	name="posting" checked> <label
																	for="inlineRadio1"> 유료 포스팅 서비스 가입 </label>
															</div>
															<div class="radio radio-inline">
																<input type="radio" id="inlineRadio2" value="2"
																	name="posting"> <label for="inlineRadio2">
																	미가입 </label>
															</div>
														</div>
														
												<div class="col-md-10">
													<label class="col-md-2 control-label">환불 규정</label>
													<div class="col-md-10">
													<textarea class="form-control" rows="5" id="refund" name="refund"></textarea>
													</div>
												</div>	
												
												<div class="col-md-10">
													<label class="col-md-2 control-label">제안/기타</label>
													<div class="col-md-10">
													<textarea class="form-control" rows="5" id="suggest" name="suggest"></textarea>
													</div>
												</div>		
												
												
										<div class="form-group">
										
                                            <label class="control-label">캠핑장 사진 첨부 1</label>
                                            <input type="file" class="filestyle" data-buttonname="btn-default" id="campPic1" name="campPic1">
                                        </div>	
                                        
                                        <div class="form-group">
                                            <label class="control-label">캠핑장 사진 첨부 2</label>
                                            <input type="file" class="filestyle" data-buttonname="btn-default" id="campPic2" name="campPic2">
                                        </div>		
                                        
                                        <div class="form-group">
                                            <label class="control-label">캠핑장 사진 첨부 3</label>
                                            <input type="file" class="filestyle" data-buttonname="btn-default" id="campPic3" name="campPic3">
                                        </div>		
                                        
                                        <div class="form-group">
                                            <label class="control-label">캠핑장 사진 첨부 4</label>
                                            <input type="file" class="filestyle" data-buttonname="btn-default" id="campPic4" name="campPic4">
                                        </div>		
                                        
                                        <div class="form-group">
                                            <label class="control-label">캠핑장 사진 첨부 5</label>
                                            <input type="file" class="filestyle" data-buttonname="btn-default" id="campPic5" name="campPic5">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label">사업자 등록증 첨부</label>
                                            <input type="file" class="filestyle" data-buttonname="btn-default" id="campPic6" name="campPic6">
                                        </div>	
                                        
                                        <div class="form-group">
                                            <label class="control-label">캠핑장 전도 첨부</label>
                                            <input type="file" class="filestyle" data-buttonname="btn-default" id="campPic7" name="campPic7">
                                        </div>
                                       
                                        
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <button type="submit" class="btn btn-default waves-effect waves-light btn-sm"
                                                    id="joinBtn">등록 신청</button>
                                                    
                                                
                                            </div>
                                            <!-- end col -->
                                    
                                        </div>
                                        <!-- end row -->
												
									</form>													
									
								</div>
							</div>


						</div>
					</div>

				</div>

			</div>
			<!-- end row -->


		


		<div class="row">
			<div class="col-sm-12"></div>
		</div>
	</div>
	</div>

	</div>
	<!-- end container -->
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

		<script src="<%= request.getContextPath() %>/resources/assets/plugins/bootstrap-tagsinput/js/bootstrap-tagsinput.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/select2/js/select2.min.js" type="text/javascript"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/bootstrap-filestyle/js/bootstrap-filestyle.min.js" type="text/javascript"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/switchery/switchery.min.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/resources/assets/plugins/parsleyjs/parsley.min.js"></script>

        <script src="<%= request.getContextPath() %>/resources/assets/plugins/moment/moment.js"></script>
     	<script src="<%= request.getContextPath() %>/resources/assets/plugins/timepicker/bootstrap-timepicker.js"></script>
     	<script src="<%= request.getContextPath() %>/resources/assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
     	<script src="<%= request.getContextPath() %>/resources/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
     	<script src="<%= request.getContextPath() %>/resources/assets/plugins/clockpicker/js/bootstrap-clockpicker.min.js"></script>
     	<script src="<%= request.getContextPath() %>/resources/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/summernote/summernote.min.js"></script>

        <!-- form advanced init js -->
        <script src="<%= request.getContextPath() %>/resources/assets/pages/jquery.form-advanced.init.js"></script>



		<!-- init -->
        <script src="<%= request.getContextPath() %>/resources/assets/pages/jquery.datatables.init.js"></script>

		<!-- Sweet-Alert  -->
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/sweet-alert2/sweetalert2.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/pages/jquery.sweet-alert.init.js"></script>


        <!-- App Js -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.app.js"></script>

		

</body>
</html>






























