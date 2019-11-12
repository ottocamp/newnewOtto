<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.*, java.util.*, camp.model.vo.*"%>
    
<%
	int code = Integer.parseInt(request.getParameter("code"));
	ArrayList<CampInfo> cList = (ArrayList<CampInfo>)request.getSession().getAttribute("cList");
	ArrayList<Attachment> aList = (ArrayList<Attachment>)request.getSession().getAttribute("aList");
	ArrayList<CampDetail> cdList = (ArrayList<CampDetail>)request.getSession().getAttribute("cdList");
	ArrayList<CampReview> crList = (ArrayList<CampReview>)request.getSession().getAttribute("crList");

	CampInfo ca = null;
	ArrayList<CampDetail> thiscd = new ArrayList<CampDetail>();
	ArrayList<CampReview> thiscr = new ArrayList<CampReview>();
	ArrayList<Attachment> thisat = new ArrayList<Attachment>();
	
	for(CampInfo c : cList){
		if(code == c.getcCode()){		
			ca = c;
		}
	}
	
	for(CampDetail cdindex : cdList){
		
		if(code == cdindex.getdCode()){
			
			thiscd.add(cdindex);
		}
		
	}
	
	for(CampReview crindex : crList){
		
		if(code == crindex.getcCampCode()){
			
			thiscr.add(crindex);
		}
		
	}
	
	for(Attachment aListindex : aList){
		
		if(code == aListindex.getcCode()){
			
			thisat.add(aListindex);
			
		}
		
	}
	
	
%>   
                   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

		<!-- jqury cdn -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>


