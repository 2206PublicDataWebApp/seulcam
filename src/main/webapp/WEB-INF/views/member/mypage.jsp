<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no">
    <title>마이페이지</title>
    <link rel="stylesheet" href="/resources/css/member/mypage.css">
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
                    <ul class="icon-list">
                        <li><a href="/member/mypageMemberView"><i class="setting-icon"></i></a></li>
                        <li><a href="#"><i class="cart-icon"></i></a></li>
                    </ul>
                </div>
            </header>
        </div>
    
    

    <!-- Section -->
    <section>
        <div class="first-layout-wrapper">
            <div class="nickname-layout">
                <div class="nickname-box">
                    <div class="profile-box">
                        <label class="profileImage" for="profileImage">
                            <div class="profile">
                                <img class="profile-default" src="https://image.msscdn.net/mfile_s01/_simbols/_basic/c.png"> 
                            </div>
                            <span class="camera-box">
                                <img class="camera" src="/resources/images/camera.png">
                            </span>
                        </label>
                        <input type="file" name="profileImage" id="profileImage">
                    </div>
                    <a class="nickname-change" href="/member/nicknameChangeView"">
                        <p class="nickname">
                            campcamp
                        </p>
                        <img class="pencil" src="/resources/images/pencil.png">
                    </a>
                </div>
            </div>

            <div class="order-list">
                <a class="order-box" href="#">
                    <p class="order-number">0</p>
                    <p class="order-text">입금<br>결제</p>
                </a>

                <a class="order-box" href="#">
                    <p class="order-number">0</p>
                    <p class="order-text">배송 중<br>픽업 대기</p>
                </a>


                <a class="order-box" href="#">
                    <p class="order-number">0</p>
                    <p class="order-text">배송 완료<br>픽업 완료</p>
                </a>
            </div>
        </div>

        <div class="second-layout-wrapper">
            <div>
                <h3 class="shop-info">쇼핑정보</h3>
                <ul class="info-list">
                    <li class="list-item">
                        <a class="item-link" href="#">주문/배송/픽업 조회</a>
                    </li>

                    <li class="list-item">
                        <a class="item-link" href="#">취소/교환/환불 내역</a>
                    </li>

                    <li class="list-item">
                        <a class="item-link" href="#">포인트 내역 조회</a>
                    </li>

                    <li class="list-item">
                        <a class="item-link" href="#">상품 후기 조회</a>
                    </li>
                </ul>
            </div>

            <div class="second-shop-layout">
                <h3 class="shop-info">캠핑장</h3>
                <ul class="info-list">
                    <li class="list-item">
                        <a class="item-link" href="#">캠핑장 예약 조회</a>
                    </li>

                    <li class="list-item">
                        <a class="item-link" href="#">캠핑장 댓글 조회</a>
                    </li>

                    <!--<li class="list-item">
                        <a class="item-link" href="#">FAQ</a>
                    </li>

                    <li class="list-item">
                        <a class="item-link" href="#">공지사항</a>
                    </li>-->
                </ul>
            </div>
        </div>
    </section>

    <footer>
        <div class="footer-wrapper">
            <a class="go-main"href="#"><b>메인으로</b></a>
            <button>
                <span>khuser01</span>
                <b>로그아웃</b>
            </button>
        </div>
    </footer>

</div>

</body>
</html>