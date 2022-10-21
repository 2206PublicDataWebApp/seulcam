<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>주문하기</title>
<style>
.head{

}


.price{
	float:right;
}
.small-title{
	font-size:16px;
	font-weight:bold;
}
.info{
	padding:30px;
}
.line{
border-bottom:solid 3px lightgray;
}
#p_img{
width:100px;
height:100px;
}
table{
width:100%

}
.pay-button{
	width:100%;
	height:40px;
	background: #000;
    color: #fff;
	float:right;

}
.info-button{
	width:80px;
	height:25px;
	background: #000;
    color: #fff;
	float:right;
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="head">
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>
		
		<div class="address line">
		<div class="info">
			<div class="small-title">배송지</div>
			<div>
				이름
				<button class="info-button">배송지 변경</button>
			</div>
			<div>010-0000-0000</div>
			<div>서울시 중구</div>
			<select>
				<option value="" disabled selected hidden>배송시 요청사항을 선택하세요</option>
				<option>빨리요</option>
				<option>연락주세요</option>
			</select>
		</div>
		</div>
		
		<div class="product line">
		<div class="info">
			<table class="list_table">
				<tr>
					<td rowspan="4">
					<img id="p_img"
						src="//image.msscdn.net/images/goods_img/20220906/2774157/2774157_1_160.jpg"
						alt="윅(WICK) ACID 워싱 볼캡-차콜"></td>
					<td>상품명</td>
					<td align="right">
						<%-- <button class="delete" id="one-delete"
							onclick="deleteOne(${cart.cartNo })">X</button> --%>
					</td>
				</tr>

				<tr>
					<td>수량</td>
					<td>
						<span>1개</span>
					</td>
				</tr>
				<tr>
					<td>가격</td>
					<td><span id="price${cart.cartNo }"
						data-value="${product.productPrice }">10000000</span></td>
				</tr>
			</table>
		</div>
		</div>
		
		<div class="point line">
		<div class="info">
		<div class="small-title">포인트 할인</div>
		<div>
		포인트
		<input type="text"/>
		<button class="info-button">사용취소</button>
		</div>
		<!-- <div>사용가능 포인트 ***원</div> -->
		</div>
		</div>

		<div class="info">
		<div class="small-title">결제 상세</div><br>
		<div>상품 금액<span class="price">122,000원</span></div>
		<div>포인트 할인<span class="price">-1,000원</span></div>
		<div style="font-weight:bold">총 결제 금액<span class="price">121,000원</span></div>
		
		</div>
		
		
		<div class="payButton">
		<button class="pay-button">****원 결제하기</button>
		</div>

	</div>


</body>
</html>