<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no">
			<title>캠핑장 예약확인</title>
			<link rel="stylesheet" href="/resources/css/camp/switch.css">
			<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
			<link rel="stylesheet" href="/resources/css/fonts.css">
			<!-- <link rel="stylesheet" href="/resources/css/memberCommon.css"> -->
			<link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
			<link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
			<!-- jQuery -->
			<script src="../../../resources/js/jquery-3.6.1.min.js"></script>
		</head>
		<style>
			ul {
				padding-left: 0;
			}

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

			.body-wrapper {
				max-width: 768px;
				margin: 0 auto;
				background-color: white;
				min-height: 100vh;

			}

			/* 컨텐츠css */
			.detailMain {
				padding-top: 70px;
			}

			.infoTitle {
				font-weight: bold;
				color: black;
				width: 100px;
				padding: 5px;
			}

			.site_img {
				padding: 5px;
				height: 100px;
				width: 100px;
				/* border: 1px solid black; */
			}

			.input_info {
				padding: 20px;
			}

			.input_info div {
				margin-bottom: 5px;
			}

			/* 카운트버튼 */
			.count-wrap {
				position: relative;
				padding: 0 38px;
				border: 1px solid #ddd;
				overflow: hidden;
				width: 120px;
				float: right;
				display: block;
			}

			.count-wrap>button {
				border: 0;
				background: #fff;
				color: #000;
				width: 38px;
				height: 38px;
				position: absolute;
				top: 0;
				font-size: 12px;
			}

			.count-wrap>button.minus {
				left: 0;
			}

			.count-wrap>button.plus {
				right: 0;
			}

			.count-wrap .inp {
				border: 0;
				height: 38px;
				text-align: center;
				display: block;
				width: 100%;
			}

			.peopleInfo {
				margin: auto;
				padding: auto;
				color: gray;
				font-size: 14px;
				font-weight: bold;
			}

			.btn-dark {
				height: 31px;
				width: 68px;
			}

			.pointInput {
				height: 30px;

			}

			.nowPoint {
				color: blue;
			}

			.bookBtn {

				/* position: fixed; */
				bottom: 0;
				width: 50%;
				height: 37px;
			}

			.btn_foot {
				position: fixed;
				display: flex;
				float: left;
				bottom: 0;
				left: 50%;
				z-index: 11;
				background: #fff;
				height: 40px;
				width: 100%;
				max-width: 768px;
				transform: translateX(-50%);
			}

			.comMessege {
				height: 60px;
				display: flex;
				justify-content: center;
				align-items: center;
			}

			/* 버튼 */
			.bookBtn {
				display: flex;
				align-items: center;
				justify-content: center;
				/* position: fixed; */
				border-radius: 4px;
				font-weight: 400;
				font-size: 16px;
				margin: 1px;
				bottom: 0;
				width: 50%;
				height: 50px;
				background-color: #0078ff;
				color: white;
			}

			.btn_foot a {
				text-decoration: none;
				color: white;

			}

			.btn_foot {
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
						<div class="comMessege">
							<h6 style="margin: 0;"><b style="color: green;">캠핑장 예약이 완료</b> 되었습니다.</h6>
						</div>
						<hr>
						<div class="site_info">
							<div class='text-right tt' stlyle='padding-bottom: 0.75rem; color: black;'>
								<b>예약상품정보</b>
								<p style="margin: 0; font-size: 12px; color: gray;">예약번호 : No.${campBooking.bookingNo}
								</p>
							</div>
							<h4 style="padding-top: 5px;">${campSite.campName}</h4>
							<div class="row" style="padding: 15px;">
								<div class="site_img col-3">
									<img class='simg' style='width: 100%; height: 100%; object-fit: cover;'
										src='/resources/ruploadFiles/${campSite.siteThumbnailRename}' alt=''>
								</div>
								<div class="col-9">
									<h5 style="padding-top: 5px;">${campSite.siteName}</h5>
									<h7 style="padding-top: 5px;">${campSite.siteIntro}</h7>
								</div>
							</div>
							<table>
								<tr>
									<td class="infoTitle">숙박기간</td>
									<td>${campBooking.firstDay} ~ ${campBooking.lastDay}
										<b>(${campBooking.totalDay}박)</b></td>
									<input type="hidden" name="firstDay" id="firstDay" value="${firstDay}">
									<input type="hidden" name="lastDay" id="lastDay" value="${lastDay}">
								</tr>
								<tr>
									<td class="infoTitle">기준인원</td>
									<td>기준인원 ${campSite.standardPeople}명 / 최대인원 ${campSite.maxPeople}명</td>
								</tr>
								<tr>
									<td class="infoTitle">체크인아웃</td>
									<td>입실 ${campSite.inTime}시 / 퇴실 ${campSite.outTime}시</td>
								</tr>
							</table>
							<hr>
						</div>
						<div class="booking_info">
							<h5><b>예약자 정보</b></h5>
							<div class="input_info row">
								<div class="col-4">
									<p class="peopleInfo">이름</p>
								</div>
								<div class="col-8 text-end" style="text-align: left;">
									<h7 style="margin: auto; padding-right: 15px;">${campBooking.bookName}</h7>
								</div>
								<div class="col-4">
									<p class="peopleInfo">휴대폰 번호</p>
								</div>
								<div class="col-8 text-end" style="text-align: left;">
									<h7 style="margin: auto; padding-right: 15px;">${campBooking.bookPhone}</h7>
								</div>
								<div class="col-4">
									<p class="peopleInfo">인원정보</p>
								</div>
								<div class="col-8 text-end" style="text-align: left;">
									<h7 style="margin: auto; padding-right: 15px;">${campBooking.bookPeople}명</h7>
								</div>
							</div>
							<h5><b>요청사항</b></h5>
							<div class="input_info row" style="padding-bottom: 0;">
								<p>${campBooking.bookRequest}</p>
							</div>
							<hr>

							<h5><b>결제 상세</b></h5>
							<div class="input_info row">
								<div class="col-4">
									<p class="peopleInfo">숙박요금</p>
								</div>
								<div class="col-8 text-end" style="text-align: left;">
									<h7 style="margin: auto; padding-right: 15px;" class="totalSitePrice"></h7>
									<p style="margin: auto; padding-right: 15px; font-size: 12px">
										${campBooking.totalDay}박 x <span class="sitePrice"></span></p>
								</div>
								<div class="col-4">
									<p class="peopleInfo">인원추가요금</p>
								</div>
								<div class="col-8 text-end" style="text-align: left;">
									<h7 style="margin: auto; padding-right: 15px;"><span class="peopleMoney"></span>
									</h7>
								</div>
								<div class="col-4">
									<p class="peopleInfo">포인트할인</p>
								</div>
								<div class="col-8 text-end" style="text-align: left;">
									<h7 style="margin: auto; padding-right: 15px;">-<span id="bookUsePoint">0</span>
									</h7>
								</div>
								<div class="col-4">
									<p class="peopleInfo">포인트적립</p>
								</div>
								<div class="col-8 text-end" style="text-align: left;">
									<h7 style="margin: auto; padding-right: 15px;" id="bookGetPoint"></h7>
									<p style="margin: auto; padding-right: 15px; font-size: 12px;">결제금액 3% 적립</p>
								</div>
								<hr>
								<div class="col-4">
									<p class="peopleInfo" style="color: black;">결제금액</p>
								</div>
								<div class="col-8 text-end" style="text-align: left;">
									<h7 style="margin: auto; padding-right: 15px;"><b class="totalPrice"></b></h7>
								</div>
							</div>
						</div>

					</div>
					<br><br>

					<div class="btn_foot">
						<a href="/campBooking/campBookingList.kh" class="bookBtn">예약내역보기</a>
						<a href="/camp/campList.kh" class="bookBtn">캠핑장 구경하러 가기</a>
					</div>

				</div>
			</div>
			<script>
				var sitePrice = ${ campSite.sitePrice };
				var totalSitePrice = ${ campBooking.bookIniPrice };
				var extraTotal = ${ campBooking.bookExtra };
				var bookUsePoint = ${ campBooking.bookUsePoint };
				var bookGetPoint = ${ campBooking.bookGetPoint };
				var totalPrice = ${ campBooking.bookTotalPrice };

				$(".sitePrice").html(sitePrice.toLocaleString('ko-KR') + "원");
				$(".totalSitePrice").html(totalSitePrice.toLocaleString('ko-KR') + "원");
				$(".peopleMoney").html(extraTotal.toLocaleString('ko-KR') + "원");
				$("#bookUsePoint").html(bookUsePoint.toLocaleString('ko-KR') + "원");
				$("#bookGetPoint").html(bookGetPoint.toLocaleString('ko-KR') + "원");
				$(".totalPrice").html(totalPrice.toLocaleString('ko-KR') + "원");
			</script>
		</body>

		</html>