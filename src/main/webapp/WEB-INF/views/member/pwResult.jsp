<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>비밀번호 재설정</title>
    <link rel="stylesheet" href="/resources/css/member/pwResult.css">
    <link rel="stylesheet" href="/resources/css/memberCommon.css">
    <link rel="stylesheet" href="/resources/css/fonts.css">
    <link rel="shortcut icon" href="resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="resources/images/faviconlogo.ico" type="image/x-icon">
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
                        비밀번호 재설정
                    </h2>
                </div>
            </header>
        </div>

        <!-- content -->
        <section>
        <form action="/member/changePw" method="POST">
			<input type="hidden" name="memberId" value="${memberId }" readonly>
            <h3>새로운 비밀번호를 입력해주세요.</h3>
            <div class="join-input">
                <p class="pw-result">
                    아이디 : <b>${memberId }</b> 
                </p>
                <div class="join-input-wrapper">
                    <input class="join-input-input" type="password" id="memberPw" name="memberPw" placeholder="새 비밀번호" maxlength="30">
                    <button type="button" class="password-eye" id="memberPwEye"><i id="toggle-eye" class="fa fa-eye fa-lg"></i></button>
                </div>
            <p class="passwordregex ok">비밀번호가 적절합니다.</p>
            <p class="passwordregex error">비밀번호는 영문/숫자/특수문자를 포함하여 8~16자로 입력해야합니다.</p>
            </div>
    
            <div class="join-input">
                <div class="join-input-wrapper">
                    <input class="join-input-input" type="password" id="memberPwCheck" placeholder="새 비밀번호 확인" maxlength="30">
                    <button type="button" class="password-eye" id="memberPwCheckEye"><i id="toggle-eye" class="fa fa-eye fa-lg"></i></button>
                </div>
            </div>
            <p class="passwordCheck ok">비밀번호가 일치합니다.</p>
            <p class="passwordCheck error">비밀번호가 일치하지 않습니다.</p>
        </section>

        <footer>
            <div class="footer-wrapper">
                <button type="submit" class="submit-button" disabled>
                비밀번호 재설정
                </button>
            </div>
        </footer>
    </div>
    </form>
    <script src="/resources/js/member/pwResult.js"></script>
    <script src="/resources/js/member/registerPw.js"></script>
</body>
</html>