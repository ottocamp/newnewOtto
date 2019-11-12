<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.ArrayList"%>

<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("blist");
	PageInfo pi = (PageInfo)request.getAttribute("pi");

	int bTag = (int)request.getAttribute("bTag");
	
	String tag = "";
	switch (bTag){
	case 0:
		tag = "공지";
		break;
	case 1:
		tag = "정보";
		break;
	case 2:
		tag = "잡담";
		break;
	}
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
		
		
	String keyWord = "";
	if(request.getAttribute("keyWord") != null) {
		keyWord = (String)request.getAttribute("keyWord");
	}
		
	String searchTag = "";
	if(request.getAttribute("tag") != null) {
		searchTag = (String)request.getAttribute("tag");
	}
	
	
	String msg = (String)session.getAttribute("msg");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
		<!-- jqury cdn -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script>
			var msg = "<%= msg %>";
			
			$(function(){
				if(msg != "null"){
					alert(msg);
					<% session.removeAttribute("msg"); %>
				}
			})
			
		
		</script>
		
		
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/assets/images/favicon.ico">

        <!-- Bootstrap core CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/metisMenu.min.css" rel="stylesheet">
        <!-- Icons CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/icons.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/style.css" rel="stylesheet">

        <style>

            .board-wrapper{
                width: 90%;
                margin: 0 auto;
                /* border: 1px solid purple; */
            }

            .boardArea{
                margin: 10px 0;
                
                /* border: 1px solid red; */
            }

            .boardList{
                width: 95%;
                margin: 0 auto;

                background-color: white;
            }

            th{
                text-align: center;
                background-color: rgb(73, 73, 73);
                padding: 8px;
                font-size: 18px;
                color: white;
            }


            td{
                text-align: center;
                background-color: rgb(243, 243, 243);
                padding: 8px;

                border: 2px solid white;
            }

            th:first-of-type{
                border-radius: 3px 0 0 0;
            }

            th:last-of-type{
                border-radius: 0 3px 0 0;
            }

            tr:last-child td:first-child {
                border-radius: 0 0 0 6px;
            }
 
            tr:last-child td:last-child {
                border-radius: 0 0 6px 0;
            }



            .searchArea{
                display: inline-block;
                width: 60%;
            }
            
            .searchArea *{
                border-radius: 3px;
            }
            
            .searchHeight{
                height: 36px;
                margin: 10px 0;
            }

            #selectArea{
                display: inline-block;
                width: 10%;
                margin-left: 20px;
            }

            .selectTag, input{
                width: 100%;
            }

            #searchText{                                
                display: inline-block;
                width: 30%;
            }

            

            .boardBtn{                                
                display: inline-block;
                width: 12%;

                background-color: gainsboro;
                border-radius: 5px;
                border: 1px solid rgb(197, 197, 243);

                color: darkblue;
            }
            
            #insertBtn{
                float: right;
                margin: 10px 20px;
                height: 45px;
                width: 20%;
            }

            .insertBtn{
                float: right;
                width: 50%;
                height: 100%;

                background-color: darkblue;
                color: aliceblue;
                float: right;
            }


            .pagingArea{
                width: 100%;

                text-align: center;
            }

            #buttonArea{
                display: inline-block;

                text-align: center;
            }
            
            #buttonArea button{
                float: left;
                position:relative;
                width: 36px;
                height: 36px;
                margin: 0 auto;
                padding: 0;
                
                border-radius: 0;
                background-color: white;
            }

            #buttonArea button:first-of-type{
                width: 50px;

                border-top-left-radius: 5px;
                border-bottom-left-radius: 5px;
            }

            #buttonArea button:last-of-type{
                width: 50px;

                border-top-right-radius: 5px;
                border-bottom-right-radius: 5px;
            }

            tr td:nth-child(3):hover{
                background-color: rgb(155, 155, 155);
                color: white;

                font-weight: bolder;
                
                cursor: pointer;
            }
            

            .fontBorder{
                font-weight: bolder;
            }

            h2 a{
                color: gray;
            }

        </style>

