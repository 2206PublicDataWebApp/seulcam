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
<title>주문하기</title>
	<link rel="stylesheet" href="/resources/css/fonts.css">
	<link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- 주문 -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="../../../resources/js/jquery-3.6.1.min.js"></script>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
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
/* 헤더 */
#header-block {
    height: 50px;
}

header {
    position: fixed;
    left: 0px;
    right: 0px;
    top: 0px;
    height: 50px;
    background-color: rgb(255, 255, 255);
    z-index: 1;
    max-width: 768px;
    margin: 0 auto; 
}
h2 {
	margin:0;
    font-size: 16px;
}


.header-wrapper {
    display: flex;
    align-items: center;
    justify-content: center;
    max-width: 768px;
    margin: 0 auto;
    height: 50px;
    position: relative;
}

.back-layout {
    display: flex;
    position: absolute;
    align-items: center;
    top: 5px;
    left: 5px;
    background-color:white;
    boaer:0px;
    outline:0px;
}

.go-back {
	background-color:white;
	border:none;
    display:inline-flex;
    position: relative;
    width: 40px;
    height: 40px;
    padding: 5px;
}

.go-back img {
    width: 25px;
    height: 25px;
}

/* Section */
.cm-line {
    height: 8px;
    background-color: #f1f1f1;
}

.wrap{
 		max-width: 768px;
        margin: 0 auto; 
        background-color: white;
        min-height: 100%;
   		position: relative;
        /* min-height: 100vh; */
}
.contents{
	padding-top: 50px;
    padding-bottom: 53px;
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
.info-point{
	padding-right:30px;
	padding-left:30px;
}
.line{
border-bottom:solid 3px lightgray;
}
.p-img{
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
margin-top: 6px;
}
#addressChangeForm{
	width:100%;
	height:130%;
	border: solid 1px lightgray;
    padding: 15px;
}
.ch-btn{
	margin:5px;
	width:80px;
	height:25px;
	
}
.pointinfo{
	display:flex;
	align:right;
	color:blue;
	 float:right; 
	 left:100px; 
}
.point-right{
 	float:right; 
}

#message{
width:100%;
}
/* button */
.submit-button {
    background-color: #0078ff;
    color: #fff;
    display: flex;
    width: 100%;
    height: 50px;
    border-radius: 4px;
    font-weight: 400;
    font-size: 16px;
    justify-content: center;
    align-items: center;
    line-height: 1.5;
    border:0px;
}

/* 상품 레이아웃 */
.product-box {
    display: flex;
    padding: 15px 30px 15px;
    cursor: pointer;
}

.thumbnail-box {
    display: flex;
    align-items: flex-start;
}

.thumbnail-link {
    display: block;
    overflow: hidden;
    position: relative;
    width: 70px;
    height: 83px;
    background-color: #f9f9f9;
    isolation: isolate;
}

.thumbnail-image {
    /* top: 50%; */
    position: absolute;
    /* left: 50%; */
    width:100%;
    height: 100%;
}

.product-info {
    margin-left: 30px;
    margin-right: 40px;
    margin-top: 20px;
    width: calc(100% );
}

/* .a-wrap {
    width: calc(100% - 22px);
} */
.order_price{
font-size:14px;
}
.phone-num{
	pont-weight:700px;
    color: #6e6e6e;
    font-size: 13px;
}
.brand-name {
    display: block;
    font-size: 12px;
}
.getpoint-one {
    display: block;
    font-size: 12px;
    pont-weight:700px;
    color:blue;
   /*  color: #6e6e6e; */
}
.product {
    display: flex;
    width: 100%;
    justify-content: space-between;
    align-items: flex-start;
}

.product-name {
    display: block;
    font-weight: 700;
    font-size: 14px;
    white-space: nowrap;
    text-overflow: ellipsis;
}
.product-option {
	pont-weight:700px;
    color: #6e6e6e;
    font-size: 12px;
}

