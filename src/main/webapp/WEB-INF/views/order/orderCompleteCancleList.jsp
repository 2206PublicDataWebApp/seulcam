<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 user-scalable=no">
<title>취소/환불 주문내역</title>
<link rel="stylesheet" href="/resources/css/camp/switch.css">
<!-- <link href="../resources/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="/resources/css/fonts.css">
<link rel="shortcut icon" href="/resources/images/faviconlogo.ico"
	type="image/x-icon">
<link rel="icon" href="/resources/images/faviconlogo.ico"
	type="image/x-icon">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- jQuery -->
<script src="../../../resources/js/jquery-3.6.1.min.js"></script>
</head>
<style>
    * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-size: 14px;
    line-height: 1.5;
    color: #000;
    background-color: #f1f1f1;
}

.body-wrapper {
    max-width: 768px;
    margin: 0 auto; 
    background-color: white;
    min-height: 100vh;
}

/* button {
    border: 0;
    background: 0 0;
    cursor: pointer;
} */

a {
   text-decoration: none; 
   color: black;
}

h2 {
    font-size: 16px;
    margin: 0;
    font-weight: bold;
}

h3 {
    text-align: center;
    margin: 0;
    font-size: 1.17em;
    font-weight: bold;
}

li {
    list-style: none;
}

img {
    max-width: 100%;
    border: none;
    line-height: 0;
    vertical-align: top;
}



/* Header */
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
button {
    border: 0;
    background: 0 0;
    cursor: pointer;
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

/* Section */
.cm-line {
    height: 10px;
    background-color: #f1f1f1;
}

.check-bar {
    display: flex;
    padding: 15px 15px 0px 15px;
    justify-content: space-between;
    align-items: center;
}

.check-all {
    display: none;
}

.check-all:checked + label::before {
	background-color: #0078ff;
	border: 1px solid #0078ff;
}

.check-all:checked + label::after {
	position: absolute;
	content: '';
	width: 3px;
	height: 6px;
	border-right: 1.5px solid #fff;
	border-bottom: 1.5px solid #fff;
	transform: rotate(45deg);
	display: block;
    left: 7px;
    top: 6px;
}

.check-label {
    padding-left: 26px;
    font-size: 14px;
    cursor: pointer;
    position: relative;
}

.check-label::before {
    position: absolute;
    display: block;
    width: 17px;
    height: 17px;
    border: 1px solid #ccc;
    border-radius: 100%;
    background-color: #f1f1f1;
    content: '';
    cursor: pointer;
    left: 0px;
    top: 2px;
    
}

.delete-btn {
    font-weight: 700;
    font-size: 13px;
    line-height: 1.5;
    cursor: pointer;
}

.product-box {
    display: flex;
    padding: 24px 15px 20px;
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
    width: 100%;
}

.product-info {
    margin-left: 10px;
    width: calc(100% );
}

/* .a-wrap {
    width: calc(100% - 22px);
} */

.brand-name {
    display: block;
    font-size: 12px;
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
    font-size: 12px;
    white-space: nowrap;
    text-overflow: ellipsis;
}

.x-button {
    position: relative;
    cursor: pointer;
    width: 15px;
    height: 15px;
}

.x-button:after {
    position: absolute;
    top: 0;
    left: 0;
    content: "\2573";
    color: black;
    text-align: center;
}

.product-option {
	pont-weight:700px;
    color: #6e6e6e;
    font-size: 12px;
}
.dilivary-status {
	font-weight:700;
    color: #6e6e6e;
    font-size: 15px;
}

.option-value {
    display: flex;
    font-size: 12px;
    justify-content: space-between;
    align-items: flex-end;
}

/* .item-amount-wrap {
    display: flex;
    margin-top: 6px;
    justify-content: space-between;
} */

.item-amount {
    display: flex;
    width: 74px;
    height: 24px;
    border: 1px solid #f3f3f3;
    border-radius: 4px;
    align-items: center;
}

.amount-minus {
    width: 24px;
    height: 100%;
    padding: 3px;
    background-color: #f3f3f3;
    font-size: 14px;
    font-weight: 600;
}

.product-amount {
    width: 50%;
    text-align: center;
    border: 0;
    border-radius: 0;
    vertical-align: middle;
    outline: 0;
}

.amount-plus {
    width: 24px;
    height: 100%;
    padding: 3px;
    background-color: #f3f3f3;
    font-size: 14px;
    font-weight: 600;
}

.order-payment {
    padding: 30px 0;
}

.order-title-wrap {
    position: relative;
    margin: 0 15px;
    padding-bottom: 20px;
}

.order-title {
    font-weight: 600;
    font-size: 16px;
    text-align: left;
}

.order-title-count {
    padding-left: 2px;
    font-weight: 500;
    font-size: 16px;
    color: #777;
}

.order-line {
    height: 1px;
    background-color: #f5f5f5;
    margin: 0 15px;
}

.order-cart-payment {
    display: flex;
    padding: 20px 15px;
    justify-content: space-between;
    align-items: center;
}

.total-span {
    font-size: 16px;
    font-weight: 600;
}

.total-price {
    font-size: 18px;
    font-weight: 600;
}

.nocamp{
    display: flex;
    height: 300px;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    }
    
.campListBtn {
    margin: 10px;
    padding: 6px 30px 5px 30px;
    color: #0078ff;
    border: 1px solid #0078ff;
    border-radius: 5px;
}


/* footer */
footer {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    max-width: 768px;
    margin: 0 auto;
    width: 100%;
    padding: 12px 7px;

}

.footer-wrapper {
    display: flex;
    justify-content: center;
}

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
}