/* 그리드 */
            html, body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            font-size: 10px;
            
            }
            
            .wrapper {
            width: 1000px;
            height: 500px;
            
            margin: 5vh auto 5vh auto;
            display: grid;
            grid-template-rows: 25% 25% 25% 25%;
            grid-template-columns: 25% 25% 25% 25%;
            grid-gap: 1rem;
            grid-template-areas:
            "box1 box1 box2 box3"
            "box1 box1 box4 box3"
            "box5 box6 box7 box7"
            "box8 box8 box9 box10"
            }

            .wrapper1 {
            width: 1000px;
            height: 300px;
            margin: 5vh auto 5vh auto;
            display: grid;
            grid-template-rows: 100%;
            grid-template-columns: 100%;
            grid-gap: 1rem;
            grid-template-areas:
            "box11"
            }
            

            .wrapper2 {
            width: 1000px;
            height: 250px;
            margin: 5vh auto 5vh auto;
            display: grid;
            grid-template-rows: 50% 50%;
            grid-template-columns: 33% 33% 33%;
            grid-gap: 1rem;
            grid-template-areas:
            "box12 box13 box14"
            "box15 box16 box17"
            }
            .wrapper2.box16 { 
              margin-right: 5px;


            }
            
            .wrapper3 {
            width: 1000px;
            height: 500px;
            margin: 5vh auto 5vh auto;
            display: grid;
            grid-template-rows: 100%;
            grid-template-columns: 100%;
            grid-gap: 1rem;
            grid-template-areas:
            "box18"
            }



          

            .wrapper4 {
            width: 1000px;
            height: 250px;
            margin: 5vh auto 5vh auto;
            display: grid;
            margin-left: 0px;
            grid-template-rows: 100%;
            grid-template-columns: 100%;
            grid-gap: 1rem;
            grid-template-areas:
            "box19"
            }

            .wrapper5 {
            width: 1000px;
            height: 250px;
            margin: 5vh auto 5vh auto;
            display: grid;
            margin-left: 0px;
            grid-template-rows: 100%;
            grid-template-columns: 100%;
            grid-gap: 1rem;
            grid-template-areas:
            "box20"
            }
            .wrapper6 {
            width: 1000px;
            height: 500px;
            margin: 5vh auto 5vh auto;
            display: grid;
            margin-left: 0px;
            grid-template-rows: 100%;
            grid-template-columns: 100%;
            grid-gap: 1rem;
            grid-template-areas:
            "box21"
            }  
            .wrapper7 {
            width: 1000px;
            height: 500px;
            margin: 5vh auto 5vh auto;
            display: grid;
            margin-left: 0px;
            grid-template-rows: 100%;
            grid-template-columns: 100%;
            grid-gap: 1rem;
            grid-template-areas:
            "box22"
            }  

            .wrapper8 {
            width: 1000px;
            height: 250px;
            margin: 5vh auto 5vh auto;
            display: grid;
            margin-left: 0px;
            grid-template-rows: 100%;
            grid-template-columns: 100%;
            grid-gap: 1rem;
            grid-template-areas:
            "box23"
            }  

            .wrapper9 {
            width: 1000px;
            height: 250px;
            margin: 5vh auto 5vh auto;
            display: grid;
            margin-left: 0px;
            grid-template-rows: 100%;
            grid-template-columns: 100%;
            grid-gap: 1rem;
            grid-template-areas:
            "box24"
            }
	         
        

            .wrapper .grid-box{
                background: #eeeeee;
                transition: all 250ms;
                font-size: 5rem;
                color: white;
                font-family: sans-serif;
                box-shadow: 0 0.1rem 0.3rem rgba(0,0,0,0.12), 0 1px
                2px rgba(0,0,0,0.24);
                animation: fadein 1s ease-out normal backwards;
            
            }


               .wrapper .grid-box1{
                background: white;
                font-size: 25px;
                color: black;
                font-family: sans-serif;

            
            }

              .wrapper .grid-box2{
                background: white;
                font-size: 25px;
                color: black;
                font-family: sans-serif;
            
            }
            .wrapper .grid-box3{
                background: white;
                font-size: 25px;
                color: black;
                font-family: sans-serif;
            
            }

                .wrapper .grid-box4{
                background: white;
                font-size: 25px;
                color: black;
                font-family: sans-serif;
            
            }

                .wrapper .grid-box5{
                background: white;
                font-size: 25px;
                color: black;
                font-family: sans-serif;
            
            }

               .wrapper .grid-box6{
                background: white;
                font-size: 25px;
                color: black;
                font-family: sans-serif;
            
            }
            

            .wrapper .grid-box8{
            background-color:white;
	          padding: 0;
	          margin:0;
            margin-top: 100px;
            }
            
            

        
        .wrapper .grid-box9{    
          margin:0;
          padding: 0;
           width: 100%;
   }

            .wrapper .grid-box:hover {
            z-index: 2;
            position: relative;
            box-shadow: 0 2rem 4rem rgba(0,0,0,0.15), 0 3rem 3rem
            rgba(0,0,0,0.15);
            transform:translate(0,-0.0.5rem) scale(1.01);
            
            }
            
            
            
            .wrapper .element1 { grid-area: box1; animation-delay:0;}
            .wrapper .element2 { grid-area: box2; animation-delay:100ms;}
            .wrapper .element3 { grid-area: box3; animation-delay:200ms;}
            .wrapper .element4 { grid-area: box4; animation-delay:200ms;}
            .wrapper .element5 { grid-area: box5; animation-delay:100ms;}
            .wrapper .element6 { grid-area: box6; animation-delay:200ms;}
            .wrapper .element7 { grid-area: box7; animation-delay:300ms;}
            .wrapper .element8 { grid-area: box8; animation-delay:200ms;}
            .wrapper .element9 { grid-area: box9; animation-delay:400ms;}
            .wrapper .element10 { grid-area: box10; animation-delay:500ms;}
            
            @keyframes fadein {
            
                0% {transform: scale(0);}
                70% {transform: scale(1.05);}
                100% {transform: scale(1);}
            }
            
            h1 { 
            
            text-align: center;
            font-size: 50px;
            
            }

            h2 { 

            text-align: center;
            font-size: 25px; 

            }

/* 사진 슬라이드 */

.slidershow{
  width: 1050px;
  height: 500px;
  overflow: hidden;
}
.middle{
  
  margin-top: 1437px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
}
.navigation{
  position: absolute;
  bottom: 20px;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
}
.bar{
  width: 50px;
  height: 10px;
  border: 2px solid #fff;
  margin: 6px;
  cursor: pointer;
  transition: 0.4s;
}
.bar:hover{
  background: #fff;
}

input[name="r"]{
    position: absolute;
    visibility: hidden;
}

.slides{
  width: 500%;
  height: 100%;
  display: flex;
}

.slide{
  width: 20%;
  transition: 0.6s;
}
.slide img{
  width: 100%;
  height: 100%;
}

#r1:checked ~ .s1{
  margin-left: 0;
}
#r2:checked ~ .s1{
  margin-left: -20%;
}
#r3:checked ~ .s1{
  margin-left: -40%;
}
#r4:checked ~ .s1{
  margin-left: -60%;
}
#r5:checked ~ .s1{
  margin-left: -80%;
}

/* 체크 버튼 */

.container {

height: 100%;
width: 100%;
display: flex;
align-items: center;
justify-content: center;
margin-top: -130px
}

input[type="checkbox"] {

  height: 50px;
  width: 50px;
  background-color: black;
  position: relative;
  outline: none;
  transform:rotate(45deg);
  -webkit-appearance:none;

}


