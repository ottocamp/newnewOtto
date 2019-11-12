<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="camp.model.vo.*, java.util.*"%>
	
<%
	ArrayList<CampRefoSiteEnter> sList = (ArrayList<CampRefoSiteEnter>)request.getAttribute("sList");
	ArrayList<CampRefoOptionEnter> oList = (ArrayList<CampRefoOptionEnter>)request.getAttribute("oList");
	//ArrayList<Attachment> aList = (ArrayList<Attachment>)request.getAttribute("aList");
	
	int sindex1 = sList.get(0).getDateMAx();
	int sindex2 = sList.get(0).getStayMAx();
	int oindex1 = oList.get(0).getOpMax1();
	int oindex2 = oList.get(0).getOpMax2();
	
	String cName = sList.get(0).getcName();
	String name = (String)request.getAttribute("name");
	String phone = (String)request.getAttribute("phone");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>예약 화면</title>
<!-- jqury cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


 <!-- App favicon -->
 <link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/assets/images/favicon.ico">

<!-- App css -->
<link href="<%= request.getContextPath() %>/resources/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="<%= request.getContextPath() %>/resources/assets/css/icons.css" rel="stylesheet" type="text/css" />
<link href="<%= request.getContextPath() %>/resources/assets/css/metismenu.min.css" rel="stylesheet" type="text/css" />
<link href="<%= request.getContextPath() %>/resources/assets/css/style.css" rel="stylesheet" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/assets/js/modernizr.min.js"></script>

<!-- 아임포트 -->
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>

#page-contentbar {
position: relative;
}

#col-main{
margin: auto;
position: absolute;
left:0;
right: 0;
top: 0;
bottom: 0;
}

</style>


