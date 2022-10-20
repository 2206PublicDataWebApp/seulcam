<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="/resources/css/member/findPw.css">
    <link rel="stylesheet" href="/resources/css/fonts.css">
    <link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
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
                        비밀번호 찾기
                    </h2>
                </div>
            </header>
        </div>

        <!-- content -->
        <section>
            <div class="tab-list">
                <a href="/member/findIdView"class="id-tab">아이디 찾기</a>
                <a href="#" class="pw-tab">비밀번호 찾기</a>
            </div>

            <h3>이메일을 통해 비밀번호 찾기</h3>

            <input type="text" class="findpw-id" placeholder="아이디를 입력해주세요.">

            <div class="email-auth">
                    <input type="email" class="email-input" placeholder="이메일을 입력해주세요.">
                    <button type="button" class="auth-button">인증 요청</button>
            </div>

            <input type="text" class="email-auth-number" placeholder="인증번호">
        </section>

        <footer>
            <div class="footer-wrapper">
                <button type="button" class="submit-button" onclick="location.href='/member/pwResultView';" >
                비밀번호 찾기
                </button>
            </div>
        </footer>
    </div>
</body>
</html>