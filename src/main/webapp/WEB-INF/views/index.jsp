<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no">
	<title>슬기로운 캠핑 생활</title>
	<link rel="stylesheet" href="/resources/css/main.css">
	<link rel="stylesheet" href="/resources/css/fonts.css">
	<link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    
</head>
<body>

	<section class="youtubeBg">
		<div data-vbg-muted="true" data-vbg-loop="true" data-vbg-autoplay="true" data-vbg-start-at="40" data-vbg="https://youtu.be/wSZ0j6eBRpg"></div>
	</section>
	
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	

	
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	
	<div class="landing">
		<h2 class="landing-title">
			누구나 함께 하는 즐거운<br>
			캠핑 라이프<br>
			슬기로운 캠핑 생활과 함께<br>
			즐겨보세요!
		</h2>
	</div>
	
	
	<script src="https://unpkg.com/youtube-background@1.0.14/jquery.youtube-background.min.js"></script>
	<script src="/resources/js/youtubeBackground.js"></script>
</body>
</html>
