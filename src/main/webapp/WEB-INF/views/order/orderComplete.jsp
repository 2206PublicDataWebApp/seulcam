<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>주문완료</title>
</head>
<style>
.title {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	height: 150px;
	font-size: 16px;
	border-bottom: solid 3px lightgray;
}
.state{
	color: #0078ff;
}
.small-title{
	font-size:16px;
	font-weight:bold;
}
.info-button{
	width:80px;
	height:25px;
	background: #000;
    color: #fff;
	float:right;
}
.info{
	padding:30px;
}
.buy-info{
	border-bottom: solid 3px lightgray;
}
.order-number{
	border-bottom: solid 3px lightgray;
}
.go-button{
	width:50%;
	height:40px;
	background: #000;
    color: #fff;
	float:right;

}
.price{
	float:right;
}

</style>
<body>
	<div class="wrap">
		<div class="head">
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>
		<div class="title">
			<h2 class="state">주문완료</h2><h2 class="">되었습니다.</h2>
		</div>
		<div class="buy-info">
		<div class="info">
		<div class="small-title">주문자 정보</div>
		<div>이름 : <span>사용자</span></div>
		<div>연락처 : <span>010-0000-0000</span></div><br>
		<div><span class="small-title">배송지</span> 
		<button class="info-button" id="postcodify_search_button">변경</button>
		<div>서울시~~~</div>
		<input type="text" name="post" class="postcodify_postcode5" >
		</div>
		</div>
		
		<div class="order-number">
		<div class="info">
		<div class="small-title">주문 번호</div>
		<span>22222222022222</span>
		<button class="info-button">상세보기</button>
		</div>
		</div>
		
		<div class="info">
		<div class="small-title">결제 상세</div><br>
		<div>상품 금액<span class="price">122,000원</span></div>
		<div>포인트 할인<span class="price">-1,000원</span></div>
		<div style="font-weight:bold">총 결제 금액<span class="price">121,000원</span></div>
		
		</div>
		
		<div>
		<button class="go-button" style="border-left:solid 1px #fff">구매내역 보기</button><button class="go-button">쇼핑 홈 가기</button>
		</div>
		

	</div>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
	$("#postcodify_search_button").postcodifyPopUp();
	</script>

</body>
</html>