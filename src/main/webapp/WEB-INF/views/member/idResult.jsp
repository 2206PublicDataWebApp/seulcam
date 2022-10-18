<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>아이디 찾기 결과</title>
    <link rel="stylesheet" href="/resources/css/idResult.css">
    <link rel="stylesheet" href="/resources/css/fonts.css">
    <link rel="shortcut icon" href="resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="resources/images/faviconlogo.ico" type="image/x-icon">
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
                        <button class="go-back" onclick="history.back()">
                            <img src="/resources/images/back_arrow.png">
                        </button>
                    </div>
                    <h2>
                        아이디 찾기 결과
                    </h2>
                </div>
            </header>
        </div>

        <!-- content -->
        <section>
            <div class="find-result">
                <p class="result-text">
                    회원님의 이메일로 <br> 가입된 아이디가 있습니다.
                </p>

                <ul class="result-box">
                    <li class="result">
                        <div class="id-result"><b>khuser01</b></div>
                        <div class="auth-result">이메일 인증</div>
                        <div class="register-date">2022.10.07 가입</div>
                    </li>
                </ul>
            </div>

            <div class="login-button">
                <p class="login-text">비밀번호가 기억나지 않으세요? 
                    <a class="find-pw" href="/member/findPwView">비밀번호 찾기</a>
                </p>

                <a href="/member/loginView" class="login">로그인</a>
            </div>


        </section>
    </div>
</body>
</html>