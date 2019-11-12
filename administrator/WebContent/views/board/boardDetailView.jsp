<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.ArrayList"%>

<%
	Board b = (Board)request.getAttribute("b");
	ArrayList<Comment> cList = (ArrayList<Comment>)request.getAttribute("cList");

	String title = b.getbTitle();
	String nextTitle = "다음 게시글이 없습니다";
	String preTitle = "이전 게시글이 없습니다";
	
	if(request.getAttribute("nextTitle") != null) {
		nextTitle = (String)request.getAttribute("nextTitle");
	}
	
	if(request.getAttribute("preTitle") != null) {
		preTitle = (String)request.getAttribute("preTitle");
	}
	
	
	
	int bTag = b.getbTag();
	int bNo = b.getbNo();
	int writerNo = b.getUserNo();


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
				if(msg != "null") {
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
        
            .container{
                /* border: 1px solid blue; */
            }

            header{
                width: 100%;
                /* border: 1px solid red; */
            }
            
            #contentArea{
                /* border: 1px solid purple; */

                margin: 20px;
                padding: 10px;
            }


            #insert_wrapper{
                height: 170px;
                
                margin: 20px auto;

                /* border: 1px solid rgb(197, 197, 243); */
            }

            #commentInsertArea{
                width: 100%;
                height: 100%;

                padding: 5px 0;
            }
            
            #memberInfo{
                float: left;
                position: relative;
                width: 18%;
                height: 100%;

                padding: 0 15px;
            }

            #memberIdPwd{
                float: left;
                width: 100%;
                height: 50%;
            }

            #memberIdPwd input{
                width: 85%;
                height: 40%;
                margin-top: 5px;
                margin-left: 3px;
            }

            #commentContentArea{                
                float: left;
                width: 70%;
                height: 100%;
                margin: auto;

                /* border: 2px solid purple; */
            }

            #insertBtnArea{
                float: left;
                text-align: center;
                width: 12%;
                height: 100%;

                padding: 30px;
            }
            
            #commentContent{
                display: inline-block;
                width: 100%;
                height: 100%;
            }

            p#goLogin{
                display: inline-block;
                width: 100%;
                height: 50%;
                margin-top: 5%;

                font-size: 5px;
            }
            
            .btnArea{
                display: inline-block;
                padding: 55px 0;
                width: 12%;
                text-align: center;
            }
 
            .submitBtn{
                width: 80%;
                height: 50px;

                background-color: gainsboro;
                border-radius: 5px;
                border: 1px solid rgb(197, 197, 243);

                color: darkblue;
            }

            
            .commentArea{
                
                margin: 5px auto;
                /* border: 1px solid purple;  */
            }

            #commentTable{
                width: 100%;
                margin: 20px 0;
                border: 1px solid rgba(128, 128, 128, 0.671);
            }

            .userName{
                width: 18%;
                text-align: center;
            }

            .commentContent{
                width: 70%;
                /* border: 2px solid purple; */
            }

            .btns{
                width: 12%;
                text-align: center;
            }

            div[class="page-wrapper"]{
                padding: 30px;
            }
            
         

			.user_wrapper, .text_wrapper{
				padding: 30px;
			}

            .btns button{
                width: 80%;
                height: 50px;

                background-color: gainsboro;
                border-radius: 5px;
                border: 1px solid rgb(197, 197, 243);

                color: darkblue;
            }

            .fontBorder{
                font-weight: bolder;
            }

            .contentText{
                white-space: pre-line;
            }




            #titleArea{
                display: inline-block;
            }

            #memInfo{
                float: left;
                line-height: 250%;
                width: 50%;
                margin: 0 10px;
                font-size: 15px;
            }

            #boardInfo{
                float: right;
                width: 15%;
            }

            #boardInfo div{
                float: right;
                margin: 0 15px;
            }




            #controll-wrapper{
                height: 100px;
            }

            #controllArea{
                width: 80%;
                height: 100%;
                margin: 0 auto;

                position: relative;

            }

            #btnDiv{
                display: inline-block;
                width: 10%;
                height: 100%;

                position: absolute;
                top: 0;
                left: 0;
                
                padding: 10px;

            }

            #deleteBtn{
                display: inline-block;
                width: 10%;
                height: 100%;

                position: absolute;
                top: 0;
                left: 80%;
                
                padding: 10px;
            }

            #btnDiv button{
                width: 100%;
                height: 100%;
            }

            #deleteBtn button{
                width: 100%;
                height: 100%;
            }


            #listDiv{
                display: inline-block;
                width: 80%;
                height: 100%;
                
                position: absolute;
                left: 10%;

            }
 
            #listDiv ul{
                display: inline-block;
                list-style-type: none;
                width: 70%;
                height: 100%;
                
                margin: 0;
                padding: 0;
            }

            #listDiv li{
                height: 50%;

                padding: 15px;
                /* margin: 10px; */
            }
            
            .color-drakBlue{
            	color: darkBlue;
            	border: 1px solid rgb(197, 197, 243);
            }
            
            #memberName{
                padding: 65px 0;
                word-break: break-all;
            }


            .align-center{
                text-align: center;
            }


			#toMainBtn{
				margin: 0;
				padding: 0;
			
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
                        <header id="titleArea">
                            <h3><%= title %></h3>
 
                            <div id="memInfo" class="left-box fontBorder">
                                <span>
                                <%= b.getbWriter() %>
                                <% if(writerNo == 9999) { %>
                                	<sub>(비회원)</sub>
                                <% } %>
                                
                                </span>
                            </div>
                            <div id="boardInfo" class="right-box fontBorder">
                                <div>조회수 : <%= b.getbCount() %></div>
                                <br>
                                <div><%= b.getUpdateDate() %></div>
                            </div>
                        </header>
                        <hr><br>
                        <div id="contentArea" class="contentText"><%= b.getbContent() %>
                        </div>

                        <br><hr>
                        <div id="controll-wrapper">
                            <div id="controllArea">
                                <div id="btnDiv" class="fontBorder btns">
                                    <button type="button" class="btn btn-primary fontBorder" id="toMainBtn" onclick="location.href='<%= request.getContextPath() %>/list.bo?b_tag=<%= bTag %>'">목록으로</button>
                                </div>

                                <div id="listDiv">
                                        <ul>
                                            <li>
                                                <span><i class="ti-angle-up">  <%= nextTitle %></i></span>
                                            </li>
                                            <li>
                                                <span><i class="ti-angle-down">  <%= preTitle %></i></span>
                                            </li>
                                        </ul>
                                </div>

                                <div id="deleteBtn" class="fontBorder">
							
									<% if(userType.equals("A")) { %>
									
									<button type="button" class="btn btn-primary fontBorder" data-toggle="modal" data-target="#deleteBoardModal">
										삭제
									</button>
									
									<% }else if(writerNo == 9999) { %>
									
									<button type="button" class="btn btn-primary fontBorder" data-toggle="modal" data-target="#checkPwdModal">
										삭제
									</button>
									
									<% }else if(writerNo == userNo) { %>
									
									<button type="button" class="btn btn-primary fontBorder" data-toggle="modal" data-target="#deleteBoardModal">
										삭제
									</button>
									
									<% } %>
									
                                </div>
                                
                            </div>     
                        </div>
						
						
						<!-- check Pwd Modal -->
						<div class="modal fade" id="checkPwdModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">게시글 삭제</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      
						      <form method="post" action="<%= request.getContextPath() %>/pwdCheck.bo" onsubmit="return checkBoardPwd();">
							      <div class="modal-body">
							            <label for="boardPwd">게시글을 삭제합니다.</label>
    									<input type="password" class="form-control" name="pwd" id="boardPwd" placeholder="임시 비밀번호를 입력하세요">
    									
							            <input type="hidden" name="b_no" value="<%= bNo %>">
							            <input type="hidden" name="bTag" value="<%= bTag %>">
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							        <button type="submit" class="btn btn-primary">삭제하기</button>
							      </div>
						      </form>
						      
						    </div>
						  </div>
						</div>
						<!-- Modal End-->
						
						
						<!-- delete Modal -->
						<div class="modal fade" id="deleteBoardModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">게시글을 삭제합니다</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      
						      
   						      <form method="post" action="<%= request.getContextPath() %>/delete.bo"">
							      <div class="modal-body">
								      정말로 삭제하시겠습니까?
		    									
							          <input type="hidden" name="b_no" value="<%= bNo %>">
							          <input type="hidden" name="bTag" value="<%= bTag %>">
							      </div>
							      <div class="modal-footer">
								      <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
								      <button type="submit" class="btn btn-primary" >삭제하기</button>
							      </div>
						      </form>
						    </div>
						  </div>
						</div>
						<!--  Modal End -->
						
							
						<hr>				


                        <div class="commentArea" id="commentArea">
                        		
                        	<% if(!cList.isEmpty()) { %>
                        		
                        		<% for(Comment c : cList) { %>
                        		
	                            <table id="commentTable">
	                                <tr class="commentTr">
	                                    <td class="userName">	                                
	                                        <div class="user_wrapper fontBorder">
	                                            <%= c.getcWriter() %>
	                                            <% if(c.getUserNo() == 9999) { %>
	                                            	<sub>(비회원)</sub>
	                                            <% } %>
	                                        </div>
	                                    </td>
	                                    <td class="commentContent">
	                                        <div class="text_wrapper">
	                                            <span class="contentText"><%= c.getcContent() %>
												</span>
	                                        </div>
	                                    </td>
										<td class="btns">
											<% if(userType.equals("A")) { %>
											
											<button type="button" class="btn btn-secondary fontBorder deleteCommentBtn" data-toggle="modal" data-target="#deleteCommentModel">
												삭제 
												<input type="hidden" name="c_no" value="<%= c.getcNo() %>">
												<input type="hidden" name="bNo" value="<%= bNo %>">
											</button> 
											
											<% }else if(c.getUserNo() == 9999) { %>
											
											<button type="button" class="btn btn-secondary fontBorder deleteCommentBtn" data-toggle="modal" data-target="#commentPwdCheckModal">
												삭제 
												<input type="hidden" name="c_no" value="<%= c.getcNo() %>">
												<input type="hidden" name="bNo" value="<%= bNo %>">
											</button> 
											
											<% }else if(c.getUserNo() == userNo) { %>
											
											<button type="button" class="btn btn-secondary fontBorder deleteCommentBtn" data-toggle="modal" data-target="#deleteCommentModel">
												삭제 
												<input type="hidden" name="c_no" value="<%= c.getcNo() %>">
												<input type="hidden" name="bNo" value="<%= bNo %>">
											</button> 
											
											<% }else { %>
											
											<button type="button" class="btn btn-outline-light fontBorder" disabled>
												삭제 
											</button> 
											
											<% } %>
											
										</td>
	                                </tr>
	                            </table>
                        	
	                            
                        		<% } %>
                        	<% } %>
                        </div>
						
						<!-- Modal -->
						<div class="modal fade" id="commentPwdCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">댓글 삭제</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      
						      <form method="post" action="<%= request.getContextPath() %>/pwdCheck.co" onsubmit="return checkCommentPwd();">
							      <div class="modal-body commentPwd">
							            <label>댓글을 삭제합니다.</label>
    									<input type="password" class="form-control" name="pwd" placeholder="임시 비밀번호를 입력하세요">
    									<input type="hidden" name="c_no">
							            <input type="hidden" name="bNo">
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							        <button type="submit" class="btn btn-primary">삭제하기</button>
							      </div>
						      </form>
						      
						    </div>
						  </div>
						</div>
						
						<!-- Modal End-->	
						
						
						<!-- delete Modal -->
						<div class="modal fade" id="deleteCommentModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">댓글을 삭제합니다</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      
						      
   						      <form method="post" action="<%= request.getContextPath() %>/delete.co"">
							      <div class="modal-body commentPwd">
							          <label>정말로 삭제하시겠습니까?</label>
		    									
									  <input type="hidden" name="c_no">
						              <input type="hidden" name="bNo">
							      </div>
							      <div class="modal-footer">
								      <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
								      <button type="submit" class="btn btn-primary" >삭제하기</button>
						      	  </div>
						      </form>
						    </div>
						  </div>
						</div>
						<!--  Modal End -->											               
						

                        <hr>
                        
                        <% if(userNo == 9999) { %>

                        <div id="insert_wrapper">
                            <div id="commentInsertArea">
                                <div id="memberInfo">
                                    <div id="memberIdPwd">
                                        <input type="text" id="memberId" placeholder="임시 Id">
                                        <input type="password" id="memberPwd" placeholder="임시 비밀번호">
                                    </div>
                                    <p id="goLogin">
                                        비회원 작성 시, 비밀번호를 분실하면 댓글을 삭제 할 수 없습니다.
                                        <br><br>
                                        <a href="<%= request.getContextPath() %>/views/user/login.jsp" style="font-size: 13px;">로그인</a>하러 가기
                                    </p>
                                </div>
                                <div id="commentContentArea">
                                    <textarea id="commentContent" style="resize: none"></textarea>
                                </div>
                                <div class="btnArea btns">
                                    <button class="btn btn-primary submitBtn fontBorder" id="commentInsertBtn" type="button">등록하기</button>
                                </div>
                            </div>     
                        </div> 
                        
                        <% }else { %>

					    <div id="insert_wrapper">
					        <div id="commentInsertArea">
					            <div id="memberInfo" class="align-center">
					                <div id="memberName" class="user_wrapper fontBorder">
					                    <%= loginUser.getUserName() %>
					                </div>
					            </div>
					            <div id="commentContentArea">
					                <textarea id="commentContent" style="resize: none"></textarea>
					            </div>
					            <div class="btnArea">
					                <button class="submitBtn fontBorder" id="memberCommentInsertBtn" type="submit">등록하기</button>
					            </div>
					        </div>     
					    </div>  
                        <% } %>

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

			function checkBoardPwd(){
				var pwd = $("#boardPwd").val();
				
				if(pwd == ""){
					alert("비밀번호를 입력하세요")
					
					return false;
				}else{
					return true;
				}
				
			}	

			function checkCommentPwd(){
				var pwd = $(".commentPwd").children("input[name='pwd']").val();
				
				if(pwd == ""){
					alert("비밀번호를 입력하세요")
					
					return false;
				}else{
					return true;
				}
				
			}		

			$(document).on('click', '.deleteCommentBtn', function(){ 
    			var cNo = $(this).children("input[name='c_no']").val();
    			var bNo = $(this).children("input[name='bNo']").val();
    			
    			$(".commentPwd").children("input[name='c_no']").val(cNo);
    			$(".commentPwd").children("input[name='bNo']").val(bNo);
    			
    			console.log($(".commentPwd").children("input[name='c_no']").val());			        			
    			console.log($(".commentPwd").children("input[name='bNo']").val());       
    			
    		});   
			
			


		
			$(function(){		
				
				$("i[class='ti-angle-up']").parent().mouseover(function(){
					$(this).css({"color":"purple", "cursor":"pointer"});
				}).mouseout(function(){
					$(this).css("color", "gray");
				}).click(function(){	
					var bNo = <%= bNo %>;
					var bTag = <%= bTag %>;
					
					$.ajax({
						url : "nextNo.bo",
						data : {bNo:bNo, bTag:bTag},
						type : "post",
						success : function(data){
							if(data == 0) {
								alert("다음 게시글이 없습니다");
							}else {
								location.href="<%= request.getContextPath() %>/detail.bo?b_no=" + data;
							}
							
						},
						error : function(){
							console.log("통신 실패");
						}
					});
				});
				
				
				
				
				$("i[class='ti-angle-down']").parent().mouseover(function(){
					$(this).css({"color":"purple", "cursor":"pointer"});
				}).mouseout(function(){
					$(this).css("color", "gray");
				}).click(function(){	
					var bNo = <%= bNo %>;
					var bTag = <%= bTag %>;
					
					$.ajax({
						url : "preNo.bo",
						data : {bNo:bNo, bTag:bTag},
						type : "post",
						success : function(data){
							if(data == 0) {
								alert("이전 게시글이 없습니다");
							}else {
								location.href="<%= request.getContextPath() %>/detail.bo?b_no=" + data;
							}
			
							
							
						},
						error : function(){
							console.log("통신 실패");
						}
					});
				});
				
				
				
				$("#commentInsertBtn").click(function(){
					var dispoId = $("#memberId").val();
					var dispoPwd = $("#memberPwd").val();
					var commentContent = $("#commentContent").val();
					var bNo = <%= bNo %>;
					
					if(dispoId == "" || dispoPwd == "") {
						
						alert("임시ID 또는 비밀번호를 입력하세요");
						
					}else if(commentContent == "") {
						
						alert("내용을 입력하세요");
						
					}else {

						/* ajax시작 */
						$.ajax({
							url : "insertComment.bo",
							data : {dispoId:dispoId, dispoPwd:dispoPwd, commentContent:commentContent, bNo:bNo},
							type : "post",
							dataType : "json",
							success : function(data){
								$commentArea = $("#commentArea");
								$commentArea.text("");
								
								for(var key in data) {
									// <table>선언
									var $input = $("<input>").attr("type", "hidden").attr("id", "userNoInput").val(data[key].userNo);
									var $table = $("<table>").attr("id", "commentTable");
									$table.append($input);
									
									
									// 작성자 명 <tr>선언
									var $tr = $("<tr>").addClass("commentTr");
									
									var $nameTd = $("<td>").addClass("userName");
									var $nameDiv = $("<div>").addClass("user_wrapper fontBorder").text(data[key].cWriter);

									if(data[key].userNo == 9999) {
										var $sub = $("<sub>").text("(비회원)");
										
										$nameDiv.append($sub);
									}
									
									$nameTd.append($nameDiv);
									
									
									// 댓글내용 <tr>선언
									var $contentTd = $("<td>").addClass("commentContent");
									var $contentDiv = $("<div>").addClass("text_wrapper");
									var $contentSpan = $("<span>").addClass("contentText").text(data[key].cContent);
									
									$contentDiv.append($contentSpan);
									$contentTd.append($contentDiv);
									
									
									// 버튼내용 <tr>선언
									var $btnTd = $("<td>").addClass("btns");

									var $button = $("<button>").addClass("btn btn-secondary fontBorder deleteCommentBtn").attr({"type":"button", "data-toggle":"modal"}).text("삭제");
									var $cNoInput = $("<input>").attr({"type":"hidden", "name":"c_no"}).val(data[key].cNo);;
									var $bNoInput = $("<input>").attr({"type":"hidden", "name":"bNo"}).val(data[key].bNo);;

									if(<%= userType.equals("A") %>) {
										$button.attr("data-target", "#deleteCommentModel");	
									}else if(data[key].userNo == 9999) {
										$button.attr("data-target", "#commentPwdCheckModal");	
									}else if(data[key].userNo == <%= userNo %>) {
										$button.attr("data-target", "#deleteCommentModel");	
									}

									$button.append($cNoInput);
									$button.append($bNoInput);
									$btnTd.append($button);
									
									
									
									$tr.append($nameTd);
									$tr.append($contentTd);
									$tr.append($btnTd);
									
									$table.append($tr);
									$commentArea.append($table);
								}	
								
	               
								
								$("#memberId").val("");
								$("#memberPwd").val("");
								$("#commentContent").val("");
								
							},
							error : function(){
								console.log("통신 실패");
							}							
						});
					/* ajax끝 */
						
					}
					
					
				});
				
				
				
				
				$("#memberCommentInsertBtn").click(function(){
					var commentContent = $("#commentContent").val();
					var bNo = <%= bNo %>;					
					
					if(commentContent == "") {
						
						alert("내용을 입력하세요");
						
					}else{
						
						/* ajax시작 */
						$.ajax({
							url : "insertMemberComment.bo",
							data : {commentContent:commentContent, userNo:<%= userNo %>, bNo:bNo},
							type : "post",
							dataType : "json",
							success : function(data){
								$commentArea = $("#commentArea");
								$commentArea.text("");
								
								for(var key in data) {
									// <table>선언
									var $input = $("<input>").attr("type", "hidden").attr("id", "userNoInput").val(data[key].userNo);
									var $table = $("<table>").attr("id", "commentTable");
									$table.append($input);
									
									
									// 작성자 명 <tr>선언
									var $tr = $("<tr>").addClass("commentTr");
									
									var $nameTd = $("<td>").addClass("userName");
									var $nameDiv = $("<div>").addClass("user_wrapper fontBorder").text(data[key].cWriter);

									if(data[key].userNo == 9999) {
										var $sub = $("<sub>").text("(비회원)");
										
										$nameDiv.append($sub);
									}
									
									$nameTd.append($nameDiv);
									
									
									// 댓글내용 <tr>선언
									var $contentTd = $("<td>").addClass("commentContent");
									var $contentDiv = $("<div>").addClass("text_wrapper");
									var $contentSpan = $("<span>").addClass("contentText").text(data[key].cContent);
									
									$contentDiv.append($contentSpan);
									$contentTd.append($contentDiv);
									
									
									// 버튼내용 <tr>선언
									var $btnTd = $("<td>").addClass("btns");

									var $button = $("<button>").addClass("btn btn-secondary fontBorder deleteCommentBtn").attr({"type":"button", "data-toggle":"modal"}).text("삭제");
									var $cNoInput = $("<input>").attr({"type":"hidden", "name":"c_no"}).val(data[key].cNo);;
									var $bNoInput = $("<input>").attr({"type":"hidden", "name":"bNo"}).val(data[key].bNo);;

									if(<%= userType.equals("A") %>) {
										$button.attr("data-target", "#deleteCommentModel");	
									}else if(data[key].userNo == 9999) {
										$button.attr("data-target", "#commentPwdCheckModal");	
									}else if(data[key].userNo == <%= userNo %>) {
										$button.attr("data-target", "#deleteCommentModel");	
									}

									$button.append($cNoInput);
									$button.append($bNoInput);
									$btnTd.append($button);
									
									
									
									$tr.append($nameTd);
									$tr.append($contentTd);
									$tr.append($btnTd);
									
									$table.append($tr);
									$commentArea.append($table);
								}	
								

								
								$("#memberId").val("");
								$("#memberPwd").val("");
								$("#commentContent").val("");
								
							},
							error : function(){
								console.log("통신 실패");
							}
							
							
						});
						/* ajax끝 */
						
					}
					
					
				});
				
			});
			
			
            
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