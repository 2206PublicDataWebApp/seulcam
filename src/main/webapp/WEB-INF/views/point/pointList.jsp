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
<title>포인트 내역 조회</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/fonts.css">
<link rel="shortcut icon" href="/resources/images/faviconlogo.ico"
	type="image/x-icon">
<link rel="icon" href="/resources/images/faviconlogo.ico"
	type="image/x-icon">
</head>
<style>
body {
	font-size: 14px;
	/*  color: #000; */
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
	padding-top: 50px;
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
.container{
	font-weight:bold;
	font-size:20px;
	height:50px;
	padding-top:20px;
}
</style>
<body>

	<div class="wrap">
		<div class="head">
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>
		<div class="contents">
		<div class="title">
			<span>포인트 내역 조회</span>
		</div>
		
		<div class="container text-center ">
		<div class="row">
		    <div class="col">
		     <span>현재 포인트</span>
		    </div>
		    <div class="col">
		      <span>${totalPoint.totalPoint } 원</span>
		    </div>
		  </div>
		  </div>
		
		<div>
		<div class="table-responsive">
		<table class="table">
		<thead>
		<tr>
		<th>날짜</th>
		<th>유형</th>
		<th>포인트</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${pList}" var="point" varStatus="i">
		<td>${point.pointDate }</td>
		<td>${point.pointType }</td>
		<c:if test="${point.pointType eq '포인트사용' }">
		<td style='color:red;'>-${point.point }</td>
		</c:if>
		<c:if test="${point.pointType eq '구매확정적립' }">
		<td style='color:blue;'>+${point.point }</td>
		</c:if>

		</c:forEach>
		</tbody>
		</table>
		</div>
		
		
		
		
		
		</div>
	</div>

</body>
</html>