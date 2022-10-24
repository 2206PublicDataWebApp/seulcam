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
    <link rel="stylesheet" href="/resources/css/memberCommon.css">
    <link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <script src="../../../resources/js/jquery-3.6.1.min.js"></script>
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
        <input type="hidden" id="memberId" name="memberId" value="${loginUser.memberId }">
            <div class="join-input">
                <div class="join-input-wrapper" class="curPw">
                    <input class="join-input-input" type="password" name="memberPw" id="memberPw" placeholder="기존 비밀번호" maxlength="16">
                    <button type="button" class="password-eye"><i id="toggle-eye" class="fa fa-eye fa-lg"></i></button>
                </div>
            </div>
            <p class="password ok">비밀번호가 일치합니다.</p>
           	<p class="password error">비밀번호가 일치하지 않습니다.</p>

            <div class="join-input">
                <div class="join-input-wrapper">
                    <input class="join-input-input" type="password" id="newMemberPw" placeholder="새 비밀번호" maxlength="16">
                    <button type="button" class="password-eye"><i id="toggle-eye" class="fa fa-eye fa-lg"></i></button>
                </div>
            </div>
    		<p class="newpassword error">8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합해주세요.</p>
            <div class="join-input">
                <div class="join-input-wrapper">
                    <input class="join-input-input" type="password" id="newMemberPwCheck" placeholder="새 비밀번호 확인" maxlength="16">
                    <button type="button" class="password-eye"><i id="toggle-eye" class="fa fa-eye fa-lg"></i></button>
                </div>
            </div>
        </section>

        <footer>
            <div class="footer-wrapper">
                <button type="button" class="submit-button" disabled>
                비밀번호 변경
                </button>
            </div>
        </footer>
    </div>
    <script src="/resources/js/member/passwordChange.js"></script>
    <script src="/resources/js/member/pwInputCommon.js"></script>
</body>
</html>