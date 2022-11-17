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
/* Header */
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
 h2 {
    font-size: 16px;
    margin:0;
    font-weight: bold;
} 

#header-block {
    height: 50px;
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
}

.go-back {
    display: inline-flex;
    position: relative;
    width: 40px;
    height: 40px;
    padding: 5px;
}

.go-back img {
    width: 25px;
    height: 25px;
}
.home-layout {
    display: flex;
    position: absolute;
    align-items: center;
    top: 8px;
    right: 5px;
}
.go-home {
    display: inline-flex;
    position: relative;
    width: 40px;
    height: 40px;
    padding: 5px;
}
.go-home img {
    width: 25px;
    height: 25px;
}
.go-home {
    display: inline-flex;
    position: relative;
    width: 40px;
    height: 40px;
    padding: 5px;
}

button {
    border: 0;
    background: 0 0;
    cursor: pointer;
}
/* Section */
.cm-line {
    height: 10px;
    background-color: #f1f1f1;
}
.wrap {
	max-width: 768px;
	margin: 0 auto;
	background-color: white;
	min-height: 100vh;
}

 .contents {
	padding-bottom: 60px;
} 
.data-No-Date{
width:100%;

padding:20px 20px 0px;

}
.padding {
    padding: 20px 20px 5px;
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
.total-Price{
	color:orange;
	font-size: 18px;
}
 .btnn{
text-align:center;
}
.orderBtn{
width:50%;
float:left;
}
.totalPrice{
padding-right:20px;
padding-bottom:10px;
}

/* button */
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
/*상품  */
.product-box {
    display: flex;
    padding: 15px 30px 15px;
    cursor: pointer;
  /*   box-shadow: 0px 1px 2px 1px rgb(0 0 0 / 25%); */
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
.info-name{
	font-weight:700;
    color: #6e6e6e;
    font-size: 15px;
}
.info-contents{
float:right;
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
.point-btn{
	width: 60px;
    height: 28px;
}
.pointInput{
height:25px;
width:160px
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

.btnn{
	width:100%;
}


</style>


<body>

	<div class="wrap">
		<div id="header-block">
            <header>
            <div class="header-wrapper">
                    <div class="back-layout">
                        <button class="go-back" onclick="history.back()">
                            <img src="/resources/images/back_arrow.png"> 
                        </button>
                    </div>
                    <h2>
                        주문 완료 내역
                    </h2>

                    <div class="home-layout">
                        <button class="go-home" onclick="location.href='/';">
                            <img src="/resources/images/home.png">
                        </button>
                    </div>
                </div>
                </header>
                </div>
            <div class="cm-line"></div>

		<div class="contents">
		
		<div class="bold title padding">${order.dirivaryStatus }</div>
		
		<div class="data-No-Date ">
		<span id="orderNo"><span class="bold">No.</span><span class="info-name" >${order.orderNo }</span></span>
		<span id="orderDate" class="right info-name">${order.orderDate }</span>
		</div>
		
		
		<hr>
		<div>
		<c:if test="${order.dirivaryStatus eq '구매확정'}"> 
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
                            <span class="brand-name"><b><span id="order_price${i.count }" class="order_price" >${product.productPrice}</span></b>
                            
						<%-- 	<span class="getpoint-one">
								<span id="getpoint-one${i.count}"></span>원 적립							
							</span> --%>
                            </span>
                        </div>
                        <div class="option-value">
                            <span>수량:<span id="order_count${i.count }" class="order_count">${order.orderCount}</span>개</span>
                       		
                       		 <span><button  style='float: right' class="btn btn-secondary btn-sm"  onclick="reviewRegist(${product.productNo })">후기작성</button></span>
                       		
                           
                        </div>
                        <div class="item-amount-wrap">
                            <div class="item-amountc">
                           
                            </div>
                        </div>
                    </div>
                </div>
			
						</c:if>
						</c:forEach>
						</c:forEach>
						</c:if> 
	   <c:if test="${order.dirivaryStatus ne '구매확정'}"> 	
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
                            <span class="brand-name"><b><span id="order_price${i.count }" class="order_price" >${product.productPrice}</span></b>
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
			
						</c:if>
						</c:forEach>
						</c:forEach>
					</c:if>
		</div>
		<hr>
		
		<div class="padding">
		<div class="bold " >주문자 정보</div>
		<div class="padding">
		<div><span class="info-name">받으시는 분</span><span class="info-contents">${order.memberName }</span></div>
		<div><span class="info-name">연락처</span> <span class="info-contents">${order.memberPhone }</span></div>

		<div><span class="info-name">배송지</span><span class="info-contents">(${order.orderAddressPost }) ${order.orderAddress1 }</span>
		</div>
		<div class="info-contents">${order.orderAddress2 }</div>
		<br>
		<div><span class="info-name">배송 메모</span><span class="info-contents">${order.orderMessage }</span></div>
		<div></div>	
		</div>
		</div>
		<hr>
		
		<div class="padding">
		<div class="bold ">결제 정보</div>
		<div class="padding">
		<div>
		<span class="info-name">상품금액</span>
		<span class="right" id="productPrice">${orderPay.productPrice }</span>
		</div>
		<div >
		<span class="info-name">포인트 할인</span>
		<span class="right">- <span id="pointPrice">${orderPay.usePoint }</span></span>
		</div>
		</div>
		<hr>
		<div class="totalPrice">
		<span class="bold">총 결제 금액</span>
		<span class="right total-Price" id="totalPrice">${orderPay.payPrice }</span>
		</div>
		</div>
		<div class="footer-btn">
		<c:if test="${order.dirivaryStatus ne'환불완료' and order.dirivaryStatus ne'구매취소' }">
		<div class="btnn">
		<button type="button" class="submit-button1" onclick="location.href='/order/complete/list.kh'" >주문 내역 리스트 보기</button>
		<button type="button" class="submit-button2" onclick="location.href='/product/top20List'" >쇼핑하러 가기</button>
		</div>
		</c:if>
		<c:if test="${order.dirivaryStatus eq'환불완료' or order.dirivaryStatus eq'구매취소' }">
		<div class="btnn">
		<button type="button" class="submit-button1" onclick="location.href='/order/complete/Cancle/list'" >취소 내역 리스트 보기</button>
		<button type="button" class="submit-button2" onclick="location.href='/product/top20List'" >쇼핑하러 가기</button>
		</div>
		</c:if>
		</div>
		
		</div>
	</div>
	
	
	<script >
	
	function reviewRegist(pNo){
	      location.href="/product/reviewRegist?productNo="+pNo;
		}
	
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