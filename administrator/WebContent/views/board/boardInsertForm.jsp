<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<!-- jqury cdn -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
        <meta charset="utf-8" />
        <title>SimpleAdmin - Responsive Admin Dashboard Template</title>
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
		

        <!-- Summernote css -->
        <link href="<%= request.getContextPath() %>/resources/assets/plugins/summernote/summernote.css" rel="stylesheet" />
		

        <style>

            #outer{
                width: 100%;
                margin: 5px auto;
                /* border: 1px solid purple;  */
            }
            
            

            form {
                margin: 10px;
            }
            
            label{
                margin-right: 10px;
            }


            select{
                height: 30px;
            }

            #bTitle{
                width: 35%;
                height: 30px;
            }

      

            #memberInfo{
                display: inline-block;
                width: 18%;
                margin: 5px 20px;
            }

            #memberInfo input{
                display: block;
                width: 100%;
                height: 30px;
                margin-top: 5px;
                font-size: 12px;
            }

            p#goLogin{
                display: inline-block;
                font-size: 5px;
            }            
            
            #btnArea{
                margin: 15px 0;
                margin-bottom: 30px;
            }
            
            #btnArea button{
				height:30px;
                width:80px;
				border-radius:5px;

                background-color: gainsboro;
                border-radius: 5px;
                border: 1px solid rgb(197, 197, 243);

                color: darkblue;
			}
			
			#btnArea button:hover{
				cursor:pointer;
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
                            <div id="outer">
                                <form method="post" action="<%= request.getContextPath() %>/insert.bo" onsubmit="return checkText();">
                                	<input type="hidden" name="userNo" value="<%= userNo %>">
                                    <div id="tagArea">
                                        <label>분류</label>
                                        <select name="boardTag" >
                                        	
                                            <option value="1" selected>정보공유</option>
                                            <option value="2">잡담</option>
                                            
                                        </select>
                                        &nbsp;&nbsp;
                                        <label>지역</label>
                                        <select name="regionTag">
                                            <option value="0" hidden>---</option>
                                            <option value="1" selected>서울</option>
                                            <option value="2">경기도</option>
                                            <option value="3">강원도</option>
                                            <option value="4">경상도</option>
                                            <option value="5">충청도</option>
                                            <option value="6">전라도</option>
                                        </select>
                                    </div>
                                    
                                    <hr>
                                    <div id="titleArea">
                                        <label>제목</label>
                                        <input type="text" name="bTitle" id="bTitle" placeholder="제목을 입력하세요" maxlength="50">
                                    </div>
                                    <hr>
                                    <div id="contentArea">
                                        <label>내용</label>
                                        <textarea class="summernote" name="content" id="content">
                                        		
                                        </textarea>
                                    </div>
                                    <hr>
                                    
                                    <div id="contentfooter">
                                    
                                    <% if(userNo == 9999) { %>
                                    
                                        <div id="memberInfo">
                                            <input type="text" name="memName" id="memName" placeholder="임시 닉네임을 입력하세요">
                                            <input type="password" name="memPwd" id="memPwd" placeholder="임시 비밀번호를 입력하세요">
                                        </div>
                            
                                        <p id="goLogin">
                                               비회원 작성 시, 비밀번호를 분실하면 글을 삭제 할 수 없습니다.&nbsp;&nbsp;
                                               <a href="<%= request.getContextPath() %>/views/user/login.jsp" style="font-size: 13px;">로그인</a>하러 가기
                                        </p>
                                            
                                    <% } %>
                                        <div id="btnArea" align="center">
                                            <button id="cancel" type="button" onclick="location.href='<%= request.getContextPath() %>/list.bo?b_tag=2'">취소하기</button>                        
                                            <button id="submit" type="submit" >등록하기</button>
                                        </div>
                                    </div>
                    
                                </form>
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
        
        <script type="text/javascript" src="<%= request.getContextPath() %>/resources/assets/plugins/parsleyjs/parsley.min.js"></script>

		<!-- Summernote Js -->
        <script src="<%= request.getContextPath() %>/resources/assets/plugins/summernote/summernote.min.js"></script>
	
        <!-- App Js -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.app.js"></script>        
        
        
        <script type="text/javascript">
            $(document).ready(function() {
                $('.form-validation').parsley();
                $('.summernote').summernote({
                    height: 400,                 // set editor height
                    minHeight: 400,             // set minimum height of editor
                    maxHeight: null,             // set maximum height of editor
                    focus: false                 // set focus to editable area after initializing summernote
                });
            });
            

        	$(changeTag);
        
        	$("select[name='boardTag']").change(changeTag);
        	
        	function changeTag(){
        		var tag = $("select[name='boardTag']").children("option:selected").val();
        		
        		
        		if(tag != 1) {
        			$("select[name='regionTag']").prev().hide();
        			$("select[name='regionTag']").hide();
        		}else {
        			$("select[name='regionTag']").prev().show();
        			$("select[name='regionTag']").show();
        		}
        	}
        	
        	
        	function checkText(){
				var title = $("#bTitle").val()
				var dispoId = $("#memName").val();
				var dispoPwd = $("#memPwd").val();
				var content = $("#content").text();
				
				console.log(content);
				
				if(title == "") {
					
					alert("제목을 입력하세요")
					
					return false;
				}else if(dispoId == "" || dispoPwd == "") {
					
					alert("임시ID 또는 비밀번호를 입력하세요");
					
					return false;
					
				}else if(content == "") {
					
					alert("내용을 입력하세요");
					
					return false;
				}
				
				return true;
				
        	}
        	
        </script>

		
</body>
</html>