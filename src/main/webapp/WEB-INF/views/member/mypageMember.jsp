<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no">
    <title>내 정보 관리</title>
    <link rel="stylesheet" href="/resources/css/mypageMember.css">
    <link rel="stylesheet" href="/resources/css/fonts.css">
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
                        내 정보 관리
                    </h2>

                    <div class="home-layout">
                        <button class="go-home" onclick="location.href='/';">
                            <img src="/resources/images/home.png">
                        </button>
                    </div>
                </div>
            </header>
        </div>

        <section>
            <div class="section-wrapper">
                <a class="user-info">
                    <p>
                        <b>회원 정보</b>
                        <span>khuser01</span>
                    </p>
                </a>

                <a class="user-info" href="/member/passwordChangeView">
                    <p>
                        비밀번호 변경
                        <img src="/resources/images/right_arrow.png">
                    </p>
                </a>

                <a class="user-info" href="/member/addressChangeView">
                    <p>
                        배송지 관리
                        <img src="/resources/images/right_arrow.png">
                    </p>
                </a>

                <a class="user-info" href="/member/accountChangeView">
                    <p>
                        환불 계좌 관리
                        <img src="/resources/images/right_arrow.png">
                    </p>
                </a>
            </div>


        </section>










    </div>
    




</body>
</html>