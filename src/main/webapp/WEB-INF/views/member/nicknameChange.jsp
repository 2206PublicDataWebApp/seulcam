<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no">
    <title>닉네임 변경</title>
    <link rel="stylesheet" href="/resources/css/member/nicknameChange.css">
    <link rel="stylesheet" href="/resources/css/memberCommon.css">
    <link rel="stylesheet" href="/resources/css/fonts.css">
    <link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <script src="../../../resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
    <div class="body-wrapper">
        <div id="header-block">
            <header>
                <h1>
                    슬기로운 캠핑 생활 <!--SEO를 위한 태그-->
                </h1>
                <div class="header-wrapper">
                    <div class="back-layout">
                        <button class="go-back">
                            <img src="/resources/images/back_arrow.png" onclick="history.back()">
                        </button>
                    </div>
                    <h2>
                        닉네임 변경
                    </h2>
                </div>
            </header>
        </div>
    
    	<form action="/member/changeNickname" method="post">
    		<input type="hidden" name="memberId" value="${loginUser.memberId }">
	        <section>
	            <div class="section-wrapper">
	                <input type="text" class="nickname-change" id="memberNickname" name="memberNickname" placeholder="닉네임 입력(최대 15자)" maxlength="15" autocomplete="off">
	                <p class="nickname ok">해당하는 닉네임이 존재하지 않습니다.</p>
            		<p class="nickname error">해당하는 닉네임이 존재합니다.</p>
            		<p class="nickname regerror">한글, 영문 및 숫자로 입력해주세요.</p>
	                <p class="current-nickname">현재 닉네임 : ${member.memberNickname }</p>
	                <ul>
	                    <li>길이는 최대 15자 이내</li>
	                    <li>중복 닉네임 불가</li>
	                    <li>이모티콘 및 특수문자 사용 불가</li>
	                </ul>
	            </div>
	        </section>
	
	        <footer>
	            <div class="footer-wrapper">
	                <button type="submit" class="submit-button" disabled>
	                닉네임 변경
	                </button>
	            </div>
	        </footer>
		</form>
    </div>
    <script src="/resources/js/member/nicknameChange.js"></script>
</body>
</html>