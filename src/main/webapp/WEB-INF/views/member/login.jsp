<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>슬기로운 캠핑 생활</title>
    <link rel="stylesheet" href="/resources/css/member/login.css">
    <link rel="stylesheet" href="/resources/css/memberCommon.css">
    <link rel="stylesheet" href="/resources/css/fonts.css">
    <link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <script src="../../../resources/js/jquery-3.6.1.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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
                        <button class="go-back" onclick="history.back()">
                            <img src="/resources/images/back_arrow.png">
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
                <form name="loginform" class="login-form" action="/member/login" method="post">
                    <div class="login-member-form">
                        <input class="login-input" type="text" name="memberId" id="memberId" placeholder="아이디" maxlength="11" autocomplete="off">
                        <div class="password-input-wrapper">
                            <input class="login-input-pw" type="password" name="memberPw" id="memberPw" placeholder="비밀번호" maxlength="30">
                            <button type="button" class="password-eye"><i id="toggle-eye" class="fa fa-eye fa-lg"></i></button>
                        </div>
                    </div>

                    <button type="submit" class="login-button">로그인</button>

                    <div class="member-util">
                        <input class="autologin" type="checkbox" id="autologin" name="useCookie" value="1">
                        <label for="autologin" id="labelAutologin">로그인 유지</label>

                        <ul class="util-list">
                            <li class="util-item1"><a class="find-id" href="/member/findIdView">아이디 찾기</a></li>
                            <li class="util-item2"><a class="find-pw" href="/member/findPwView">비밀번호 찾기</a></li>
                        </ul>
                    </div>

                    <div class="social-login" onclick="kakaoLogin();">
                        <a class="kakao-login">
                            <img src="/resources/images/kakao_login.png">
                        </a>
                    </div>
                </form>
            </div>

            <div class="register">
                <p class="register-text">아직 계정이 없다면? <a href="/member/registerView">회원가입</a> </p>
            </div>
        </section>
    </div>
    <script src="/resources/js/member/pwInputCommon.js"></script>
    <script src="/resources/js/member/kakaoLogin.js"></script>
    
</body>
</html>