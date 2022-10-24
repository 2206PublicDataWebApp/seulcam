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
.adress-button{
	
	
	width:80px;
	height:25px;
	background: #000;
    color: #fff;
    float:right;
}
.delete {
	border: none;
	float:right;
	width: 50px;
	height: 50px;
	font-size: 40px;
	display: inline-block;
	opacity: .3;
}
.post{
width:100%;
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
.point-right{
	float:right;
}
.pointinfo{
	color:lightblue;
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
			<input type="hidden" id="memberId" value="${member.memberId }"/>
				${member.memberName }
			<%-- 	<jsp:include page="/WEB-INF/views/order/addressPopup.jsp"></jsp:include> --%>
				<!-- <button class="info-button"  id="postcodify_search_button ">배송지 변경</button> -->
				<button class="info-button"  id="btn" onclick="addressChange(this)">배송지 변경</button>
			</div>
			<div>${member.memberPhone }</div>
			<div id="post">${member.memberZip }</div>
			<div id="adress1">${member.memberAddress1 }</div>
			<div id="adress2">${member.memberAddress2 }</div>
			<select id="message">
				<option value="" disabled selected hidden>배송시 요청사항을 선택하세요</option>
				<option>부재 시 경비실에 맡겨주세요</option>
				<option>부재 시 택배함에 넣어주세요</option>
				<option>부재 시 집 앞에 넣어주세요</option>
				<option>배송 전 연락 바랍니다.</option>
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
		<span class="point-right">
		<input type="text"/>
		<button class="info-button">사용취소</button>
		</span>
		</div>
		<div class="pointinfo">사용가능 포인트 <span>${member.totalPoint}</span>원</div>
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
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

	
	<script>
	function addressChange(obj){
		event.preventDefault();
		var $div=$("<div id='addressChangeForm'>");
		$div.append("<span>주소 변경</span>");
		$div.append("<span><button class='adress-button'  id='postcodify_search_button'onclick='popup(this)'>주소찾기</button></span> ");
		$div.append("<div><input type='text'id='cng-post' name='post' class='post postcodify_postcode5' readonly></div>");
		$div.append("<div><input type='text'id='cng-ad1' name='address1' class='post postcodify_address' readonly></div>");
		$div.append("<div><input type='text'id='cng-ad2' name='address2' class='post postcodify_details' placeholder='상세주소를 입력하세요'></div>");
		$div.append("<div><button class='ch-btn' id='submit-address'onclick='change()'>변경</button><button class='ch-btn' onclick='displayform(this)'>취소</button></div>");
		$div.append("</div>");
		$("#adress2").append($div);
	}
	
	function popup(obj){
	$(obj).postcodifyPopUp();
	}
	function displayform(obj){
	$("#addressChangeForm*").remove();
	}
	
	function change(){
		var memberId=$("#memberId").val();
		var post=$("#cng-post").val();
		var address1=$("#cng-ad1").val();
		var address2=$("#cng-ad2").val();
		
		$.ajax({
			url:"/order/addressChange.kh",
			data:{"memberId": memberId, "memberZip" : post,"memberAddress1" : address1,"memberAddress2" : address2},
			type:"post",
			success:function(data){
				if(data =="success"){
					alert("주소 변경 완료");
					
				}else{
					alert("주소 변경 실패");
					
				}
			},
			error:function(){
				alert("ajax 통신 오류! 관리자에게 문의해 주세요!");
			}
			
		})
		
	}
	
	</script>
	
	
	

</body>
</html>