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
				<h2><a href="/camp/campList.kh">최근 인기 캠핑장 추천, 슬캠 ${msg }</a></h2>
				<div class="searchCity">
					<label for="city_select"><p>지역 </p></label>
					<select class="selectList" name="city_select" id="city_select">
						<option value="" disabled selected>지역 시/도</option>
						<option value="강원도" >강원도</option>
						<option value="경기도" >경기도</option>
						<option value="경상남도" >경상남도</option>
						<option value="경상북도" >경상북도</option>
						<option value="광주시" >광주시</option>
						<option value="대구시" >대구시</option>
						<option value="대전시" >대전시</option>
						<option value="부산시" >부산시</option>
						<option value="서울시" >서울시</option>
						<option value="세종시" >세종시</option>
						<option value="울산시" >울산시</option>
						<option value="인천시" >인천시</option>
						<option value="전라남도" >전라남도</option>
						<option value="전라북도" >전라북도</option>
						<option value="제주도" >제주도</option>
						<option value="충청남도" >충청남도</option>
						<option value="충청북도" >충청북도</option>
					</select>
				</div>
				<div class="searchCity">
					<label for="category_select"><p>카테고리 </p></label>
					<select class="selectList" name="category_select" id="category_select">
						<option value="" disabled selected>카테고리</option>
						<option value="글램핑" >글램핑</option>
						<option value="일반야영장" >일반야영장</option>
						<option value="자동차야영장" >자동차야영장</option>
						<option value="카라반" >카라반</option>
					</select>
				</div>
				<div class="switch_area">
					
					<span id="switchName">
						예약가능 캠핑장만 보기
					</span>
					<span id="switch">
						<label class="switch-button">
							<input type="checkbox" name="registCheck" />
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
		var page = 0;
		var city ="";
		var category ="";
		var search = "";
		var regist ="N";
		var listUrl ="";
		function urlLoad(){
			$.ajax({
								url : listUrl,
								type : "GET",
								data : {
									"page" : page,
									"city" : city,
									"category" : category,
									"search" : search,
									"regist" : regist
								},
								dataType : "json",
								async : false,
								success : function(data) {
									var str = "";
									for (var i = 0; i < data.length; i++) {
										str += "<div class='camp_List' id='campsite-"+data[i].contentId+"'>"
										str += "<a href='/camp/campDetail.kh?contentId="+data[i].contentId+"' data-id='"+data[i].contentId+"'>"
												if(data[i].firstImageUrl == null){
										str += "<div style='height: 225px; background: url(https://3.bp.blogspot.com/-ZKBbW7TmQD4/U6P_DTbE2MI/AAAAAAAADjg/wdhBRyLv5e8/s1600/noimg.gif) no-repeat center center #343a40; background-size: 100%;'></div></a>"
									}else{
										str += "<div style='height: 225px; background: url("+data[i].firstImageUrl+") no-repeat center center #343a40; background-size: 100%;'></div></a>"
									}	
										str += "<div class='card-body 'style='padding-top: 0.75rem;'><div class='text-right tt' stlyle='padding-bottom: 0.75rem;'><small class='text-muted'>"+data[i].induty+"</small></div>"
										str += "<a href='/camp/campDetail.kh?contentId="+data[i].contentId+"' data-id='"+data[i].contentId+"'><h3 class='card-title tt'>"+data[i].facltNm+"</h3><p class='card-text tt'>"+data[i].addr1+"</p></a></div><hr>좋아요 : 0</div>"
									}
									if(listUrl == "/camp/campListScroll.kh"){
										$("#list_area").append(str);
									}else{
										$("#list_area").html(str);
									}
									page++
								},
								error : function() {
									console.log("출력실패");
								}
							})
		}

		//리스트 진입시 목록 출력
		$(document).ready(function() {
			listUrl = "/camp/campListShow.kh";
			urlLoad();
						})
		//자동 스크롤시 페이지 갱신 ajax
		function scrollload(){
			listUrl = "/camp/campListScroll.kh";
			// page++;
			urlLoad();
		}
		//자동 스크롤시 페이지 갱신 코드
		$(window).scroll(function () {
			// setTimeout(function(){
			var scrollHeight = $(window).scrollTop() + $(window).height();
			var documentHeight = $(document).height();
			//현재 높이 측정
			// console.log(scrollHeight)
			// console.log(documentHeight)
			if (scrollHeight+page  >= documentHeight -1) {
				console.log()
				scrollload()
				}
			// },500)
		});		 

		// 예약가능 스위치 활성화
		$("input[name='registCheck']").change(function(){
			if(this.checked == true){
				regist = "Y"
			}else{
				regist = "N"
			}
		})

		// 검색결과 출력
		$("select").change(function(){
			if(this.name == "city_select"){
				city ="\'"+$(this).val()+"\'";
			}else if(this.name == "category_select"){
				category ="\'"+$(this).val()+"\'";
			}
			$(".word_area").html("<h2>"+ city +" "+ category+" 검색결과</h2> ")
			listUrl = "/camp/campListShow.kh";
			// if(page != 0){
			// 	page=0;
			// }
			urlLoad();
			});




		
	</script>
</body>
</html>