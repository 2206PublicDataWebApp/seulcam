<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="/resources/css/member/passwordChange.css">
    <link rel="stylesheet" href="/resources/css/fonts.css">
    <link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
</head>
<body>
    <!-- header -->
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
                        비밀번호 변경
                    </h2>
                </div>
            </header>
        </div>

        <!-- content -->
        <section>
            <div class="join-input">
                <div class="join-input-wrapper">
                    <input class="join-input-input" type="password" id="memberPwd" placeholder="기존 비밀번호" maxlength="30">
                    <button type="button" class="password-eye"></button>
                </div>
                <p class="pwd-check"></p>
            </div>

            <div class="join-input">
                <div class="join-input-wrapper">
                    <input class="join-input-input" type="password" id="newMemberPwd" placeholder="새 비밀번호" maxlength="30">
                    <button type="button" class="password-eye"></button>
                </div>
                <p class="pwd-check"></p>
            </div>
    
            <div class="join-input">
                <div class="join-input-wrapper">
                    <input class="join-input-input" type="password" id="newMemberPwdCheck" placeholder="새 비밀번호 확인" maxlength="30">
                    <button type="button" class="password-eye active"></button>
                </div>
            </div>
        </section>

        <footer>
            <div class="footer-wrapper">
                <button type="button" class="submit-button" >
                비밀번호 변경
                </button>
            </div>
        </footer>
    </div>
</body>
</html>