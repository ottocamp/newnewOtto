<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.*"%>
<%

	

%>    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user side bar</title>

</head>
<body>

	                <aside class="sidebar-navigation">
                    <div class="scrollbar-wrapper">
                        <div>
                            <button type="button" class="button-menu-mobile btn-mobile-view visible-xs visible-sm">
                                <i class="mdi mdi-close"></i>
                            </button>
                            <!-- User Detail box -->
                            <div class="user-details">
                                <div class="pull-left">
                                    <img alt="" class="thumb-md img-circle propicArea" >
                                </div>
                                <div class="user-info">
                                    <a href="#"><%= loginUser.getUserName() %>님</a>
                                    <p class="text-muted m-0"></p>
                                </div>
                            </div>
                            <!--- End User Detail box -->

                            <!-- Left Menu Start -->
                            <ul class="metisMenu nav" id="side-menu">
                                <%-- <li><a href="<%= request.getContextPath() %>/views/user/userMain.jsp"><i class="ti-home"></i> 회원 메인 메뉴 </a></li> --%>

                                <li><a href="<%= request.getContextPath() %>/views/user/userUpdate.jsp"> <i class="ti-paint-bucket"></i> 나의 정보 </a></li>

                                <li>
                                    <a href="<%= request.getContextPath() %>/reservation.user"><i class="ti-paint-bucket"></i> 이용내역</span></a>

                                </li>
                                
                                <li><a href="<%= request.getContextPath() %>/select.favorite"><i class="ti-spray"></i> 나의 관심 캠핑장</a></li>

                                <li><a href="<%= request.getContextPath() %>/ipinfo.user"><i
									class="ti-spray"></i> 로그인 관리 </a></li>
  								<li><a href="<%= request.getContextPath() %>/coupon.user"><i
									class="ti-spray"></i> 쿠폰 관리 </a></li>
									
									
								<!-- 김상인 2019/11/10일 추가 / 위치 변경 필요 -->	
	                            <li class="qes-side">
	                                <a href="#" aria-expanded="true"><i class="mdi mdi-book-open"></i> 내가 쓴 글 <span
									class="fa arrow"></span></a>
	                                <ul class="nav-second-level nav collapse" aria-expanded="false">
	                                    <li><a href="<%= request.getContextPath() %>/myList.bo">내 게시글</a></li>
	                                    <li><a href="<%= request.getContextPath() %>/myList.co">내 댓글</a></li>
	                                    
	                                    <% if(!loginUser.getUserType().equals("A")) { %>
	                                    <li><a href="<%= request.getContextPath() %>/myList.qe">내 문의</a></li>
	                                    <% } %>
	                                </ul>
	                            </li >
	                            
	                            
	                            <% if(loginUser.getUserType().equals("B")) { %>   
		                            <li class="qes-side">
	                            		<a href="<%= request.getContextPath() %>/list.an" target="_self"><i class="mdi mdi-pencil-box"></i> 답변하기 </a>                           
		                            </li>
	                            	
	                            <% } %>
												
								
  									
<!--                                 <li>
                                    <a href="javascript: void(0);" aria-expanded="true"><i class="ti-pencil-alt"></i> 리뷰 및 메모</span></a>
                                </li> -->
<%--                                 <li>
                                    <a href="<%= request.getContextPath() %>/checkFavorite?code=<%= 10 %>" aria-expanded="true"><i class="ti-pencil-alt"></i> 즐찾 추가 테스트10</span></a>
                                </li>
                                <li>                  <!--  -->
                                    <a href="<%= request.getContextPath() %>/checkFavorite?code=<%= 9 %>" aria-expanded="true"><i class="ti-pencil-alt"></i> 즐찾 추가 테스트9</span></a>
                                </li> --%>

     
                            </ul>
                        </div>
                    </div><!--Scrollbar wrapper-->
                </aside>

				<script>
				
				$(function(){
					
					$.ajax({
						url : "<%= request.getContextPath() %>/propic.select",
						type : "post",
						success : function(data){	
							
							var uno = data.userNo;
							var oname = data.originName;
							var cname = data.changeName;

							$(".propicArea").attr("src","<%= request.getContextPath() %>/resources/userpropic/"+cname+"?after");
							
		
							
						},
						error:function(){
							console.log("ajax 통신 실패");
						}
					});
					
	
				});
				
				
				
				
				
				</script>
	


</body>
</html>