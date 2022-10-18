<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no">
    <title>닉네임 변경</title>
    <link rel="stylesheet" href="/resources/css/nicknameChange.css">
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
                        <button class="go-back">
                            <img src="/resources/images/back_arrow.png" onclick="history.back()">
                        </button>
                    </div>
                    <h2>
                        닉네임 변경
                    </h2>
                </div>
            </header>
        </div>
    
    
        <section>
            <div class="section-wrapper">
                <input type="text" class="nickname-change" placeholder="닉네임 입력(최대 15자)" maxlength="15">
                <p class="current-nickname">현재 닉네임 : campcamp</p>
                <ul>
                    <li>길이는 최대 15자 이내</li>
                    <li>중복 닉네임 불가</li>
                    <li>이모티콘 및 특수문자 사용 불가</li>
                </ul>
            </div>
        </section>

        <footer>
            <div class="footer-wrapper">
                <button type="button" class="submit-button" >
                변경
                </button>
            </div>
        </footer>

    </div>
</body>
</html>