</head>
<body>

	<div id="page-wrapper">

            <!-- Top Bar Start -->
            <%@ include file="../common/topnavbar.jsp" %>
            <!-- Top Bar End -->

			<% 
				int userNo = 9999;
				String userType = "";
				if(loginUser != null) {
					userNo = loginUser.getUserNo();
					userType = loginUser.getUserType();					
				}				
			%>

            <!-- Page content start -->
            <div class="page-contentbar">

                <!--left navigation start-->
				<%@ include file="../common/boardSidebar.jsp" %>
                <!--left navigation end-->

                <!-- START PAGE CONTENT -->
                <div id="page-right-content">

                    <div class="container">          
						
                        
                        <div class="board-wrapper">
                        
                                              
						<% if(bTag == 0) { %>
                        	<h2><a href="<%= request.getContextPath() %>/list.bo?b_tag=0">공지사항</a></h2>
						<% }else if(bTag == 1) { %>
                        	<h2><a href="<%= request.getContextPath() %>/list.bo?b_tag=1">정보공유</a></h2>
						<% }else { %>
                        	<h2><a href="<%= request.getContextPath() %>/list.bo?b_tag=2">잡담(자유)</a></h2>
						<% } %>
						<br>
                        
                            <div class="boardArea">
                                <table class="boardList">
                                    <thead class="thead-light">
                                        <tr>
                                            <th width="50">분류</th>
                                            <th width="300">제목</th>
                                            <th width="80">작성자</th>
                                            <th width="100">작성일</th>
                                            <th width="40">조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<% if(list.isEmpty()) { %>
                                    	<tr>
                                    		<td colspan="5">조회된 공지사항이 없습니다.</td>
                                    	</tr>
                                    	
                                    	<% }else { %>
                                        	<% for(Board b : list) { %>
                                        	
	                                    	<tr>
												<input type="hidden" value="<%= b.getbNo() %>">
	                                            <td><%= tag %></td>
	                                            <td><%= b.getbTitle() %></td>
	                                            <td><%= b.getbWriter() %></td>
	                                            <td><%= b.getUpdateDate() %></td>
	                                            <td><%= b.getbCount() %></td>
	                                        </tr>
                                        	<% } %>
                                    	<% } %>
                                     
                                    </tbody>
                                </table>
                            </div>

                            <br>
                            <div class="searchArea">
                                <form class="searchForm" role="search" method="post" action="<%= request.getContextPath() %>/search.bo" onsubmit="return checkKeyword();">
                                    <div id="selectArea">
                                        <select class="selectTag searchHeight" name="selectTag">
                                        	<% if(searchTag.equals("")) { %>                                        	
                                            <option id="searchTag" value="title">제목</option>
                                            <option id="searchTag" value="writer">작성자</option>
                                            <option id="searchTag" value="content">내용</option>
                                            
                                            <% }else if(searchTag.equals("title")) { %>      
                                                              	
                                            <option id="searchTag" value="title" selected>제목</option>
                                            <option id="searchTag" value="writer">작성자</option>
                                            <option id="searchTag" value="content">내용</option>
                                            
                                            <% }else if(searchTag.equals("writer")) { %>      
                                                              	
                                            <option id="searchTag" value="title">제목</option>
                                            <option id="searchTag" value="writer" selected>작성자</option>
                                            <option id="searchTag" value="content">내용</option>
                                            
                                            <% }else if(searchTag.equals("content")) { %>      
                                                              	
                                            <option id="searchTag" value="title">제목</option>
                                            <option id="searchTag" value="writer">작성자</option>
                                            <option id="searchTag" value="content" selected>내용</option>
                                            
                                            <% } %>
                                            
                                            
                                            
                                        </select>
                                    </div>
                                    <div id="searchText">
                                    	<% if(keyWord.equals("")) { %>
                                        <input type="text" name="keyWord" class="searchHeight" placeholder="키워드를 입력하세요">
                                        
                                    	<% }else { %>
                                    	
                                        <input type="text" name="keyWord" class="searchHeight" value="<%= keyWord %>">
                                    	
                                    	<% } %>
                                    
                                        <input type="hidden" name="bTag" value="<%= bTag %>">
                                    </div>

                                    <button class="searchHeight fontBorder boardBtn" type="submit">검색하기</button>
                                </form>
                            </div>

                            <div id="insertBtn" class="fontBorder">
                            	<% if(bTag != 0) {%>                             	                  
                                		<button type="button" class="btn btn-primary boardBtn insertBtn fontBorder" onclick="location.href='views/board/boardInsertForm.jsp'">글쓰기</button>                            	                  
                                <% }else { %>
                                	<% if(userType.equals("A")) { %>                 
                                		<button type="button" class="btn btn-primary boardBtn insertBtn fontBorder" onclick="location.href='views/board/noticeInsertForm.jsp'">공지 작성</button>  
                                	<% } %>
                                <% } %>
                            </div>

                            <br><br>
                            
                            <div class="pagingArea fontBorder">
                                
                                <% if(keyWord.equals("")) { %>
                                
	                            	<% if(!list.isEmpty() && listCount > 12) { %>
	                            
	                                <div id="buttonArea">          
	                                	<% if(currentPage - 1 <= 0)  { %>
	                               			<button class="boardBtn" disabled style="color:gray">이전</button>
	                                	<% }else { %>
	                                   		<button class="boardBtn" onclick="location.href='<%= request.getContextPath() %>/list.bo?b_tag=<%= bTag %>&currentPage=<%= currentPage - 1 %>'">이전</button>
	                                	<% } %>  
	                                	
	                                	<% for(int i = startPage; i <= endPage; i++) { %>
	                                		<% if(i == currentPage) { %>
	                                			<button class="boardBtn" disabled style="color:blue"><%= i %></button>
	                                		<% }else { %>
	                                			<button class="boardBtn" onclick="location.href='<%= request.getContextPath() %>/list.bo?b_tag=<%= bTag %>&currentPage=<%= i %>'"><%= i %></button>
	                                		<% } %>                                                           
	                                	<% } %>
	                                      
	                                	<% if(currentPage == maxPage)  { %>
	                                		<button class="boardBtn" disabled style="color:gray">다음</button>
	                                	<% }else { %>
	                                    	<button class="boardBtn" onclick="location.href='<%= request.getContextPath() %>/list.bo?b_tag=<%= bTag %>&currentPage=<%= currentPage + 1 %>'">다음</button>
	                                	<% } %>
	                                </div>
	                                
	                                <% } %>
	                                
                                <% }else { %>
                                
	                            	<% if(!list.isEmpty() && listCount > 12) { %>
	                            
	                                <div id="buttonArea">          
	                                	<% if(currentPage - 1 <= 0)  { %>
	                               			<button class="boardBtn" disabled style="color:gray">이전</button>
	                                	<% }else { %>
	                                   		<button class="boardBtn" onclick="location.href='<%= request.getContextPath() %>/search.bo?bTag=<%= bTag %>&currentPage=<%= currentPage - 1 %>&keyWord=<%= keyWord %>&selectTag=<%= searchTag %>'">이전</button>
	                                	<% } %>  
	                                	
	                                	<% for(int i = startPage; i <= endPage; i++) { %>
	                                		<% if(i == currentPage) { %>
	                                			<button class="boardBtn" disabled style="color:blue"><%= i %></button>
	                                		<% }else { %>
	                                			<button class="boardBtn" onclick="location.href='<%= request.getContextPath() %>/search.bo?bTag=<%= bTag %>&currentPage=<%= i %>&keyWord=<%= keyWord %>&selectTag=<%= searchTag %>'"><%= i %></button>
	                                		<% } %>                                                           
	                                	<% } %>
	                                      
	                                	<% if(currentPage == maxPage)  { %>
	                                		<button class="boardBtn" disabled style="color:gray">다음</button>
	                                	<% }else { %>
	                                    	<button class="boardBtn" onclick="location.href='<%= request.getContextPath() %>/search.bo?bTag=<%= bTag %>&currentPage=<%= currentPage + 1 %>&keyWord=<%= keyWord %>&selectTag=<%= searchTag %>'">다음</button>
	                                	<% } %>
	                                </div>
	                                
	                                <% } %>
                                
                                <% } %>
                                
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
	        $(function(){	   
	        	$("tr td:nth-of-type(2)").click(function(){
	        		var bNo = $(this).parent().children("input").val();	 
	        		
	        		location.href="<%= request.getContextPath() %>/detail.bo?b_no=" + bNo;
	        	});
	        	
	        });
	        
	        
	        function checkKeyword(){
	        	var keyword = $("#searchText").children("input").val();
	        	
	        	if(keyword == ""){
					alert("키워드를 입력하세요")
					
					return false;
				}else{
					return true;
				}
	        }
	        
	        
        </script>



        <!-- js placed at the end of the document so the pages load faster -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery-2.1.4.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/bootstrap.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/metisMenu.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.slimscroll.min.js"></script>

        <!-- App Js -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.app.js"></script>

		
		

</body>
</html>