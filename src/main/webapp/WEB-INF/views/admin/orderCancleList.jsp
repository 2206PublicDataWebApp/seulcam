<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취소 주문 내역</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/fonts.css">
<link rel="shortcut icon" href="/resources/images/faviconlogo.ico"
	type="image/x-icon">
<link rel="icon" href="/resources/images/faviconlogo.ico"
	type="image/x-icon">
<script src="../../../resources/js/jquery-3.6.1.min.js"></script>
</head>
<style>
.title{
	width:100%;
	height:90px;
	margin-top:50px;
	
}
.title-name{
	margin-left:30px;
	font-size:30px;
	font-weight: bold;
}
.title-button{
	margin-left:10px;
}
</style>
<body>

<div class="title">
<span class="title-name">주문내역</span>
<span class="title-button">
<button type="button" class="btn btn-sm btn-info"
onclick="location.href='/orderAdmin/list.kh'">
 	모든 주문내역 보기
</button>
</span>
</div>


	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>No</th>
					<th>주문번호</th>
					<th>구매자</th>
					<th>주문날짜</th>
					<th>구매내역</th>
					<th>입금여부</th>
					<th>배송상태</th>
					<th>취소여부</th>
					<th>환불여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${oList}" var="order" varStatus="i">
				<c:forEach items="${opList}" var="pay" varStatus="i">
				<c:if test="${order.cancleStatus eq'Y' }">
				<c:if test="${order.orderNo eq pay.orderNo }">
					<tr>
						<td>${i.count}</td>
						<td>${order.orderNo }</td>
						<td>${order.memberId }</td>
						<td>${order.orderDate }</td>
						<td>${order.orderMainProductName }</td>
						<td>${order.payStatus }</td>
						<td>${order.dirivaryStatus }</td>
						<td>${order.cancleStatus }</td>
						<c:if test="${order.refundStatus eq 'N' }">
						
						<td>
							<input type="text" class="impUid" 		value="${pay.impUid }"/>
							<input type="text" class="merchant_uid" value="${pay.merchant_uid }"/>
							<input type="text" class="payPrice"   	value="${pay.payPrice }"/>
							<button  class="btn btn-secondary btn-sm" onclick="cancelPay(this)">환불하기</button></td>
						</c:if>
						<c:if test="${order.refundStatus eq 'Y' }">
						<td>환불완료</td>
						</c:if>
						
					</tr>
					</c:if>
					</c:if>
					</c:forEach>
				</c:forEach>
			</tbody>
		</table>
	</div>


<script>




function cancelPay(obj){
	const data={
		impUid:$(obj).parent().children('.impUid').val(),	
		merchant_uid:$(obj).parent().children('.merchant_uid').val(),
	}
	console.log(data);
	
	
	
	  $.ajax({
	      url: "/payments/cancel", // 예: http://www.myservice.com/payments/cancel
	      type: "POST",
	      contentType: "application/json",
	      data: JSON.stringify({
	        merchant_uid: data.merchant_uid, // 예: ORD20180131-0000011
	        cancel_request_amount: "100", // 환불금액
	        reason: "테스트 결제 환불" // 환불사유
	        /* "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
	        "refund_bank": "88" // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
	        "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호 */
	      }),
	      dataType: "json"
	    });
	  
	  
  
	   
	  }


</script>


</body>
</html>