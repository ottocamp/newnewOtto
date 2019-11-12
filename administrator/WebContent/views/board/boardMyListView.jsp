<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.ArrayList, java.util.HashMap" %>
<%
	ArrayList<Board> blist = (ArrayList<Board>)request.getAttribute("blist");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	HashMap cCount = (HashMap)request.getAttribute("cCount");	
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
		
	
	String keyWord = "";
	if(request.getAttribute("keyWord") != null) {
		keyWord = (String)request.getAttribute("keyWord");
	}
	
	
	String msg = (String)session.getAttribute("msg");
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Atto</title>
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

            .searchArea{
                display: inline-block;
                width: 60%;
            }
            
            .searchHeight{
                height: 36px;
                margin: 10px 0;
            }

            #selectArea{
                display: inline-block;
                width: 10%;
            }

            .selectTag, input{
                width: 100%;
            }

            #searchText{                                
                display: inline-block;
                width: 30%;
            }

            

            button{                                
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

            button[type='button']{
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



            button{
				height:30px;
                width:80px;
				border-radius:5px;

                background-color: gainsboro;
                border-radius: 5px;
                border: 1px solid rgb(197, 197, 243);

                color: darkblue;
			}

            #titleArea{
                width: 95%;
                margin-right: 0;
            }

            #boardTitle{
                width: 75%;
            }

            #boardTitle a:first-of-type{
                margin-right: 8px;
            }

            #boardTitle a{
                color: gray;
            }

            #boardCount{
                margin: 0 15px;
            }

            #deleteBoard{
                border: none;
                width: 4%;
                margin: 0;
            }

            #deleteBoard a{
                color: gray;
                margin: 0;
            }



            
            #boardTitle a:first-of-type{
                display: inline-block;
                width: auto;
            }

            
            #boardTitle > i:hover{
                color: brown;
                cursor: pointer;
            }
            
            
           	h2 a{
                color: gray;
            }
            
            
            
            .contentText{
                white-space: pre-line;
            }

            .fontBorder{
                font-weight: bolder;
            }
            
            .float-left{
                float: left;
            }

            .float-right{
                float: right;
            }
            
            .display-inline{
                display: inline;
            }

            .display-inline-block{
                display: inline-block;
            }
        
            .textCenter{
                text-align: center;
            }
        
        
           	.box{
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
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
                <% if(userType.equals("B")) { %>
				<%@ include file="../common/campSidebar.jsp" %>                
                <% }else{ %>
				<%@ include file="../common/userSidebar.jsp" %>
                <% } %>
                <!--left navigation end-->
		

                <!-- START PAGE CONTENT -->
                <div id="page-right-content">

                    <div class="container">
                    
						<div class="board-wrapper">
                        
	                        <h2><a href="<%= request.getContextPath() %>/myList.bo">내 게시글</a></h2>
	                        <br>

	                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
	                        	<% if(blist.isEmpty()) { %>
		                        	
		                            <div class="panel panel-default boardList textCenter">
		                                <div class="panel-heading " role="tab" id="heading1">
		                                    <h4 class="panel-title text-align">
		                                    	내 게시글이 없습니다
		                                    </h4>
		                                </div>
		                              
		                            </div>
		                            
	                        	<% }else {%>
	                        		<% for(Board b : blist) { %>
	                        		<% 
	                        			String title = "";
	                        		
		                    			int count = 0;
		                    			if(cCount.get(b.getbNo()) != null) {
		                    				count = (int)cCount.get(b.getbNo());
		                    			}
		                    			
		                    			title = b.getbTitle() + " [" + count + "]";
	                        		
	                        		%>
	                        		
	                        		
			                            <div class="panel panel-default display-inline-block boardList" id="titleArea">
			                                <div class="panel-heading" role="tab" id="heading1">
			                                    <h4 class="panel-title">
			
			                                        <div class="display-inline-block" id="boardTitle">
			                                            <a href="<%= request.getContextPath() %>/detail.bo?b_no=<%= b.getbNo() %>"><%= title %></a>
			                                            <i class="mdi mdi-checkbox-multiple-blank-outline" style="font-size: 12px" onclick="window.open('<%= request.getContextPath() %>/detail.bo?b_no=<%= b.getbNo() %>')"></i>
                            		
			                                        </div>
			                                        
			                                        <div class="display-inline-block" id="boardCount">
			                                            조회수 : <%= b.getbCount() %>
			                                        </div>
			                                        <div class="display-inline-block float-right" id="qesDate">
			                                            작성일 : <%= b.getUpdateDate() %>
			                                        </div>
			                                    </h4>
			                                </div>
			                            </div>
	                        
			                            <div class="panel panel-default display-inline-block textCenter" id="deleteBoard">
			                                <a href="<%= request.getContextPath() %>/delete.bo?b_no=<%= b.getbNo() %>"><i class="mdi mdi-delete" style="font-size: 25px;"></i></a>
			                            </div>
	                        		<% } %>
	                        	<% } %>
	                        </div>
	
	                        <br>
		
	                        <div class="searchArea">
                                <form class="searchForm" role="search" method="post" action="<%= request.getContextPath() %>/mySearch.bo" onsubmit="return checkKeyword();">

                                    <div id="searchText">
                                    	<% if(keyWord.equals("")) { %>
                                        <input type="text" name="keyWord" class="searchHeight" placeholder="키워드를 입력하세요">
                                        
                                    	<% }else { %>
                                    	
                                        <input type="text" name="keyWord" class="searchHeight" value="<%= keyWord %>">
                                    	
                                    	<% } %>
                                    
                                    </div>

                                    <button class="searchHeight fontBorder boardBtn" type="submit">검색하기</button>
	                            </form>
	                        </div>
	
	                        <div id="insertBtn" class="fontBorder">
                            	<button type="button" class="btn btn-primary boardBtn insertBtn fontBorder" onclick="location.href='views/board/boardInsertForm.jsp'">글쓰기</button> 
	                        </div>
	
	                        <br><br>
	
							<div class="pagingArea fontBorder">
	                                
	                                <% if(keyWord.equals("")) { %>
		                                
	                                	<% if(!blist.isEmpty() && listCount > 8) { %>
		                            
				                                <div id="buttonArea">          
				                                	<% if(currentPage - 1 <= 0)  { %>
				                               			<button class="boardBtn" disabled style="color:gray">이전</button>
				                                	<% }else { %>
				                                   		<button class="boardBtn" onclick="location.href='<%= request.getContextPath() %>/myList.bo?currentPage=<%= currentPage - 1 %>'">이전</button>
				                                	<% } %>  
				                                	
				                                	<% for(int i = startPage; i <= endPage; i++) { %>
				                                		<% if(i == currentPage) { %>
				                                			<button class="boardBtn" disabled style="color:blue"><%= i %></button>
				                                		<% }else { %>
				                                			<button class="boardBtn" onclick="location.href='<%= request.getContextPath() %>/myList.bo?currentPage=<%= i %>'"><%= i %></button>
				                                		<% } %>                                                           
				                                	<% } %>
				                                      
				                                	<% if(currentPage == maxPage)  { %>
				                                		<button class="boardBtn" disabled style="color:gray">다음</button>
				                                	<% }else { %>
				                                    	<button class="boardBtn" onclick="location.href='<%= request.getContextPath() %>/myList.bo?currentPage=<%= currentPage + 1 %>'">다음</button>
				                                	<% } %>
				                                </div>
		                                	
		                                <% } %>
		                                
	                                <% }else { %>
		                                
	                                	<% if(!blist.isEmpty() && listCount > 8) { %>
			                                <div id="buttonArea">          
			                                	<% if(currentPage - 1 <= 0)  { %>
			                               			<button class="boardBtn" disabled style="color:gray">이전</button>
			                                	<% }else { %>
			                                   		<button class="boardBtn" onclick="location.href='<%= request.getContextPath() %>/mySearch.bo?currentPage=<%= currentPage - 1 %>&keyWord=<%= keyWord %>'">이전</button>
			                                	<% } %>  
			                                	
			                                	<% for(int i = startPage; i <= endPage; i++) { %>
			                                		<% if(i == currentPage) { %>
			                                			<button class="boardBtn" disabled style="color:blue"><%= i %></button>
			                                		<% }else { %>
			                                			<button class="boardBtn" onclick="location.href='<%= request.getContextPath() %>/mySearch.bo?currentPage=<%= i %>&keyWord=<%= keyWord %>'"><%= i %></button>
			                                		<% } %>                                                           
			                                	<% } %>
			                                      
			                                	<% if(currentPage == maxPage)  { %>
			                                		<button class="boardBtn" disabled style="color:gray">다음</button>
			                                	<% }else { %>
			                                    	<button class="boardBtn" onclick="location.href='<%= request.getContextPath() %>/mySearch.bo?currentPage=<%= currentPage + 1 %>&keyWord=<%= keyWord %>'">다음</button>
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