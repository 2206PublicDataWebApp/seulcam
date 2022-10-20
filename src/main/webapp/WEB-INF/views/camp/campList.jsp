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
	<div class="body-wrapper">
	<!-- 헤더&메뉴바 -->
	<header>
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	</header>
	<!-- 검색 -->


	<!-- 컨텐츠 -->
		
		
		
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
			<!-- <div class="camp_List" id="campsite-2301">
				<div class="card mb-4">
					<a href="/campsites/2301/view" data-id="2301">
						<div
							style="height: 225px; background: url('https://www.guryecamp.com/img_up/shop_pds/kp740/design/img/new_royal.jpg') no-repeat center center #343a40; background-size: 100%;"></div>
					</a>
					<div class="card-body" style="padding-top: 0.75rem;">

						<div class="text-right" stlyle="padding-bottom: 0.75rem;">
							<small class="text-muted">이미지 출처: 소보루의 소비 생활</small>
						</div>

						<a href="/campsites/2301/view" data-id="2301">
							<h5 class="card-title">블루문캠핑장</h5>
							<p class="card-text">경기 가평군 상면</p>
						</a>
						<div class="text-right">
							<div class="btn-group">
								<button type="button"
									class="btn btn-sm btn-outline-danger btn-pick"
									data-campsite-id="2301">
									<i class="fas fa-heart"></i><span class="pick-total"
										data-campsite-id="2301"></span>
								</button>
								<button type="button"
									class="btn btn-sm btn-outline-dark btn-visit"
									data-campsite-id="2301">
									<i class="fas fa-walking"></i><span class="visit-total"
										data-campsite-id="2301"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="camp_List" id="campsite-1759">
				<div class="card mb-4">
					<a href="/campsites/1759/view" data-id="1759">
						<div
							style="height: 225px; background: url(/image/blog_image/2296/229642.jpg) no-repeat center center #343a40; background-size: 100%;"></div>
					</a>
					<div class="card-body" style="padding-top: 0.75rem;">

						<div class="text-right" stlyle="padding-bottom: 0.75rem;">
							<small class="text-muted">이미지 출처: 윰로그</small>
						</div>

						<a href="/campsites/1759/view" data-id="1759">
							<h5 class="card-title">산중오토캠핑장</h5>
							<p class="card-text">경상남도 거창군 북상면</p>
						</a>
						<div class="text-right">
							<div class="btn-group">
								<button type="button"
									class="btn btn-sm btn-outline-danger btn-pick"
									data-campsite-id="1759">
									<i class="fas fa-heart"></i><span class="pick-total"
										data-campsite-id="1759"></span>
								</button>
								<button type="button"
									class="btn btn-sm btn-outline-dark btn-visit"
									data-campsite-id="1759">
									<i class="fas fa-walking"></i><span class="visit-total"
										data-campsite-id="1759"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="camp_List" id="campsite-3067">
				<div class="card mb-4">
					<a href="/campsites/3067/view" data-id="3067">
						<div
							style="height: 225px; background: url(/image/blog_image/2338/233889.jpg) no-repeat center center #343a40; background-size: 100%;"></div>
					</a>
					<div class="card-body" style="padding-top: 0.75rem;">

						<div class="text-right" stlyle="padding-bottom: 0.75rem;">
							<small class="text-muted">이미지 출처: 내맘대로 성장기</small>
						</div>

						<a href="/campsites/3067/view" data-id="3067">
							<h5 class="card-title">유명산밸리캠핑장</h5>
							<p class="card-text">경기 가평군 설악면</p>
						</a>
						<div class="text-right">
							<div class="btn-group">
								<button type="button"
									class="btn btn-sm btn-outline-danger btn-pick"
									data-campsite-id="3067">
									<i class="fas fa-heart"></i><span class="pick-total"
										data-campsite-id="3067"></span>
								</button>
								<button type="button"
									class="btn btn-sm btn-outline-dark btn-visit"
									data-campsite-id="3067">
									<i class="fas fa-walking"></i><span class="visit-total"
										data-campsite-id="3067"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div> -->
		</div>
	
	<!-- 푸터 -->


	<script>
		$(document)
				.ready(
						function() {
							var url = 'https://apis.data.go.kr/B551011/GoCamping/basedList'; /*URL*/
							var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'qbHoplMaKq5PUqUFEhfVjBpLiBxBcVPOw%2Fio3GvQ91q8xQjh%2BLZMz4caQ5Nqyt%2BU%2BeCGuAPRaJHRIhTzUqKmHw%3D%3D'; /*Service Key*/
							queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
							queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('3240');
							queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('WIN');
							queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('seulcam'); /**/
							queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('json');  
							var urli = url+queryParams;
							console.log($(document).height())
							$.ajax({
										url : urli,
										type : "GET",
										data : {},
										dataType : "json",
										async: false,
										success : function(data) {
											console.log(data.response.body.numOfRows)
											var str = "";
											for (var i = 0; i < data.response.body.items.item.length; i++) {
												var campItem = data.response.body.items.item;
												if(campItem[i].facltDivNm =="민ㅇ간" && campItem[i].doNm == "ㄹ전라남도" && campItem[i].manageSttus == "운영"){
													str += "<div class='camp_List' id='campsite-"+campItem[i].contentId+"'>"
													str += "<a href='#' data-id='"+campItem[i].contentId+"'>"
													str += "<div style='height: 225px; background: url("+campItem[i].firstImageUrl+") no-repeat center center #343a40; background-size: 100%;'></div></a>"
													str += "<div class='card-body 'style='padding-top: 0.75rem;'><div class='text-right tt' stlyle='padding-bottom: 0.75rem;'><small class='text-muted'>"+campItem[i].induty+"</small></div>"
													str += "<a href='#' data-id='"+campItem[i].contentId+"'><h3 class='card-title tt'>"+campItem[i].facltNm+"</h3><p class='card-text tt'>"+campItem[i].addr1+"</p></a></div><hr>좋아요 : 0</div>"
													$.ajax({
														url : "",
														type : "GET",
														data : {},
														dataType : "json",
														success : function(result){
															
														},
														error : function({

														})

													})
												}
												
											}
											if(str == ""){
												$("#list_area").append("없서용");
											}
											$("#list_area").append(str);

										},
										error : function() {
											console.log("출력실패");
										}
									})

							$.ajax({
								url : "/campListShow.kh",
								type : "GET",
								data : {},
								dataType : "json",
								success : function(data) {
									console.log(data)
								},
								error : function() {
									console.log("출력실패");
								}
							})

						})
		var page = 2;
		function scrollload(){
			var url = 'https://apis.data.go.kr/B551011/GoCamping/basedList'; /*URL*/
				var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'qbHoplMaKq5PUqUFEhfVjBpLiBxBcVPOw%2Fio3GvQ91q8xQjh%2BLZMz4caQ5Nqyt%2BU%2BeCGuAPRaJHRIhTzUqKmHw%3D%3D'; /*Service Key*/
				queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent(page); /**/
				queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10');
				queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('WIN');
				queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('seulcam'); /**/
				queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('json');  
				var urli = url+queryParams;
				page++;
				console.log("페이지 : " + page)
				$.ajax({
							url : urli,
							type : "GET",
							data : {},
							dataType : "json",
							success : function(data) {
								console
										.log(data.response.body.numOfRows)
								var str = "";
								for (var i = 0; i < data.response.body.items.item.length; i++) {
									var campItem = data.response.body.items.item;
									str += "<div class='camp_List' id='campsite-"+campItem[i].contentId+"'>"
									str += "<a href='#' data-id='"+campItem[i].contentId+"'>"
									str += "<div style='height: 225px; background: url("+campItem[i].firstImageUrl+") no-repeat center center #343a40; background-size: 100%;'></div></a>"
									str += "<div class='card-body 'style='padding-top: 0.75rem;'><div class='text-right tt' stlyle='padding-bottom: 0.75rem;'><small class='text-muted'>"+campItem[i].induty+"</small></div>"
									str += "<a href='#' data-id='"+campItem[i].contentId+"'><h3 class='card-title tt'>"+campItem[i].facltNm+"</h3><p class='card-text tt'>"+campItem[i].addr1+"</p></a></div><hr>좋아요 : 0</div>"
								}
								$("#list_area").append(str);

							},
							error : function() {
								console.log("출력실패");
							}
						})
		}

		/* $(window).scroll(function () {
			// setTimeout(function(){
			var scrollHeight = $(window).scrollTop() + $(window).height();
			var documentHeight = $(document).height();
			console.log(scrollHeight)
			console.log(documentHeight)
			if (scrollHeight+page  >= documentHeight) {
				scrollload()
				}
			// },300)
		});		 */		



		// var xhr = new XMLHttpRequest();
		// var url = 'https://apis.data.go.kr/B551011/GoCamping/basedList'; /*URL*/
		// var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'qbHoplMaKq5PUqUFEhfVjBpLiBxBcVPOw%2Fio3GvQ91q8xQjh%2BLZMz4caQ5Nqyt%2BU%2BeCGuAPRaJHRIhTzUqKmHw%3D%3D'; /*Service Key*/
		// queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
		// queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10');
		// queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('WIN');
		// queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('seulcam'); /**/
		// queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('json');        
		// xhr.open('GET', url + queryParams);
		// xhr.onreadystatechange = function () {

		//     if (this.readyState == 4) {
		//         // console.log(this.response);
		//         console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
		//     }
		// };
		// function clicki(){
		//     console.log(queryParams)
		// }
		// xhr.send('');
	</script>
</body>
</html>