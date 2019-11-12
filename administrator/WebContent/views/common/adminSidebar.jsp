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
							<li><a href="<%=request.getContextPath()%>/main.li"><i
									class="ti-home"></i> 관리자 메인 </a></li>

									
							<li><a href="<%=request.getContextPath()%>/latestList.li"><i
									class="mdi mdi-calendar-clock"></i> 예약관리 </a></li>		

							

							<li><a href="<%=request.getContextPath()%>/userGrade.li"><i
									class="mdi mdi-account"></i> 회원등급관리 </a></li>

							

							<li class=""><a href="javascript: void(0);"
								aria-expanded="false"><i class="text fas fa-won-sign"></i> 매출내역확인 <span
									class="fa arrow"></span></a>
								<ul class="nav-second-level nav collapse" aria-expanded="false"
									style="height: 0px;">
									<li><a href="<%= request.getContextPath() %>/views/sales/salesTotalView.jsp">전체 매출내역</a></li>
									<li><a href="<%=request.getContextPath()%>/salesList.sl">사업장별 매출내역</a></li>
								</ul></li>


							<li class=""><a href="javascript: void(0);"
								aria-expanded="false"><i class="ti-files"></i> 사업장 관리 <span
									class="fa arrow"></span></a>
								<ul class="nav-second-level nav collapse" aria-expanded="false"
									style="height: 0px;">
									<li><a href="<%=request.getContextPath()%>/campList.cl">사업장 승인하기</a></li>
									<li><a href="<%=request.getContextPath()%>/campDetail.li">승인 사업장 보기</a></li>
								</ul></li>

							<li><a href="<%=request.getContextPath()%>/views/mail/MailSendView.jsp"><i
									class="mdi mdi-email-outline"></i> 광고메일전송 </a></li>
							<li><a href="<%=request.getContextPath()%>/couponList.li"><i
									class=" mdi mdi-language-c"></i> 쿠폰관리하기 </a></li>			
						
						
						
							<!-- 11월 11일 김상인 추가 -->
                            <li class="qes-side">
                                <a href="#" aria-expanded="true"><i class="mdi mdi-book-open"></i> 글 관리  <span
									class="fa arrow"></span></a>
                                <ul class="nav-second-level nav collapse" aria-expanded="false">
                                    <li><a href="<%= request.getContextPath() %>/allNotice.bo">공지 관리</a></li>
                                    <li><a href="<%= request.getContextPath() %>/allList.bo">게시글 관리</a></li>
                                    <li><a href="<%= request.getContextPath() %>/allList.co">댓글 관리</a></li>
                                    <li><a href="<%= request.getContextPath() %>/list.an">답변하기</a></li>
                                </ul>
                            </li >
                            <!-- 김상인 추가 끝 -->
						</ul>
					</div>
				</div>
				<!--Scrollbar wrapper-->
			</aside>
			<!--left navigation end-->
</body>
</html>