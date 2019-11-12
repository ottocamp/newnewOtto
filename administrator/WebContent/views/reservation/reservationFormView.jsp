<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="camp.model.vo.*, java.util.*"%>
	
<%
	ArrayList<CampInfoReservation> cList = (ArrayList<CampInfoReservation>)request.getAttribute("cList");
	ArrayList<CampSiteReservation> sList = (ArrayList<CampSiteReservation>)request.getAttribute("sList");
	ArrayList<CampOptionReservation> oList = (ArrayList<CampOptionReservation>)request.getAttribute("oList");
	ArrayList<Attachment> aList = (ArrayList<Attachment>)request.getAttribute("aList");
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
			캠핑장 사이트 전도.
			</div>
			<!-- block-1 end -->
			
			<hr>
			
			<!-- block-2 -->
			캠핑장 예약 폼	
			<form action="" method="post">
			<div>
			날짜 선택 : <input type="date" name="entDate">
			</div>

			<hr>
			
			<div>
				<table class="table m-0 table-bordered">
					<tr>
						<td>사이트1(인클루드)&nbsp;<input type="checkbox" name="st1" id="st-ck1"></td>
						<td>사이트2(인클루드)&nbsp;<input type="checkbox" name="st2"  id="st-ck2"></td>
						<td>사이트3(인클루드)&nbsp;<input type="checkbox" name="st3" id="st-ck3"></td>
					</tr>
				</table>
			</div>
			<!-- 사이트 버튼 보관div -->
			<div> 	
			<p>
			<button class="btn btn-dark btn-rounded btn-hide" type="button" data-toggle="collapse" data-target="#st1InsertReservation" aria-expanded="false" aria-controls="st1InsertReservation" id="st-btn1">사이트1 버튼</button>
  			<button class="btn btn-dark btn-rounded btn-hide" type="button" data-toggle="collapse" data-target="#st2InsertReservation" aria-expanded="false" aria-controls="st2InsertReservation" id="st-btn2">사이트2 버튼</button>
  			<button class="btn btn-dark btn-rounded btn-hide" type="button" data-toggle="collapse" data-target="#st3InsertReservation" aria-expanded="false" aria-controls="st3InsertReservation" id="st-btn3">사이트3 버튼</button>
  			</p>
  			</div> 
  			<!-- 사이트 버튼 보관div 끗 -->	
  		
		<div><!-- 사이트 전체를 덮는 -->
		
  			<div class="collapse st-InsertReservation" id="st1InsertReservation">
    		<div class="card card-body">
        		<table class="table table-bordered">
          			<tr class="success">
            			<th>사이트 테이블1</th><th>이용인원(기준/최대)</th><th>이용금액</th><th>추가인원</th><th>예약기간</th><th>예약인원</th><th>합계</th><th>선택</th>
          			</tr>
          			<tr>
          		  		<td></td>
            			<td></td>
            			<td></td>
            			<td></td>
            			<td><select><option>1</option></select></td>
            			<td><select><option>1</option></select></td>
            			<td></td>
            			<td><input type="checkbox"></td>
          			</tr>
        		</table>	
    		</div>
  			</div>
  			
  			<div class="collapse" id="st2InsertReservation">
    		<div class="card card-body">
        		<table class="table table-bordered">
          			<tr class="success">
            			<th>사이트 테이블2</th><th>이용인원(기준/최대)</th><th>이용금액</th><th>추가인원</th><th>예약기간</th><th>예약인원</th><th>합계</th><th>선택</th>
          			</tr>
          			<tr>
          		  		<td></td>
            			<td></td>
            			<td></td>
            			<td><select><option>1</option></select></td>
            			<td><select><option>1</option></select></td>
            			<td></td>
            			<td><input type="checkbox"></td>
          			</tr>
        		</table>	
    		</div>
  			</div>
  			
  			<div class="collapse" id="st3InsertReservation">
    		<div class="card card-body">
        		<table class="table table-bordered">
          			<tr class="success">
            			<th>사이트 테이블 3</th><th>이용인원(기준/최대)</th><th>이용금액</th><th>추가인원</th><th>예약기간</th><th>예약인원</th><th>합계</th><th>선택</th>
          			</tr>
          			<tr>
          		  		<td></td>
            			<td></td>
            			<td></td>
            			<td></td>
            			<td><select><option>1</option></select></td>
            			<td><select><option>1</option></select></td>
            			<td></td>
            			<td><input type="checkbox"></td>
          			</tr>
        		</table>	
    		</div>
  			</div>
				

			<hr>

			<div id="campEtcReservation">
				<table class="table table-bordered">
					<tr>
						<td>옵션1(인클루드)<input type="checkbox" name="op1" id="op-ck1"></td>
						<td>옵션2(인클루드)<input type="checkbox" name="op2" id="op-ck2"></td>
					</tr>
				</table>
			</div>
					
			<!-- 옵션 버튼 보관div -->	
			<div> 
			<p>
			<button class="btn btn-dark btn-rounded btn-hide" type="button" data-toggle="collapse" data-target="#op1InsertReservation" aria-expanded="false" aria-controls="op1InsertReservation" id="op-btn1">옵션1 버튼</button>
  			<button class="btn btn-dark btn-rounded btn-hide" type="button" data-toggle="collapse" data-target="#op2InsertReservation" aria-expanded="false" aria-controls="op2InsertReservation" id="op-btn2">옵션2 버튼</button>
  			</p>
  			</div> 
  			<!-- 옵션 버튼 보관div 끗 -->	
					
			<div class="collapse" id="op1InsertReservation">
				<table class="table table-bordered">
					<tr class="success">
						<th>옵션이름</th>
						<th>가격</th>
						<th>기간</th>
						<th>소모수</th>
						<th>합계</th>
						<th>선택</th>
					</tr>
					<tr>
						<td>옵션1(인클루드)</td>
						<td></td>
						<td><select><option>1</option></select></td>
						<td><select><option>1</option></select></td>
						<td></td>
						<td><input type="checkbox"></td>
					</tr>
				</table>
			</div>
				
			<div class="collapse" id="op2InsertReservation">
				<table class="table table-bordered">
					<tr class="success">
						<th>옵션이름</th>
						<th>가격</th>
						<th>기간</th>
						<th>소모수</th>
						<th>합계</th>
						<th>선택</th>
					</tr>
					<tr>
						<td>옵션2(인클루드)</td>
						<td></td>
						<td><select><option>1</option></select></td>
						<td><select><option>1</option></select></td>
						<td></td>
						<td><input type="checkbox"></td>						
					</tr>
				</table>
			</div>

			<hr>
			
			<div>
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
			</div>
			

			<div id="ReservationTotalPayment">
				<table class="table table-sm table-bordered">
					<tr>
						<td>총 결제금액.</td>
						<td>(체크된 합계금액을 땡겨오는 역할)</td>
					</tr>
				</table>
			</div>
			
		</div><!-- 사이트 전체를 덮는 -->
			<!-- block-2 end -->
			
			
			<!-- block-3 -->
			<div id="rePrecautions" style="background: white">
				캠핑장 주의사항
				<div id="campPrecautions"></div>
			</div>
			<!-- block-3 end -->

