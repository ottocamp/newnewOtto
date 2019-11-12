<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="grade.model.vo.*, java.util.*, java.text.DecimalFormat"%>
<%
	ArrayList<UserGrade> uList = (ArrayList<UserGrade>)request.getAttribute("uList");
	DecimalFormat formatter = new DecimalFormat("##,###,###");
	
	ArrayList<UserGradeIndex> uiList = new ArrayList<UserGradeIndex>();
	
	
	for(UserGrade ug : uList){
		
		switch(ug.getGuserGrade()){
		
		case "A" : ug.setGuserGrade("MVP"); break;
		case "B" : ug.setGuserGrade("VIP"); break;
		case "C" : ug.setGuserGrade("FAMILY"); break;
		case "D" : ug.setGuserGrade("WELCOME"); break;
		
		}
		
		if(ug.getGsumCost() < 300000){
			
			if(!ug.getGuserGrade().equalsIgnoreCase("WELCOME")){
				
				uiList.add(new UserGradeIndex(ug.getGuserNo(), 
											ug.getGuserName(),
											ug.getGuserGrade(),
											"WELCOME",
											ug.getGsumCost()));
			}
			
			
		}else if(ug.getGsumCost() < 500000){
			
		if(!ug.getGuserGrade().equalsIgnoreCase("FAMILY")){
				
				uiList.add(new UserGradeIndex(ug.getGuserNo(), 
											ug.getGuserName(),
											ug.getGuserGrade(),
											"FAMILY",
											ug.getGsumCost()));
			}
			
		}else if(ug.getGsumCost() < 1000000){
			
		if(!ug.getGuserGrade().equalsIgnoreCase("VIP")){
				
				uiList.add(new UserGradeIndex(ug.getGuserNo(), 
											ug.getGuserName(),
											ug.getGuserGrade(),
											"VIP",
											ug.getGsumCost()));
			}
			
		}else{
			
		if(!ug.getGuserGrade().equalsIgnoreCase("MVP")){
				
				uiList.add(new UserGradeIndex(ug.getGuserNo(), 
											ug.getGuserName(),
											ug.getGuserGrade(),
											"MVP",
											ug.getGsumCost()));
			}
		}

	}
	
	String msg = (String)session.getAttribute("msg");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등급관리 페이지</title>
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
		
		#gwelcome, #gfamily, #gvip, #gmvp:hover{
			cursor: pointer;
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


</head>
<body>

