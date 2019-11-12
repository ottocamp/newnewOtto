<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="question.model.vo.*" %>
    
<%
	Question q = (Question)request.getAttribute("q");
	String title = q.getqTitle() + " [" + q.getAnsYN() + "]";	


	String msg = (String)session.getAttribute("msg");
	
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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

            .contentText{
                white-space: pre-line;
            }
            
            
            #btnArea button:first-child{
                box-sizing: border-box;
                margin-left: 50px;
                margin-top: 5px;
                margin-right: 5px;
                margin-bottom: 5px;

                padding: 12px;
                width: 25%;
            }

            #btnArea button:nth-child(2){
                box-sizing: border-box;
                margin: 5px;

                padding: 12px;
                width: 25%;
            }
            
            
            #questionTitle{   
            	disply: inline-block;         	
                width: 70%;
            }
            
            .panel-title #questionTitle{
                display: inline-block;
                width: 70%;

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
			    
			    <div id="page-right-content">
			    	<div class="container">
						<div class="board-wrapper">
			    	
				    		<h2><a href="<%= request.getContextPath() %>/views/question/questionPwdCheckForm.jsp">내 문의</a></h2>
				    		<br>
							
							
							<div class="panel-group boardArea" id="accordion" role="tablist" aria-multiselectable="true">
	                        	      
	                            <div class="panel panel-default boardList">
	                                <div class="panel-heading" role="tab" id="noMemTitle">
	                                    <h4 class="panel-title">
	                                	    <div class="display-inline" id="questionTitle">
	                                    	 <%= title %>
	                                        </div>
	                                        <div class="display-inline" id="qesWriter">
	                                        <%= q.getaWriter() %>
	                                        </div>
	                                        <div class="display-inline float-right" id="qesDate">
	                                            작성일 : <%= q.getUpdateDate() %>
	                                        </div>
	                                    </h4>
	                                </div>
	                                <div id="" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="noMemTitle">
	                                    <!-- class="in" 일 시 열려 있는 상태-->
	                                    <div class="panel-body"><span class="contentText"><%= q.getqContent() %>		                                    	
	                                    	</span>
	                                    	
	                                    	<hr>
	                                    	<span class="contentText"><%= q.getAns() %>
	                                    	</span>
	                                    	
	                                    </div>
	                                </div>
	                            </div>	                            
	                        </div>
		                        
		                    <div class="row">
		                        <div class="col-md-4 col-md-offset-4 margin-top-30" id="btnArea">
	                                <button type="button" class="btn btn-secondary fontBorder" onclick="location.href='<%= request.getContextPath() %>/freqList.qe'"> Q&A로</button>
	                                <button type="button" class="btn btn-primary fontBorder" onclick="location='<%= request.getContextPath() %>/views/question/questionPwdCheckForm.jsp'"> 뒤로가기 </button>
		                        </div>
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
			
		
		
        <!-- js placed at the end of the document so the pages load faster -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery-2.1.4.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/bootstrap.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/metisMenu.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.slimscroll.min.js"></script>

        <!-- App Js -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.app.js"></script>

	
	
	</body>
</html>