<hr>

			<!-- block-4 -->
			<div id="rePrivateInsert" style="background: white;">
				개인정보 제출
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
				무통장입금 : <input type="radio" name="payment" value="bankDeposit">
				현지 지불 :  <input type="radio" name="payment" value="localPayment">
				카드 : <input type="radio" name="payment" value="creditCard">
				</div>
				
				
			</div>
			<!-- block-4 end -->

		<button type="submit" class="btn btn-dark btn-lg" style="float: right;" onclick="IMP.request_pay">예약</button>
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
		$(function() {
			$(".btn-hide").hide();
		});

		/* $(function() {
		    $(".st-InsertReservation").hide();
		    
		}) */

		$("#st-ck1").change(function() {
			if ($("#st-ck1").prop("checked")) {
				$("#st-btn1").eq(0).show();
			} else {
				$("#st-btn1").eq(0).hide();
				//$("#st1InsertReservation").eq(0).hide();
			}
		});

		$("#st-ck2").change(function() {
			if ($("#st-ck2").prop("checked")) {
				$("#st-btn2").eq(0).show();
			} else {
				$("#st-btn2").eq(0).hide();
			}
		});

		$("#st-ck3").change(function() {
			if ($("#st-ck3").prop("checked")) {
				$("#st-btn3").eq(0).show();
			} else {
				$("#st-btn3").eq(0).hide();
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

		$("#op-ck2").change(function() {
			if ($("#op-ck2").prop("checked")) {
				$("#op-btn2").eq(0).show();
			} else {
				$("#op-btn2").eq(0).hide();
			}
		});

		// 옵션 체크시 리스트 버튼 숨김/드러냄 종료
		
		//아임포트 결제
		
		
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명:결제테스트',
			amount : 14000,
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
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