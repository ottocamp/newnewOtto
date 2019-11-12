<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, review.model.vo.*"%>
<%
	ArrayList<UserReview> userReviewList = (ArrayList<UserReview>)request.getAttribute("userReviewList");
	String msg = (String)session.getAttribute("msg");

%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 관리 페이지</title>
		<!-- jqury cdn -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
        <meta charset="utf-8" />
    
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
	textarea {
	resize: none;
}

.starR {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	text-indent: -9999px;
	cursor: pointer;
}

.starR.on {
	background-position: 0 0;
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
                 <%@ include file="../common/userSidebar.jsp" %>
                <!--left navigation end-->

                <!-- START PAGE CONTENT -->
                <div id="page-right-content">

                    <div class="container">
                    
                    
                    
                    
                    
                        <div class="row">
							<div class="col-sm-12">
							
								<h4 class="m-t-0 header-title">예약 관리 메뉴</h4>

                                <div class="table-responsive m-b-20">
                                    <h5><b>캠핑장 예약 정보</b></h5>
                                    <!-- <p class="text-muted font-13 m-b-30">
                                        현재 오또캠핑을 통해서 예약된 모든 사항들이 표시됩니다.
                 <br>결제완료는 예약자가 금액을 지불하고 사업장의 승인을 기다리는 상태, 예약완료는 사업자가 예약을 승인한 상태
                 <br>예약취소는 예약이 취소된 상태, 이용완료는 캠핑장 이용이 모두 완료되어 환불이 불가능한 상태입니다.     
                                    </p> -->

                                    <table id="datatable" class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                        <!--         -->
                                        
                                        	<th>예약번호</th>
                                        	<th>캠핑장명</th>
                                        	<th>제목</th>
                                        	<th>사용날짜</th>
                                        	<th hidden="">숨긴내용</th>
                                        	<th hidden="">숨긴별점</th>
                                        	<th hidden="">숨긴 캠핑장코드</th>
                                        	<th>확인/신청</th>
                                        </tr>
                                        </thead>
	     
                                        <tbody>
                                        <% for(UserReview ure : userReviewList){ %>
											<tr id="usergrade">
												<td><%= ure.getReNo() %></td>
												<td><%= ure.getcName() %></td>
												<td><%= ure.getrTitle() %></td>
												<td><%= ure.getReDate() %></td>
												<td hidden=""><%= ure.getrContent() %></td>
												<td hidden=""><%= ure.getrNum() %></td>	
												<td hidden=""><%= ure.getcCode() %></td>	
												<td>
													<button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal" onclick="revChange(this);">수정</button>
													<button type="button" class="btn btn-primary btn-xs" onclick="revDelete(this);">삭제</button>
												
												</td>
											</tr>
										<%} %>
                                        </tbody>
                                    </table>
                                </div>
                                
                                
							</div>
						</div>
                        <!--end row -->
                        
                        
                            <form method="post" action="<%= request.getContextPath() %>/insert.review">
                     	 			<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                    <h4>리뷰 수정하기</h4>
                                                </div>
                                                <div class="modal-body">
                                               	제목 : <input type="text" name="rTitle" id="rTitle" class="form-control" style="height: 36px; width: 200px; display: inline-block;" autocomplete="nope">         
                                                <br><hr>
                                           		     별점 
                                                 <div class="starRev">
  														<span class="starR">1</span>
 												 		<span class="starR">2</span>
  														<span class="starR">3</span>
  														<span class="starR">4</span>
 														<span class="starR">5</span>
                                         	   </div>
                                         	   <br><hr>
                                                 
                                                 내용 <textarea class="form-control" rows="5" style="margin: 0px; width: 500px; height: 90px;" placeholder="내용을 입력해주세요" name="rContent" id="rContent"></textarea>
                                                 
                                                     <input type="number" name="reNo2" id="reNo2" hidden="">
													 <input type="number" name="cCode" id="cCode" hidden="">
													 <input type="text" name="cName" id="cName" hidden="">
													 <input type="text" name="reDate" id="reDate" hidden="">
													 <input type="number" name="rNum" id="rNum" value="1" hidden="">
                                                 
                                                 
                                                 
                                                 
                                                </div>
                                                <div class="modal-footer">
                                               		<button type="submit" class="btn btn-primary ">수정하기</button>
                                                    <button type="button" class="btn btn-default " data-dismiss="modal">닫기</button>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
                       </form>
                        
                        
                        <div class="row">
                            <div class="col-lg-6">
                                 <button class="btn btn-default waves-effect waves-light btn-sm" id="sa-success" >Click me</button>
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
                            
                        </div>
                        <div>
                            <strong>OH ! DDO</strong> - Copyright © 2019
                        </div>
                    </div> <!-- end footer -->

                </div>
                <!-- End #page-right-content -->s

            </div>
            <!-- end .page-contentbar -->
        </div>

		<script>
		
		$('.starRev span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  $("#rNum").val($(this).parent().children('.on').last().text());
			  return false;
			});
		
		
		
		
		 //예약번호 캠프네임 리뷰제목 예약날짜 리뷰내용 리뷰점수
		function revChange(value){
			
			var reNo2 = $(value).parent().parent().children().eq(0).text();
			var cName = $(value).parent().parent().children().eq(1).text();
			var rTitle = $(value).parent().parent().children().eq(2).text();
			var reDate = $(value).parent().parent().children().eq(3).text();
			var rContent = $(value).parent().parent().children().eq(4).text();
			var rNum = $(value).parent().parent().children().eq(5).text();
			var cCode = $(value).parent().parent().children().eq(6).text();
			
			$("#rTitle").val(rTitle);
			$("#rContent").val(rContent);			
			$("#reNo2").val(parseInt(reNo2));
			$("#cCode").val(cCode);
			$("#cName").val(cName);
			$("#reDate").val(reDate);
			$("#cCode").val(cCode);
			
			if(rNum==5){
				$('.starRev span').eq(4).click();
			}else if(rNum==4){
				$('.starRev span').eq(3).click();
			}else if(rNum==3){
				$('.starRev span').eq(2).click();
			}else if(rNum==2){
				$('.starRev span').eq(1).click();
			}else if(rNum==1){
				$('.starRev span').eq(0).click();
			}
			

		}
		 
		 
		 function revDelete(value){
			 var reNo3 = $(value).parent().parent().children().eq(0).text();
			 
			 if(confirm("정말 삭제하시겠습니까?")){
				 
				 location.href = '<%= request.getContextPath() %>/delete.review?reNo3='+reNo3;
				 
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