<div id="page-wrapper">
			<button class="btn btn-default waves-effect waves-light btn-sm" id="sa-success" >Click me</button>
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
                    
                    <form action="<%= request.getContextPath() %>/gradeSearch.li" method="post" onsubmit="return validate();">
                    <div class="row">
							<div class="col-sm-12">
							<h4 class="m-t-0 header-title">회원등급관리메뉴 <div class="btn-group" style="padding-left: 1000px;">
                                        <button type="button" class="btn btn-default" id="gall">전체선택</button>
                                        <button  class="btn btn-default">검색하기</button>
                                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">탐색하기</button>
                                    </div>
							
							</h4>
								<div class="card-box widget-inline" style="clear: both;">
									<div class="row">
										<div class="col-lg-3 col-sm-6" id="gwelcome" >
											<div class="widget-inline-box text-center">
												<h3 class="m-t-10"><i class="text mdi mdi-access-point-network"></i> <b data-plugin="counterup">WELCOME</b></h3>
												<p class="text-muted"><div class="checkbox checkbox-inline">
                                                <input type="checkbox" id="welcome" name="grade" value="D">
                                                <label for="welcome">신규회원</label>
                                            </div></p>
											</div>
										</div>

										<div class="col-lg-3 col-sm-6" id="gfamily">
											<div class="widget-inline-box text-center">
												<h3 class="m-t-10 text-custom"><i class="text-custom mdi mdi-airplay"></i> <b data-plugin="counterup">FAMILY</b></h3>
												<p class="text-muted"><div class="checkbox checkbox-inline">
                                                <input type="checkbox" id="family" name="grade" value="C">
                                                <label for="family">30만원이상</label>
                                            </div></p>
											</div>
										</div>

										<div class="col-lg-3 col-sm-6">
											<div class="widget-inline-box text-center" id="gvip">
												<h3 class="m-t-10 text-info"><i class="text-info mdi mdi-black-mesa"></i> <b data-plugin="counterup">VIP</b></h3>
												<p class="text-muted"><div class="checkbox checkbox-inline">
                                                <input type="checkbox" id="vip" name="grade" value="B">
                                                <label for="vip">50만원이상</label>
                                            </div></p>
											</div>
										</div>

										<div class="col-lg-3 col-sm-6">
											<div class="widget-inline-box text-center b-0" id="gmvp">
												<h3 class="m-t-10 text-danger"><i class="text-danger mdi mdi-cellphone-link"></i> <b data-plugin="counterup">MVP</b></h3>
												<p class="text-muted"><div class="checkbox checkbox-inline">
                                                <input type="checkbox" id="mvp" name="grade" value="A">
                                                <label for="mvp">100만원이상</label>
                                            </div></p>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
						</form>
                    
                        <div class="row">
                            <div class="col-sm-12">
                                
                                <div class="table-responsive m-b-20">
                                  
                                    <table id="datatable" class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th>회원번호</th>
                                            <th>이메일</th>
                                            <th>회원이름</th>
                                            <th>회원등급</th>
                                            <th>가입일자</th>
                                            <th>총 결제금액</th>
                                            <th>등급변경</th>
                                        </tr>
                                        </thead>


                                        <tbody>
                                        <% for(UserGrade ug : uList){ %>
											<tr id="usergrade">
												<td><%= ug.getGuserNo() %></td>
												<td><%= ug.getGemail() %></td>
												<td><%= ug.getGuserName() %></td>
					
												<% if(ug.getGuserGrade().equals("WELCOME")){ %>
												<td ><%= ug.getGuserGrade() %></td>
												<%} %>
												<% if(ug.getGuserGrade().equals("FAMILY")){ %>
												<td class="text-custom"><%= ug.getGuserGrade() %></td>
												<%} %>
												<% if(ug.getGuserGrade().equals("VIP")){ %>
												<td class="text-info"><%= ug.getGuserGrade() %></td>
												<%} %>
												<% if(ug.getGuserGrade().equals("MVP")){ %>
												<td class="text-danger"><%= ug.getGuserGrade() %></td>
												<%} %>
							
												<td><%= ug.getGjoinDate().substring(0,2) %>/<%= ug.getGjoinDate().substring(3,5) %>/<%= ug.getGjoinDate().substring(6) %></td>
												<td><%= formatter.format(ug.getGsumCost()) %></td>
												<td><button type="button" class="btn btn-primary btn-xs" onclick="update(this);">등급변경</button></td>
											</tr>
										<%} %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!--end row -->


                        <div class="row">
                            <div class="col-lg-6">
                            <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                    <h4>탐색된 회원의 정보</h4>
                                                    <p>탐색 회원 수 : <%= uiList.size() %>명</p>
                                                
                                                </div>
                                                <div class="modal-body">
                                                     <h4 class="modal-title" id="myModalLabel"></h4>
                                                   
                                                     <table class="table table table-hover m-0">
                                                <thead>
                                                    <tr>
                                                        <th>이름</th>
                                                        <th>변경전 등급</th>
                                                        <th>변경후 등급</th>
                                                      	<th>결제금액</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                	<% for(UserGradeIndex ui : uiList){ %>
                                                	<tr>
                                                		<th scope="row"><%= ui.getGuserName() %></th>
                                                		
                                                		<% if(ui.getGbeforeGrade().equals("WELCOME")){ %>
												<td ><%= ui.getGbeforeGrade() %></td>
												<%} %>
												<% if(ui.getGbeforeGrade().equals("FAMILY")){ %>
												<td class="text-custom"><%= ui.getGbeforeGrade() %></td>
												<%} %>
												<% if(ui.getGbeforeGrade().equals("VIP")){ %>
												<td class="text-info"><%= ui.getGbeforeGrade() %></td>
												<%} %>
												<% if(ui.getGbeforeGrade().equals("MVP")){ %>
												<td class="text-danger"><%= ui.getGbeforeGrade() %></td>
												<%} %>
                                                		
                    
                                                			<% if(ui.getGafterGrade().equals("WELCOME")){ %>
												<td ><%= ui.getGafterGrade() %></td>
												<%} %>
												<% if(ui.getGafterGrade().equals("FAMILY")){ %>
												<td class="text-custom"><%= ui.getGafterGrade() %></td>
												<%} %>
												<% if(ui.getGafterGrade().equals("VIP")){ %>
												<td class="text-info"><%= ui.getGafterGrade() %></td>
												<%} %>
												<% if(ui.getGafterGrade().equals("MVP")){ %>
												<td class="text-danger"><%= ui.getGafterGrade() %></td>
												<%} %>
                                                		
                                                		
                                                		<td><%= formatter.format(ui.getGsumCost()) %>원</td>
                                                	</tr>
                                                	<%} %>
        
                                                </tbody>
                                            </table>
                                                </div>
                                                <div class="modal-footer">
                                                	<button type="button" class="btn btn-primary" id="updateBtn">변경하기</button>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
                            </div> <!-- end col -->

                           
                        </div> <!-- end row -->


                        <div class="row">
                            <div class="col-sm-12">
                            
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
        

		<script>
		// 게시판 상세보기 기능 구현 
	
		function update(value){
					
			var grade = prompt("변경하려는 등급을 입력하세요(welcome,family,vip,mvp)"); 
				
				if(grade == ""){				
					alert("등급을 입력해주세요"	);
					return;
				}			
			
			if(grade == 'd' || grade == 'D'|| grade == '웰컴' || grade == 'welcome' || grade == 'WELCOME'){			
				grade = 'D';
			}else if(grade == 'c'|| grade == 'C' || grade == '패밀리' || grade == 'family' || grade == 'FAMILY'){			
				grade = 'C';
			}else if(grade == 'b' || grade == 'B' || grade == '브이아이피' || grade == 'VIP' || grade == 'vip'){			
				grade = 'B';
			}else if(grade == 'a' || grade == 'A' || grade == '엠브이피' || grade == 'MVP' || grade == 'mvp'){			
				grade = 'A';
			}else{
				alert("올바른 등급을 입력하세요");
				return;
			}
			

				var userNo = $(value).parent().parent().children().eq(0).text() + "," + grade;
				
				$.ajax({
					url : "<%= request.getContextPath() %>/grade.up",
					type : "post",
					data : {userNo:userNo},
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
				
				
				
				<%-- location.href="<%= request.getContextPath() %>/grade.up?userNo=" + userNo + grade; --%>
				
				
			};
			
	function validate(){
		
		if(!$("input:checkbox[name='grade']").is(":checked")){
			
			alert('등급을 선택해주세요');
			return false;
		}
		
		
	}
		
	$(function(){
		
		$("#gall").click(function(){
		  
			if($("input:checkbox[name='grade']").eq(0).is(":checked") && $("input:checkbox[name='grade']").eq(1).is(":checked")
					&& $("input:checkbox[name='grade']").eq(2).is(":checked") && $("input:checkbox[name='grade']").eq(3).is(":checked")){
				
			    $("input:checkbox[name='grade']").prop("checked",false);
			}else{
			    $("input:checkbox[name='grade']").prop("checked",true);
			}

	    });
		
		$("#updateBtn").click(function(){
			
			<% request.getSession().setAttribute("uiList", uiList); %>
			location.href = "<%= request.getContextPath() %>/GradeListUpdate.li";
			
			
		});
		
		$("#gwelcome").click(function(){
			
			if($("input:checkbox[name='grade']").eq(0).is(":checked")){
				$("input:checkbox[name='grade']").eq(0).prop("checked",false);
			}else{
				$("input:checkbox[name='grade']").eq(0).prop("checked",true);
			}	
		});
		
		$("#gfamily").click(function(){
			
			if($("input:checkbox[name='grade']").eq(1).is(":checked")){
				$("input:checkbox[name='grade']").eq(1).prop("checked",false);
			}else{
				$("input:checkbox[name='grade']").eq(1).prop("checked",true);
			}	
		});
		
		$("#gvip").click(function(){
			
			if($("input:checkbox[name='grade']").eq(2).is(":checked")){
				$("input:checkbox[name='grade']").eq(2).prop("checked",false);
			}else{
				$("input:checkbox[name='grade']").eq(2).prop("checked",true);
			}	
		});
		
		$("#gmvp").click(function(){
	
			if($("input:checkbox[name='grade']").eq(3).is(":checked")){
				$("input:checkbox[name='grade']").eq(3).prop("checked",false);
			}else{
				$("input:checkbox[name='grade']").eq(3).prop("checked",true);
			}	
		});
		
		
		
		
		
		
	})
	
	
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