.option-value {
    display: flex;
    font-size: 12px;
    justify-content: space-between;
    align-items: flex-end;
}
.row {
    --bs-gutter-x: 1.5rem;
    --bs-gutter-y: 0;
    display: flex;
    flex-wrap: wrap;
    margin-top: calc(-1 * var(--bs-gutter-y));
    margin-right: calc(-.5 * var(--bs-gutter-x));
    margin-left: calc(-.5 * var(--bs-gutter-x));
    }
    .input_info {
    padding:20px 20px 0px;
}
.point-name{
width:25%;
}
.point-box{
width:75%;
}
.nowPoint{
color:#0078ff;
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
.point-btn{
	width: 60px;
    height: 28px;
}
.pointInput{
height:25px;
width:160px;
}
.point-font{
	font-size:15px;
}
.pl{
    width: 200px;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    border-radius: 10px;
    padding: 4px 1px;
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    font-size: 14px;
    line-height: 16px;
}
.select-box{
padding-top:10px;
}
/* 
.pl:focus{
    border: 1px solid #9B51E0;
    box-sizing: border-box;
    border-radius: 10px;
    outline: 3px solid #F8E4FF;
    border-radius: 10px;
} */
footer {
    position: absolute;
    /* bottom: 0;
    left: 0;
    right: 0;
    max-width: 768px;
    margin: 0 auto; 
    width: 100%; */
   /*  padding: 12px 7px;
    height: auto; */
 	

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
.payButton{
	width:100%;
}

</style>
</head>
<body>
	<div class="wrap">
		<div class="head">
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>
		<div class="contents">
		<div>
		<header>
		<div class="header-wrapper">
		
                    <div class="back-layout">
                        <button class="go-back" onclick="history.back()">
                            <img src="../../../resources/images/back_arrow.png">
                        </button>
                    </div>
                    <h2>주문하기</h2>
                </div>
		<div class="cm-line"></div>
               </header> 
		
		</div>
		<div class="info">
		
			<div class="small-title">배송지</div>
			
			<div>
			<input type="hidden" id="memberId" value="${member.memberId }"/>
				<span id="memberName">${member.memberName }</span>
				<button class="info-button btn-blue"  id="btn" onclick="addressChange(this)">배송지 변경</button>
			</div>
			<div><span id="memberPhone" class="phone-num">${member.memberPhone }</span></div>
			<div><span id="address1">${member.memberAddress1 }</span>
			<span id="address2">${member.memberAddress2 }</span></div>
			<div>(<span id="post">${member.memberZip }</span>)</div>
			<div id="addresscng"></div>
			<div class="select-box">
			<select class="pl" id="message">
				<option  value="" disabled selected hidden>배송시 요청사항을 선택하세요</option>
				<option>부재 시 경비실에 맡겨주세요</option>
				<option>부재 시 택배함에 넣어주세요</option>
				<option>부재 시 집 앞에 놓아주세요</option>
				<option>배송 전 연락 바랍니다.</option>
			</select>
			</div>
		</div>
		<hr>
		
		<c:forEach items="${oList}" var="order" varStatus="i">
		<c:forEach items="${pList}" var="product" varStatus="p">
		<c:if test="${order.productNo eq product.productNo }">
                               <div class="product-box" >
                 
                    <div class="order-thumbnail">
                        <div class="thumbnail-box">
                            <a href="#" class="thumbnail-link"  onclick="location.href='#'">
                                <img class="thumbnail-image" id="img${i.count }" alt="상품이미지" src="/resources/puploadFiles/${product.mainFileRename}" ">
                            </a>
                        </div>
                    </div>
                    <div class="product-info">
                        <div class="product">
                            <div class="brand-info">
                                <div class="a-wrap">
                                    <span class="product-name"id="order_product${i.count}">${product.productName }</span>
                                            <span class="product-option">${product.brandName }/ <span class="product-option"><b>${product.productColor }</b></span></span>
                                </div>
                            </div>
                            <span class="brand-name"><b><span id="order_price${i.count }" class="order_price" >${product.productPrice}</span>원</b>
                            
							<span class="getpoint-one">
								<span id="getpoint-one${i.count}"></span>원 적립							
							</span>
                            </span>
                        </div>
                        <div class="option-value">
                            <span>수량:<span id="order_count${i.count }" class="order_count">${order.orderCount}</span>개</span>
                        </div>
                        <div class="item-amount-wrap">
                            <div class="item-amountc">
                                
                           
                            </div>
                        </div>
                    </div>
                </div>
		
				<input type="hidden" id="p-count"value="${!index.last }"/>
						</c:if>
						</c:forEach>
						</c:forEach>
		<hr>
		<div class="point">
		<div class="info-point">
		<div class="small-title">포인트 할인</div>
		<div class="input_info row">
					<div class="point-name">
						<span class="point-font">포인트</span>
					</div>
					<div class="point-box text-end" style="text-align: right;">
						<input type="text" class="pointInput" name="" value="" id="point" placeholder=""><button type="button" onclick="pointCancle()" class="btn-blue point-btn">사용취소</button>
						<p align="right" class="nowPoint">사용가능 포인트 <span id="available-point">${member.totalPoint}</span>원</p>
					</div>
					<hr>
				</div>
		
		</div>
		<hr>

		<div class="info">
		<div class="small-title">결제 상세</div><br>
		<div>상품 금액<span class="price"><span  id="product_price">${totalPrice }</span><span>원</span></span></div>
		<div>포인트 할인 <span class="price" id="point-price">원</span></div>
		<div style="font-weight:bold">총 결제 금액<span class="price" ><span id="total-price"></span><span>원</span></span></div>
		
		</div>
		</div>
		
		<div class="footer-btn">
		<div class="payButton">
		<button class="submit-button" onclick="orderPay()"><span id="total-button"></span>원 결제하기</button>
		</div>
		</div>
		

	</div>
	</div>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

	
	<script>
	//숫자 콤마 찍기
	function priceToString(price) {
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }
	//콤마 스트링 숫자로 변환
	function stringNumberToInt(stringNumber){
        return parseInt(stringNumber.replace(/,/g , ''));
    }
	
	
	 //주문페이지 벗어나면 주문 취소
	 var checkUnload = true;
	    $(window).on("beforeunload", function(){
	        if(checkUnload) {
	        var memberId=$("#memberId").val();
	        $.ajax({
	        	url:"/order/notCompleteOrder",
	        	type:"GET",
	        	data:{"memberId":memberId},
	        	success:function(){
	        		//alert("주문 취소");
	        		window.location.href('/');
	        		
	        		
	        	},error:function(){
					alert("ajax 통신 오류! 관리자에게 문의해 주세요!");
				}
	        	
	        	
	        });		        
	        return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다." 
	        
	        };
	    });

	function addressChange(obj){
		checkUnload = false;
		event.preventDefault();
		var $div=$("<div id='addressChangeForm'>");
		$div.append("<span style='font-weight:bold'>주소 변경</span>");
		$div.append("<span><button class='adress-button info-button btn-gray'  id='postcodify_search_button'onclick='popup(this)'>주소찾기</button></span> ");
		$div.append("<div><input type='text'id='cng-post' name='post' class='post postcodify_postcode5' readonly></div>");
		$div.append("<div><input type='text'id='cng-ad1' name='address1' class='post postcodify_address' readonly></div>");
		$div.append("<div><input type='text'id='cng-ad2' name='address2' class='post postcodify_details' placeholder='상세주소를 입력하세요'></div>");
		$div.append("<div><button class='ch-btn btn-gray' id='submit-address'onclick='change()'>변경</button><button class='ch-btn btn-gray' onclick='displayform(this)'>취소</button></div>");
		$div.append("</div>");
		$("#addresscng").html($div);
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
					location.replace("/order/order.kh");
					var checkUnload = false;
				}else{
					alert("주소 변경 실패");
					
				}
			},
			error:function(){
				alert("ajax 통신 오류! 관리자에게 문의해 주세요!");
			}
			
		})
		
	}
	
	//상품금액
	<c:forEach items="${oList}" var="order" varStatus="i">
	var price=$("#order_price${i.count}").text()*$("#order_count${i.count}").text();
	$("#order_price${i.count}").text(price.toLocaleString('ko-KR'));
	$("#getpoint-one${i.count}").text((price/100*3).toLocaleString('ko-KR'));
	</c:forEach>
	
	//포인트
	var availPoint=$("#available-point").text();
	$("#available-point").html(priceToString(availPoint));
	
	$("#point").on("keyup",function(){
	$("#available-point").html("${member.totalPoint}");
	
	var point=$("#point").val();
	var userpoint=$("#available-point").text();
	if(parseInt(point)>parseInt(userpoint)){
		alert ("보유 포인트를 초과하였습니다.");
		pointCancle();
	}else if(parseInt(point)>parseInt(stringNumberToInt($("#total-price").html()))){
		alert("결제 금액을 초과 할 수 없습니다.")
	}
	
	else{
	$("#point-price").html('-'+priceToString(point)+'원');
	
	var userpoint=$("#available-point").text();
	$("#available-point").html(priceToString(userpoint-point));
	
	var totalPrice=totalProduct-point;
	$("#total-price").html(priceToString(totalPrice));
	$("#total-button").html(priceToString(totalPrice));
	}
	})

	
	var totalProduct=$('#product_price').text();
	$('#product_price').text(priceToString(totalProduct));
	$("#total-price").prepend(priceToString(totalProduct));
	$("#total-button").prepend(priceToString(totalProduct));
	
	function pointCancle(){
	$("#point").val("");
	$("#available-point").html(priceToString("${member.totalPoint}"));
	$("#point-price").html('0원');
	$("#total-price").html(priceToString(totalProduct));
	$("#total-button").html(priceToString(totalProduct));
	}
	//alert($("#total-price").text())
	
	function orderPay(){
		checkUnload = false;
		const data={
			Num:createOrderNum(),
			memberId:$("#memberId").val(),
			memberName:$("#memberName").text(),
			name : $("#order_product1").text()+" 외 "+(${pCount}-1)+"개",
			amount : stringNumberToInt($("#total-price").text()),
			memberPhone : $("#memberPhone").text(),
			usePoint : $("#point").val(),
			getPoint : Math.ceil(stringNumberToInt($("#total-price").text())/100*3),
			orderAddressPost : $("#post").text(),
			orderAddress1 : $("#address1").text(),
			orderAddress2 : $("#address2").text(),
			payPrice : stringNumberToInt($("#total-price").text()),
			productPrice : stringNumberToInt($("#product_price").text()),
			orderMainFileRename : $('#img1').attr("src"),
			orderMainProductName:$("#order_product1").text()+" 외 "+(${pCount}-1)+"개",
			point:$("#point").val(),
			orderMessage:$("#message").val()
				
		}
		console.log(data);
		//paymentComplete(data);//결제 완료후
		paymentCard(data);//결제 화면
	}
	function createOrderNum(){
		const date = new Date();
		const year = date.getFullYear();
		const month = String(date.getMonth() + 1).padStart(2, "0");
		const day = String(date.getDate()).padStart(2, "0");
		
		let orderNum = year + month + day;
		for(let i=0;i<10;i++) {
			orderNum += Math.floor(Math.random() * 8);	
		}
		return orderNum;
	}
