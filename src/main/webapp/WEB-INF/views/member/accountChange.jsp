<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>환불 계좌 관리</title>
    <link rel="stylesheet" href="/resources/css/accountChange.css">
    <link rel="stylesheet" href="/resources/css/fonts.css">
    <link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
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
                        환불 계좌 관리
                    </h2>

                    <div class="home-layout">
                        <button class="go-home" onclick="location.href='/';">
                            <img src="/resources/images/home.png">
                        </button>
                    </div>
                </div>
            </header>
        </div>

        <!-- Section -->
        <section>
            <div class="account-wrapper">
                <p class="account-text">
                    환불 처리를 위해 계좌 정보를 수집, 이용하며, 입력하신 정보는
                    환불 목적으로만 이용됩니다.
                </p>

                <div class="account-box">
                    <div class="order-form">
                        <h4 class="order-form-title">예금주</h4>
                        <div class="input-box">
                            <input type="text" class="order-form-input" value="" placeholder="예금주를 입력해주세요.">
                        </div>
                    </div>

                    <div class="order-form">
                        <h4 class="order-form-title">입금 은행</h4>
                        <div class="input-box">
                            <select class="order-select">
                                <option>입금은행을 선택해주세요.</option>
                                <option value="bank1">우리은행</option>
                                <option value="bank2">신한은행</option>
                                <option value="bank3">기업은행</option>
                                <option value="bank4">대구은행</option>
                                <option value="bank5">부산은행</option>
                                <option value="bank6">광주은행</option>
                                <option value="bank7">경남은행</option>
                                <option value="bank8">토스뱅크</option>
                                <option value="bank9">농협중앙회</option>
                            </select>
                        </div>
                    </div>

                    <div class="order-form">
                        <h4 class="order-form-title">계좌번호</h4>
                        <div class="input-box">
                            <input type="text" class="order-form-input" value="" placeholder="계좌번호를 입력해 주세요.">
                        </div>
                    </div>
                </div>
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