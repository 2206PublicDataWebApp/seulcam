<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>주문 상세 리스트</title>
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
}

header {
	position: fixed;
	left: 0px;
	right: 0px;
	top: 0px;
	height: 50px;
	background-color: rgb(255, 255, 255);
	z-index: 200;
	max-width: 600px;
	margin: 0 auto;
}

.wrap {
	max-width: 600px;
	margin: 0 auto;
	background-color: white;
	min-height: 100vh;
}

.contents {
	padding-top: 60px;
	weight:100%;
}
.title {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	height: 90px;
	font-size: 16px;
	border-bottom: solid 3px lightgray;
}
.p-img{
	width:100px;
	height:80px;
}
.contents-tbl{
	width:100%;
	padding-left:10px;
	
}
.list-menu{
	padding-top:30px;
}
.menu-tbl{
	width:100%;
	text-align:center;
	font-size:19px;
}
.bold{
	font-weight: bold;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<body>
	<div class="wrap">
		<div class="head">
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>

		<div class="contents">

			<div class="title">
				<span>주문 내역 리스트</span>
			</div>
			<div class="list-menu">
				<table class="menu-tbl">
					<tr>
						<td>
							<ul>
								<li class="bold">10</li>
								<li>전체</li>
							</ul>
						</td>
						<td>
							<ul>
								<li class="bold">10</li>
								<li>입금/결제</li>
							</ul>
						</td>
						<td>
							<ul>
								<li class="bold">10</li>
								<li>배송중</li>
							</ul>
						</td>
						<td>
							<ul>
								<li class="bold">10</li>
								<li>배송완료</li>
							</ul>
						</td>
						<td>
							<ul>
								<li class="bold">10</li>
								<li>구매확정</li>
							</ul>
						</td>
					</tr>
				</table>
			</div>

			<div class="list-contents">
				<table class="contents-tbl">
					<c:forEach items="${oList}" var="order" varStatus="i">

						 <c:forEach items="${opList}" var="orderPay" varStatus="op">
							<c:if test="${order.orderNo eq orderPay.orderNo }">
								<%-- <c:forEach items="${pList}" var="product" varStatus="p">
									<c:if test="${orderProduct.productNo eq product.productNo }">  --%>

										<tr>
											<td colspan="3" class="alert alert-secondary" >
											<span class="bold" >
											<fmt:parseDate value="${order.orderDate }" var="stringday" pattern="yyyy-MM-dd HH:mm:ss" /> 
											<fmt:formatDate value="${stringday}" pattern="YY.MM.dd (E)" />
											</span>
											<span style='float:right' onclick="location.href='/order/complete/datail.kh?orderNo=${order.orderNo}'">
											<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
											  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
											</svg>
											</span>
							
											</td>
										</tr>
										<tr>
											<td><span class="bold">${order.dirivaryStatus }</span></td>
										</tr>

										<tr>
											<td>
											<img class="p-img" alt="상품이미지" src="${order.orderMainFileRename}" >
											</td>
											<td>
											<ul><li class="bold">${order.orderMainProductName }</li>
												<li>${orderPay.payPrice }원</li>
											</ul>
											</td>
											
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
											<span><button  style='float: right' class="btn btn-secondary btn-sm" >배송조회</button></span>
											<!-- <span><a href="https://tracker.delivery/#/:carrier_id/:track_id" target="_blank">배송조회</a></span> -->
											</td>
											</c:if>
											<c:if test="${order.dirivaryStatus eq '배송완료'}">
											<td colspan="3">
											<span><button  style='float: right' class="btn btn-secondary btn-sm" >배송조회</button></span>
											<span><button  style='float: right' class="btn btn-secondary btn-sm" onclick="getPoint(this)">구매확정</button>
												<input type="hidden" id="orderNo" value="${order.orderNo }"/>
											</span>
											<!-- <span><a href="https://tracker.delivery/#/:carrier_id/:track_id" target="_blank">배송조회</a></span>
											<a href="https://tracker.delivery/#/kr.epost/1111111111111" target="_blank">배송조회</a> -->
											</td>
											</c:if>
											<c:if test="${order.dirivaryStatus eq '구매확정'}">
											<td colspan="3">
											<span><button  style='float: right' class="btn btn-secondary btn-sm" >배송조회</button></span>
											<span><button  style='float: right' class="btn btn-secondary btn-sm" >후기작성</button></span>
											</td>
											</c:if>
										</tr>
							</c:if>
						</c:forEach>
					</c:forEach>
				</table>
			</div>


		</div>
	</div>
	
	<script>
	function getPoint(obj){
		var orderNo=$(obj).parent().children("#orderNo").val();	

		$.ajax({
			url:"/order/GETPoint",
			type:"post",
			data:{"orderNo":orderNo},
			success:function(data){
				alert ("구매가 확정되었습니다.");
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
	}
	</script>
</body>
</html>