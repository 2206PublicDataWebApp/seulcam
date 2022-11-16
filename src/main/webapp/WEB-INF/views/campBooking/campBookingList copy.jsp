<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no">
                <title>마이 캠핑장 예약</title>
                <link rel="stylesheet" href="/resources/css/camp/switch.css">
                <!-- <link href="../resources/css/bootstrap.min.css" rel="stylesheet"> -->
                <link rel="stylesheet" href="/resources/css/fonts.css">
                <link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
                <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
                <!-- jQuery -->
                <script src="../../../resources/js/jquery-3.6.1.min.js"></script>
            </head>
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }

                body {
                    font-size: 14px;
                    line-height: 1.5;
                    color: #000;
                    background-color: #f1f1f1;
                }

                .body-wrapper {
                    max-width: 768px;
                    margin: 0 auto;
                    background-color: white;
                    min-height: 100vh;
                }

                button {
                    border: 0;
                    background: 0 0;
                    cursor: pointer;
                }

                a {
                    text-decoration: none;
                    color: black;
                }

                h2 {
                    font-size: 16px;
                }

                h3 {
                    text-align: center;
                }

                li {
                    list-style: none;
                }

                img {
                    max-width: 100%;
                    border: none;
                    line-height: 0;
                    vertical-align: top;
                }



                /* Header */
                #header-block {
                    height: 50px;
                }

                header {
                    position: fixed;
                    left: 0px;
                    right: 0px;
                    top: 0px;
                    height: 50px;
                    background-color: rgb(255, 255, 255);
                    z-index: 10;
                    max-width: 768px;
                    margin: 0 auto;
                }

                .header-wrapper {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    max-width: 768px;
                    margin: 0 auto;
                    height: 50px;
                    position: relative;
                }

                .back-layout {
                    display: flex;
                    position: absolute;
                    align-items: center;
                    top: 5px;
                    left: 5px;
                }

                .go-back {
                    display: inline-flex;
                    position: relative;
                    width: 40px;
                    height: 40px;
                    padding: 5px;
                }

                .go-back img {
                    width: 25px;
                    height: 25px;
                }

                /* Section */
                .cm-line {
                    height: 10px;
                    background-color: #f1f1f1;
                }

                .check-bar {
                    display: flex;
                    padding: 15px 15px 0px 15px;
                    justify-content: space-between;
                    align-items: center;
                }

                .check-all {
                    display: none;
                }

                .check-all:checked+label::before {
                    background-color: #0078ff;
                    border: 1px solid #0078ff;
                }

                .check-all:checked+label::after {
                    position: absolute;
                    content: '';
                    width: 3px;
                    height: 6px;
                    border-right: 1.5px solid #fff;
                    border-bottom: 1.5px solid #fff;
                    transform: rotate(45deg);
                    display: block;
                    left: 7px;
                    top: 6px;
                }

                .check-label {
                    padding-left: 26px;
                    font-size: 14px;
                    cursor: pointer;
                    position: relative;
                }

                .check-label::before {
                    position: absolute;
                    display: block;
                    width: 17px;
                    height: 17px;
                    border: 1px solid #ccc;
                    border-radius: 100%;
                    background-color: #f1f1f1;
                    content: '';
                    cursor: pointer;
                    left: 0px;
                    top: 2px;

                }

                .delete-btn {
                    font-weight: 700;
                    font-size: 13px;
                    line-height: 1.5;
                    cursor: pointer;
                }

                .product-box {
                    display: flex;
                    padding: 24px 15px 20px;
                    cursor: pointer;
                }

                .thumbnail-box {
                    display: flex;
                    align-items: flex-start;
                }

                .thumbnail-link {
                    display: block;
                    overflow: hidden;
                    position: relative;
                    width: 70px;
                    height: 83px;
                    background-color: #f9f9f9;
                    isolation: isolate;
                }

                .thumbnail-image {
                    /* top: 50%; */
                    position: absolute;
                    /* left: 50%; */
                    width: 100%;
                }

                .product-info {
                    margin-left: 10px;
                    width: calc(100%);
                }

                /* .a-wrap {
    width: calc(100% - 22px);
} */

                .brand-name {
                    display: block;
                    font-size: 12px;
                }

                .product {
                    display: flex;
                    width: 100%;
                    justify-content: space-between;
                    align-items: flex-start;
                }

                .product-name {
                    display: block;
                    font-weight: 700;
                    font-size: 12px;
                    white-space: nowrap;
                    text-overflow: ellipsis;
                }

                .x-button {
                    position: relative;
                    cursor: pointer;
                    width: 15px;
                    height: 15px;
                }

                .x-button:after {
                    position: absolute;
                    top: 0;
                    left: 0;
                    content: "\2573";
                    color: black;
                    text-align: center;
                }

                .product-option {
                    color: #6e6e6e;
                    font-size: 12px;
                }

                .option-value {
                    display: flex;
                    font-size: 12px;
                    justify-content: space-between;
                    align-items: flex-end;
                }

                .item-amount-wrap {
                    display: flex;
                    margin-top: 6px;
                    justify-content: space-between;
                }

                .item-amount {
                    display: flex;
                    width: 74px;
                    height: 24px;
                    border: 1px solid #f3f3f3;
                    border-radius: 4px;
                    align-items: center;
                }

                .amount-minus {
                    width: 24px;
                    height: 100%;
                    padding: 3px;
                    background-color: #f3f3f3;
                    font-size: 14px;
                    font-weight: 600;
                }

                .product-amount {
                    width: 50%;
                    text-align: center;
                    border: 0;
                    border-radius: 0;
                    vertical-align: middle;
                    outline: 0;
                }

                .amount-plus {
                    width: 24px;
                    height: 100%;
                    padding: 3px;
                    background-color: #f3f3f3;
                    font-size: 14px;
                    font-weight: 600;
                }

                .order-payment {
                    padding: 30px 0;
                }

                .order-title-wrap {
                    position: relative;
                    margin: 0 15px;
                    padding-bottom: 20px;
                }

                .order-title {
                    font-weight: 600;
                    font-size: 16px;
                    text-align: left;
                }

                .order-title-count {
                    padding-left: 2px;
                    font-weight: 500;
                    font-size: 16px;
                    color: #777;
                }

                .order-line {
                    height: 1px;
                    background-color: #f5f5f5;
                    margin: 0 15px;
                }

                .order-cart-payment {
                    display: flex;
                    padding: 20px 15px;
                    justify-content: space-between;
                    align-items: center;
                }

                .total-span {
                    font-size: 16px;
                    font-weight: 600;
                }

                .total-price {
                    font-size: 18px;
                    font-weight: 600;
                }


                /* footer */
                footer {
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    right: 0;
                    max-width: 768px;
                    margin: 0 auto;
                    width: 100%;
                    padding: 12px 7px;

                }

                .footer-wrapper {
                    display: flex;
                    justify-content: center;
                }

                .submit-button {
                    background-color: #0078ff;
                    color: #fff;
                    display: flex;
                    width: 100%;
                    height: 50px;
                    border-radius: 4px;
                    font-weight: 400;
                    font-size: 16px;
                    justify-content: center;
                    align-items: center;
                    line-height: 1.5;
                }

                .footer-span1 {
                    opacity: 0.7;
                    color: #fff;
                    font-weight: 400;
                    font-size: 16px;
                    line-height: 1.5;
                }

                .footer-span1:after {
                    display: inline-block;
                    width: 1px;
                    height: 14px;
                    margin: -2px 12px 0;
                    background-color: #fff;
                    opacity: 0.4;
                    vertical-align: middle;
                    content: '';
                }

                .footer-span2 {
                    font-weight: 400;
                    font-size: 16px;
                    line-height: 1.5;
                    cursor: pointer;
                }

                .product-box {
                    margin: 10px;
                    box-shadow: 0px 1px 2px 0px rgb(0 0 0 / 25%);
                }

                .disabled {
                    position: relative;
                    height: 100%;
                }

                .disabled::before {
                    content: '';
                    position: absolute;
                    width: 96%;
                    height: 65%;
                    background-color: rgba(255, 255, 255, 0.75);
                    z-index: 2;
                }

                .com {
                    position: sticky;
                    font-size: 10px;
                    padding: 2px 6px;
                    border-radius: 4px;
                    background-color: gray;
                    z-index: 3;
                    color: #fff;
                }

                .campListBtn {
                    margin: 10px;
                    padding: 6px 30px 5px 30px;
                    color: #0078ff;
                    border: 1px solid #0078ff;
                    border-radius: 5px;
                }

                .campListBtn:hover {
                    color: white;
                    background-color: #0078ff;
                }

                .nocamp {
                    display: flex;
                    height: 300px;
                    justify-content: center;
                    align-items: center;
                    flex-direction: column;
                }

                .go-home {
                    display: inline-flex;
                    position: relative;
                    width: 40px;
                    height: 40px;
                    padding: 5px;
                }

                .home-layout {
                    display: flex;
                    position: absolute;
                    align-items: center;
                    top: 8px;
                    right: 5px;
                }
            </style>

            <body>
                <div class="body-wrapper">
                    <div id="header-block">
                        <header>
                            <div class="header-wrapper">
                                <div class="back-layout">
                                    <a href="/member/myPageView" class="go-back">
                                        <img src="/resources/images/back_arrow.png">
                                    </a>
                                </div>
                                <h2>마이 캠핑장 예약</h2>
                                <div class="home-layout">
                                    <button class="go-home" onclick="location.href='/';">
                                        <img src="/resources/images/home.png">
                                    </button>
                                </div>
                            </div>
                        </header>
                    </div>
                    <div class="cm-line"></div>
                    <section>
                        <div class="order-check">
                            <div class="check-bar">

                                <label for="check-all">전체예약 <b>
                                        ${cbList.size()}
                                    </b>개</label>
                                <!-- <button class="delete-btn">선택</button> -->
                            </div>
                        </div>
                        <c:forEach items="${cbList }" var="campBookingList" varStatus="i">
                            <!-- 현재날짜 -->
                            <c:set var="date" value="<%=new java.util.Date()%>" />
                            <c:set var="today">
                                <fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />
                            </c:set>
                            <!-- 마지막날짜 -->
                            <fmt:parseDate value="${campBookingList.lastDay }" var="dateValue" pattern="yyyy-MM-dd" />
                            <c:set var="lastDay">
                                <fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />
                            </c:set>
                            <c:choose>
                                <c:when test="${today > lastDay}">
                                    <div class="product-box disabled"
                                        onclick='location.href="/campBooking/campBookingDetail.kh?bookingNo="+${campBookingList.bookingNo }+""'>
                                </c:when>
                                <c:when test="${campBookingList.bookCancleStatus == 'Y'}">
                                    <div class="product-box disabled"
                                        onclick='location.href="/campBooking/campBookingDetail.kh?bookingNo="+${campBookingList.bookingNo }+""'>
                                </c:when>
                                <c:otherwise>
                                    <div class="product-box"
                                        onclick='location.href="/campBooking/campBookingDetail.kh?bookingNo="+${campBookingList.bookingNo }+""'>
                                </c:otherwise>
                            </c:choose>
                            <div class="order-thumbnail">
                                <div class="thumbnail-box">
                                    <a href="#" class="thumbnail-link">
                                        <img class="thumbnail-image" style="width:100%; height: 100%;"
                                            src="${campBookingList.camp.firstImageUrl }" />
                                    </a>
                                </div>
                            </div>
                            <div class="product-info">
                                <div class="product">
                                    <div class="brand-info">
                                        <div class="a-wrap">
                                            <c:if test="${today > dateValue}">
                                            </c:if>
                                            <c:choose>
                                                <c:when test="${campBookingList.bookCancleStatus == 'Y'}">
                                                    <p class="brand-name">예약번호 : No.${campBookingList.bookingNo } <span
                                                            class="com">취소완료</span></p>
                                                </c:when>
                                                <c:when test="${today > lastDay}">
                                                    <p class="brand-name">예약번호 : No.${campBookingList.bookingNo } <span
                                                            class="com">이용완료</span></p>
                                                </c:when>
                                                <c:otherwise>
                                                    <p class="brand-name">예약번호 : No.${campBookingList.bookingNo }</p>
                                                </c:otherwise>
                                            </c:choose>
                                            <p class="product-name">${campBookingList.campSite.campName}</p>
                                        </div>
                                    </div>
                                    <span class="brand-name"><b>예약일 :
                                            <fmt:formatDate value="${campBookingList.bookDate }" pattern="yyyy-MM-dd" />
                                        </b></span>
                                </div>
                                <div class="option-value">
                                    <span class="product-option">${campBookingList.firstDay } ~
                                        ${campBookingList.lastDay } (${campBookingList.totalDay }박)</span>
                                    <span>
                                        <fmt:formatNumber value="${campBookingList.bookTotalPrice }" pattern="#,###" />원
                                    </span>
                                </div>
                                <div class="item-amount-wrap">
                                    <div class="item-amountc">
                                        <span class="product-option">입실 ${campBookingList.campSite.inTime }시 / 퇴실
                                            ${campBookingList.campSite.outTime }시</span>
                                    </div>
                                    <button></button>
                                </div>
                            </div>
                </div>
                </c:forEach>
                <c:if test="${empty cbList}">
                    <div class="product-box nocamp">
                        <h3>캠핑장 예약내역이 없습니다.</h3>
                        <p style="color: gray;">캠핑장을 예약해 보세요</p>
                        <a href="/camp/campList.kh" class="campListBtn">캠핑장 보러가기</a>

                    </div>
                </c:if>


                </section>

                <footer>
                    <!-- <div class="footer-wrapper">
                <button type="button" class="submit-button">
                    <span class="footer-span1">총 1개</span>
                    <span class="footer-span2">244,000</span>
                    원 결제하기
                </buttn>
            </div> -->
                </footer>
                </div>

            </body>

            </html>