</head>
<body>

	<div id="page-wrapper">
		<!-- Top Bar Start -->


		<!-- Top navbar -->
		<%@ include file="../common/topnavbar.jsp"%>
		<!-- Top Bar End -->


		<!-- Page content start -->
		<div class="page-contentbar" id="page-contentbar">
			
			<div class="col-xs-10" id="col-main">
			
			
			<!-- block-1 -->
			<div>
			
			</div>
			
			<!-- block-1 end -->
			
			<hr>
			
			<!-- block-2 -->
			<form action="<%= request.getContextPath() %>/ReInFo.rif" method="post">
			<div name="campname" hidden><%= cName %></div>
			<div>
			날짜 선택 : <input type="date" name="entDate">
			</div>

			<hr>
			
			<div>
				<table class="table m-0 table-bordered">
					<tr>
						<% for(CampRefoSiteEnter crse : sList) { %>
						<td><%= crse.getsType()%> &nbsp;<input type="checkbox" class="st-ck1" id="st-ck1"></td>
						<% } %>

					</tr>
				</table>
			</div>
			<!-- 사이트 버튼 보관div -->
			<div> 	
			<p>
			<button class="btn btn-dark btn-rounded btn-hide st-btn1" type="button" data-toggle="collapse" data-target="#st1InsertReservation" aria-expanded="false" aria-controls="st1InsertReservation" id="st-btn1">사이트</button>
  			<!-- <button class="btn btn-dark btn-rounded btn-hide" type="button" data-toggle="collapse" data-target="#st2InsertReservation" aria-expanded="false" aria-controls="st2InsertReservation" id="st-btn2">사이트2 버튼</button>
  			<button class="btn btn-dark btn-rounded btn-hide" type="button" data-toggle="collapse" data-target="#st3InsertReservation" aria-expanded="false" aria-controls="st3InsertReservation" id="st-btn3">사이트3 버튼</button> -->
  			</p>
  			</div> 
  			<!-- 사이트 버튼 보관div 끗 -->	
  		
		<div><!-- 사이트 전체를 덮는 -->
		
  			<div class="collapse st-InsertReservation" id="st1InsertReservation">
    		<div class="card card-body">
        		<table class="table table-bordered">
          			<tr class="success">
            			<th>사이트 테이블1</th><th>이용금액</th><th>추가인원</th><th>예약기간</th><th>예약인원</th><th>선택</th>
          			</tr>
          			<% for(CampRefoSiteEnter crse : sList) { %>
          			<tr>
          		  		<td><%= crse.getReSiType() %></td>
            			<td><%= crse.getsPrice() %></td>
            			<td><%= crse.getAddPrice() %></td>
            			<td>
            			<select>
            			<%for(int i = 1; i < sindex1; i++) { %>
            			<option>
            				<%= i %>박 <%= i+1 %>일
            			</option>
            			<% } %>
            			</select>
            			</td>
            			<td>
            			<select>
            			<%for(int i = 1; i <= sindex2; i++) { %>
            			<option>
            				<%= i %>명
            			</option>
            			<% } %>
            			</select>
            			</td>
            			<td ><input type="checkbox"></td>
          			</tr>
          			<% } %>
        		</table>	
    		</div>
  			</div>


			<hr>

			<div id="campEtcReservation">
				<table class="table table-bordered">
					<tr>
						<% for(CampRefoOptionEnter croe : oList) { %>
						<td><%= croe.getoType() %><input type="checkbox" name="op1" id="op-ck1"></td>
						<% } %>
					</tr>
				</table>
			</div>
					
			<!-- 옵션 버튼 보관div -->	
			<div> 
			<p>
			<button class="btn btn-dark btn-rounded btn-hide" type="button" data-toggle="collapse" data-target="#op1InsertReservation" aria-expanded="false" aria-controls="op1InsertReservation" id="op-btn1">옵션</button>
  			</p>
  			</div> 
  			<!-- 옵션 버튼 보관div 끗 -->	
					
			<div class="collapse" id="op1InsertReservation">
				<table class="table table-bordered">
					<tr class="success">
						<th>옵션이름</th>
						<th>가격</th>
						<th>사용기간</th>
						<th>대수/인원 / 기타.</th>
						<th>선택</th>
					</tr>
					<% for(CampRefoOptionEnter croe : oList) { %>
					<tr>
						<td><%= croe.getoType() %></td>
						<td><%= croe.getoPrice() %></td>
						<td>
						<select>
						<%for(int i = 1; i <= oindex1; i++) { %>
						<option>
						<%= i %>
						</option>
						<% } %>
						</select>
						</td>
						<td>
						<select>
						<%for(int i = 1; i <= oindex2; i++) { %>
						<option>
						<%= i %>
						</option>
						<% } %>
						</select>
						</td>
						<td><input type="checkbox"></td>
					</tr>
					<% } %>
				</table>
			</div>

			<hr>
			
			<!-- <div>
				<table class="table table-bordered">
					<tr class="success">
						<th>쿠폰</th>
						<th>감액가격</th>
						<th>보유쿠폰</th>
						<th>합계</th>
						<th>선택</th>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td><select><option>1</option></select></td>
						<td></td>
						<td><input type="checkbox"></td>						
					</tr>
				</table>
			</div> -->
			

			<!-- <div id="ReservationTotalPayment">
				<table class="table table-sm table-bordered">
					<tr>
						<td>총 결제금액.</td>
						<td id="inHere">(체크된 합계금액을 땡겨오는 역할)</td>
					</tr>
				</table>
			</div> -->
			
		</div><!-- 사이트 전체를 덮는 -->
			<!-- block-2 end -->
			
			<!-- <div>
			block-3
			<div id="rePrecautions" style="background: white">
				캠핑장 주의사항
				<div id="campPrecautions"></div>
			</div>
			block-3 end
			</div> -->
