<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 user-scalable=no">
<title>캠핑장 예약</title>
<link rel="stylesheet" href="/resources/css/camp/switch.css">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/fonts.css">
<!-- <link rel="stylesheet" href="/resources/css/memberCommon.css"> -->
<link rel="shortcut icon" href="/resources/images/faviconlogo.ico"
	type="image/x-icon">
<link rel="icon" href="/resources/images/faviconlogo.ico"
	type="image/x-icon">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- jQuery -->
<script src="../../../resources/js/jquery-3.6.1.min.js"></script>
</head>
<style>

body {
	font-size: 14px;
	color: #000;
	background-color: #f1f1f1;
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

.header-wrapper {
	display: flex;
	align-items: center;
	justify-content: center;
	max-width: 385px;
	margin: 0 auto;
	height: 50px;
	position: relative;
}

.body-wrapper {
	max-width: 600px;
	margin: 0 auto;
	background-color: white;
	min-height: 100vh;
	/* 컨텐츠css */
	
}
.detailMain {
	padding-top: 70px;
    }
.infoTitle {
	font-weight: bold;
	color: green;
	width: 100px;
	padding: 5px;
}
.site_img {
	padding: 5px;
	height: 80px;
	width: 80px;
	border: 1px solid black;
}
.input_info {
	padding: 20px;
}
.input_info div{
	margin-bottom: 5px;
}

</style>
<body>
<!-- 헤더&메뉴바 -->
	<header>
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	</header>

	<!-- 컨텐츠 -->
	<div class="body-wrapper">
		<div class="container">
		<div class="detailMain">
			<div class="site_info">
				<div class='text-right tt' stlyle='padding-bottom: 0.75rem; color: black;'><small class='text-muted'>예약상품정보</small></div>
				<h4 style="padding-top: 5px;">(주)디노담양힐링파크 지점</h4>
				<div class="row" style="padding: 20px;">
					<div class="site_img col-3">

					</div>
					<div class="col-9">
						<h5 style="padding-top: 5px;">멋장이</h5>
						<h7 style="padding-top: 5px;">산속맑은공기 좋아여</h7>
					</div>
				</div>
					<table>
						<tr>
							<td class="infoTitle">숙박기간</td>
							<td>2022-10-18 ~ 2022-10-20</td>
						</tr>
						<tr>
							<td class="infoTitle">기준인원</td>
							<td>기준인원 2명 / 최대인원 6명</td>
						</tr><tr>
							<td class="infoTitle">체크인아웃</td>
							<td>입실 14시 / 퇴실 12시</td>
						</tr>
						<tr>
							<td class="infoTitle">기준인원</td>
							<td>기준인원 2명 / 최대인원 6명</td>
						</tr>
					</table>
					<div style="text-align: right;">
						<h5 style="padding-right: 20px;">1박 <b>45,000원</b></h5>

					</div>
				<hr>
			</div>
			<div class="booking_info">
				<h5><b>예약자 정보</b></h5>
				<div class="input_info row" style="padding: 20px;">
					<div class="col-4">
						<h6 style="margin: auto; padding: auto;">이름 <span style="color: red;">(필수)</span></h6>
					</div>
					<div class="col-8">
						<input type="text" class="form-control">
					</div>
					<div class="col-4">
						<h6 style="margin: auto; padding: auto;">연락처 <span style="color: red;">(필수)</span></h6>
					</div>
					<div class="col-8">
						<input type="text" class="form-control">
					</div>
					<div class="col-4">
						<h6 style="margin: auto; padding: auto;">요청사항</h6>
					</div>
					<div class="col-8">
						<textarea class="form-control" name="" id="" cols="30" rows="3"></textarea>
					</div>
				</div>
				<div class="input_people">
					<h5><b>전체 인원 정보</b></h5>
					
				</div>

			</div>

		</div>
	</div>
	</div>

</body>
</html>