.footer-span1 {
    opacity: 0.7;
    color: #fff;
    font-weight: 400;
    font-size: 16px;
    line-height: 1.5;
}

.footer-span1:after {
    display: inline-block;
    width: 1px;
    height: 14px;
    margin: -2px 12px 0;
    background-color: #fff;
    opacity: 0.4;
    vertical-align: middle;
    content: '';
}

.footer-span2 {
    font-weight: 400;
    font-size: 16px;
    line-height: 1.5;
    cursor: pointer;
}
    .product-box {
        margin: 10px;
        box-shadow: 0px 1px 2px 0px rgb(0 0 0 / 25%);
    }

/* 메뉴 */
.list-menu{
	padding-top:20px;
	padding-bottom:20px;
}
.menu-tbl{
	table-layout: fixed;
	width:100%;
	text-align:center;
	font-size:19px;
}
.bold{
	font-weight: bold;
}
.line{
 	height: 2px;
    background-color: #f1f1f1;
}
.chkcolor{
color: #0078ff;
}
    </style>
<body>
    <div class="body-wrapper">
        <div id="header-block">
            <header>
                <div class="header-wrapper">
                    <div class="back-layout">
                        <a href="/member/myPageView" class="go-back">
                            <img src="/resources/images/back_arrow.png">
                        </a>
                    </div>
                    <h2>취소/환불 주문내역</h2>
                    <div class="home-layout">
                        <button class="go-home" onclick="location.href='/';">
                            <img src="/resources/images/home.png">
                        </button>
                    </div>
                </div>
            </header>
        </div>
        <div class="cm-line"></div>
        <section>
                <div class="list-menu">
				<table class="menu-tbl">
					<tr>
						<td>
						<c:if test="${dirivaryStatus eq '전체' }">
							<ul onclick="location.href='/order/complete/Cancle/list'">
								<li class="bold chkcolor" >${count3 }</li>
								<li class="chkcolor">전체</li>
							</ul>
						</c:if>
						<c:if test="${dirivaryStatus ne '전체' }">
							<ul onclick="location.href='/order/complete/Cancle/list'">
								<li class="bold" >${count3 }</li>
								<li>전체</li>
							</ul>
						</c:if>
						</td>
						<td>
						<c:if test="${dirivaryStatus eq '구매취소' }">
							<ul onclick="cngDel('구매취소')">
							<!-- <li class="bold" id="count5"></li> -->
							<li class="bold chkcolor">${count1 }</li> 
								<%-- <li class="bold">${count5 }</li> --%>
								<li class="chkcolor">구매취소</li>
							</ul>
						</c:if>
						<c:if test="${dirivaryStatus ne '구매취소' }">
							<ul onclick="cngDel('구매취소')">
							<!-- <li class="bold" id="count5"></li> -->
							<li class="bold">${count1 }</li> 
								<%-- <li class="bold">${count5 }</li> --%>
								<li>구매취소</li>
							</ul>
						</c:if>
						</td>
						<td>
						<c:if test="${dirivaryStatus eq '환불완료' }">
							<ul onclick="cngDel('환불완료')">
							<!-- <li class="bold" id="count5"></li> -->
							<li class="bold chkcolor">${count2 }</li> 
								<%-- <li class="bold">${count5 }</li> --%>
								<li class="chkcolor">환불완료</li>
							</ul>
						</c:if>
						<c:if test="${dirivaryStatus ne '환불완료' }">
							<ul onclick="cngDel('환불완료')">
							<!-- <li class="bold" id="count5"></li> -->
							<li class="bold">${count2 }</li> 
								<%-- <li class="bold">${count5 }</li> --%>
								<li>환불완료</li>
							</ul>
						</c:if>
						</td>
					</tr>
				</table>
			</div>
			<div class="line"></div>
           <c:forEach items="${oList}" var="order" varStatus="i">
           <c:if test="${order.dirivaryStatus eq '구매취소' or order.dirivaryStatus eq '환불완료' }">
						 <c:forEach items="${opList}" var="orderPay" varStatus="op">
						 <c:if test="${order.orderNo eq orderPay.orderNo }">
              <div class="product-box" >
                   
                 
                    <div class="order-thumbnail">
                        <div class="thumbnail-box">
                            <a href="#" class="thumbnail-link"  onclick="location.href='/order/complete/datail.kh?orderNo=${order.orderNo}'">
                                <img class="thumbnail-image" style="width:100%; height: 100%;" src="${order.orderMainFileRename}">
                            </a>
                        </div>
                    </div>
                    <div class="product-info">
                        <div class="product">
                            <div class="brand-info">
		                         <div class="item-amount-wrap">
		                            <div class="item-amountc">
		                                <span class="dilivary-status">${order.dirivaryStatus}</span>
		                           
		                            </div>
		                       	 </div>
                                <div class="a-wrap">
                                            <span class="brand-name">주문번호 : No.${order.orderNo }</span>
                                    <span class="product-name">${order.orderMainProductName }</span>
                                </div>
                            </div>
                            <span class="brand-name"><b>주문일 : <fmt:parseDate value="${order.orderDate }" var="stringday" pattern="yyyy-MM-dd HH:mm:ss" /> 
											<fmt:formatDate value="${stringday}" pattern="YY.MM.dd (E)" /></b></span>
                        </div>
							<span class="product-name">
							 <c:if test="${order.dirivaryStatus eq '입금확인'}">
											<td colspan="3">
											<!-- <span><button  style='float: right' class="btn btn-secondary btn-sm" >배송조회</button></span> -->
											<span><button  style='float: right' class="btn btn-secondary btn-sm" onclick="cancleOrder(this)">구매취소</button>
											<input type="hidden" id="orderNo" value="${order.orderNo }"/>
											</span>
											</td>
											</c:if>
											<c:if test="${order.dirivaryStatus eq '배송중'}">
											<td colspan="3">
											<span><button  style='float: right' class="btn btn-secondary btn-sm" onclick="diliveryDtail(${order.orderNo})">배송조회</button></span>
											<!-- <span><a href="https://tracker.delivery/#/:carrier_id/:track_id" target="_blank">배송조회</a></span> -->
											</td>
											</c:if>
											<c:if test="${order.dirivaryStatus eq '배송완료'}">
											<td colspan="3">
											<span><button  style='float: right' class="btn btn-secondary btn-sm" onclick="diliveryDtail(${order.orderNo})">배송조회</button></span>
											<span><button  style='float: right' class="btn btn-secondary btn-sm" onclick="getPoint(this)">구매확정</button>
												<input type="hidden" id="orderNo" value="${order.orderNo }"/>
											</span>
											<!-- <span><a href="https://tracker.delivery/#/:carrier_id/:track_id" target="_blank">배송조회</a></span>
											<a href="https://tracker.delivery/#/kr.epost/1111111111111" target="_blank">배송조회</a> -->
											</td>
											</c:if>
											<c:if test="${order.dirivaryStatus eq '구매확정'}">
											<td colspan="3">
											<span><button  style='float: right' class="btn btn-secondary btn-sm" onclick="diliveryDtail(${order.orderNo})">배송조회</button></span>
											<span><button  style='float: right' class="btn btn-secondary btn-sm" >후기작성</button></span>
											</td>
											</c:if>
							
							</span>
                        <div class="option-value">
                            <span><fmt:formatNumber value="${orderPay.payPrice }" pattern="#,###,###"/>원</span>
                        </div>
                        
                    </div>
                </div>
                </c:if>
            </c:forEach>
            </c:if>
            </c:forEach>
            <c:if test="${empty oList}">
               <div class="product-box nocamp">
                    <h3>주문 내역이 없습니다.</h3>
                    <p style="color: gray; margin-bottom: 0;">멋진 캠핑용품을 쇼핑해보세요</p>
                    <a href="/product/newArrivalList" class="campListBtn">쇼핑하러가기</a>    
                    
                </div>
            </c:if>

            
        </section>

      
    </div>


<script type="text/javascript">
function diliveryDtail(orderNo){
	location.href="/order/delliveryDtail?orderNo="+orderNo+""
	
}


function cngDel(msg){
	location.href="/order/cancle/delliveryMenu?dirivaryStatus="+msg+""
	dilivaryCount();
} 

/* function getPoint(obj){
	var orderNo=$(obj).parent().children("#orderNo").val();	

	$.ajax({
		url:"/order/GETPoint",
		type:"post",
		data:{"orderNo":orderNo},
		success:function(data){
			alert ("구매가 확정되었습
					니다.");
			location.replace("/order/complete/list.kh");
			
		},
		error:function(){
			alert("ajax 통신 오류! 관리자에게 문의해 주세요!");
		}
	})
	
	
}

function cancleOrder(obj){
	var orderNo=$(obj).parent().children("#orderNo").val();	
	$.ajax({
		url:"/order/cancleOrder",
		type:"post",
		data:{"orderNo":orderNo},
		success:function(data){
			alert ("구매가 취소되었습니다");
			location.replace("/order/complete/list.kh");
			
		}
	})
} */
</script>
</script>
</body>
</html>