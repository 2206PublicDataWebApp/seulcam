<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/register.css">
    <link rel="stylesheet" href="/resources/css/fonts.css">
    <link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <title>회원가입</title>
    <!--jquery cdn으로 가져오기-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <div class="body-wrapper">
        <div id="header-block">
            <header>
                <h1>
                    슬기로운 캠핑 생활
                </h1>
                <div class="header-wrapper">
                    <div class="back-layout">
                        <button class="go-back" onclick="history.back()">
                            <img src="/resources/images/back_arrow.png">
                        </button>
                    </div>
                    <h2>
                        회원가입
                    </h2>
                </div>
            </header>
        </div>

        <!-- content -->
        <section>
            <div class="section-wrapper">
                <div class="join-membership">
                    <div class="join-input">
                        <label id="first-label" for="memberId">
                            아이디
                            <span class="label-essential"></span>
                        </label>
                        <div class="join-input-wrapper">
                            <input class="join-input-input" type="text" id="memberId" placeholder="영문, 숫자 5-11자" maxlength="11">
                        </div>
                        <p class="id-check"></p>
                    </div>

                    <div class="join-input">
                        <label for="memberPwd">
                            비밀번호
                            <span class="label-essential"></span>
                        </label>
                        <div class="join-input-wrapper">
                            <input class="join-input-input" type="password" id="memberPwd" placeholder="숫자, 영문, 특수문자 조합 최소 8자" maxlength="30">
                            <button type="button" class="password-eye"></button>
                        </div>
                        <p class="pwd-check"></p>
                    </div>

                    <div class="join-input">
                        <div class="join-input-wrapper">
                            <input class="join-input-input" type="password" id="memberPwdCheck" placeholder="비밀번호 재입력" maxlength="30">
                            <button type="button" class="password-eye active"></button>
                        </div>
                    </div>

                    <div class="join-input">
                        <label for="memberNickname">
                            닉네임
                            <span class="label-essential"></span>
                        </label>
                        <div class="join-input-wrapper">
                            <input class="join-input-input" type="text" id="memberNickname">
                        </div>
                    </div>

                    <div class="join-input">
                        <label for="memberEmail">
                            이메일
                            <span class="label-essential"></span>
                        </label>
                        <div class="join-input-wrapper">
                            <input class="join-input-input" type="email" id="memberEmail">
                        </div>
                    </div>
                    <p class="email-check"></p>
                    <p class="email-text">계정 분실 시 본인인증 정보로 활용됩니다.</p>

                    <div class="join-input">
                        <label for="friend">
                            초대 추천인 아이디
                        </label>
                        <div class="join-input-wrapper">
                            <input class="join-input-input" type="text" id="friend" maxlength="11">
                        </div>
                    </div>
                </div>

                <div class="join-button-wrapper">
                    <button type="submit" class="join-button" onclick="location.href='/member/congView';">
                        가입하기
                    </button>
                </div>

                <ul>
                    <li>본인인증이 어려운 경우(만 14세 미만 포함), <a href="/" class="no-login">메인으로 이동</a>할 수 있습니다.</li>
                </ul>
            </div>
        </section>
    </div>
    <script src="/resources/js/register.js"></script>
</body>
</html>