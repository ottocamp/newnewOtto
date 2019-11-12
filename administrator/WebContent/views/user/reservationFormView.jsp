<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

 <style type="text/css">
 	#main-container {
 	 padding: 20px 15%;
 	 
 	}
 </style>

</head>
<body>
	<!-- menubar -->
	
	<%@ include file="../common/topnavbar.jsp" %>


	<!-- main container start-->
	<div class="container" id="main-container">
		

	<!-- block-1 -->
	<div id="reInfo" style="background: green">캠핑장 정보</div>
	<!-- block-1 end -->
			
			
			
	<!-- block-2 -->		
	<form action="" method="post">
	<div id="reCampInsert" class="border border-warning">
		<div id="campMap" style="background: white">캠핑장 사이트 전도</div>

		<hr>	
		캠핑장 예약폼
		<div id="campChoiceReservation" class="" >
			<div class="">
				<table class="table table-sm">
					<tr>
						<td>사이트1(인클루드)&nbsp;<input type="checkbox" id="st-ck1"></td>
						<td>사이트2(인클루드)&nbsp;<input type="checkbox" id="st-ck2"></td>
						<td>사이트3(인클루드)&nbsp;<input type="checkbox" id="st-ck3"></td>
					</tr>
				</table>
			</div>
		</div>

<br>
				
		<div>
			<input type="date">
		</div>
			
		<div> <!-- 사이트 버튼 보관div -->	
			<p>
			<button class="btn btn-outline-secondary btn-group btn-group-sm" type="button" data-toggle="collapse" data-target="#st1InsertReservation" aria-expanded="false" aria-controls="st1InsertReservation" id="st-btn1">사이트1 버튼</button>
  			<button class="btn btn-outline-secondary btn-group btn-group-sm" type="button" data-toggle="collapse" data-target="#st2InsertReservation" aria-expanded="false" aria-controls="st2InsertReservation" id="st-btn2">사이트2 버튼</button>
  			<button class="btn btn-outline-secondary btn-group btn-group-sm" type="button" data-toggle="collapse" data-target="#st3InsertReservation" aria-expanded="false" aria-controls="st3InsertReservation" id="st-btn3">사이트3 버튼</button>
  			</p>
  		</div> <!-- 사이트 버튼 보관div 끗 -->	
  		
		<div>
  		<div class="collapse st-InsertReservation" id="st1InsertReservation">
    	<div class="card card-body">
        	<table class="table table-sm table-bordered">
          		<thead class="thead-light">
          		<tr>
            		<th>사이트 테이블1</th><th>이용인원(기준/최대)</th><th>이용금액</th><th>추가인원</th><th>예약기간</th><th>예약인원</th><th>합계</th><th>선택</th>
          		</tr>
          		</thead>
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
        	<table class="table table-sm table-bordered">
          		<thead class="thead-light">
          		<tr>
            		<th>사이트 테이블2</th><th>이용인원(기준/최대)</th><th>이용금액</th><th>추가인원</th><th>예약기간</th><th>예약인원</th><th>합계</th><th>선택</th>
          		</tr>
          		</thead>
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
        	<table class="table table-sm table-bordered">
          		<thead class="thead-light">
          		<tr>
            		<th>사이트 테이블 3</th><th>이용인원(기준/최대)</th><th>이용금액</th><th>추가인원</th><th>예약기간</th><th>예약인원</th><th>합계</th><th>선택</th>
          		</tr>
          		</thead>
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
				

				<br>

				<div id="campEtcReservation">
					<table class="table table-sm">
						<tr>
							<td>옵션1(인클루드)<input type="checkbox" id="op-ck1"></td>
							<td>옵션2(인클루드)<input type="checkbox" id="op-ck2"></td>
						</tr>
					</table>
					</div>
					
				<div> <!-- 옵션 버튼 보관div -->	
					<p>
					<button class="btn btn-outline-secondary btn-group btn-group-sm" type="button" data-toggle="collapse" data-target="#op1InsertReservation" aria-expanded="false" aria-controls="op1InsertReservation" id="op-btn1">옵션1 버튼</button>
  					<button class="btn btn-outline-secondary btn-group btn-group-sm" type="button" data-toggle="collapse" data-target="#op2InsertReservation" aria-expanded="false" aria-controls="op2InsertReservation" id="op-btn2">옵션2 버튼</button>
  					</p>
  				</div> <!-- 옵션 버튼 보관div 끗 -->	
					
						<div class="collapse" id="op1InsertReservation">
						<table class="table table-sm table-bordered">
						<thead class="thead-light">
						<tr>
							<th>옵션이름</th>
							<th>가격</th>
							<th>기간</th>
							<th>소모수</th>
							<th>합계</th>
							<th>선택</th>
						</tr>
						</thead>
						<br>
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
				<table class="table table-sm table-bordered">
						<thead class="thead-light">
						<tr>
							<th>옵션이름</th>
							<th>가격</th>
							<th>기간</th>
							<th>소모수</th>
							<th>합계</th>
							<th>선택</th>
						</tr>
						</thead>
						<br>
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

				<br>

				<div id="ReservationTotalPayment">
					<table class="table table-sm table-bordered">
						<tr>
							<td>총 결제금액.</td>
							<td>(체크된 합계금액을 땡겨오는 역할)</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- block-2 end -->
			
			<!-- block-3 -->
			<div id="rePrecautions" style="background: pink">
				캠핑장 주의사항
				<div id="campPrecautions">3</div>
			</div>
			<!-- block-3 end -->

			<!-- block-4 -->
			<div id="rePrivateInsert" style="background: skyblue">
				개인정보 제출
				<div id="submitForm">
				<table class="table table-sm table-bordered">
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

		<button type="submit" class="btn btn-primary">예약</button>
		</form>

	</div>
			
			</div>
		</form>
	</div>

	<!-- main container end-->



	<!-- script -->
	<script>
	
	// 사이트 체크시 리스트 버튼 숨김/드러냄
    $(function() {
        $(".btn-outline-secondary").hide();
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

</body>
</html>