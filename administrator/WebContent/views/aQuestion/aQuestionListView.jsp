<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, aQuestion.model.vo.*"%>    
<%
	ArrayList<aQuestion> qList = (ArrayList<aQuestion>)request.getAttribute("qList");
	String msg = (String)session.getAttribute("msg");	
	
	for(aQuestion aq : qList){
		
		switch(aq.getqTag()){
		
		case "1" : aq.setqTag("결제"); break;	
		case "2" : aq.setqTag("예약"); break;
		case "3" : aq.setqTag("설비"); break;
		case "4" : aq.setqTag("기타"); break;
		
		}
	
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		#detail_box{
			display:none;
		}
		
		#sa-success{
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
								<h4 class="m-t-0 header-title">관리자 문의내역 관리 메뉴</h4>

                                <div class="table-responsive m-b-20">
                                    <h5><b>관리자에게 한 문의 내역</b></h5>
                                    <p class="text-muted font-13 m-b-30">
                                        문의내역 중에서 관리자에게 온 문의내용을 확인할 수 있는 테이블 입니다.
                 <br>상세 및 답변 버튼을 누르면 문의 상세 내용과 답변을 할 수 있습니다. 
                                    </p>

                                    <table id="datatable" class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th>문의번호</th>
                                            <th>문의제목</th>
                                            <th>문의날짜</th>
                                            <th>문의 카테고리</th>
                                            <th>답변여부</th>
                                            <th>문의회원번호</th>
                                            <th>상세보기</th>
                                        </tr>
                                        </thead>


                                        <tbody>
                                        <% for(aQuestion aq : qList){ %>
											<tr id="usergrade">
												<td><%= aq.getqCode() %></td>
												<td><%= aq.getqTitle() %></td>
												<td><%= aq.getqDate() %></td>
												<td><%= aq.getqTag() %></td>
												<td><%= aq.getqYn() %></td>
												<td><%= aq.getqWriter() %></td>
												<td>
												<% if(aq.getqYn().equals("Y")){ %>
												<button class="btn btn-dark btn-xs" type="button" onclick="update(this);">상세보기</button>
												<% }else{ %>
												<button class="btn btn-primary btn-xs" type="button" onclick="update(this);">답변하기</button>
												<%} %>
												</td>
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
                                <h4 class="m-t-0 header-title">문의 상세 내역</h4>
                                <table id="datatable" class="table table-bordered m-0">
                                <thead>
                                  <tr>
                                       <th width="100px"></th>
                                       <th>내용</th>
                                    
                                  </tr>
                                  </thead>
                                
                                  <tbody id="detail">
                                  
                         	
                                  </tbody>
                                
                                </table>	
                                <div id="buttonArea"></div>
      							<button class="btn btn-default waves-effect waves-light btn-sm" id="sa-success" >Click me</button>
                            </div>
                        </div>
                        
                        


                        <div class="row">
                            <div class="col-lg-6">
                                
                            </div> <!-- end col -->

                            <div class="col-lg-6">
                                
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
        
        <script type="text/javascript">
        
		function update(value){
			
			$("#detail_box").css("display","block");
			
			var qNo = $(value).parent().parent().children().eq(0).text();			
			
			$tbody = $("#detail");
			$tbody.html('');
			$("#buttonArea").html('');
			
			$tr1 = $("<tr>");
			$tr2 = $("<tr>");
			$button = null;
			
			
				
			<% for(aQuestion aq : qList) {%>
			
				if(qNo + "" == (<%= aq.getqCode() %> +"")){
					
					var $li1 = $("<td>").text("<%= aq.getqContent() %>");
					var $qCode = $("<input type='hidden'>").val("<%= aq.getqCode() %>")
					
					
					
					if("<%= aq.getqYn() %>" == "N"){
						
						var $li2 = $("<textarea style='width:100%' id='comment'>").text("답변할 내용을 작성하세요");
						$button = $('<button class="btn btn-primary btn-xs" type="button" onclick="Answer(this);">').text("답변하기");
						
					}else{
						
						var $li2 = $("<td>").text("<%= aq.getqComment() %>");
						
											
					}
					
				}
			
			<%} %> 
				
			$td1 = $("<td>").text("문의");
			$td2 = $("<td>").text("답변");
			
			$tr1.append($td1);
			$tr1.append($li1);
			$tbody.append($tr1);
			
			$tr2.append($td2);
			$tr2.append($li2);
			$tbody.append($tr2);
			$("#buttonArea").append($button);
			$("#buttonArea").append($qCode);
			
			
		}
        
		function Answer(value){
			
			var qCode = $(value).parent().children().eq(1).val();
			var comment = $("#comment").val();
			var index = qCode + "," + comment;
							
			 location.href = "<%= request.getContextPath() %>/answer.qa?qCode="+index;
			
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