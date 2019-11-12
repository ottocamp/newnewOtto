<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, question.model.vo.*"%>
    
<%
	ArrayList<Question> qlist = (ArrayList<Question>)request.getAttribute("qlist");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
		
	
	String keyWord = "";
	if(request.getAttribute("keyWord") != null) {
		keyWord = (String)request.getAttribute("keyWord");
	}
	
	int boardTag = 999;
	if(request.getAttribute("q_tag") != null) {
		boardTag = (int)(request.getAttribute("q_tag"));
	}
	
	String msg = (String)session.getAttribute("msg");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
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
                border: 1px solid rgb(197, 197, 243);

                color: darkblue;
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


            .searchArea{
                display: inline-block;
                width: 60%;
                
                margin: 0 20px;                
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
            }

            .selectTag, input{
                width: 100%;
            }

            #searchText{                                
                display: inline-block;
                width: 30%;
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
            
            .fontBorder{
                font-weight: bolder;
            }

            .panel-title a:first-of-type{
                margin: 0 10px;
            }

            h2 a{
                color: gray;
            }

            .qes-side a:first-of-type{
                display: inline-block;
                width: auto;
            }

            
            .qes-side > i:hover{
                color: brown;
                cursor: pointer;
            }
            
            .text-align{
            	text-align: center;
            }
            
            .listMargin{
                margin: 10px 0;
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
				<%@ include file="../common/questionSidebar.jsp" %>
                <!--left navigation end-->

                <!-- START PAGE CONTENT -->
                <div id="page-right-content">

                    <div class="container">    
						<div class="board-wrapper">
						                            

                        <h2><a href="<%= request.getContextPath() %>/freqList.qe">자주 묻는 질문</a></h2>
                        <br>
						
						
							<div class="panel-group boardArea" id="accordion" role="tablist" aria-multiselectable="true">
	                        
	                        	<% if(qlist.isEmpty()) { %>
	                        	
	                            <div class="panel panel-default boardList">
	                                <div class="panel-heading " role="tab" id="heading1">
	                                    <h4 class="panel-title text-align">
	                                    	등록된 Q&A가 없습니다
	                                    </h4>
	                                </div>
	                              
	                            </div>
	                            
	                        	<% }else {%>
	                        		<% for(Question q : qlist) { %>
	                        			<% 
	                        			int qTag = q.getqTag();
	                        			String tag = "";
	                        			
	                        			switch (qTag){
	                        			case 0:
	                        				tag = "[결제]";
	                        				break;
	                        			case 1:
	                        				tag = "[예약]";
	                        				break;
	                        			case 2:
	                        				tag = "[설비]";
	                        				break;
	                        			case 3:
	                        				tag = "[기타]";
	                        				break;
	                        			}
	                        			
	                        			String panelId = "heading" + q.getqNo();
	                        			String targetId = "collpase" + q.getqNo();
	                        			
	                        			%>
	                        			
	                        		
		
		                            <div class="panel panel-default boardList">
		                                <div class="panel-heading" role="tab" id="<%= panelId %>">
		                                    <h4 class="panel-title">
		                                        <a href="<%= request.getContextPath() %>/freqList.qe?q_tag=<%= qTag %>"><%= tag %></a>
		                                        <a data-toggle="collapse" data-parent="#accordion" href="#<%= targetId %>" aria-expanded="false" aria-controls="<%= targetId %>">
		                                            <%= q.getqTitle() %>
		                                        </a>
		                                    </h4>
		                                </div>
		                                <div id="<%= targetId %>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="<%= panelId %>">
		                                    <!-- class="in" 일 시 열려 있는 상태-->
		                                    <div class="panel-body">
		                                        <%= q.getqContent() %>
		                                    </div>
		                                </div>
		                            </div>
	                        		<% } %>
	                        	<% } %>
		
	                            
	                        </div>
	                        
	                        <br>
	
	                        <div class="searchArea">
	                            <form class="searchForm" role="search" method="post" action="<%= request.getContextPath() %>/searchPreqList.qe" onsubmit="return checkKeyword();">
	                            	<% if(keyWord.equals("")) { %>
	                            	
	                                <div id="searchText">
	                                	<input type="text" name="keyWord" class="searchHeight" placeholder="키워드를 입력하세요">
	                                	<input type="hidden" name="q_tag" value="<%= boardTag %>">
	                                </div>
	                            	
	                            	<% }else { %>
	                            	
	                                <div id="searchText">
	                                	<input type="text" name="keyWord" class="searchHeight" value="<%= keyWord %>">
	                                	<input type="hidden" name="q_tag" value="<%= boardTag %>">
	                                </div>
	                            		
	                            	
	                            	<% } %>
	
	                                <button class="searchHeight fontBorder" type="submit">검색하기</button>
	                            </form>
	                        </div>
	
                            <div id="insertBtn" class="fontBorder">
                               	<% if(userType.equals("A")) { %>                 
                               		<button type="button" class="btn btn-primary boardBtn insertBtn fontBorder" onclick="location.href='views/board/noticeInsertForm.jsp'">등 록</button>  
                               	<% } %>
                            </div>
							<br><br>
	
							<div class="pagingArea fontBorder">
	                                
	                                <% if(keyWord.equals("")) { %>
		                                
	                                	<% if(!qlist.isEmpty() && listCount > 8) { %>
		                            
				                                <div id="buttonArea">          
				                                	<% if(currentPage - 1 <= 0)  { %>
				                               			<button class="boardBtn" disabled style="color:gray">이전</button>
				                                	<% }else { %>
				                                   		<button class="boardBtn" onclick="location.href='<%= request.getContextPath() %>/freqList.qe?currentPage=<%= currentPage - 1 %>&q_tag=<%= boardTag %>'">이전</button>
				                                	<% } %>  
				                                	
				                                	<% for(int i = startPage; i <= endPage; i++) { %>
				                                		<% if(i == currentPage) { %>
				                                			<button class="boardBtn" disabled style="color:blue"><%= i %></button>
				                                		<% }else { %>
				                                			<button class="boardBtn" onclick="location.href='<%= request.getContextPath() %>/freqList.qe?currentPage=<%= i %>&q_tag=<%= boardTag %>'"><%= i %></button>
				                                		<% } %>                                                           
				                                	<% } %>
				                                      
				                                	<% if(currentPage == maxPage)  { %>
				                                		<button class="boardBtn" disabled style="color:gray">다음</button>
				                                	<% }else { %>
				                                    	<button class="boardBtn" onclick="location.href='<%= request.getContextPath() %>/freqList.qe?currentPage=<%= currentPage + 1 %>&q_tag=<%= boardTag %>'">다음</button>
				                                	<% } %>
				                                </div>
		                                	
		                                <% } %>
		                                
	                                <% }else { %>
		                                
	                                	<% if(!qlist.isEmpty() && listCount > 8) { %>
			                                <div id="buttonArea">          
			                                	<% if(currentPage - 1 <= 0)  { %>
			                               			<button class="boardBtn" disabled style="color:gray">이전</button>
			                                	<% }else { %>
			                                   		<button class="boardBtn" onclick="location.href='<%= request.getContextPath() %>/searchPreqList.qe?currentPage=<%= currentPage - 1 %>&keyWord=<%= keyWord %>&q_tag=<%= boardTag %>'">이전</button>
			                                	<% } %>  
			                                	
			                                	<% for(int i = startPage; i <= endPage; i++) { %>
			                                		<% if(i == currentPage) { %>
			                                			<button class="boardBtn" disabled style="color:blue"><%= i %></button>
			                                		<% }else { %>
			                                			<button class="boardBtn" onclick="location.href='<%= request.getContextPath() %>/searchPreqList.qe?currentPage=<%= i %>&keyWord=<%= keyWord %>&q_tag=<%= boardTag %>'"><%= i %></button>
			                                		<% } %>                                                           
			                                	<% } %>
			                                      
			                                	<% if(currentPage == maxPage)  { %>
			                                		<button class="boardBtn" disabled style="color:gray">다음</button>
			                                	<% }else { %>
			                                    	<button class="boardBtn" onclick="location.href='<%= request.getContextPath() %>/searchPreqList.qe?currentPage=<%= currentPage + 1 %>&keyWord=<%= keyWord %>&q_tag=<%= boardTag %>'">다음</button>
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
	        	var keyword = $("#searchText").children("input[type='text']").val();
	        	
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