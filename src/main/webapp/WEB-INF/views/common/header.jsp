<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no">
    <title>header</title>
    <link rel="stylesheet" href="/resources/views/header.css">
    <!-- 제이쿼리 로드 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <header>
        <div class="wrapper">
            <h1><a href="#"><img class="logo" src="/small-logo.png">슬기로운 캠핑 생활</a></h1>
            <button class="more-btn">
                <i class="icon"></i>
            </button>
            <ul class="icon-list">
                <li><a href="#"><i class="search-icon"></i></a></li>
                <li><a href="#"><i class="cart-icon"></i></a></li>
                <li><a href="#"><i class="member-icon"></i></a></li>
            </ul>
        </div>
    </header>

    <nav class="main-navigation">
        <ul>
            <li>
                <a class="top20" href="#"><b>TOP 20</b></a>
            </li>
            
            <li>
                <a class="newarrival" href="#"><b>NEW ARRIVAL</b></a>
            </li>

            <li>
                <a href="#"><b>브랜드</b></a>
            </li>

            <li class="main-menu">
                <a>텐트/타프</a>
                <div class="content">
                    <ul class="sub-menu">
                        <li><a href="#"><b>전체 보기</b></a></li>
                        <li><a href="#">텐트</a></li>
                        <li><a href="#">타프</a></li>
                    </ul>
                </div>
            </li>

            <li class="main-menu">
                <a>테이블/체어</a>
                <div class="content">
                    <ul class="sub-menu">
                        <li><a href="#"><b>전체 보기</b></a></li>
                        <li><a href="#">테이블</a></li>
                        <li><a href="#">체어</a></li>
                    </ul>
                </div>
            </li>


            <li class="main-menu">
                <a>침낭/매트</a>
                <div class="content">
                    <ul class="sub-menu">
                        <li><a href="#"><b>전체 보기</b></a></li>
                        <li><a href="#">침낭</a></li>
                        <li><a href="#">매트</a></li>
                    </ul>
                </div>
            </li>

            <li class="main-menu">
                <a>식기</a>
                <div class="content">
                    <ul class="sub-menu">
                        <li><a href="#"><b>전체 보기</b></a></li>
                        <li><a href="#">코펠</a></li>
                        <li><a href="#">취사도구</a></li>
                        <li><a href="#">컵/머그컵</a></li>
                    </ul>
                </div>
            </li>

            <li class="main-menu">
                <a>화로/버너</a>
                <div class="content">
                    <ul class="sub-menu">
                        <li><a href="#"><b>전체 보기</b></a></li>
                        <li><a href="#">스토브</a></li>
                        <li><a href="#">화로대</a></li>
                        <li><a href="#">난로</a></li>
                    </ul>
                </div>
            </li>

            <li class="main-menu">
                <a>캠핑소품</a>
                <div class="content">
                    <ul class="sub-menu">
                        <li><a href="#"><b>전체 보기</b></a></li>
                        <li><a href="#">전자용품</a></li>
                        <li><a href="#">기타소품</a></li>
                    </ul>
                </div>
            </li>

        </ul>

        <a href="#"><b>캠핑장 예약</b></a>
        <a href="#"><b>로그인</b></a>
    </nav>

    <script src="/resources/js/menu.js"></script>
</body>
</html>