function paymentCard(data) {
		// 모바일로 결제시 이동페이지
		const pathName = location.pathname;
		const href = location.href;
		const m_redirect = href.replaceAll(pathName, "/order/payment/complete/mobile");
		
		var IMP = window.IMP;
		IMP.init("imp56144003"); 
			
		IMP.request_pay({ // param
			pg: "html5_inicis",
		  	pay_method: data.payMethod,
		  	merchant_uid: data.Num,
		  	name: data.name,
		  	amount: "100",
		   	buyer_email: "",
		   	buyer_name: "",
		  	buyer_tel: data.phone,
		  	buyer_addr: data.deleveryAddress2 + " " + data.deleveryAddress3,
		  	buyer_postcode: data.deleveryAddress1,
		  	m_redirect_url: m_redirect, 
	  	}, 
		function (rsp) { // callback
			if (rsp.success) {
	         // 결제 성공 시 로직,
		        data.imp_uid = rsp.imp_uid;
	         //아임포트 고유 결제번호
			//success가 false이고 사전 validation에 실패한 경우, imp_uid는 null일 수 있음
		        data.merchant_uid = rsp.merchant_uid;
		        //가맹점에서 생성/관리하는 고유 주문번호
		        //이미 결제가 승인 된(status: paid) merchant_uid로는 재결제 불가
		        
		        console.log(data);
		        paymentComplete(data);  
				
			} else {
	          // 결제 실패 시 로직,
				var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
			}
		});
	}
	
	
	
	
	
	
function paymentComplete(data){
	console.log(data);
	$.ajax({
		url:"/order/payment/complete",
		method:"POST",
		data:data,
		success:function(orderNo){
				checkUnload = false;
				alert("주문 성공");
				let url="/order/finish.kh?orderNo="+orderNo+"";
				location.replace(url);
				
		},
		error:function(){
			alert("ajax 통신 오류! 관리자에게 문의해 주세요!");
		}
		
	});

	/* 
	.done(function(result){
		messageSend();
		swal({
			text:result,
			consoleClickOutside:false
			
		})
		.then(function(){
			location.replace("/orderList");
		})
	})
	.fail(function(){
		alert("에러");
		location.replace("/");
	}) */
}

	
	</script>
	
	
	

</body>
</html>