<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>배송지 관리</title>
    <link rel="stylesheet" href="/resources/css/member/addressChange.css">
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
                        배송지 관리
                    </h2>

                    <div class="home-layout">
                        <button class="go-home">
                            <img src="/resources/images/home.png">
                        </button>
                    </div>
                </div>
            </header>
        </div>

        <section>
            <div class="section-wrapper">
                <div class="join-input">
                    <label for="memberName">
                        이름
                        <span class="label-essential"></span>
                    </label>
                    <div class="join-input-wrapper">
                        <input class="join-input-input" type="text" id="memberName" placeholder="수령인">
                    </div>
                </div>

                <div class="join-input">
                    <label for="memberPhone">
                        휴대전화
                        <span class="label-essential"></span>
                    </label>
                    <div class="join-input-wrapper">
                        <input class="join-input-input" type="text" id="memberPhone" placeholder="-를 빼고 입력해주세요.">
                    </div>
                </div>

                <div class="join-input">
                    <label for="zipcode">
                        주소
                        <span class="label-essential"></span>
                    </label>
                    <div class="address-input">
                        <input type="text" class="zipcode" placeholder="우편번호">
                        <button type="button" class="find-address">주소찾기</button>
                    </div>
                    <div class="join-input-wrapper addr">
                        <input class="join-input-input" type="text" id="address1" placeholder="주소">
                    </div>
                    <div class="join-input-wrapper addr">
                        <input class="join-input-input" type="text" id="address2" placeholder="상세 주소">
                    </div>
                </div>

            </div>
        </section>

        <footer>
            <div class="footer-wrapper">
                <button type="button" class="submit-button" >
                등록
                </button>
            </div>
        </footer>
    </div>
</body>
</html>