input[type="checkbox"]:before{

  position: absolute;
  content: "";
  background-color: black;
  height:60%;
  width:100%;
  top:-59%;
  border-radius: 75px 75px 0 0;


}

input[type="checkbox"]:after{
  position: absolute;
  content: "";
  background-color: black;
  height:60%;
  width:100%;
  transform: rotate(-90deg);
  border-radius: 75px 75px 0 0;
  top:20%;
  right:79%;
  }

input[type="checkbox"]:checked,
input:checked[type="checkbox"]:before,
input:checked[type="checkbox"]:after{
background-color: #fe0f42;
  
}

/* 버튼 */



button{
  background: none;
  color: black;
  width: 240px;
  height: 80px;
  font-size: 18px;
  transition: .6s;
  overflow:hidden;


}

button:focus { 
  outline: none;

}

button:before {
  content: '';
  display: block;
  position: absolute;
  background: rgba(255,255,255,.5);
  width: 60px;
  height: 100%;
  left:0;
  opacity: .5s;
  filter: blur(30px);
  transform: translate(-130px) skewX(-15deg);
 }

button:after {

  content: '';
  display: block;
  position: absolute;
 
  background: rgba(255,255,255,.2);
  width: 30px;
  height: 100%;
  left:0;
  opacity: .5s;
  filter: blur(30px);
  transform: translate(-100px) skewX(-15deg);

}

button:hover{

  background: black;
  cursor:pointer;
  color: white;

}

button:hover:before{
  transform:translateX(300px) skewX(-15deg);
  opacity: .6;
  transition: .7s;

}

