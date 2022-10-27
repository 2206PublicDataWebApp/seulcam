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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="../../../resources/js/jquery-3.6.1.min.js"></script>
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
                        <button class="go-home" onclick="location.href='/';">
                            <img src="/resources/images/home.png">
                        </button>
                    </div>
                </div>
            </header>
        </div>

        <section>
        <form action="/member/changeAddress" method="post">
        <input type="hidden" name="memberId" value="${loginUser.memberId }">
            <div class="section-wrapper">
                <div class="join-input">
                    <label for="memberName">
                        이름
                        <span class="label-essential"></span>
                    </label>
                    <div class="join-input-wrapper">
                        <input class="join-input-input" type="text" id="memberName" name="memberName" placeholder="수령인" value="${member.memberName }">
                    </div>
                </div>

                <div class="join-input">
                    <label for="memberPhone">
                        휴대전화
                        <span class="label-essential"></span>
                    </label>
                    <div class="join-input-wrapper">
                        <input class="join-input-input" type="text" id="memberPhone" name="memberPhone" placeholder="-를 빼고 입력해주세요." value="${member.memberPhone }">
                    </div>
                </div>

                <div class="join-input">
                    <label for="zipcode">
                        주소
                        <span class="label-essential"></span>
                    </label>
                    <div class="address-input">
                        <input type="text" class="zipcode" id="memberZip" placeholder="우편번호" name="memberZip" value="${member.memberZip }" readonly>
                        <button type="button" class="find-address" onclick="addrSearch()">주소찾기</button>
                    </div>
                    <div class="join-input-wrapper addr">
                        <input class="join-input-input" type="text" id="address1" placeholder="주소" name="memberAddress1" value="${member.memberAddress1 }" readonly>
                    </div>
                    <div class="join-input-wrapper addr">
                        <input class="join-input-input" type="text" id="address2" placeholder="상세 주소" name="memberAddress2" value="${member.memberAddress2 }">
                    </div>
                </div>

            </div>
        </section>

        <footer>
            <div class="footer-wrapper">
                <button type="submit" class="submit-button" >
                등록
                </button>
            </div>
        </footer>
        </form>
    </div>
    
    <script src="/resources/js/member/addressChange.js"></script>
</body>
</html>