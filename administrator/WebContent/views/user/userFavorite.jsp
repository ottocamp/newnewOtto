<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, camp.model.vo.*"%>    
<%	
	ArrayList<CampInfo> cList = (ArrayList<CampInfo>)request.getAttribute("cList");
	ArrayList<Attachment> aList = (ArrayList<Attachment>)request.getAttribute("aList");
	
	String msg = (String)session.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jqury cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta charset="utf-8" />
<title>유저 즐겨찾기 페이지</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/assets/images/favicon.ico">

<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/resources/assets/css/bootstrap.min.css"
	rel="stylesheet">
<!-- MetisMenu CSS -->
<link
	href="<%=request.getContextPath()%>/resources/assets/css/metisMenu.min.css"
	rel="stylesheet">
<!-- Icons CSS -->
<link
	href="<%=request.getContextPath()%>/resources/assets/css/icons.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="<%=request.getContextPath()%>/resources/assets/css/style.css"
	rel="stylesheet">
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
	
		#detail_box th{
		background-color: #f9f9f9;
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

			<%@ include file="../common/userSidebar.jsp" %>

			<!-- START PAGE CONTENT -->
			<div id="page-right-content">

				<div class="container">
				
				<div class="row">
                          <div class="col-sm-12">
                              <h4 class="header-title m-t-0 m-b-20"><%= loginUser.getUserName() %>님의 관심 캠핑장</h4>
                          </div>
                      </div>
				
				
					<div class="row">
					<% for(CampInfo ca : cList) {%>
						<div class="col-md-4">
                        		<div class="text-center card-box">
                                    <div class="dropdown pull-right">
                                        <a href="#" class="dropdown-toggle card-drop" data-toggle="dropdown" aria-expanded="false">
                                            <h3 class="m-0 text-muted"><i class="mdi mdi-dots-horizontal"></i></h3>
                                        </a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="<%= request.getContextPath() %>/delete.favorite?Code=<%= ca.getcCode() %>">관심목록에서 삭제</a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="member-card">
                                       <!--  <span class="user-badge bg-warning">Founder</span> -->
                                        <div class="thumb-xl member-thumb m-b-10 center-block">
                                        <% for(Attachment at : aList) {%>
                                        
                                        	<% if((at.getcCode() == ca.getcCode()) && at.getcType() == 2){ %>
                                            <img src="<%=request.getContextPath()%><%= at.getFilePath() %><%= at.getChangeName() %>" class="img-circle img-thumbnail" alt="profile-image" style="width: 120px; height: 120px;">
                                            <%} %>
                               			<%} %>
                                            <i class="mdi mdi-information-outline member-star text-success" title="verified user"></i>
                                        </div>

                                        <div class="">
                                            <h4 class="m-b-5"><%= ca.getcName() %></h4>
                                            <p class="text-muted"><%= ca.getcPhone() %> <span> | </span> <span> <a href="#" class="text-pink"><%= ca.getcUrl() %></a> </span></p>
                                        </div>

                                        <p class="text-muted font-13">
                                            <%= ca.getcAddress() %>
                                        </p>
										<input type="hidden" value="<%= ca.getcCode() %>" id="cCode">
                                        <button type="button" class="btn btn-default btn-sm m-t-10" onclick="detail(this);">자세히 보기</button>

                                        <ul class="social-links list-inline m-t-30">
                                            <li>
                                                <a title="" data-placement="top" data-toggle="tooltip" class="tooltips" href="" data-original-title="Facebook"><i class="fa fa-facebook"></i></a>
                                            </li>
                                            <li>
                                                <a title="" data-placement="top" data-toggle="tooltip" class="tooltips" href="" data-original-title="Twitter"><i class="fa fa-twitter"></i></a>
                                            </li>
                                            <li>
                                                <a title="" data-placement="top" data-toggle="tooltip" class="tooltips" href="" data-original-title="Skype"><i class="fa fa-skype"></i></a>
                                            </li>
                                        </ul>

                                    </div>

                                </div>

                            </div>
                            <%} %>
                            
					</div>
					<!--end row -->
					
					
					<div class="row">
				   <button class="btn btn-default waves-effect waves-light btn-sm" id="sa-success" >Click me</button>
					<button class="btn btn-primary " data-toggle="modal" data-target=".bs-example-modal-lg" style="display: none;" id="modal">Large modal</button>
					
					<!--  Modal content for the above example -->
                                    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                    <h4 class="modal-title" id="myLargeModalLabel">사업장 상세내역</h4>
                                                </div>
                                                <div class="modal-body">
                                              	<table class="table table-bordered m-0" id="detail_box">
                                                <thead>
                                                    <tr>
                                                        <th >캠핑장명</th>
                                                        <td id="campName"></td>
                                                		<th >전화번호</th>
                                                		<td id="phone"></td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th >주소</th>
                                                        <td colspan="3" id="adderess"></td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <th >홈페이지</th>
                                                        <td id="homepage"></td>
                                                        <th >테마</th>
                                                        <td id="tema"></td>     
                                                    </tr>
                                                    <tr>
                                                        <th >포스팅 서비스 제휴 여부</th>
                                                        <td id="post"></td>
                                                        <th >예약시작가능일</th>
                                                        <td id="reDay"></td> 
                                                    </tr>  
                                                    <tr>
                                                     <th >시설현황</th>
                                                     <td colspan="3" id="now"></td>
                                                    </tr>
                                                    <tr>
                                                     <th >환불규정</th>
                                                     <td colspan="3" id="refund"></td>
                                                    </tr>
                                                    <tr>
                                                     <th >기타제안</th>
                                                     <td colspan="3" id="etc"></td>
                                                    </tr>
                       								<tr>
                                                     <th>첨부사진</th>
                                                     <td colspan="3" id="picture"></td>
                                                    </tr>
                                                    <tr hidden="">
                                                    <td colspan="3"> <input type="text" id="ct"> </td>
                                                    <td> <button type="button" id="hbt" onclick="test22();">숨긴버튼</button> </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                                </div>
                                                 <div align="right">
                                                	<button type="button" class="btn btn-success" id="vbt" onclick="test11();">상세 페이지로 이동</button>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->

					</div>
					<!-- end row -->


					


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

	<script type="text/javascript">
	
	function detail(value){
		
		$("#campName").html('');
		$("#phone").html('');
		$("#adderess").html('');
		$("#homepage").html('');
		$("#tema").html('');
		$("#post").html('');
		$("#reDay").html('');
		$("#now").html('');
		$("#refund").html('');
		$("#etc").html('');
		$("#picture").html('');
		$("#code").val('');
		

		var cNo = $(value).parent().children().eq(3).val();
					
		<% for(CampInfo ca : cList) {%>
		
			if(cNo == (<%= ca.getcCode() %> +"")){
				
				code = <%= ca.getcCode() %>
				var $td1 = $("<td>").text("<%= ca.getcName() %>");
				var $td2 = $("<td>").text("<%= ca.getcAddress() %>");
				var $td3 = $("<td>").text("<%= ca.getcPhone() %>");
				var $td4 = $("<td>").text("<%= ca.getcUrl() %>");
				var $td5 = $("<td>");
			
				var $td6 = $("<td>").text("<%= ca.getcTheme() %>");
				var $td7 = $("<td>").text("<%= ca.getcOption() %>");
				var $td8 = $("<td>").text("<%= ca.getcAvailableDate() %>");
				var $td9 = $("<td>").text("<%= ca.getcPosting() %>");
				var $td10 = $("<td>").text("<%= ca.getcRefundment() %>");
				var $td11 = $("<td>").text("<%= ca.getcEtc() %>");
				$("#ct").val("<%= ca.getcCode() %>");			
				
				<% for(int i = 0; i < aList.size(); i++) { %>
				
				if(cNo == <%= aList.get(i).getcCode() %>){
				
				var $liImg = $("<img src='<%= request.getContextPath() + aList.get(i).getFilePath() + aList.get(i).getChangeName() %>' width='150px' height='100px' onclick='test(this);'>");	
					
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
				$("#now").append($td7);
				$("#refund").append($td10);
				$("#etc").append($td11);
				$("#picture").append($td5);
	
				       
			}
		
		<%} %>
		
		
		$("#modal").click();
	}
	
	
	function() test11(){
		$("#hbt").click();
		
	}
	
	function() test22(){
		alert("가보자");
	}
	
	
	
	
	
	
	
	</script>

	<!-- js placed at the end of the document so the pages load faster -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/jquery-2.1.4.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/metisMenu.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/jquery.slimscroll.min.js"></script>

		<!-- init -->
        <script src="<%= request.getContextPath() %>/resources/assets/pages/jquery.datatables.init.js"></script>

		<!-- Sweet-Alert  -->
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/sweet-alert2/sweetalert2.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/pages/jquery.sweet-alert.init.js"></script>


	<!-- App Js -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/jquery.app.js"></script>




</body>
</html>