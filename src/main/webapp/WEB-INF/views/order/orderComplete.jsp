<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>주문완료</title>
	<link rel="stylesheet" href="/resources/css/fonts.css">
	<link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
</head>
<style>
body {
        font-size: 14px;
       	color: #000;
		background-color: #f1f1f1;
		height:100%;
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

.wrap{
 		max-width: 768px;
        margin: 0 auto; 
        background-color: white;
        min-height: 100%;
   		position: relative;
   		}
.contents{
	padding-top: 50px;
   padding-bottom: 53px;
}
.title {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	height: 150px;
	font-size: 16px;
	/* border-bottom: solid 3px lightgray; */
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
	float:right;
}
.info{
	padding:30px;
}
/* .buy-info{
	border-bottom: solid 3px lightgray;
} */
/* .order-number{
	border-bottom: solid 3px lightgray;
} */
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
#addressChangeForm{
	width:100%;
	height:130%;
	border:solid 3px lightgray;
}
.ch-btn{
	margin:5px;
	width:80px;
	height:25px;
	background: #000;
    color: #fff;
	
}
.adress-button{
	
	
	width:80px;
	height:25px;
	background: #000;
    color: #fff;
    float:right;
}
.post{
width:100%;
margin-top: 6px;
}
.btn-blue{
 	background-color: #0078ff;
    color: #fff;
    border-radius: 4px;
    font-weight: 400;
    /* font-size: 16px; */
    justify-content: center;
    align-items: center;
    line-height: 1.5;
    border:0px;

}
.btn-gray{
 	background-color: gray;
    color: white;
    border-radius: 4px;
    font-weight: 400;
    /* font-size: 16px; */
    justify-content: center;
    align-items: center;
    line-height: 1.5;
    border:0px;

}
.submit-button1 {
    background-color: #0078ff;
    color: #fff;
    display: flex;
    width: 50%;
    height: 50px;
    border-top-left-radius: 4px;
    border-bottom-left-radius: 4px;
    font-weight: 400;
    font-size: 16px;
    justify-content: center;
    align-items: center;
    line-height: 1.5;
/*     border-right:solid 1px black;
     border-left:none;
    border-top:none;
    border-bottom:none;  */
    border:0px; 
    float:left;
     border-right:solid 2px white;
}
.submit-button2 {
    background-color: #0078ff;
    color: #fff;
    display: flex;
    width: 50%;
    height: 50px;
	border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
    font-weight: 400;
    font-size: 16px;
    justify-content: center;
    align-items: center;
    line-height: 1.5;
    border:0px;
    float:left;
}

#addressChangeForm{
	width:100%;
	height:130%;
	border: solid 1px lightgray;
    padding: 15px;
}
.msg-box{
padding-top:10px;
}
.footer-btn {
   position: fixed;
	display: flex;
	float: left;
    bottom: 0;
    left: 50%;
    z-index: 11;
    background: #fff;
	height: 53px;
    width: 100%;
    max-width: 768px;
    transform: translateX(-50%);
	cursor: pointer;
}
.submit-btn{
	width:100%;
}
</style>
<body>
	<div class="wrap">
		<div class="head">
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>
		<div class="contents">
		<div class="title">
			<h2 class="state">주문완료</h2><h2 class="">되었습니다.</h2>
		</div>
		<hr>
		<div class="buy-info">
		<div class="info">
		<div class="small-title">주문자 정보</div>
		<div>이름 : <span>${order.memberName }</span></div>
		<div>연락처 : <span>${order.memberPhone }</span></div><br>
		<div><span class="small-title">배송지</span> 
		<button class="info-button btn-blue"   id="btn" onclick="addressChange(this,${order.orderNo})">변경</button>
<!-- 		<button class="info-button" id="postcodify_search_button">변경</button> -->
		<div id="post">${order.orderAddress1 }</div>
		<div id="address1">${order.orderAddress2 }</div>
		<div id="address2">${order.orderAddressPost }</div>
		<div class="small-title msg-box">배송 메모</div>
		<div>${order.orderMessage }</div>
		<!-- <input type="text" name="post" class="postcodify_postcode5" > -->
		</div>
		</div>
		<div class="order-number">
		<div class="info">
		<div class="small-title">주문 번호</div>
		<span>No.${order.orderNo }</span>
		<button class="info-button btn-blue" onclick="location.href='/order/complete/datail.kh?orderNo=${order.orderNo}'">상세보기</button>
		</div>
		</div>
		<hr>
		<div class="info">
		<div class="small-title">결제 상세</div><br>
		<div>상품 금액<span class="price"><fmt:formatNumber value="${orderPay.productPrice}" pattern="#,###,###"/>원</span></div>
		<div>포인트 할인<span class="price">-<fmt:formatNumber value="${orderPay.usePoint }" pattern="#,###,###"/>원</span></div>
		<div style="font-weight:bold">총 결제 금액<span class="price"><fmt:formatNumber value="${orderPay.payPrice }" pattern="#,###,###"/>원</span></div>
		
		</div>
		
		<div class="footer-btn">
		<div class="submit-btn">
		<button class="submit-button1" style="border-left:solid 1px #fff"onclick="location.href='/order/complete/list.kh?memberId=${order.memberId}'" >구매내역 보기</button><button class="submit-button2" onclick="location.href='/product/top20List'">쇼핑 홈 가기</button>
		</div>
		</div>
		

	</div>
	</div>
	</div>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
	$("#postcodify_search_button").postcodifyPopUp();
	</script>
	<script>
	
	function addressChange(obj,orderNo){
		event.preventDefault();
		var $div=$("<div id='addressChangeForm'>");
		$div.append("<span style='font-weight:bold'>주소 변경</span>");
		$div.append("<span><button class='adress-button info-button btn-gray'  id='postcodify_search_button'onclick='popup(this)'>주소찾기</button></span> ");
		$div.append("<div><input type='text'id='cng-post' name='post' class='post postcodify_postcode5' readonly></div>");
		$div.append("<div><input type='text'id='cng-ad1' name='address1' class='post postcodify_address' readonly></div>");
		$div.append("<div><input type='text'id='cng-ad2' name='address2' class='post postcodify_details' placeholder='상세주소를 입력하세요'></div>");
		$div.append("<div><button class='ch-btn btn-gray' id='submit-address'onclick='change()'>변경</button><button class='ch-btn btn-gray' onclick='displayform(this)'>취소</button></div>");
		$div.append("</div>");
		$("#address2").html($div);
	}
	
	function popup(obj){
	$(obj).postcodifyPopUp();
	}
	function displayform(obj){
	$("#addressChangeForm*").remove();
	}
	
	function change(orderNo){
		var orderNo=orderNo;
		var post=$("#cng-post").val();
		var address1=$("#cng-ad1").val();
		var address2=$("#cng-ad2").val();
		
		$.ajax({
			url:"/order/complete/addressChange.kh",
			data:{"orderNo" : orderNo, "orderAddressPost" : post,"orderAddress1" : address1,"orderAddress2" : address2},
			type:"post",
			success:function(data){
				if(data =="success"){
					alert("주소 변경 완료");
					window.location.replace("/order/finish.kh?orderNo="+orderNo+"");
				}else{
					alert("주소 변경 실패");
					
				}
			},
			error:function(){
				alert("ajax 통신 오류! 관리자에게 문의해 주세요!");
			}
			
		})
		
	}
	function completeOrderDetail(){
	
	}
	</script>
	

</body>
</html>