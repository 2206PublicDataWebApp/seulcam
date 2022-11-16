<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no">
				<title>캠핑장 예약</title>
				<link rel="stylesheet" href="/resources/css/camp/switch.css">
				<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
				<link rel="stylesheet" href="/resources/css/fonts.css">
				<!-- <link rel="stylesheet" href="/resources/css/memberCommon.css"> -->
				<link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
				<link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
				<link rel="stylesheet"
					href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
				<!-- jQuery -->
				<script src="../../../resources/js/jquery-3.6.1.min.js"></script>
				<!-- 주문 -->
				<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
					charset="utf-8"></script>
				<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
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

				.btnPoint {
					margin-bottom: 0;
					display: flex;
					color: white;
					background-color: #0078ff;
					height: 30px;
					width: 68px;
					justify-content: center;
					align-items: center;
					border-radius: 4px;
				}

				.pointInput {
					height: 30px;

				}

				.nowPoint {
					color: #0078ff;
				}

				input::-webkit-outer-spin-button,
				input::-webkit-inner-spin-button {
					-webkit-appearance: none;
					margin: 0;
				}

				input:focus {
					outline: none !important;
					box-shadow: none;
				}

				.form-control:focus {
					outline: none !important;
					box-shadow: none;
					border: 1px solid #ced4da;
					;
				}

				hr {}

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

				a:hover {
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
							<div class="site_info">
								<div class='text-right tt' stlyle='padding-bottom: 0.75rem; color: black;'><b>예약상품정보</b>
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
										<td>${firstDay} ~ ${lastDay} <b>(${countDay}박)</b></td>
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
								<div style="text-align: right;">
									<h5 style="padding-right: 20px;">1박 <span class="sitePrice"></span></h5>

								</div>
								<hr>
							</div>
							<div class="booking_info">
								<h5><b>예약자 정보</b></h5>
								<div class="input_info row" style="padding: 20px;">
									<div class="col-4">
										<h6 style="margin: auto; padding: auto;">이름 <span
												style="color: red;">(필수)</span>
										</h6>
									</div>
									<div class="col-8">
										<input type="text" class="form-control" name="bookName" id="bookName"
											value="${mOne.memberName}" placeholder="이름을 입력해주세요" required>
									</div>
									<div class="col-4">
										<h6 style="margin: auto; padding: auto;">연락처 <span
												style="color: red;">(필수)</span>
										</h6>
									</div>
									<div class="col-8">
										<input type="tel" class="form-control" name="bookPhone" id="bookPhone"
											value="${mOne.memberPhone}" placeholder="-를 빼고 입력해주세요." required>
									</div>
									<div class="col-4">
										<h6 style="margin: auto; padding: auto;">요청사항</h6>
									</div>
									<div class="col-8">
										<textarea class="form-control" name="bookRequest" id="bookRequest" cols="30"
											rows="3" placeholder="요청사항을 입력해주세요."></textarea>
									</div>
								</div>
								<h5><b>전체 인원 정보</b></h5>
								<div class="input_info row">
									<div class="col-4">
										<h6 style="margin-top: 10px; padding: auto;">인원</h6>
									</div>
									<div class="col-8" style="text-align: left;">
										<div class="count-wrap _count">
											<button type="button" class="minus">-</button>
											<input type="text" name="bookPeople" id="bookPeople" class="inp"
												value="1" />
											<button type="button" class="plus">+</button>
										</div>
									</div>
									<hr>
									<div class="col-4">
										<p class="peopleInfo">기준인원</p>
									</div>
									<div class="col-8 text-end" style="text-align: left;">
										<h7 style="margin: auto; padding-right: 15px;">${campSite.standardPeople}명</h7>
									</div>
									<div class="col-4">
										<p class="peopleInfo">최대인원</p>
									</div>
									<div class="col-8 text-end" style="text-align: left;">
										<h7 style="margin: auto; padding-right: 15px;">${campSite.maxPeople}명</h7>
									</div>
									<div class="col-4">
										<p class="peopleInfo">인원당 추가금액</p>
									</div>
									<div class="col-8 text-end" style="text-align: left;">
										<h7 style="margin: auto; padding-right: 15px;" id="excessCharge">
											${campSite.excessCharge}원</h7>
									</div>
									<div class="col-4">
										<p class="peopleInfo">인원추가요금</p>
									</div>
									<div class="col-8 text-end" style="text-align: left; margin-bottom: 15px;">
										<h7 style="margin: auto; padding-right: 15px;"><b class="peopleMoney"></b></h7>
									</div>
									<hr>
								</div>
								<h5><b>포인트 할인</b></h5>
								<div class="input_info row">
									<div class="col-3" style="margin-bottom: 0;">
										<h6>포인트</h6>
									</div>
									<div class="col-9 text-end"
										style="text-align: left; display: flex;  margin-bottom: 0;  flex-direction: row; justify-content: flex-end;">
										<input type="number" class="pointInput" name="" value="" id="pointInput"
											placeholder="">
										<div class="btnPoint" style="margin-bottom: 0;"><a
												onclick="pointCancle()">사용취소</a>
										</div>

									</div>
									<p align="right" class="nowPoint">사용가능 포인트 <span
											id="available-point"><fmt:formatNumber value="${mOne.totalPoint}" pattern="#,###" /></span>원</p>
									<hr>
								</div>
								<h5><b>결제 상세</b></h5>
								<div class="input_info row">
									<div class="col-4">
										<p class="peopleInfo">숙박요금</p>
									</div>
									<div class="col-8 text-end" style="text-align: left;">
										<h7 style="margin: auto; padding-right: 15px;" class="totalSitePrice">10000원
										</h7>
										<p style="margin: auto; padding-right: 15px; font-size: 12px">${countDay}박 x
											<span class="sitePrice"></span></p>
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
										<h7 style="margin: auto; padding-right: 15px;">-<span
												id="bookUsePoint">0</span>원
										</h7>
									</div>
									<div class="col-4">
										<p class="peopleInfo">포인트적립</p>
									</div>
									<div class="col-8 text-end" style="text-align: left;">
										<h7 style="margin: auto; padding-right: 15px;" id="bookGetPoint"></h7>
										<p style="margin: auto; padding-right: 15px; font-size: 12px;">결제금액 3% 적립</p>
									</div>
									<div class="col-4">
										<p class="peopleInfo" style="color: black;">최종금액</p>
									</div>
									<div class="col-8 text-end" style="text-align: left;">
										<h7 style="margin: auto; padding-right: 15px;"><b class="totalPrice"></b></h7>
									</div>
								</div>
							</div>

						</div>
						<br><br>

						<div class="btn_foot">
							<a onclick="bookPay()" style="width: 100%;" class="bookBtn"><span
									class="totalPrice"></span>　예약하기</a>
						</div>

					</div>
				</div>
				<script>sitePrice
					var sitePrice = ${ campSite.sitePrice };
					var totalSitePrice = ${ campSite.sitePrice }* ${ countDay };
					var excessCharge = ${ campSite.excessCharge };
					var point = ${ mOne.totalPoint };
					var extraTotal = 0;
					var bookUsePoint = 0;
					var totalPrice = totalSitePrice + extraTotal - bookUsePoint;
					var bookGetPoint = Math.ceil(totalPrice / 100 * 3);
					var totalPriceB = totalSitePrice + extraTotal;

					$("#bookGetPoint").html(bookGetPoint.toLocaleString('ko-KR') + "원")
					$(".totalPrice").html(totalPrice.toLocaleString('ko-KR') + "원");
					$(".totalSitePrice").html(totalSitePrice.toLocaleString('ko-KR') + "원")
					$(".sitePrice").html(sitePrice.toLocaleString('ko-KR') + "원")
					$("#excessCharge").html("기준인원 초과 1인당 " + excessCharge.toLocaleString('ko-KR') + "원")
					$(".peopleMoney").html("0원");
					$(".inp").val(${ campSite.standardPeople });

					//결제
					function bookPay() {
						const data = {
							"Num": createOrderNum(),
							"memberId": "${mOne.memberId}",
							"siteNo": ${ campSite.siteNo },
						"name" : "${campSite.campName}",
							"bookName": $("#bookName").val(),
								"bookPhone": $("#bookPhone").val(),
									"bookRequest": $("#bookRequest").val(),
										"bookPeople": $("#bookPeople").val(),
											"firstDay": $("#firstDay").val(),
												"lastDay": $("#lastDay").val(),
													"totalDay":${ countDay },
						"bookIniPrice": totalSitePrice,
							"bookExtra": extraTotal,
								"bookUsePoint": bookUsePoint,
									"bookGetPoint": bookGetPoint,
										"bookTotalPrice": totalPrice,
											"payPrice": totalPrice,
												"productPrice": totalSitePrice,
													"usePoint": bookUsePoint,
														"getPoint": bookGetPoint,
															"payType": "C"
					}
					bookingPayCheck(data)
				// paymentCard(data)
	}
					function bookingPayCheck(data) {
						$.ajax({
							url: "/campBooking/bookingPayCheck.kh",
							type: "get",
							data: data,
							success: function (result) {
								if (result == "noneId") {
									alert("로그인 실패");
									location.href = "/camp/campSiteDetail.kh?contentId=" + contentId;
								}
								else if (result == "wrongApproach") {
									alert("잘못된 접근");
									location.href = "/camp/campSiteDetail.kh?contentId=" + contentId;
								}
								else if (result == "wrongDate") {
									alert("잘못된 접근");
									location.href = "/camp/campSiteDetail.kh?contentId=" + contentId;
								}
								else if (result == "success") {
									console.log(result)
									paymentCard(data)
								} else {
									alert("에러");
									location.href = "/camp/campSiteDetail.kh?contentId=" + contentId;
								}

							},
							error: function (request, status, error) {
								console.log("code: " + request.status)
								console.log("message: " + request.responseText)
								console.log("error: " + error);
								alert("ajax 통신 오류! 관리자에게 문의해 주세요!");
							}
						})
					}
					function createOrderNum() {
						const date = new Date();
						const year = date.getFullYear();
						const month = String(date.getMonth() + 1).padStart(2, "0");
						const day = String(date.getDate()).padStart(2, "0");

						let orderNum = year + month + day;
						for (let i = 0; i < 10; i++) {
							orderNum += Math.floor(Math.random() * 8);
						}
						return orderNum;
					}

					function paymentCard(data) {
						// 모바일로 결제시 이동페이지
						const pathName = location.pathname;
						const href = location.href;
						const m_redirect = href.replaceAll(pathName, "");

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


									bookingData(data);

								} else {
									// 결제 실패 시 로직,
									var msg = '결제에 실패하였습니다.';
									msg += '에러내용 : ' + rsp.error_msg;
								}
							});
					}

					function bookingData(data) {
						$.ajax({
							url: "/campBooking/campBooking.kh",
							type: "post",
							data: data,
							success: function (bookingNo) {
								var contentId = ${ campSite.campId
						};
						if (bookingNo > 0) {
							alert("예약성공");
							location.href = "/campBooking/campBookingComplete.kh?bookingNo=" + bookingNo;
						}
						else if (bookingNo == "fail") {
							alert("예약현황 데이터 저장 오류");
							location.href = "/camp/campSiteDetail.kh?contentId=" + contentId;
						} else {
							alert("에러");
							location.href = "/camp/campSiteDetail.kh?contentId=" + contentId;
						}
					},
					error: function(request, status, error) {
						console.log("code: " + request.status)
						console.log("message: " + request.responseText)
						console.log("error: " + error);
						alert("ajax 통신 오류! 관리자에게 문의해 주세요!");
					}
		})
	}
					function priceUpdate() {
						totalPrice = totalSitePrice + extraTotal - bookUsePoint;
						totalPriceB = totalSitePrice + extraTotal
						bookGetPoint = Math.ceil(totalPrice / 100 * 3);
						$("#bookUsePoint").html(parseInt(bookUsePoint).toLocaleString('ko-KR'))
						$(".totalPrice").html(totalPrice.toLocaleString('ko-KR') + "원");
						$("#bookGetPoint").html(bookGetPoint.toLocaleString('ko-KR') + "원");
					}
					//포인트 키업 
					$("#pointInput").keyup(function () {
						$("#available-point").html((point).toLocaleString('ko-KR'));
						bookUsePoint = $("#pointInput").val();
						if (parseInt(bookUsePoint) > parseInt(point)) {
							alert("보유 포인트를 초과하였습니다.");
							pointCancle();

						} else if (bookUsePoint == "") {
							pointCancle();
						} else if (totalPriceB - bookUsePoint < 0) {
							alert("결제 금액을 초과할 수 없습니다.");
							pointCancle();
						}
						else {
							$("#point-price").html('-' + point + '원');
							$("#available-point").html((point - bookUsePoint).toLocaleString('ko-KR'));
							priceUpdate()
						}
					})

					function pointCancle() {
						bookUsePoint = 0;
						$("#pointInput").val("");
						$("#available-point").html((point).toLocaleString('ko-KR'));
						$("#bookUsePoint").html('0');
						priceUpdate()

					}

					//인원수 업다운
					$('._count :button').on({
						'click': function (e) {
							e.preventDefault();
							var $count = $(this).parent('._count').find('.inp');
							var now = parseInt($count.val());
							var min = 1;
							var max = ${ campSite.maxPeople
					};
					var num = now;

					if ($(this).hasClass('minus')) {
						var type = 'm';
					} else {
						var type = 'p';
					}
					if (type == 'm') {
						if (now > min) {
							num = now - 1;
						}
					} else {
						if (now < max) {
							num = now + 1;
						} else {
							alert("최대인원을 초과할 수 없습니다!");
						}
					}
					if (num != now) {
						$count.val(num);
					}
		}
	});
					$('.minus').click(function (e) {
						e.preventDefault();
						var now = $(".inp").val();
						var standardPeople = ${ campSite.standardPeople };
						if (now > standardPeople) {
							extraTotal = (excessCharge * (now - standardPeople));
							$(".peopleMoney").html(extraTotal.toLocaleString('ko-KR') + "원");
							priceUpdate()
						} else {
							extraTotal = 0;
							$(".peopleMoney").html("0원");
							priceUpdate()
						}
					});


					$('.plus').click(function (e) {
						e.preventDefault();
						var now = $(".inp").val();
						var standardPeople = ${ campSite.standardPeople };
						if (now > standardPeople) {
							extraTotal = (excessCharge * (now - standardPeople));
							$(".peopleMoney").html(extraTotal.toLocaleString('ko-KR') + "원");
							priceUpdate()
						} else {
							extraTotal = 0;
							$(".peopleMoney").html("0원");
							priceUpdate()
						}
					});
				</script>
			</body>

			</html>