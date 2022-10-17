<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>슬기로운 캠핑 생활</title>
    <link rel="stylesheet" href="/resources/css/login.css">
    <link rel="stylesheet" href="/resources/css/fonts.css">
    <link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">

</head>
<body>
    <!-- Header -->
    <div class="body-wrapper">
        <div id="header-block">
            <header>
                <h1>
                    슬기로운 캠핑 생활 <!--SEO를 위한 태그-->
                </h1>
                <div class="header-wrapper">
                    <div class="back-layout">
                        <button class="go-back">
                            <img src="/resources/images/back_arrow.png"> <!--좀 더 작은 이미지 파일로 바꾸기-->
                        </button>
                    </div>
                    <h2>
                        로그인
                    </h2>
                </div>
            </header>
        </div>

        <!-- content -->
        <section>
            <div class="member-check">
                <p class="registered-member"><b>가입 회원</b></p>
            </div>

            <div class="login-member">
                <form name="loginform" class="login-form" action="#" method="post">
                    <div class="login-member-form">
                        <input class="login-input" type="text" id="memberId" placeholder="아이디" maxlength="11">
                        <div class="password-input-wrapper">
                            <input class="login-input-pw" type="password" id="memberPwd" placeholder="비밀번호" maxlength="30">
                            <button type="button" class="password-eye"></button>
                        </div>
                    </div>

                    <button type="submit" class="login-button">로그인</button>

                    <div class="member-util">
                        <input class="autologin" type="checkbox" id="autologin" name="autologin" value="1">
                        <label for="autologin" id="labelAutologin">자동 로그인</label>

                        <ul class="util-list">
                            <li class="util-item1"><a class="find-id" href="#">아이디 찾기</a></li>
                            <li class="util-item2"><a class="find-pw" href="#">비밀번호 찾기</a></li>
                        </ul>
                    </div>

                    <div class="social-login">
                        <a class="kakao-login">
                            <img src="/resources/images/kakao_login.png">
                        </a>
                    </div>
                </form>
            </div>

            <div class="register">
                <p class="register-text">아직 계정이 없다면? <a href="#">회원가입</a> </p>
            </div>


        </section>
    </div>
    
</body>
</html>