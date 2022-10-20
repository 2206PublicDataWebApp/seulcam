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
	<title>캠핑장 리스트</title>
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
		<link href="../resources/css/layout.css"" rel="stylesheet">
		<link href="../resources/css/bootstrap.min.css"" rel="stylesheet"> -->
		<!-- jQuery -->
		<script src="../../../resources/js/jquery-3.6.1.min.js"></script>
		<link rel="stylesheet" href="/resources/css/camp/switch.css">
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
	z-index: 1;
	max-width: 400px;
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
.campListMain {
	padding-top: 50px;
}
.search_area {
	padding: 15px;
	padding-top: 50px;
	padding-bottom: 15%;
	margin: auto;
	min-height: 200px;
	font-size: 16px;
	border-bottom: 10px solid rgb(243, 243, 243);
	
}
.search_area h2{
	
	padding-bottom: 15px;
	text-align: center;
}
.search_area p{
	font-size: 20px;
	padding: 5px;

}
select {
    font-size: 1.1rem;
    padding: 2px 5px;
	width: 100%;
}
.searchCity {
	margin: auto;
	padding-top: 20px;
	padding-bottom: 20px;
	width: 100%;
	max-width: 600px;
}
.switch_area {
	margin: auto;
	max-width: 600px;
	padding-top: 20px;
	padding-bottom: 20px;
}
.switch_area #switchName {
	margin: auto;
	font-size: 20px;
	padding: 5px;
}
.switch_area #switch {
	margin: auto;
	float: right;
}
.camp_List {
	padding-bottom: 15px;
	border: solid #343a40 1px;
}
.tt {
	margin: 5px;
}
.word_area {
	padding: 15px;
}

</style>
<body>
	<!-- 헤더&메뉴바 -->
	<header>
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	</header>
	<!-- 검색 -->
	
	
	<!-- 컨텐츠 -->
	
	<div class="body-wrapper">
		
		
		<div class="campListMain">
			<div class="search_area">
				<h2>최근 인기 캠핑장 추천, 슬캠</h2>
				<div class="searchCity">
					<label for="city_select"><p>지역 </p></label>
					<select name="" id="city_select">
						<option value="0" >지역 시/군/구</option>
					</select>
				</div>
				<div class="searchCity">
					<label for="category_select"><p>카테고리 </p></label>
					<select name="" id="category_select">
						<option value="0" >카테고리</option>
					</select>
				</div>
				<div class="switch_area">
					
					<span id="switchName">
						예약가능 캠핑장만 보기
					</span>
					<span id="switch">
						<label class="switch-button">
							<input type="checkbox"/>
							<span class="onoff-switch"></span>
						</label>
					</span>
				
				</div>
				
				<input type="text">

			</div>
			<div class="list_area" >
				<div class="word_area">
					<h2>검색결과</h2>
				</div>
			<div id="list_area">


			</div>
		</div>
	
	<!-- 푸터 -->


	<script>
		$(document)
				.ready(
						function() {
							$.ajax({
								url : "/camp/campListShow.kh",
								type : "GET",
								data : {},
								dataType : "json",
								success : function(data) {
									console.log(data[0].contentId)
									var str = "";
									for (var i = 0; i < data.length; i++) {
									str += "<div class='camp_List' id='campsite-"+data[i].contentId+"'>"
									str += "<a href='#' data-id='"+data[i].contentId+"'>"
									str += "<div style='height: 225px; background: url("+data[i].firstImageUrl+") no-repeat center center #343a40; background-size: 100%;'></div></a>"
									str += "<div class='card-body 'style='padding-top: 0.75rem;'><div class='text-right tt' stlyle='padding-bottom: 0.75rem;'><small class='text-muted'>"+data[i].induty+"</small></div>"
									str += "<a href='#' data-id='"+data[i].contentId+"'><h3 class='card-title tt'>"+data[i].facltNm+"</h3><p class='card-text tt'>"+data[i].addr1+"</p></a></div><hr>좋아요 : 0</div>"
									}
									$("#list_area").append(str);
								},
								error : function() {
									console.log("출력실패");
								}
							})

						})
		//자동 스크롤시 페이지 갱신
		var page = 0;
		function scrollload(){
				page++;
				$.ajax({
							url : "",
							type : "GET",
							data : {
								"page" : page
							},
							dataType : "json",
							async: false,
							success : function(data) {
								console.log(data)
								var str = "";
								// for (var i = 0; i < data.response.body.items.item.length; i++) {
								// 	var campItem = data.response.body.items.item;
								// 	str += "<div class='camp_List' id='campsite-"+campItem[i].contentId+"'>"
								// 	str += "<a href='#' data-id='"+campItem[i].contentId+"'>"
								// 	str += "<div style='height: 225px; background: url("+campItem[i].firstImageUrl+") no-repeat center center #343a40; background-size: 100%;'></div></a>"
								// 	str += "<div class='card-body 'style='padding-top: 0.75rem;'><div class='text-right tt' stlyle='padding-bottom: 0.75rem;'><small class='text-muted'>"+campItem[i].induty+"</small></div>"
								// 	str += "<a href='#' data-id='"+campItem[i].contentId+"'><h3 class='card-title tt'>"+campItem[i].facltNm+"</h3><p class='card-text tt'>"+campItem[i].addr1+"</p></a></div><hr>좋아요 : 0</div>"
								// }
								// $("#list_area").append(str);

							},
							error : function() {
								console.log("출력실패");
							}
						})
		}
		//자동 스크롤시 페이지 갱신
		$(window).scroll(function () {
			// setTimeout(function(){
			var scrollHeight = $(window).scrollTop() + $(window).height();
			var documentHeight = $(document).height();
			console.log(scrollHeight)
			console.log(documentHeight)
			if (scrollHeight+page  >= documentHeight) {
				scrollload()
				}
			// },300)
		});		 



		
	</script>
</body>
</html>