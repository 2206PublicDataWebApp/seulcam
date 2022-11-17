<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no">
			<title>캠핑장 사이트 정보</title>
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
				max-width: 385px;
				margin: 0 auto;
				height: 50px;
				position: relative;
			}

			.body-wrapper {
				max-width: 770px;
				margin: 0 auto;
				background-color: white;
				min-height: 100vh;
			}

			/* 컨텐츠css */
			.detailMain {
				padding-top: 70px;
			}

			.info_area {
				padding: 10px;
			}

			.infoTitle {
				font-weight: bold;
				color: green;
				width: 100px;
				padding: 5px;
			}

			.itModal {
				color: darkslategray;
			}

			.container {
				/* padding: 20px; */

			}

			.calendar_area {
				padding: 10px;
			}

			.intro_area {
				padding: 10px;
			}

			.intro {
				margin: auto;
				padding: 10px;
				border: 1px solid #ccc;
				height: 114px;
				overflow: hidden;
				animation: 5s delay-overflow;
			}

			.moreIntro {
				margin-top: 10px;
				border-radius: 5px;
				border: 1px solid #343a40;
				text-align: center;
				padding: 7px;
				font-size: 16px;
				cursor: pointer;
			}

			.moreIntro:hover {
				background-color: #343a40;
				color: #ccc;
			}

			.no_overflow {
				overflow: auto;
				height: auto;
				/* persist overflow value from animation */
				animation: 7s delay-overflow;
			}

			@ keyframes delay-overflow {
				from {
					overflow: auto;

				}

			}

			div {
				word-break: break-all;
			}

			.siteInfo {
				position: relative;
				margin: auto;
				margin-bottom: 8px;
				margin-left: 3px;
				margin-right: 3px;
				box-shadow: 0px 1px 2px 0px rgb(0 0 0/ 25%);
				background-color: #fff;
				cursor: pointer;
			}

			.siteList_area {
				/* background-color: #F5F5F5; */
				display: block;
			}

			.siteList {
				display: block;
				overflow: hidden;
			}

			.siteImg {
				width: 120px;
				height: 122px;
			}

			.registY {
				position: absolute;
				bottom: 4px;
				left: 6px;
				font-size: 10px;
				padding: 2px 8px;
				border-radius: 10px;
				background-color: #F6B67B;
				z-index: 3;
				color: #fff;
			}

			.registN {
				position: absolute;
				bottom: 4px;
				left: 6px;
				font-size: 10px;
				padding: 2px 8px;
				border-radius: 10px;
				background-color: #E86F52;
				z-index: 3;
				color: #fff;
			}

			*,
			::after,
			::before {
				box-sizing: border-box;
			}

			/* div {
    display: block;
} */
			.siteImg>div {
				width: 120px;
				height: 100%;
				object-fit: cover;
			}

			.d-flex {
				display: flex !important;
			}

			.siteIntro {
				position: relative;
				width: 180%;
				padding: 8px;
			}

			.siteRegist {
				width: 100%;
				padding: 8px;
			}

			.siteIntro-header {
				width: 100%;
				display: flex;
				flex-direction: column;
			}

			.site-disabled {
				pointer-events: none;
			}

			.site-disabled:before {
				content: '';
				position: absolute;
				width: 100%;
				height: 100%;
				background-color: rgba(255, 255, 255, 0.75);
				z-index: 2;
			}

			/* section calendar */
			.sec_cal {
				width: 360px;
				margin: 0 auto;
				font-family: "NotoSansR";
			}
			@media screen and (max-width: 576px){
			.sec_cal{
					max-width: 330px;
					margin: 1.75rem auto;
				}}

			.sec_cal .cal_nav {
				display: flex;
				justify-content: center;
				align-items: center;
				font-weight: 700;
				font-size: 24px;
				line-height: 78px;
			}

			.sec_cal .cal_nav .year-month {
				width: 300px;
				text-align: center;
				line-height: 1;
			}

			.sec_cal .cal_nav .nav {
				display: flex;
				border: 1px solid #333333;
				border-radius: 5px;
			}

			.sec_cal .cal_nav .go-prev,
			.sec_cal .cal_nav .go-next {
				display: block;
				width: 50px;
				height: 35px;
				font-size: 0;
				display: flex;
				justify-content: center;
				align-items: center;
			}

			.sec_cal .cal_nav .go-prev::before,
			.sec_cal .cal_nav .go-next::before {
				content: "";
				display: block;
				width: 20px;
				height: 20px;
				border: 3px solid #000;
				border-width: 3px 3px 0 0;
				transition: border 0.1s;
			}

			.sec_cal .cal_nav .go-prev:hover::before,
			.sec_cal .cal_nav .go-next:hover::before {
				border-color: #ed2a61;
			}

			.sec_cal .cal_nav .go-prev::before {
				transform: rotate(-135deg);
			}

			.sec_cal .cal_nav .go-next::before {
				transform: rotate(45deg);
			}

			.sec_cal .cal_wrap {
				padding-top: 20px;
				position: relative;
				margin: 0 auto;
			}

			.sec_cal .cal_wrap .days {
				display: flex;
				margin-bottom: 20px;
				padding-bottom: 20px;
				border-bottom: 1px solid #ddd;
			}

			.sec_cal .cal_wrap::after {
				top: 368px;
			}

			.current {
				pointer-events: all;
			}

			.current:hover {
				background-color: #fdc9bc;
			}

			.sec_cal .cal_wrap .day {
				display: flex;
				align-items: center;
				justify-content: center;
				width: calc(100%/ 7);
				text-align: left;
				color: #000;
				font-size: 12px;
				text-align: center;
				border-radius: 5px
			}

			.current.today {
				font-weight: bold;
			}

			.noContact {
				background-color: rgb(242, 242, 242);
			}

			.sec_cal .cal_wrap .dates {
				display: flex;
				flex-flow: wrap;
				height: 290px;
			}

			.sec_cal .cal_wrap .day:nth-child(7n -1) {
				color: #3c6ffa;
			}

			.sec_cal .cal_wrap .day:nth-child(7n) {
				color: #ed2a61;
			}

			.sec_cal .cal_wrap .day.disable {
				color: #ddd;
			}

			.selectDate {
				background-color: #E86F52;
				/* pointer-events: none; */
				color: #fff !important;
			}

			.calSelect {
				display: flex;
				justify-content: center;
				flex-direction: column;
				width: 100%;
				height: 40px;
				background-color: #f1f1f1;
				box-shadow: 0px 1px 2px 0px rgb(0 0 0/ 25%);
				border-radius: 10px;
			}

			.calSelect div {
				float: left;
				height: 100%;
				width: 50%;
				text-align: center;
			}

			footer {
				position: relative !important;
				display: flex;
				flex-direction: column;
				align-items: center;
			}
		</style>

		<body>
			<!-- 헤더&메뉴바 -->
			<header>
				<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
			</header>

			<!-- 컨텐츠 -->
			<div class="body-wrapper">
				<div class="detailMain">
					<div class="info_area">
						<div class='text-right tt' stlyle='padding-bottom: 0.75rem;'>
							<small class='text-muted'>${camp.induty}</small>
						</div>
						<h4 style="padding-top: 5px;">${camp.facltNm}</h4>
						<table>
							<tr>
								<td class="infoTitle">대표번호</td>
								<td>${camp.tel}</td>
							</tr>
							<tr>
								<td class="infoTitle">주소</td>
								<td>${camp.addr1}</td>
							</tr>
						</table>
						<hr>
					</div>

					<div class="intro_area">
						<h4>캠핑장 소개</h4>
						<div class="intro1 intro">
							<c:if test='${camp.intro == "" || camp.intro == null }'>
								<p> 캠핑장은 굽이치는 홍천강 물줄기를 마주하고 드높은 팔봉산 자락에 위치하여 청정 자연도시 홍천에서 휴식과 여유를 찾는 건강한 가족문화를 위해
									조성되었습니다.
									드넓은 사이트와 레포츠파크 등 다양한 편의시설을 갖추고 있습니다.
									총 8천평의 부지위에 캠핑장 18개 site와 데크site 5개로 이루어져 site간의 거리를 최대화 한 결과 가족 단위로 오붓한 캠핑을 즐길 수
									있도록 하였습니다.

									캠핑장을 중심으로 백우산 등산과 용소계곡 트랙킹을 할 수 있고 캠핑장 자체 순환도로만 600미터에 달하여 휴식과 운동을 겸할 수 있습니다.

									저희 캠핑장을 방문하시는 모든 분이 만족하실 수 있도록 최선을 다하겠사오니 한번 방문하시어 좋은 추억을 만들어 가시기 바랍니다.
									이곳에서 캠핑의 재미와 낭만을 즐기시고, 가족과 즐거운 추억도 만드세요!</p>
							</c:if>
							<c:if test='${camp.intro != ""}'>${camp.intro}</c:if>
						</div>
						<div class="moreIntro1 moreIntro" onclick="moreIntro(1)">더보기</div>
						<hr>
					</div>
					<div class="intro_area">
						<h4>이용 시 주의사항</h4>
						<div class="intro2 intro">
							<p style="color: #dc3545;"><b>아래 내용을 읽지 않고 이용 시 발생하는 불이익에 대해 책임지지 않습니다. 꼭 읽어주세요.</b></p>

							<p>- 3팀이상 붙어 있지 않더라도 예약 금지, 텐트를 피칭하셨더라도 퇴실 조치 (최대 두팀까지만 허용) ※예약금이 환불 되지 않습니다 <br>

								- 예약자는 온라인으로만 예약이 가능하며, 사이트별 지정 예약제입니다<br>

								- 밤 9시이후로는 차량이동이 절대 불가, 입실 또한 불가 (위급사항시 관리동에 문의 바랍니다)<br>

								- 입실하지 못하신 분들은 자동 취소 될 수 있으며 익일 9시부터 입실 가능<br>

								- 샤워장 : 오전 9시부터 21시까지 이용가능<br>
								- 개수대에서 세면 및 양치 금지(화장실이용)<br>
								- 코로나 19로인해 샤워장 인원이 제한, 4인이상 사용금지, 직계가족은 함께 사용 가능<br><br>

								- 트렘폴린,수영장 : 오전 10시부터 오후 6시까지 이용가능(영유아 관찰요망, 트램폴린 한번에 4인이상 이용 불가)<br>
								- 모든 부대시설이용은 무료
								- 시설이용시 안전사고에 관련하여 보호자가 관리해주셔야 합니다<br>
								-사용자의 부주의로 인해 발생한 사로는 캠핑장에서 책임지지 않습니다<br><br>

								- 일반쓰레기는 봉투에 담아 배출하여 주시고 재활용쓰레기는 분리수거해주셔야합니다<br><br>

								- 음식물 쓰레기는 세척실안 음식물통에 버려주세요<br><br>

								- 사이트당 사용량은 600w입니다<br>
								- 사용불가한 전자제품 : 전기밥솥, 에어컨, 냉장고, 전기난로, 전기온풍기, 라디에이터 등 과전력소모기<br>
								- 12월, 1월,2월 장박 캠퍼분들은 입실시 사전에 연락주셔야하며 퇴실시 전기 차단<br><br>

								- 매너타임 저녁 10시 30분부터 익일 오전 7시까지 매너 타임입니다. 차량시동도 꺼주셔야합니다<br><br>

								- 2회불응시 퇴소 조치 되며 텐트나 물품은 다음날 철수 하셔야합니다<br><br>

								- 고성방가, 음주, 주변텐트와의 트러블로 인한 불편 접수 시 즉시 퇴소 조치 되실 수 있습니다<br><br>

								- 애견동반은 소형견만 가능. 기본에티켓과 목줄 필참<br><br>

								- 코로나 19로 인해 사이트를 벗어 나시면 마스크를 착용하여 주시고 공용사용 공간에선 꼭!! 마스크를 착용하여 주셔야합니다</p>
						</div>
						<div class="moreIntro2 moreIntro" onclick="moreIntro(2)">더보기</div>
						<hr>
					</div>
					<div class="calendar_area">
						<h4>예약 일자 선택</h4>
						<div class="calSelect">
							<a data-bs-toggle='modal' data-bs-target='#calModal'>
								<div>
									<i class="bi bi-calendar-check"></i><span class="stDate"></span>
								</div>
								<div>
									<i class="bi bi-calendar-check"></i><span class="edDate"></span>
								</div>
							</a>
						</div>
						<hr>
						<h4>예약 가능 사이트</h4>
					</div>
					<div class="siteList_area">
						<div class="siteList"></div>

						<hr>
					</div>
					<!-- data-bs-toggle='modal' data-bs-target='calModal' -->
					<!-- Modal cal -->
					<div class="modal fade" id="calModal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="ModalLabel">예약날짜</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="calSelect">
										<a>
											<div>
												<i class="bi bi-calendar-check"></i><span class="stDate">
													22년 10월 31일</span>
											</div>
											<div>
												<i class="bi bi-calendar-check"></i><span class="edDate">
													22년 10월 31일</span>
											</div>
										</a>
									</div>
									<hr>
									<div class="sec_cal">
										<div class="cal_nav">
											<a href="javascript:;" class="nav-btn go-prev">prev</a>
											<div class="year-month"></div>
											<a href="javascript:;" class="nav-btn go-next">next</a>
										</div>
										<div class="cal_wrap">
											<div class="days">
												<div class="day">MON</div>
												<div class="day">TUE</div>
												<div class="day">WED</div>
												<div class="day">THU</div>
												<div class="day">FRI</div>
												<div class="day">SAT</div>
												<div class="day">SUN</div>
											</div>
											<div class="dates"></div>
										</div>
									</div>

								</div>
								<div class="modal-footer" style="padding: 10px;">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">선택</button>
								</div>
							</div>
						</div>
					</div>


					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="exampleModalLabel">Modal
										title</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="siteImg-area" style="width: 80%; height: 200px; margin-bottom: 10px;"
										align="center"></div>
									<div class="siteInfoDetail"></div>

								</div>
								<div class="modal-footer" style="padding: 10px;">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
				crossorigin="anonymous"></script>
			<script type="text/javascript">
				// const myModal = document.getElementById('myModal')
				// const myInput = document.getElementById('myInput')

				// myModal.addEventListener('shown.bs.modal', () => {
				// myInput.focus()
				// })
				var moreNum = 0;
				var contentId = ${ camp.contentId };
				function moreIntro(num) {
					if (moreNum == 0) {
						$(".intro" + num + "").css({ height: 'auto', overflow: 'auto' });
						// $(".intro").addClass("no_overflow")
						$(".moreIntro" + num + "").html("줄이기");
						moreNum = 1;
					} else {
						$(".intro" + num + "").css({ height: '114px', overflow: 'hidden' });
						$(".moreIntro" + num + "").html("더보기");
						moreNum = 0;
					}
				}
				function siteLoad() {
					$.ajax({
						url: "/camp/campSiteListView.kh",
						type: "get",
						data: {
							"contentId": contentId,
							"firstDayJs": firstDay,
							"lastDayJs": lastDay
						},
						success: function (data) {
							var str = "";
							for (var i = 0; i < data.length; i++) {
								if (data[i].siteCount < 1) {
									str += "<div class='siteInfo row site-disabled'>"
								} else {
									str += "<div class='siteInfo row'>"
								}
								str += "<div class='col-4' style='padding-left: 0;' data-bs-toggle='modal' data-bs-target='#exampleModal' onclick='modal(" + data[i].siteNo + ")'>"
								str += "<img class='simg' style='width: 100%; height: 162px; object-fit: cover;' src='/resources/ruploadFiles/" + data[i].siteThumbnailRename + "' alt=''>"
								if (data[i].siteCount < 1) {
									str += "<span class='registN'>예약불가</span></img></div>"
								} else {
									str += "<span class='registY'>예약가능</span></img></div>"
								}
								str += "<div class='col-8' style='padding-left: 0;' ><div class='row' style='padding: 0px; padding-top : 5px' data-bs-toggle='modal' data-bs-target='#exampleModal' onclick='modal(" + data[i].siteNo + ")'>"
								str += "<h5>" + data[i].siteName + "</h5></div><div class='row' style='padding-right: 0;' ><div class='col-8' style='padding-right: 0;' data-bs-toggle='modal' data-bs-target='#exampleModal' onclick='modal(" + data[i].siteNo + ")'>"
								str += "<p style='color: #767676;'>" + data[i].siteChar + "</p><p style='color: #767676;'>기준인원 " + data[i].standardPeople + "명 / 최대인원 " + data[i].maxPeople + "명</p></div>"
								str += "<div class='col-4' style='display: flex; flex-direction: column-reverse; padding-right: 0;'>"
								str += "<a onclick='moveBooking(" + data[i].siteNo + ")' style='margin: 5px;' class='btn btn-outline-success btn-sm'>예약</a><p style='font-size: 8pt; margin: 0; color: green;'>남은자리 " + data[i].siteCount + "개</p>"
								str += "<p style='font-size: 12pt; margin: 0;'>" + data[i].sitePrice.toLocaleString('ko-KR') + "원~</p></div></div></div></div>"
							}
							$(".siteList").html(str);

						},
						error: function (request, status, error) {
							console.log("code: " + request.status)
							console.log("message: " + request.responseText)
							console.log("error: " + error);
						}

					})
				}

				function moveBooking(siteNo) {
					var memberId = "${sessionScope.loginUser.memberId}";
					// if( memberId == ""){
					// 	alert("로그인을 해야 예약이 가능합니다.")
					// }
					location.href = "/campBooking/campBookingView.kh?siteNo=" + siteNo + "&memberId=" + memberId + "&contentId=" + contentId + "&firstDayJs=" + firstDay + "&lastDayJs=" + lastDay + ""


				}

				// $(document).ready(function() {
				// 	siteLoad();
				// })


				function modal(siteNo) {
					$.ajax({
						url: "/camp/campSiteDetailView.kh",
						type: "get",
						data: {
							"siteNo": siteNo
						},
						success: function (data) {
							$("#exampleModalLabel").html("<b>" + data.siteName + " 사이트 상세 정보</b>");
							$(".siteImg-area").html('<img class="img-thumbnail" style="width: 100%; height: 100% ;object-fit: cover;" src="/resources/ruploadFiles/' + data.siteThumbnailRename + '" alt="">')
							var str = ""
							str += "<table><tr><td class='infoTitle itModal'>특징</td><td>" + data.siteChar + "</td></tr>"
							str += "<tr><td class='infoTitle itModal'>정보</td><td>" + data.siteInfo + "</td></tr>"
							str += "<tr><td class='infoTitle itModal'>소개</td><td>" + data.siteIntro + "</td></tr>"
							str += "<tr><td class='infoTitle itModal'>사이트가격</td><td>" + data.sitePrice.toLocaleString('ko-KR') + "원~</td></tr>"
							str += "<tr><td class='infoTitle itModal'>사이트갯수</td><td>" + data.siteCount + "개</td></tr>"
							str += "<tr><td class='infoTitle itModal'>인원정보</td><td>기준인원 " + data.standardPeople + "명 / 최대인원 " + data.maxPeople + "명</td></tr>"
							str += "<tr><td class='infoTitle itModal'>추가인원가격</td><td>1인당 " + data.excessCharge.toLocaleString('ko-KR') + "원</td></tr>"
							str += "<tr><td class='infoTitle itModal'>입/퇴실시간</td><td>입실 " + data.inTime + "시 / 퇴실 " + data.outTime + "</td></tr></table>"
							$(".siteInfoDetail").html(str);

						},
						error: function (request, status, error) {
							console.log("code: " + request.status)
							console.log("message: " + request.responseText)
							console.log("error: " + error);
						}
					})
				}

				/*
				@@@@@달력시작@@@@@
				달력 렌더링 할 때 필요한 정보 목록 
				
				현재 월(초기값 : 현재 시간)
				금월 마지막일 날짜와 요일
				전월 마지막일 날짜와 요일
				*/
				var num = 0;
				var startDate = "";
				var endDate = "";
				var firstDay = "";
				var lastDay = "";

				//달력관련 load
				$(document).ready(function () {
					readyDate()
					num = 3;
					var dd = new Date(startDate.substring(0, 4), startDate.substring(4, 6) - 1, startDate.substring(6, 8))
					siteLoad();
					inputDate();
					calendarInit();
				});

				// 시작시 오늘날짜 표시
				function readyDate() {
					var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
					var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
					var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
					var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
					var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
					// 달력에서 표기하는 날짜 객체


					var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
					var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
					var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일
					// 렌더링을 위한 데이터 정리
					currentYear = thisMonth.getFullYear();
					currentMonth = thisMonth.getMonth();
					currentDate = thisMonth.getDate();


					sd = new Date(currentYear, currentMonth, currentDate);
					ed = new Date(currentYear, currentMonth, currentDate + 1);
					startDate = getFormatDate(sd);
					endDate = getFormatDate(ed);
					firstDay = getFormatDate2(startDate) + "";
					lastDay = getFormatDate2(endDate) + "";
				}

				//날짜 html 입력
				function inputDate() {
					var sdd = startDate + "";
					var edd = endDate + "";
					var sd = " " + sdd.substring(2, 4) + "년 " + sdd.substring(4, 6) + "월 " + sdd.substring(6, 8) + "일";
					var ed = " " + edd.substring(2, 4) + "년 " + edd.substring(4, 6) + "월 " + edd.substring(6, 8) + "일"
					$(".stDate").html(sd);
					$(".edDate").html(ed);
				}

				// 날짜 선택 변수 구현
				function clickDate(date) {
					if (num == 3) {
						$("#" + startDate + "").removeClass("selectDate");
						$("#" + endDate + "").removeClass("selectDate");
						endDate = "";
						startDate = date;
						$("#" + startDate + "").addClass("selectDate");
						num = 1;
					}
					else if (num == 0) {
						startDate = date;
						num = 1;
						$("#" + startDate + "").addClass("selectDate");
					}
					else if (num == 1) {
						endDate = date;
						if (endDate == startDate) {
							endDate = "";
							num = 1;
						}
						else if (getDateDiff(getFormatDate2(startDate), getFormatDate2(endDate)) > 7) {
							alert("최대 7박까지 예약 가능합니다.")
							endDate = "";
							num = 1;
						}
						else if (startDate > endDate && endDate != "") {
							$("#" + startDate + "").removeClass("selectDate");
							startDate = date;
							endDate = "";
							$("#" + startDate + "").addClass("selectDate");
						} else {
							endDate = date;
							num = 3;
							$("#" + endDate + "").addClass("selectDate");
						}
					}
					firstDay = getFormatDate2(startDate);
					if (endDate != "") {
						lastDay = getFormatDate2(endDate);
					}
					inputDate();
				}

				//모달창 닫혔을시 기능
				$('#calModal').on('hidden.bs.modal', function () {
					if (endDate == "") {
						var sdd = startDate + "";
						var fillDate = new Date(sdd.substring(0, 4), sdd.substring(4, 6) - 1, parseInt(sdd.substring(6, 8)) + 1)
						// console.log(dd)
						endDate = getFormatDate(fillDate);
						lastDay = getFormatDate2(endDate);
						num = 3;
						inputDate();
						calendarInit();
						siteLoad();
					}
					siteLoad();
				})
				function campBooking() {

				}

				// 날짜 포맷
				const getFormatDate = (date) => {
					var year = date.getFullYear() + "";
					var month = (1 + date.getMonth()) + "";
					if (month < 10) {
						month = '0' + month;
					} //10미만일 시 앞에 0을 붙혀서 저장
					var day = date.getDate();
					if (day < 10) {
						day = '0' + day;
					}
					return year + month + day; // YYYYMMDD 형식으로 리턴
				}
				const getFormatDate2 = (date) => {
					// var fillDate = new Date(sdd.substring(0,4),sdd.substring(4,6)-1,parseInt(sdd.substring(6,8))+1 )
					date = date + "";
					var year = date.substring(0, 4) + "";
					var month = date.substring(4, 6);
					if (month < 10) {
						month = '0' + month;
					} //10미만일 시 앞에 0을 붙혀서 저장
					var day = parseInt(date.substring(6, 8));
					if (day < 10) {
						day = '0' + day;
					}
					return year + "-" + month + "-" + day; // YYYY-MM-DD 형식으로 리턴
				}
				//날짜 비교 포멧
				const getDateDiff = (d1, d2) => {
					const date1 = new Date(d1);
					const date2 = new Date(d2);

					const diffDate = date1.getTime() - date2.getTime();

					return Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
				}

				//달력 생성
				function calendarInit() {

					// 날짜 정보 가져오기
					var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
					var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
					var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
					var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)

					var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
					// 달력에서 표기하는 날짜 객체


					var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
					var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
					var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

					// kst 기준 현재시간
					// console.log(thisMonth);

					// 캘린더 렌더링
					renderCalender(thisMonth);

					function renderCalender(thisMonth) {
						// 렌더링을 위한 데이터 정리
						currentYear = thisMonth.getFullYear();
						currentMonth = thisMonth.getMonth();
						currentDate = thisMonth.getDate();

						// 이전 달의 마지막 날 날짜와 요일 구하기
						var startDay = new Date(currentYear, currentMonth, 0);
						var prevDate = startDay.getDate();
						var prevDay = startDay.getDay();

						// 이번 달의 마지막날 날짜와 요일 구하기
						var endDay = new Date(currentYear, currentMonth + 1, 0);
						var nextDate = endDay.getDate();
						var nextDay = endDay.getDay();

						// console.log(prevDate, prevDay, nextDate, nextDay);

						// 현재 월 표기
						$('.year-month').text(currentYear + '.' + (currentMonth + 1));

						// 렌더링 html 요소 생성
						calendar = document.querySelector('.dates')
						calendar.innerHTML = '';


						// 지난달
						for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
							calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
						}
						// 이번달
						for (var i = 1; i <= nextDate; i++) {
							var kh = new Date(currentYear, currentMonth, i)
							if (thisMonth.getMonth() == today.getMonth() && i < today.getDate()) {
								calendar.innerHTML = calendar.innerHTML + '<div class="day current disable" id="' + getFormatDate(kh) + '">' + i + '</div>'
							} else if (thisMonth.getMonth() < today.getMonth() && currentYear <= today.getFullYear()) {
								calendar.innerHTML = calendar.innerHTML + '<div class="day current disable" id="' + getFormatDate(kh) + '">' + i + '</div>'
							} else {
								calendar.innerHTML = calendar.innerHTML + '<div class="day current" id="' + getFormatDate(kh) + '" onclick="clickDate(' + getFormatDate(kh) + ')"><input type="hidden" value="' + kh + '">' + i + '</div>'
							}
						}
						// 다음달
						for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
							calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
						}

						// 오늘 날짜 표기
						if (today.getMonth() == currentMonth) {
							todayDate = today.getDate();
							var currentMonthDate = document.querySelectorAll('.dates .current');
							currentMonthDate[todayDate - 1].classList.add('today');
						}

						// 선택된 날짜 표시
						if (startDate != "") {
							$("#" + startDate + "").addClass("selectDate");
						}
						if (endDate != "") {
							$("#" + endDate + "").addClass("selectDate");
						}

					}

					// 이전달로 이동
					$('.go-prev').on('click', function () {
						thisMonth = new Date(currentYear, currentMonth - 1, 1);
						renderCalender(thisMonth);
					});

					// 다음달로 이동
					$('.go-next').on('click', function () {
						thisMonth = new Date(currentYear, currentMonth + 1, 1);
						renderCalender(thisMonth);
					});
				}


			</script>



		</body>

		</html>