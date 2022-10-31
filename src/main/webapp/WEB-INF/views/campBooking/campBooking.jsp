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
	height: 100px;
	width: 100px;
	/* border: 1px solid black; */
}
.input_info {
	padding: 20px;
}
.input_info div{
	margin-bottom: 5px;
}
/* 카운트버튼 */
.count-wrap {
    position: relative;
    padding: 0 38px;
    border: 1px solid #ddd;
    overflow: hidden;
    width: 120px;
    float:right;
    display: block;
}
.count-wrap > button {
    border: 0;
    background: #fff;
    color: #000;width: 38px;
    height: 38px;
    position: absolute;
    top: 0;
    font-size: 12px;}
.count-wrap > button.minus {left: 0;}
.count-wrap > button.plus {right: 0;}
.count-wrap .inp {
    border: 0;
    height: 38px;
    text-align: center;
    display: block;
    width: 100%;}

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
				<div class='text-right tt' stlyle='padding-bottom: 0.75rem; color: black;'><b>예약상품정보</b></div>
				<h4 style="padding-top: 5px;">${campSite.campName}</h4>
				<div class="row" style="padding: 15px;">
					<div class="site_img col-3">
						<img class='simg' style='width: 100%; height: 100%; object-fit: cover;' src='/resources/ruploadFiles/${campSite.siteThumbnailRename}' alt=''>
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
						</tr>
						<tr>
							<td class="infoTitle">기준인원</td>
							<td>기준인원 ${campSite.standardPeople}명 / 최대인원 ${campSite.maxPeople}명</td>
						</tr><tr>
							<td class="infoTitle">체크인아웃</td>
							<td>입실 ${campSite.inTime}시 / 퇴실 ${campSite.outTime}시</td>
						</tr>
					</table>
					<div style="text-align: right;">
						<h5 style="padding-right: 20px;">1박 <b id="sitePrice">45,000원</b></h5>

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
						<input type="text" class="form-control" name="" value="${mOne.memberName}" placeholder="이름을 입력해주세요" required>
					</div>
					<div class="col-4">
						<h6 style="margin: auto; padding: auto;">연락처 <span style="color: red;">(필수)</span></h6>
					</div>
					<div class="col-8">
						<input type="text" class="form-control" name="" value="${mOne.memberPhone}" placeholder="-를 빼고 입력해주세요." required>
					</div>
					<div class="col-4">
						<h6 style="margin: auto; padding: auto;">요청사항</h6>
					</div>
					<div class="col-8">
						<textarea class="form-control" name="" id="" cols="30" rows="3"></textarea>
					</div>
				</div>
				<h5><b>전체 인원 정보</b></h5>
				<div class="input_info row">
					<div class="col-4">
						<h6 style="margin: auto; padding: auto;">인원</h6>
					</div>
					<div class="col-8" style="text-align: left;">
						<div class="count-wrap _count">
							<button type="button" class="minus">-</button>
							<input type="text" class="inp" value="1" />
							<button type="button" class="plus">+</button>
						</div>
					</div>
					<hr>
					<div class="col-4">
						<h6 style="margin: auto; padding: auto;">기준인원</h6>
					</div>
					<div class="col-8 text-end" style="text-align: left;">
						<h7 style="margin: auto; padding-right: 15px;">${campSite.standardPeople}명</h7>
					</div>
					<div class="col-4">
						<h6 style="margin: auto; padding: auto;">최대인원</h6>
					</div>
					<div class="col-8 text-end" style="text-align: left;">
						<h7 style="margin: auto; padding-right: 15px;">${campSite.maxPeople}명</h7>
					</div>
					<div class="col-4">
						<h6 style="margin: auto; padding: auto;">인원당 추가금액</h6>
					</div>
					<div class="col-8 text-end" style="text-align: left;">
						<h7 style="margin: auto; padding-right: 15px;" id="excessCharge">${campSite.excessCharge}원</h7>
					</div>
					<div class="col-4">
						<h6 style="margin: auto; padding: auto;">인원추가요금</h6>
					</div>
					<div class="col-8 text-end" style="text-align: left;">
						<h7 style="margin: auto; padding-right: 15px;"><b id="peopleMoney"></b></h7>
					</div>
				</div>

			</div>

		</div>
		<br><br><br><br><br><br><br><br>
	</div>
	</div>
<script>sitePrice
	var sitePrice = ${campSite.sitePrice};
	var excessCharge = ${campSite.excessCharge};
	$("#sitePrice").html(sitePrice.toLocaleString('ko-KR')+"원")
	$("#excessCharge").html("기준인원 초과 1인당 "+ excessCharge.toLocaleString('ko-KR')+"원")
	$("#peopleMoney").html("0원");
	$(".inp").val(${campSite.standardPeople});
    $('._count :button').on({
		'click' : function(e){
			e.preventDefault();
			var $count = $(this).parent('._count').find('.inp');
			var now = parseInt($count.val());
			var min = 1;
			var max = ${campSite.maxPeople};
			var num = now;
		
			if($(this).hasClass('minus')){
				var type = 'm';
			}else{
				var type = 'p';
			}
			if(type=='m'){
				if(now>min){
					num = now - 1;
				}
			}else{
				if(now<max){
					num = now + 1;
				}else{
					alert("최대인원을 초과할 수 없습니다!");
				}
			}
			if(num != now){
				$count.val(num);
			}
		}
	});
	$('.minus').click(function(e){
        e.preventDefault();
    	var now = $(".inp").val();
		var standardPeople = ${campSite.standardPeople};
		var total = (excessCharge*(now-standardPeople)).toLocaleString('ko-KR');
        if(now > standardPeople){
			$("#peopleMoney").html(total+"원");
		}else{
			$("#peopleMoney").html("0원");
		}
    });
    	
   
    $('.plus').click(function(e){
        e.preventDefault();
    	var now = $(".inp").val();
		var standardPeople = ${campSite.standardPeople};
		var total = (excessCharge*(now-standardPeople)).toLocaleString('ko-KR');
        if(now > standardPeople){
			$("#peopleMoney").html(total+"원");
		}else{
			$("#peopleMoney").html("0원");
		}
    });
</script>
</body>
</html>