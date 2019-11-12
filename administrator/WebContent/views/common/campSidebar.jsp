<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<div class="user-details">
							<div class="pull-left">
								<img
									src="<%=request.getContextPath()%>/resources/assets/images/users/avatar-1.jpg"
									alt="" class="thumb-md img-circle">
							</div>
							<div class="user-info">
								<a href="#">Stanley Jones</a>
								<p class="text-muted m-0">Administrator</p>
							</div>
						</div>
						<!--- End User Detail box -->




						<!-- Left Menu Start -->
						<ul class="metisMenu nav" id="side-menu">
							<li><a href="<%=request.getContextPath()%>/views/reservation/reservationCampListView.jsp"><i
									class="ti-home"></i> 사업자 메인 </a></li>

							<li><a href="javascript: void(0);" aria-expanded="true"><i
									class="mdi mdi-calendar-clock"></i>예약 내역 <span class="fa arrow"></span></a> 
									<ul class="nav-second-level nav collapse" aria-expanded="false">
									<li><a href="<%=request.getContextPath()%>/views/reservation/reservationCampListView.jsp">예약내역 조회</a></li>
                                    </ul></li>

							<li class=""><a href="javascript: void(0);" aria-expanded="true"><i
									class="text fas fa-won-sign"></i>매출 내역 <span class="fa arrow"></span></a> 
									<ul class="nav-second-level nav collapse" aria-expanded="false">
									<li><a href="<%=request.getContextPath()%>/saleslist.ca">매출내역 조회</a></li>
                                    </ul></li>

							<li><a href="javascript: void(0);" aria-expanded="true"><i
									class="mdi mdi-account"></i>정보등록관리 <span class="fa arrow"></span></a>
								<ul class="nav-second-level nav collapse" aria-expanded="false">
									<li><a href="<%=request.getContextPath()%>/views/camp/campInsertView.jsp">정보 등록</a></li>
									<li><a href="<%=request.getContextPath()%>/submitresult.ca">등록 현황</a></li>

								</ul></li>

							<!-- 김상인 2019/11/10일 추가 / 위치 변경 필요 -->	
                            <li class="qes-side">
                                <a href="#" aria-expanded="true"><i class="mdi mdi-book-open"></i> 내가 쓴 글 <span class="fa arrow"></span> </a>
                                <ul class="nav-second-level nav collapse" aria-expanded="false">
                                    <li><a href="<%= request.getContextPath() %>/myList.bo">내 게시글</a></li>
                                    <li><a href="<%= request.getContextPath() %>/myList.co">내 댓글</a></li>
                                    <li><a href="<%= request.getContextPath() %>/myList.qe">내 문의</a></li>
                                    
                                    <br>
                                    <li><a href="<%= request.getContextPath() %>/list.an">답변하기</a></li>
                                </ul>
                            </li >
                                    
							
						</ul>
					</div>
				</div>
				<!--Scrollbar wrapper-->
			</aside>
			<!--left navigation end-->
</body>
</html>