<hr>

			<!-- block-4 -->
			<div id="rePrivateInsert" style="background: white;">
				<div id="submitForm">
				<table class="table table-bordered">
					<tr>
						<th>이름</th>
						<td><input type="text" name="name"></td>
						<th>비밀번호</th>
						<td><input type="password" name="password"></td>
					</tr>
					<tr>
						<th>핸드폰번호</th>	
						<td><input type="text" name="phone"></td>
						<th>차량번호</th>
						<td><input type="text" name="licenceNumber"></td>
					</tr>
					<tr>
						<th colspan="1">메모/메세지</th>
						<td colspan="3"><textarea name="message" cols=55 rows=5 style="resize:none"></textarea></td>
					</tr>
				</table>
				
				</div>
				
				<br>
				
				<div id="CCPI">
				<!-- Consent to Collection of Personal Information -->
				<p>
				1. 개인정보의 수집·이용 목적: 원활한 예약 관리 및 예약자의 예약확인.<br>
				2. 수집하는 개인정보의 항목: 이름, 휴대폰번호, 차량번호<br>
				3. 개인정보의 보유·이용 기간: 해당 예약방문일 직후 삭제<br>
				4. 개인정보의 수집 및 이용에 대한 동의를 거부할 수 있으며, 이 경우 예약이 제한됩니다.<br>
				</p>
				개인정보 수집 사용 동의 &nbsp <input type="checkbox" value="ccpi">
				</div>
				
				<br>
				
				<div id="payment">
				<table class="table">
					<tr>
					<td>현지 지불 :  <input type="radio" name="payment" value="localPayment"></td>
					<td>카드 : <input type="radio" name="payment" value="creditCard"></td>
					</tr>
				</table>
				
				
				</div>
				
				
			</div>
			<!-- block-4 end -->
		
		<button type="submit" class="btn btn-dark btn-lg" style="float: right;">예약하기</button>
		<button type="button" class="btn btn-primary btn-lg" style="float: right;" onclick="pay()">결제</button>
		</form>


			
			</div>


			<!-- START PAGE CONTENT -->
			<div class="footer"></div>
			<!-- end footer -->


		</div>
		<!-- end .page-contentbar -->
	</div>
	<!-- End #page-wrapper -->



	<!-- script -->
	<script>

		// 사이트 체크시 리스트 버튼 숨김/드러냄
		$(function () {
			$(".btn-hide").hide();
		});

		$("#st-ck1").change(function() {
			if ($("#st-ck1").prop("checked")) {
				$("#st-btn1").eq(0).show();
			} else {
				$("#st-btn1").eq(0).hide();
				//$("#st1InsertReservation").eq(0).hide();
			}
		});

		// 사이트 체크시 리스트 버튼 숨김/드러냄 종료

		// 옵션 체크시 리스트 버튼 숨김/드러냄

		$("#op-ck1").change(function() {
			if ($("#op-ck1").prop("checked")) {
				$("#op-btn1").eq(0).show();
			} else {
				$("#op-btn1").eq(0).hide();
			}
		});

		// 옵션 체크시 리스트 버튼 숨김/드러냄 종료
		

	</script>	
	
		<!-- 아임포트  -->
	 <script type="text/javascript">
        function pay() {
			 
			var IMP = window.IMP; // 생략가능
			IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			var msg;
			
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '캠핑장 결제',
			    amount : 15000,
			    //buyer_email : 'iamport@siot.do',
			    buyer_name : '<%=name%>',
			    buyer_tel : '<%=phone%>',
			    //buyer_addr : '서울특별시 강남구 삼성동',
			    //buyer_postcode : '123-456',
			    //m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        //msg += '고유ID : ' + rsp.imp_uid;
			       	//msg += '상점 거래ID : ' + rsp.merchant_uid;
			        //msg += '결제 금액 : ' + rsp.paid_amount;
			       	//msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		}
        </script>
	<!-- script end -->
	



<!-- jQuery  -->
<script src="<%= request.getContextPath() %>/resources/assets/js/jquery.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/assets/js/popper.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/assets/js/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/assets/js/metisMenu.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/assets/js/waves.js"></script>
<script src="<%= request.getContextPath() %>/resources/assets/js/jquery.slimscroll.js"></script>

<!-- App js -->
<script src="<%= request.getContextPath() %>/resources/assets/js/jquery.core.js"></script>
<script src="<%= request.getContextPath() %>/resources/assets/js/jquery.app.js"></script>

<!-- 아임포트 라이브러리 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</body>
</html>