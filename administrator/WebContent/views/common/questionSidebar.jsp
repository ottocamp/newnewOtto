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
                            <li class="qes-side">
                                <a href="#" aria-expanded="true"><i class="mdi mdi-book-open"></i> 자주 묻는 질문 <span
									class="fa arrow"></span></a>
                                <ul class="nav-second-level nav collapse" aria-expanded="false">
                                    <li><a href="<%= request.getContextPath() %>/freqList.qe?q_tag=0">결제</a></li>
                                    <li><a href="<%= request.getContextPath() %>/freqList.qe?q_tag=1">예약</a></li>
                                    <li><a href="<%= request.getContextPath() %>/freqList.qe?q_tag=2">설비</a></li>
                                    <li><a href="<%= request.getContextPath() %>/freqList.qe?q_tag=3">기타</a></li>
                                </ul>
                            </li >
                            <br><br><br><br><br><br><br><br><br>
                            <li class="qes-side"> 
                            	<% if(!userType.equals("A")) { %>
                            		<hr>
                            		<% if(userNo != 9999) { %>
                            		
                            			<a href="<%= request.getContextPath() %>/myList.qe" target="_self"><i class="mdi mdi-comment-text"></i> 내 문의</a><i class="mdi mdi-checkbox-multiple-blank-outline" style="font-size: 12px" onclick="window.open('<%= request.getContextPath() %>/myList.qe')"></i>                                    
                            		
                            		<% }else { %>
                            		
                            			<a href="<%= request.getContextPath() %>/views/question/questionPwdCheckForm.jsp" target="_self"><i class="mdi mdi-comment-text"></i> 내 문의</a><i class="mdi mdi-checkbox-multiple-blank-outline" style="font-size: 12px" onclick="window.open('<%= request.getContextPath() %>/views/question/questionPwdCheckForm.jsp')"></i>                                    
                            	
                            		<% } %>
                            	
                            	<% } %>
                            	
                            </li>
                            <li class="qes-side">
                            	<% if(!userType.equals("A")) { %>
                            	
                            		<a href="<%= request.getContextPath() %>/getName.ca" target="_self"><i class="mdi mdi-comment-question-outline"></i> 문의하기 </a><i class="mdi mdi-checkbox-multiple-blank-outline" style="font-size: 12px" onclick="<%= request.getContextPath() %>/getName.ca"></i>
                                
                            	<% } %>
                                
                            </li>
                            
                            <% if(userType.equals("A") || userType.equals("B")) { %>                            
                            	<hr>
	                            <li class="qes-side">
                            		<a href="<%= request.getContextPath() %>/list.an" target="_self"><i class="mdi mdi-pencil-box"></i> 답변하기 </a><i class="mdi mdi-checkbox-multiple-blank-outline" style="font-size: 12px" onclick="window.open('<%= request.getContextPath() %>/list.an')"></i>                            
	                            </li>
                            	
                            <% } %>
                            
                        </ul>
					</div>
				</div>
				<!--Scrollbar wrapper-->
			</aside>
			<!--left navigation end-->
</body>
</html>