<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.*"%>
<%
	User loginUser = (User)session.getAttribute("loginUser");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#topNav_logo:hover{
		cursor: pointer;	
	}
	
	

	
	
</style>
<script type="text/javascript">
	$(function(){
		
		$("#topNav_logo").click(function(){
			location.href = "<%= request.getContextPath() %>"; 
		})		
		
	})

</script>
</head>
<body>
<div class="topbar">

			<!-- LOGO -->
			<div class="topbar-left">
				<div class="" style="">
					 <img src="<%=request.getContextPath()%>/resources/main/images/11.png" alt="logo" class="logo-lg" 
					 style="width: 100%; height: 100%; margin-left: 25px;" id="topNav_logo" > 
					
				</div>
			</div>

			<!-- Top navbar -->
			<div class="navbar navbar-default" role="navigation">
				<div class="container">
					<div class="">

						<!-- Mobile menu button -->
						<div class="pull-left">
							<button type="button"
								class="button-menu-mobile visible-xs visible-sm">
								<i class="fa fa-bars"></i>
							</button>
							<span class="clearfix"></span>
						</div>

						<!-- Top nav left menu -->
						<ul class="nav navbar-nav hidden-sm hidden-xs top-navbar-items" style="float: right; margin-right: 79px;">
							<li><a href="<%= request.getContextPath() %>/list.bo?b_tag=0" >게시판</a></li>
							<li><a href="<%= request.getContextPath() %>/freqList.qe">Q & A</a></li>
							<% if(loginUser != null){ %>
							<li class="dropdown top-menu-item-xs">
                                    <a href="" class="dropdown-toggle menu-right-item profile" data-toggle="dropdown" aria-expanded="false"><img src="<%= request.getContextPath() %>/resources/top_nav/images/m_iconM.png" alt="user-img" class="img-circle"> </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="<%= request.getContextPath() %>/views/user/userUpdate.jsp"><i class="ti-user m-r-10"></i> 나의 정보보기</a></li>
                                        <li><a href="javascript:void(0)"><i class="ti-settings m-r-10"></i> 정보수정</a></li>
                                        <li><a href="javascript:void(0)"><i class="mdi mdi-heart-outline m-r-10"></i> 즐겨찾기</a></li>
                                        <li class="divider"></li>
                                        <li><a href="<%= request.getContextPath() %>/logout.user"><i class="ti-power-off m-r-10"></i> 로그아웃</a></li>
                                    </ul>
                                </li>    
                            <%}else{ %>
                            <li><a href="<%= request.getContextPath() %>/views/user/login.jsp" >로그인</a></li>
                               <%} %>
						</ul>

						<!-- Top nav Right menu -->
						
						
						
						
					</div>
				</div>
				<!-- end container -->
			</div>
			<!-- end navbar -->
		</div>
</body>
</html>