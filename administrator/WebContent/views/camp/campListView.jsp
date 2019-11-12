<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, camp.model.vo.*"%>    
<%	
	ArrayList<CampInfo> cList = (ArrayList<CampInfo>)request.getAttribute("cList");
	ArrayList<Attachment> aList = (ArrayList<Attachment>)request.getAttribute("aList");
	String msg = (String)session.getAttribute("msg");

	int index = 1;
	
	String[] sArr = new String[20];
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

		<!-- jqury cdn -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
        <meta charset="utf-8" />
        <title>사업장 승인 페이지</title>
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
	#detail_box{
		display:none;
	}
	
	</style>
	
	<script>
		var msg = "<%= msg %>";
		$(function(){
		if(msg != "null"){
			
			$("#sa-success").click();
			<% session.removeAttribute("msg"); %>
		}
		});
		
	</script>

	<style type="text/css">
		#sa-success{
			display:none;
		}
		
		img:hover{
		cursor: pointer;
		}
		
		#detail_box th{
		background-color: #f9f9f9;
		}
		
	</style>

	<script type="text/javascript">
		

		function closeBtn(){
			
			$("#detail_box").css("display","none");
		}
		
		code = 0;
		
		function update(value){
			
			$("#detail_box").css("display","block");
			
			$("#campName").html('');
			$("#phone").html('');
			$("#adderess").html('');
			$("#homepage").html('');
			$("#tema").html('');
			$("#post").html('');
			$("#reDay").html('');
		/* 	$("#now").html(''); */
		 /* $("#refund").html('');  */
			$("#etc").html('');
			$("#picture").html('');
			$("#code").val('');
			

			var cNo = $(value).parent().parent().children().eq(0).val();
						
			<% for(CampInfo ca : cList) {%>
			
				if(cNo == (<%= ca.getcCode() %> +"")){
					
					
					<% 
						
						for(int i = 0; i < sArr.length; i++){
							
							sArr[i] = "";
						}
					
						String[] test1 = ca.getcOption().split(",");
	
						
						for(int i = 0; i < test1.length; i++){
	
							switch(test1[i]){
							case "전기" : sArr[0] = "true"; break;
							case "샤워실" : sArr[1] = "true"; break;
							case "수세식" : sArr[2] = "true"; break;
							case "화로사용" : sArr[3] = "true"; break;
							case "와이파이" : sArr[4] = "true"; break;
							case "동계가능" : sArr[5] = "true"; break;
							case "팬션/민박" : sArr[6] = "true"; break;
							case "데크" : sArr[7] = "true"; break;
							case "잔디" : sArr[8] = "true"; break;
							case "카라반" : sArr[9] = "true"; break;
							case "글램핑" : sArr[10] = "true"; break;
							case "온수" : sArr[11] = "true"; break;
							case "난로대여" : sArr[12] = "true"; break;
							case "파쇄석" : sArr[13] = "true"; break;
							case "썰매장" : sArr[14] = "true"; break;
							case "물놀이가능" : sArr[15] = "true"; break;
							case "애견가능" : sArr[16] = "true"; break;
							case "놀이터" : sArr[17] = "true"; break;
							case "낚시" : sArr[18] = "true"; break;
							case "매점" : sArr[19] = "true"; break;
							}

						}

					%>
					
					$("#checkbox-1").prop("checked", '<%= sArr[0] %>');
					$("#checkbox-2").prop("checked", '<%= sArr[1] %>');
					$("#checkbox-3").prop("checked", '<%= sArr[2] %>');
					$("#checkbox-4").prop("checked", '<%= sArr[3] %>');
					$("#checkbox-5").prop("checked", '<%= sArr[4] %>');
					$("#checkbox-6").prop("checked", '<%= sArr[5] %>');
					$("#checkbox-7").prop("checked", '<%= sArr[6] %>');
					$("#checkbox-8").prop("checked", '<%= sArr[7] %>');
					$("#checkbox-9").prop("checked", '<%= sArr[8] %>');
					$("#checkbox-10").prop("checked", '<%= sArr[9] %>');
					$("#checkbox-11").prop("checked", '<%= sArr[10] %>');
					$("#checkbox-12").prop("checked", '<%= sArr[11] %>');
					$("#checkbox-13").prop("checked", '<%= sArr[12] %>');
					$("#checkbox-14").prop("checked", '<%= sArr[13] %>');
					$("#checkbox-15").prop("checked", '<%= sArr[14] %>');
					$("#checkbox-16").prop("checked", '<%= sArr[15] %>');
					$("#checkbox-17").prop("checked", '<%= sArr[16] %>');
					$("#checkbox-18").prop("checked", '<%= sArr[17] %>');
					$("#checkbox-19").prop("checked", '<%= sArr[18] %>');
					$("#checkbox-20").prop("checked", '<%= sArr[19] %>');
					

					
					
					
					
					
					
					
					code = "<%= ca.getcCode() %>"
					var $td1 = "<%= ca.getcName() %>"
					var $td2 = "<%= ca.getcAddress() %>"
					var $td3 = "<%= ca.getcPhone() %>"
					var $td4 = "<%= ca.getcUrl() %>"
					var $td5 = $("<td>");
				
					<% if(ca.getcTheme() == 1){ %>
					var $td6 = "산"
					<%}else if(ca.getcTheme() == 2){ %>
					var $td6 = "강"
					<%}else if(ca.getcTheme() == 3){ %>
					var $td6 = "바다"
					<%}else {%>
					var $td6 = "기타"
					<%} %>
					
					var $td7 = "<%= ca.getcOption() %>"
					var $td8 = "<%= ca.getcAvailableDate() %>"
					var $td9 = "<%= ca.getcPosting() %>"
					<%-- var $td10 = "<%= ca.getcRefundment() %>" --%>
					var $td11 = "<%= ca.getcEtc() %>"
								
					
					<% for(int i = 0; i < aList.size(); i++) { %>
					
					if(cNo == <%= aList.get(i).getcCode() %>){
					
					var $liImg = $("<img src='<%= request.getContextPath() + aList.get(i).getFilePath() + aList.get(i).getChangeName() %>' width='300px' height='200px' onclick='test(this);'>");	
						
						$td5.append($liImg);
											
					}
										
					<% } %>
					
					
					$("#code").val(code);
					$("#campName").append($td1);
					$("#phone").append($td3);
					$("#adderess").append($td2);
					$("#homepage").append($td4);
					$("#tema").append($td6);
					$("#post").append($td9);
					$("#reDay").append($td8);
				/* 	$("#now").append($td7); */
				  /*   $("#refund").after($td10);   */
					$("#etc").append($td11);
					$("#picture").append($td5);
		
					       
				}
			
			<%} %>
			
		
				
		}
		

		function approval(value){
			
			if(confirm("정말로 승인하시겠습니까?")){
			location.href = "<%= request.getContextPath() %>/update.ca?cNo="+code;
			}
	
		}
		

		function test(value){
			
			 var src = $(value).attr('src');
			 
			 img1= new Image(); 
			 img1.src=(src); 
			 
			 W=img1.width; 
			 H=img1.height; 
			 O="width="+W+",height="+H+",scrollbars=yes"; 
	 		 
			 imgWin=window.open("","",O); 
			 imgWin.document.write("<html><head><title>:*:*:*: 이미지상세보기 :*:*:*:*:*:*:</title></head>");
			 imgWin.document.write("<body topmargin=0 leftmargin=0>");
			 imgWin.document.write("<img src="+src+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
			 imgWin.document.close();
	
			
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
							
								<h4 class="m-t-0 header-title">사업장 관리 메뉴</h4>

                                <div class="table-responsive m-b-20">
                                    <h5><b>사업장 승인 신청 내역</b></h5>
                                    <p class="text-muted font-13 m-b-30">
                                        현재 오또캠핑에 등록하고자 하는 사업장들의 내역이 나타납니다.
                 <br> 승인대기는 사업자가 신청서를 작성하고 관리자의 최종 승인을 기다리는 단계입니다.
                 <br> 상세보기를 하면 승인 대기 중인 사업장을 승인할 수 있습니다.      
                                    </p>

                                    <table id="datatable" class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th>신청번호</th>
                                            <th>캠핑장명</th>
                                            <th>주소</th>
                                            <th>연락처</th>
                                            <th>사업자명</th>
                                            <th>상세보기</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <% for(CampInfo ci : cList){ %>
											<tr id="usergrade">
												<input type="hidden" value="<%= ci.getcCode() %>">
												<td><%= index++ %></td>
												<td><%= ci.getcName() %></td>
												<td><%= ci.getcAddress() %></td>
												<td><%= ci.getcPhone() %></td>
												<td><%= ci.getcOperName() %></td>
												<td><button class="btn btn-primary btn-xs" type="button" onclick="update(this);">상세보기</button></td>	
											</tr>
										<%} %>
                                        </tbody>
                                    </table>
                                </div>
                                
							</div>
						</div>
                        <!--end row -->

                        <div class="row" id="detail_box">
                            <div class="col-sm-12"> 
                                <h4 class="m-t-0 header-title">사업장 상세 내역</h4>
                               	 <table class="table table-bordered m-0" style="text-align: center;">
												<input type="hidden" value="" id="code">
                                                <thead>
                                                    <tr>
                                                        <th style="text-align: center;">캠핑장명</th>
                                                        <td id="campName" style="text-align: center;" colspan="2"></td>
                                                		<th style="text-align: center;">전화번호</th>
                                                		<td id="phone" style="text-align: center;"  colspan="2"></td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th style="text-align: center;">주소</th>
                                                        <td  id="adderess" style="text-align: center;"  colspan="5"></td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <th style="text-align: center;">홈페이지</th>
                                                        <td id="homepage" style="text-align: center;"  colspan="2"></td>
                                                        <th style="text-align: center;">테마</th>
                                                        <td id="tema" style="text-align: center;"  colspan="2"></td>     
                                                    </tr>
                                                    <tr>
                                                        <th style="text-align: center;">포스팅 서비스 제휴 여부</th>
                                                        <td id="post" style="text-align: center;"  colspan="2"></td>
                                                        <th style="text-align: center;">예약시작가능일</th>
                                                        <td id="reDay" style="text-align: center;"  colspan="2"></td> 
                                                    </tr>  
                                                    <tr>
                                                     <th rowspan="4" style="text-align: center;">시설현황</th>
                                                     <td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-1" type="checkbox" name="optional" value="전기"  <%= sArr[0] %>> 
																	<label for="checkbox-1">전기</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-2" type="checkbox" name="optional" value="샤워실" <%= sArr[1] %>> <label
																		for="checkbox-2">샤워실</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-3" type="checkbox" name="optional" value="수세식" <%= sArr[2] %>> <label
																		for="checkbox-3">수세식</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-4" type="checkbox" name="optional" value="화로사용" <%= sArr[3] %>> <label
																		for="checkbox-4">화로사용</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-5" type="checkbox" name="optional" value="와이파이" <%= sArr[4] %>> <label
																		for="checkbox-5">와이파이</label>
																</div>
															</td>
														</tr>
														<tr>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-6" type="checkbox" name="optional" value="동계가능" <%= sArr[5] %>> <label
																		for="checkbox-6">동계가능</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-7" type="checkbox" name="optional" value="팬션민박" <%= sArr[6] %>> <label
																		for="checkbox-7">팬션/민박</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-8" type="checkbox" name="optional" value="데크" <%= sArr[7] %>> <label
																		for="checkbox-8">데크</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-9" type="checkbox" name="optional" value="잔디" <%= sArr[8] %>> <label
																		for="checkbox-9">잔디</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-10" type="checkbox" name="optional" value="카라반" <%= sArr[9] %>> <label
																		for="checkbox-10">카라반</label>
																</div>
															</td>
														</tr>
														<tr>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-11" type="checkbox" name="optional" value="글램핑" <%= sArr[10] %>> <label
																		for="checkbox-11">글램핑</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-12" type="checkbox" name="optional" value="온수" <%= sArr[11] %>> <label
																		for="checkbox-12">온수</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-13" type="checkbox" name="optional" value="난로대여" <%= sArr[12] %>> <label
																		for="checkbox-13">난로대여</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-14" type="checkbox" name="optional" value="파쇄석" <%= sArr[13] %>> <label
																		for="checkbox-14">파쇄석</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-15" type="checkbox" name="optional" value="썰매장" <%= sArr[14] %>> <label
																		for="checkbox-15">썰매장</label>
																</div>
															</td>
														</tr>
														<tr>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-16" type="checkbox" name="optional" value="물놀이가능" <%= sArr[15] %>> <label
																		for="checkbox-16">물놀이가능</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-17" type="checkbox" name="optional" value="애견가능" <%= sArr[16] %>> <label
																		for="checkbox-17">애견가능</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-18" type="checkbox" name="optional" value="놀이터" <%= sArr[17] %>> <label
																		for="checkbox-18">놀이터</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-19" type="checkbox" name="optional" value="낚시" <%= sArr[18] %>> <label
																		for="checkbox-19">낚시</label>
																</div>
															</td>
															<td>
																<div class="checkbox checkbox-dark checkbox-circle">
																	<input id="checkbox-20" type="checkbox" name="optional" value="매점" <%= sArr[19] %>> <label
																		for="checkbox-20">매점</label>
																</div>
															</td>
														</tr>
                                                     <tr>
                                                    </tr>
                                                    <tr id="refund">
                                                     <th rowspan="6" style="text-align: center;">환불규정</th>
                                                     <th colspan='3' style="text-align: center;">사용예정일기준(입실기준)</th>
                                                     <th style="text-align: center;"  colspan="2">환불율</th>
                                                    </tr>
                                                    <tr> <td colspan='3'>사용예정일 10일전까지 취소</td> <td colspan="2">100% 환불</td> </tr> <tr> <td colspan='3'>사용예정일 7일전까지 취소</td> <td colspan="2">80% 환불</td> </tr> <tr> <td colspan='3'>사용예정일 5일전까지 취소</td> <td colspan="2">60% 환불</td> </tr> <tr> <td colspan='3'>사용예정일 3일전까지 취소</td> <td  colspan="2">40% 환불</td> </tr> <tr> <td colspan='3'>사용예정일 2일전부터  당일까지 취소</td> <td  colspan="2">환불불가</td> </tr>
                                                    
                                                    <tr>
                                                     <th style="text-align: center;">기타제안</th>
                                                     <td colspan="5" id="etc" style="text-align: center;"></td>
                                                    </tr> 
                       								<tr>
                                                     <th style="text-align: center;">첨부사진</th>
                                                     <td colspan="5" id="picture" ></td>
                                                    </tr>
                       
                                                </tbody>
                                            </table>
                                
                                <br>
                                <div style="float: right;">
      							<button class="btn btn-primary btn" type="button" onclick="approval(this);" style="">승인하기</button>
      							<button class="btn btn-dark btn" type="button" onclick="closeBtn(this);">닫기</button>
      							</div>
      							<button class="btn btn-default waves-effect waves-light btn-sm" id="sa-success" >Click me</button>
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



		


        <!-- js placed at the end of the document so the pages load faster -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery-2.1.4.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/bootstrap.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/metisMenu.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.slimscroll.min.js"></script>

        <!-- App Js -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.app.js"></script>

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