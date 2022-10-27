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
<title>캠핑장 사이트 정보</title>
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
	max-width: 400px;
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
	color: rgb(39, 174, 96);
	width: 100px;
	padding: 5px;
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
@keyframes delay-overflow {
  from { overflow: auto; }
}
div{
  word-break:break-all;
}
.siteInfo {
	position: relative;
    margin: auto;
    box-shadow: 0px 1px 2px 0px rgb(0 0 0 / 25%);
    background-color: #fff;
    cursor: pointer;
}
.siteList_area{
	background-color: #F5F5F5;
	display: block;
}
.siteList{
	display: block;
	overflow: hidden;
}
.siteImg {
    width: 120px;
    height: 122px;
}
span {
    position: absolute;
    bottom: 4px;
    left: 4px;
    font-size: 10px;
    padding: 2px 8px;
    border-radius: 10px;
    background-color: #F6B67B;
    color: #fff;
}
*, ::after, ::before {
    box-sizing: border-box;
}
/* div {
    display: block;
} */
.siteImg > div {
    width: 120px;
    height: 100%;
    object-fit: cover;
}
.d-flex {
    display: flex!important;
}
.siteIntro{
	position: relative;
	width: 180%;
    padding: 8px;
}
.siteRegist {
	width: 100%;
    padding: 8px;
}
.siteIntro-header{
	width: 100%;
	display: flex;
	flex-direction: column;
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
					<div class='text-right tt' stlyle='padding-bottom: 0.75rem;'><small class='text-muted'>${camp.induty}</small></div>
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
				<div class="calendar_area">
					<hr>
				</div>
				<div class="intro_area">
					<h4>캠핑장 소개</h4>
					<div class="intro">
						${camp.intro}
					</div>
					<div class="moreIntro" onclick="moreIntro()">
						더보기
					</div>
					<hr>
				</div>
				<div class="siteList_area">
					<h4>예약 가능 사이트</h4>
					<div class="siteList">
						<div class="siteInfo row">
							<div class="col-4" style="padding-left: 0;">
								<img class="simg" style="width: 100%; height: 100%; object-fit: cover;" src="https://campingagains3.s3.ap-northeast-2.amazonaws.com/medium_2021_12_26_12_15_24_34875d31d7.png" alt="">
									<span>예약가능</span>
								</img>
							</div>
							<div class="col-5" style="padding: 0px; padding-top : 5px">
								<h5>${camp.facltNm}</h5>
									<p>데크30x30</p>
									<p>기준인원 2명 / 최대인원 5명</p>
							</div>
							<div class="col-3" style="padding-right: 0;">
								dfdf
							</div>

						</div>
						<!-- <div class="siteInfo d-flex">
							<div class="siteImg">
								<div class="simg" src="https://campingagains3.s3.ap-northeast-2.amazonaws.com/medium_2021_12_26_12_15_24_34875d31d7.png" alt="">

									<span>예약가능</span>
								</div>
							</div>
							<div class="siteIntro">
								<div class="siteIntro-header">
									<h5>${camp.facltNm}</h5>
									<p>데크30x30</p>
									<p>기준인원 2명 / 최대인원 5명</p>
								</div>
								<div class="siteIntro-footer">
								</div>
							</div>
							<div class="siteRegist d-flex">
								df
							</div>
						</div> -->

					</div>

					<hr>
				</div>



				<!-- Button trigger modal -->
				<a data-bs-toggle="modal"
					data-bs-target="#exampleModal" onclick="modal()">Launch demo modal</a>
					<a data-bs-toggle="modal"
					data-bs-target="#exampleModal">Launch demo modal</a>
					<a data-bs-toggle="modal"
					data-bs-target="#exampleModal">Launch demo modal</a>
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">Modal
									title</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">sdfsdfsdf</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script type="text/javascript">
		// const myModal = document.getElementById('myModal')
		// const myInput = document.getElementById('myInput')
		
		// myModal.addEventListener('shown.bs.modal', () => {
		// myInput.focus()
		// })
		var moreNum = 0;
		function moreIntro(){
			if(moreNum == 0){
				$(".intro").css({height: 'auto' , overflow: 'auto'});
				// $(".intro").addClass("no_overflow")
				$(".moreIntro").html("줄이기");
				moreNum = 1;
			}else{
				$(".intro").css({height: '114px' , overflow: 'hidden'});
				$(".moreIntro").html("더보기");
				moreNum = 0;
			}
		}
		function modal(){
			$("#exampleModalLabel").html("가즈아");
		}

	</script>



</body>
</html>