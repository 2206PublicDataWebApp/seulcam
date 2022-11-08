<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>주문 상세</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/css/fonts.css">
	<link rel="shortcut icon" href="/resources/images/faviconlogo.ico"
		type="image/x-icon">
	<link rel="icon" href="/resources/images/faviconlogo.ico"
		type="image/x-icon">
		<script src="../../../resources/js/jquery-3.6.1.min.js"></script>
</head>
<style>
body {
	font-size: 14px;
	color: #000;
	background-color: #f1f1f1;
}

header {
	position: fixed;
	left: 0px;
	right: 0px;
	top: 0px;
	height: 50px;
	background-color: rgb(255, 255, 255);
	z-index: 200;
	max-width: 768px;
	margin: 0 auto;
}

.wrap {
	max-width: 768px;
	margin: 0 auto;
	background-color: white;
	min-height: 100vh;
}

.contents {
	padding-top: 60px;
}
.data-No-Date{
width:100%;

}
.padding{
padding:10px;
}
.bold{
font-weight:bold;
font-size:20px;
}
.line{
	width:100%;
	border-bottom:solid 2px lightgray;
}
.title{
 height:30px;
}
.right{
	float:right;
}
.p-img{
width:100px;
height:100px;
}
.list_table {
	width: 100%;
	border-bottom:solid 3px lightgray;
	text-align: center;
}
.totlaPrice{
	color:orange;
}
 .btnn{
text-align:center;
}
.orderBtn{
width:50%;
float:left;
}
.totalPrice{
padding-bottom:20px;
}

</style>


<body>

	<div class="wrap">
		<div class="head">
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>

		<div class="contents">
		
		<div class="bold title padding">${order.dirivaryStatus }</div>
		
		<div class="data-No-Date line padding">
		<span id="orderNo"><span class="bold">No.</span><span >${order.orderNo }</span></span>
		<span id="orderDate" class="right">${order.orderDate }</span>
		</div>
		
		
		
		<div >
		<c:forEach items="${oList}" var="order" varStatus="i">
		<c:forEach items="${pList}" var="product" varStatus="p">
		<c:if test="${order.productNo eq product.productNo }">
			<table class="list_table">
				<tr>
					<td rowspan="4">
					<img class="p-img" alt="상품이미지" src="/resources/puploadFiles/${product.mainFileRename}" ></td>
					<td id="order_product${i.count }"style="font-weight:bold">${product.productName }</td>
					<td align="right">
						
					</td>
				</tr>

				<tr>
					<td>수량</td>
					<td>
						<span id="order_count${i.count }" class="order_count">${order.orderCount}</span>개
					</td>
				</tr>
				<tr>
					<td>가격</td>
					<td><span id="order_price${i.count }" class="order_price" data-value="1000">${product.productPrice }</span></td>
				</tr>
			</table>
						</c:if>
						</c:forEach>
						</c:forEach>
		</div>
		
		<div class="line">
		<div class="padding">
		<div class="bold " >주문자 정보</div>
		<div>이름 : ${order.memberName }</div>
		<div>연락처 : ${order.memberPhone }</div>
		</div>
		
		<div class="padding">
		<div class="bold " >배송지</div>
		<div>${order.orderAddress1 }${order.orderAddress2 }</div>
		<div>(${order.orderAddressPost })</div>
		<div>배송 메모</div>
		<div>${order.orderMessage }</div>	
		</div>
		</div>
		<div class="padding">
		<div class="bold ">결제 정보</div>
		<div>
		<span>상품금액</span>
		<span class="right" id="productPrice">${orderPay.productPrice }</span>
		</div>
		<div class="line">
		<span>포인트 할인</span>
		<span class="right">- <span id="pointPrice">${orderPay.usePoint }</span></span>
		</div>
		
		<div class="totalPrice padding">
		<span class="bold">총 결제 금액</span>
		<span class="right totlaPrice" id="totalPrice">${orderPay.payPrice }</span>
		</div>
		</div>
		
		<div class="btnn">
		<button type="button" class="btn btn-dark orderBtn" onclick="location.href='/order/complete/list.kh?memberId=${order.memberId}'" >주문 내역 리스트 보기</button>
		<button type="button" class="btn btn-dark orderBtn" onclick="location.href='/product/top20List'" >쇼핑하러 가기</button>
		</div>
		
		</div>
	</div>
	
	
	<script >
	<c:forEach items="${oList}" var="order" varStatus="i">
	var productOnePrice=Number($('#order_price${i.count }').text());
	$('#order_price${i.count}').html(productOnePrice.toLocaleString('ko-KR')+"원");
	</c:forEach>
	const productPrice=Number($("#productPrice").text());
	const pointPrice=Number($("#pointPrice").text());
	const totalPrice=Number($("#totalPrice").text());
	
	
	$("#productPrice").text(productPrice.toLocaleString('ko-KR')+"원");
	$("#pointPrice").html(pointPrice.toLocaleString('ko-KR')+"원");
	$("#totalPrice").html(totalPrice.toLocaleString('ko-KR')+"원");
	
	</script>

</body>
</html>