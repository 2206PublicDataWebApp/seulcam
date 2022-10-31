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
				<c:if test="${order.cancleStatus eq'Y' }">
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
						<td><button  class="btn btn-secondary btn-sm">환불하기</button></td>
						</c:if>
						<c:if test="${order.refundStatus eq 'Y' }">
						<td>환불완료</td>
						</c:if>
						
					</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>




</body>
</html>