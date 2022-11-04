<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/member/register.css">
    <link rel="stylesheet" href="/resources/css/fonts.css">
    <link rel="stylesheet" href="/resources/css/memberCommon.css">
    <link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <script src="../../../resources/js/jquery-3.6.1.min.js"></script>
    <title>회원가입</title>
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
            	<form action="/member/register" method="post">
	                <div class="join-membership">
	                    <div class="join-input">
	                        <label id="first-label" for="memberId">
	                            아이디
	                            <span class="label-essential"></span>
	                        </label>
	                        <div class="join-input-wrapper">
	                            <input class="join-input-input" type="text" name="memberId" id="memberId" placeholder="영문, 숫자 5-11자" maxlength="11" autocomplete="off">
	                        </div>
	                        <p class="id ok">해당하는 아이디가 존재하지 않습니다.</p>
	                        <p class="id error">해당하는 아이디가 존재합니다.</p>
	                        <p class="idreg error">영문과 숫자로 5자 이상으로 입력해주세요.</p>
	                    </div>
	
	                    <div class="join-input">
	                        <label for="memberPw">
	                            비밀번호
	                            <span class="label-essential"></span>
	                        </label>
	                        <div class="join-input-wrapper">
	                            <input class="join-input-input" type="password" id="memberPw" name="memberPw" placeholder="숫자, 영문, 특수문자 조합 최소 8자" maxlength="30">
	                            <button type="button" class="password-eye" id="memberPwEye"><i id="toggle-eye" class="fa fa-eye fa-lg"></i></button>
	                        </div>
	                        <p class="passwordregex ok">비밀번호가 적절합니다.</p>
            				<p class="passwordregex error">비밀번호는 영문/숫자/특수문자를 포함하여 8~16자로 입력해야합니다.</p>
	                    </div>
	
	                    <div class="join-input">
	                        <div class="join-input-wrapper">
	                            <input class="join-input-input" type="password" id="memberPwCheck" placeholder="비밀번호 재입력" maxlength="30">
	                            <button type="button" class="password-eye" id="memberPwCheckEye"><i id="toggle-eye" class="fa fa-eye fa-lg"></i></button>
	                        </div>
	                        <p class="passwordCheck ok">비밀번호가 일치합니다.</p>
            				<p class="passwordCheck error">비밀번호가 일치하지 않습니다.</p>
	                    </div>
	
	                    <div class="join-input">
	                        <label for="memberNickname">
	                            닉네임
	                            <span class="label-essential"></span>
	                        </label>
	                        <div class="join-input-wrapper">
	                            <input class="join-input-input" type="text" id="memberNickname" name="memberNickname" autocomplete="off">
	                        </div>
	                        <p class="nickname ok">해당하는 닉네임이 존재하지 않습니다.</p>
            				<p class="nickname error">해당하는 닉네임이 존재합니다.</p>
            				<p class="nickname regerror">한글, 영문 및 숫자로 입력해주세요.</p>
	                    </div>
	
	                    <div class="join-input">
	                        <label for="memberEmail">
	                            이메일
	                            <span class="label-essential"></span>
	                        </label>
	                        <div class="join-input-wrapper">
	                            <input class="join-input-input" type="email" name="memberEmail" id="memberEmail" autocomplete="off">
	                        </div>
	                    </div>
	                    <p class="emailregex ok">이메일이 유효합니다.</p>
            			<p class="emailregex error">유효한 이메일 주소를 입력해주세요.</p>
	                    <p class="email-text">계정 분실 시 본인인증 정보로 활용됩니다.</p>
	
	                    <div class="join-input">
	                        <label for="friend">
	                            초대 추천인 아이디
	                        </label>
	                        <div class="join-input-wrapper">
	                            <input class="join-input-input" type="text" name="memberRecommend" maxlength="11" autocomplete="off">
	                        </div>
	                    </div>
	                </div>
	
	                <div class="join-button-wrapper">
	                    <button type="submit" class="join-button" disabled>
	                        가입하기
	                    </button>
	                </div>
	
	                <ul>
	                    <li>본인인증이 어려운 경우(만 14세 미만 포함), <a href="/" class="no-login">메인으로 이동</a>할 수 있습니다.</li>
	                </ul>
                </form>
            </div>
            
        </section>
    </div>
    <script src="/resources/js/member/registerPw.js"></script>
    <script src="/resources/js/member/register.js"></script>
</body>
</html>