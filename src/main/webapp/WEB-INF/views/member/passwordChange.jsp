<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="/resources/css/member/passwordChange.css">
    <link rel="stylesheet" href="/resources/css/fonts.css">
    <link rel="stylesheet" href="/resources/css/memberCommon.css">
    <link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
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
        <form action="/member/changePw" method="post">
        <input type="hidden" id="memberId" name="memberId" value="${loginUser.memberId }">
            <div class="join-input">
                <div class="join-input-wrapper curPw">
                    <input class="join-input-input" type="password"  id="memberPw" placeholder="기존 비밀번호" maxlength="16">
                    <button type="button" class="password-eye" id="memberPwEye"><i id="toggle-eye" class="fa fa-eye fa-lg"></i></button>
                </div>
            </div>
            <p class="password ok">비밀번호가 일치합니다.</p>
           	<p class="password error">비밀번호가 일치하지 않습니다.</p>

            <div class="join-input">
                <div class="join-input-wrapper newPw">
                    <input class="join-input-input" type="password" id="newMemberPw" name="memberPw" placeholder="새 비밀번호" maxlength="16" disabled>
	                <button type="button" class="password-eye" id="newMemberPwEye"><i id="toggle-eye" class="fa fa-eye fa-lg"></i></button>
                </div>
            </div>
    		<p class="passwordregex ok">비밀번호가 적절합니다.</p>
            <p class="passwordregex error">비밀번호는 영문/숫자/특수문자를 포함하여 8~16자로 입력해야합니다.</p>
            <div class="join-input">
                <div class="join-input-wrapper newPwCheck">
                    <input class="join-input-input" type="password" id="newMemberPwCheck" placeholder="새 비밀번호 확인" maxlength="16" disabled>
                    <button type="button" class="password-eye" id="newMemberPwCheckEye"><i id="toggle-eye" class="fa fa-eye fa-lg"></i></button>
                </div>
            </div>
            <p class="passwordCheck ok">비밀번호가 일치합니다.</p>
            <p class="passwordCheck error">비밀번호가 일치하지 않습니다.</p>
        </section>

        <footer>
            <div class="footer-wrapper">
                <button type="submit" class="submit-button" disabled>
                비밀번호 변경
                </button>
            </div>
        </footer>
    </div>
    <script src="/resources/js/member/passwordChange.js"></script>
    <script src="/resources/js/member/passwordChangeInput.js"></script>
</body>
</html>