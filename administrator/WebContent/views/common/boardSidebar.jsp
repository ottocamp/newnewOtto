<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 아이콘 cdn -->
		<script src="https://kit.fontawesome.com/ec9c0ffb05.js" crossorigin="anonymous"></script>
</head>
<body>
<!--left navigation start-->
			<aside class="sidebar-navigation">
				<div class="scrollbar-wrapper">
					<div>
						<button type="button"
							class="button-menu-mobile btn-mobile-view visible-xs visible-sm">
							<i class="mdi mdi-close"></i>
						</button>
						<!-- User Detail box -->
						<!--- End User Detail box -->

						<!-- Left Menu Start -->
						<ul class="metisMenu nav" id="side-menu">
                                <li><a href="<%= request.getContextPath() %>/list.bo?b_tag=0"><i class="mdi mdi-clipboard-text"></i> 공지사항 </a></li>

                                <li>
                                    <a aria-expanded="true"><i class="mdi mdi-forum"></i> 정보 공유 <span
									class="fa arrow"></span></a>
                                    <ul class="nav-second-level nav collapse" aria-expanded="false">
                                        <li><a href="<%= request.getContextPath() %>/regionList.bo?b_region=1">서울</a></li>
                                        <li><a href="<%= request.getContextPath() %>/regionList.bo?b_region=2">경기도</a></li>
                                        <li><a href="<%= request.getContextPath() %>/regionList.bo?b_region=3">강원도</a></li>
                                        <li><a href="<%= request.getContextPath() %>/regionList.bo?b_region=4">경상도</a></li>
                                        <li><a href="<%= request.getContextPath() %>/regionList.bo?b_region=5">전라도</a></li>
                                        <li><a href="<%= request.getContextPath() %>/regionList.bo?b_region=6">충청도</a></li>
                            
                                    </ul>
                                </li>

                                <li><a href="<%= request.getContextPath() %>/list.bo?b_tag=2"><i class="mdi mdi-message-text"></i> 잡담(자유) </a></li>
                            
						</ul>
					</div>
				</div>
				<!--Scrollbar wrapper-->
			</aside>
			<!--left navigation end-->
</body>
</html>