button:hover:after{
  transform:translateX(300px) skewX(-15deg);
  opacity: .6;
  transition: .7s;

}




            </style>

            
            
           
          

          </head>
          


            <body>
 			<h1><%= ca.getcName() %></h1>
              <main class="wrapper">
               
            
                <div class="element1 grid-box"> <img src="<%=request.getContextPath()%><%=  thisat.get(0).getFilePath() %><%= thisat.get(0).getChangeName() %>" width="512.5px" height="262.5px"></div>
                <div class="element2 grid-box"><img src="<%=request.getContextPath()%><%=  thisat.get(1).getFilePath() %><%= thisat.get(1).getChangeName() %>" width="250px" height="125px"></div>
                <div class="element3 grid-box"><img src="<%=request.getContextPath()%><%=  thisat.get(2).getFilePath() %><%= thisat.get(2).getChangeName() %>?after" width="250px" height="262.5px"></div>
                <div class="element4 grid-box"><img src="<%=request.getContextPath()%><%=  thisat.get(3).getFilePath() %><%= thisat.get(3).getChangeName() %>" width="250px" height="125px"></div>
                <div class="element5 grid-box"><img src="<%=request.getContextPath()%><%=  thisat.get(4).getFilePath() %><%= thisat.get(4).getChangeName() %>" width="250px" height="125px"></div>
                <div class="element6 grid-box"><img src="<%=request.getContextPath()%><%=  thisat.get(5).getFilePath() %><%= thisat.get(5).getChangeName() %>" width="250px" height="125px"></div>
                <div class="element7 grid-box"><img src="<%=request.getContextPath()%><%=  thisat.get(6).getFilePath() %><%= thisat.get(6).getChangeName() %>" width="512.5px" height="125px"></div>
                <div class="element8 grid-box"><img src="<%=request.getContextPath()%><%=  thisat.get(7).getFilePath() %><%= thisat.get(7).getChangeName() %>" width="512.5px" height="125px"></div>
                <div class="element9 grid-box"><img src="<%=request.getContextPath()%><%=  thisat.get(8).getFilePath() %><%= thisat.get(8).getChangeName() %>" width="250px" height="125px"></div>
                <div class="element10 grid-box"><img src="<%=request.getContextPath()%><%=  thisat.get(9).getFilePath() %><%= thisat.get(9).getChangeName() %>" width="250px" height="125px"></div>

       

        <main class="wrapper1">
            <div class="element11 grid-box1">
                      <h1>캠핑장 정보 </h1>
             <table border="1px solid black;" style="text-align: center; width: 100%;">
         		<tr>
         		<th>주소</th>
         		<th>전화번호</th>
         		<th>홈페이지주소</th>
         		<th>테마</th>
         		
         		</tr>
           
         		<tr>
         			<td><%= ca.getcAddress() %></td>
         			<td><%= ca.getcPhone() %></td>
         			<td><a href="#"><%= ca.getcUrl() %></a></td>
			<% if(ca.getcTheme() == 1){ %>
         			<td>산</td>
         		<%}else if(ca.getcTheme() == 2){ %>
         			<td>강</td>
         		<%}else if(ca.getcTheme() == 3){%>
         			<td>바다</td>
         		<%}else{ %>
         			<td>기타</td>
         		<%} %>
         		</tr>     	  	

              	</table>
              
           
            </div>
       		<div style="text-align: center;"><input type="checkbox" id="fav">
       		</div>
           
           
            <main class="wrapper2">  
              <div class="element12 grid-box2"><img src="<%= request.getContextPath() %>/resources/main/images/info1.png" width="330px" height="125px"></div>  
              <div class="element13 grid-box2"><img src="<%= request.getContextPath() %>/resources/main/images/info2.png" width="330px" height="125px"></div>   
              <div class="element14 grid-box2"><img src="<%= request.getContextPath() %>/resources/main/images/info3.png" width="330px" height="125px"></div>   
              <div class="element15 grid-box2"><img src="<%= request.getContextPath() %>/resources/main/images/info4.png" width="330px" height="125px"></div>   
              <div class="element16 grid-box2"><img src="<%= request.getContextPath() %>/resources/main/images/info5.png" width="330px" height="125px"></div>   
              <div class="element17 grid-box2"><img src="<%= request.getContextPath() %>/resources/main/images/info6.png" width="330px" height="125px"></div>   

              
            
            </div>
 

            <main class="wrapper4">   
              <div class="element19 grid-box3"><h1>가격</h1>
              <table border="1px solid black;" style="text-align: center; width: 100%;">
         		<tr>
         		<th>구분</th>
         		<th>가격</th>
         		<th>추가인원요금</th>
         		<th>최대숙박기간</th>
         		<th>최대숙박인원</th>
         		
         		</tr>
              <% for(CampDetail cd : thiscd){ %>
         		

         		<tr>
         			<td><%= cd.getdSite() %></td>
         			<td><%= cd.getdPrice() %>원</td>
         			<td><%= cd.getdAddPirce() %>원</td>
         			<td><%= cd.getdDateMax() %>일</td>
         			<td><%= cd.getdStayMax() %>명</td>
         		</tr>     	  	
              <%} %>
              
              	</table>
            </div>

              <main class="wrapper5">
              <div class="element20 grid-box4"><h1>환불규정</h1>
                <table border="1px solid black;" style="width: 100%; text-align: center;">
               <tr>
               <th>사용예정일기준(입실기준)</th>
               <th>환불율</th>
               </tr>
               <tr>
               <td>사용예정일 10일전까지 취소</td>
               <td>100% 환불</td>
               </tr>
               <tr>
               <td>사용예정일 7일전까지 취소</td>
               <td>80% 환불</td>
               </tr>
               <tr>
               <td>사용예정일 5일전까지 취소</td>
               <td>60% 환불</td>
               </tr>
               <tr>
               <td>사용예정일 3일전까지 취소</td>
               <td>40% 환불</td>
               </tr>
               <tr>
               <td>사용예정일 2일전부터  당일까지 취소</td>
               <td>환불불가</td>
               </tr>
               </table>
                  
            </div>
            
            <main class="wrapper6">
              <div class="element20 grid-box5" style="margin-top: 100px;"><h1>리뷰</h1>
               
               <table border="1px solid black;" style="text-align: center; width: 100%;">
         		<tr>
         		<th>예약번호</th>
         		<th>점수</th>
         		<th>내용</th>
         		<th>회원아이디</th>
         		</tr>
         	<% for(CampReview cr : thiscr){ %>
         		<tr>
         			<td><%= cr.getcReNo() %></td>
         			<td><%= cr.getcRNum() %></td>
         			<td><%= cr.getcRContent() %></td>
         			<td><%= cr.getcUserId() %></td>
         		</tr>     	  	
        
             <%} %> 
              	</table>
               
               
               
            </div>
            
            
            	<div style="text-align: center;">
            	<button type="button" onclick="reservation();">예약하기</button>
            	</div>
            
     

                
                
               
                  
                 
              
                    
          

		</body>
                     
           <script>
      $(function(){
                        	
         	$("#fav").change(function(){
            	 
              	if($("#fav").prop("checked")){
              		$(this).prop("checked",false);
              		alert("즐겨찾기를 하려면 로그인을 해야합니다.");
              		                             		
              	}else{
              		
              	}
              	
         	})


         });

      function reservation(){
    	  
    	  location.href="<%= request.getContextPath() %>/campRe.re?cNo=<%= code %>";
    	  
      }
      
      
      
      
      
      
      
                        </script>    
       
       
        </main>
        </html>


