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
                <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="/resources/css/fonts.css">
                <link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
                <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

                <!-- jQuery -->
                <script src="../../../resources/js/jquery-3.6.1.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"
                    integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk"
                    crossorigin="anonymous"></script>
                <!-- ✅ Load slick CSS ✅ -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css"
                    integrity="sha512-wR4oNhLBHf7smjy0K4oqzdWumd+r5/+6QO/vDda76MW5iug4PT7v86FoEkySIJft3XA0Ae6axhIvHrqwm793Nw=="
                    crossorigin="anonymous" referrerpolicy="no-referrer" />

                <!-- ✅ Load slick theme CSS ✅ -->
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"
                    integrity="sha512-17EgCFERpgZKcm0j0fEq1YCJuyAWdz9KUtv1EjVuaOz8pDnh/0nZxmU6BBXwaaxqoi9PQXnRWqlcDB027hgv9A=="
                    crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                    z-index: 1;
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

                .maps {
                    cursor: pointer;
                    border: none;
                    width: 250px;
                    height: 220px;
                }

                .campInfo {
                    padding-top: 9px;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                }




                .cm-line {
                    height: 10px;
                    background-color: #f1f1f1;
                    width: 100%;
                }

                .map_area {
                    display: flex;
                    justify-content: center;
                    margin-top: 20px;
                }

                .bookBtn {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    /* position: fixed; */
                    border-radius: 4px;
                    font-weight: 400;
                    font-size: 16px;
                    margin: 1px;
                    bottom: 0;
                    width: 50%;
                    height: 50px;
                    background-color: #0078ff;
                    color: white;
                }

                .btn_foot a {
                    text-decoration: none;
                    color: white;

                }

                .btn_foot {
                    position: fixed;
                    display: flex;
                    float: left;
                    bottom: 0;
                    left: 50%;
                    z-index: 200;
                    background: #fff;
                    height: 53px;
                    width: 100%;
                    max-width: 768px;
                    transform: translateX(-50%);
                    cursor: pointer;
                }

                .listView {
                    cursor: pointer;
                    border-radius: 3px;
                    border: 1px solid;
                    padding: 3px 7px 3px 7px;
                    color: #0078ff;
                }

                .review-product-information_thumbnail>img {
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    height: 100%;
                    border-radius: 4px;
                    transform: translate(-50%, -50%);
                    -o-object-fit: contain;
                    object-fit: contain;

                }

                .review-product-information_thumbnail {
                    overflow: hidden;
                    position: relative;
                    width: 60px;
                    height: 40px;
                }

                .review-product-information {
                    cursor: pointer;
                    display: flex !important;
                    max-height: 54px;
                    align-items: center;
                    padding-bottom: 5px;
                    margin-bottom: 5px;
                    justify-content: space-between;
                }

                .review-information>span {
                    align: right;
                    margin-top: 15px;
                }

                .review-product-information-text {

                    width: calc(100% - 145px);
                    margin-left: 10px;
                    font-size: 12px;
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
                                <h2 style="margin: 0; font-weight: bold;">캠핑장 좋아요 조회</h2>
                            </div>
                        </header>
                    </div>
                    <div class="cm-line"></div>
                    <section>
                        <div class="order-check">
                            <div class="check-bar">

                                <c:if test="${myLikeCount != 0}">
                                    <label for="check-all">좋아요 누른 캠핑장 ${myLikeCount}개</label>
                                    <p class="listView" data-bs-toggle='modal' data-bs-target='#exampleModal'>
                                        리스트보기</p>
                                </c:if>
                                <c:if test="${myLikeCount == 0}">
                                    <label for="check-all">아직 좋아요 누른 캠핑장이 없어요!</label>
                                </c:if>
                            </div>
                        </div>
                        <div class="layout-wrapper">
                            <div style="height: 100%; overflow:auto; ">
                                <div class="map_area">
                                    <div id="map" style="width:90%;height:600px;"></div>
                                    <hr>
                                </div>
                            </div>
                            <br><br><br>


                        </div>


                        <!-- <div class="product-box nocamp">
                    <h3>캠핑장 예약내역이 없습니다.</h3>
                    <p style="color: gray;">캠핑장을 예약해 보세요</p>
                    <a href="/camp/campList.kh" class="campListBtn">캠핑장 보러가기</a>    
                    
                </div> -->
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">캠핑장 좋아요 리스트</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>

                                    <div class="modal-body">
                                        <div class="list-slick">
                                            <div class="list-wrapper">
                                                <c:forEach var="myLikeList" items="${lList }" varStatus="i">
                                                    <div class="review-product-information"
                                                        onclick='window.open("/camp/campDetail.kh?contentId="+${myLikeList.campId }+"")'>
                                                        <div class="review-product-information_thumbnail">
                                                            <img src="${myLikeList.imgUrl}">
                                                        </div>
                                                        <div class="review-product-information-text">
                                                            <div><b>${myLikeList.campName}</b></div>
                                                            <div>${myLikeList.campAddr}</div>
                                                        </div>
                                                        <span style="float: left;">${myLikeList.campLikeDate}</span>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="padding: 10px;">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">닫기</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </section>
                    <div class="btn_foot">

                        <a href="/camp/campList.kh" style="width: 100%;" class="bookBtn">캠핑장 구경하러 가기</a>

                    </div>
                    <footer>

                    </footer>
                </div>


                <!-- ✅ load jQuery ✅ -->
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

                <!-- ✅ load Slick ✅ -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"
                    integrity="sha512-XtmMtDEcNz2j7ekrtHvOVR4iwwaD6o/FUJe6+Zq+HgcCsk3kj4uSQQR8weQ2QVj1o0Pk6PwYLohm206ZzNfubg=="
                    crossorigin="anonymous" referrerpolicy="no-referrer"></script>

                <script type="text/javascript"
                    src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=2i99b6lxe8&submodules=geocoder"></script>
                <script>
                    $('#exampleModal').on('shown.bs.modal', function () {
                        $('.list-wrapper').slick({
                            slidesToShow: 6,
                            slidesToScroll: 6,
                            vertical: true,
                            arrows: false,
                            dots: true
                        });
                    })

                    //지도생성

                    var mapOptions = {
                        center: new naver.maps.LatLng(35.8404, 127.600),
                        zoom: 7,
                        zoomControl: true,
                        zoomControlOption: {
                            position: naver.maps.Position.TOP_RIGHT,
                            style: naver.maps.ZoomControlStyle.SMALL
                        }
                    };
                    //mapOptions를 아래 변수에 넣어서 구문을 하나로 합칠수도있음
                    var map = new naver.maps.Map('map', mapOptions); //지도생성

                    //마커 배열생성
                    let markers = new Array();
                    let infoWindows = new Array();

                    $(document).ready(function () {
                        loadLike();

                    })
                    function loadLike() {
                        $.ajax({
                            url: "/camp/myLikeView.kh",
                            type: "get",
                            data: {},
                            success: function (data) {
                                for (var i = 0; i < data.length; i++) {

                                    //마커 찍기
                                    var marker = new naver.maps.Marker({//마커생성
                                        position: new naver.maps.LatLng(data[i].mapY, data[i].mapX), //옵션설정
                                        title: data[i].campName,
                                        map: map,
                                        icon: {
                                            content: '<img src="/resources/images/heart.png" style="width : 20px;height:22px; margin-left:3px;"></img>',
                                            size: new naver.maps.Size(26, 36)

                                        }
                                    });


                                    var titleCamp = data[i].campName;
                                    var campAddr = data[i].campAddr;

                                    //마커에 정보창 표시
                                    var contentStr = "<div class='maps' onclick ='location.href=\"/camp/campDetail.kh?contentId=" + data[i].campId + "\"''><div class=''  style='height: 130px; width: 100%; margin-bottom: 10px; background: url(" + data[i].imgUrl + ") no-repeat center center #343a40; background-size: 100%;'></div><div class='campInfo'><h6><b>" + titleCamp + "</b></h6><p>" + campAddr + "</p></div></div>";
                                    var infoWindow = new naver.maps.InfoWindow({
                                        content: contentStr
                                    });
                                    markers.push(marker);
                                    infoWindows.push(infoWindow);
                                }
                                var k = 0;
                                function getClickHandler(seq) {
                                    return function (e) {  // 마커를 클릭하는 부분
                                        k = seq;
                                        var marker = markers[seq], // 클릭한 마커의 시퀀스로 찾는다.
                                            infoWindow = infoWindows[seq]; // 클릭한 마커의 시퀀스로 찾는다

                                        if (infoWindow.getMap()) {
                                            infoWindow.close();
                                        } else {
                                            infoWindow.open(map, marker); // 표출
                                        }
                                    }
                                }



                                for (var i = 0, ii = markers.length; i < ii; i++) {
                                    // console.log(markers[i], getClickHandler(i));
                                    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
                                }
                                naver.maps.Event.addListener(map, 'click', function (e) {
                                    var marker = markers[k], // 클릭한 마커의 시퀀스로 찾는다.
                                        infoWindow = infoWindows[k];
                                    infoWindow.close();
                                });
                            },
                            error: function (request, status, error) {
                                console.log("code: " + request.status)
                                console.log("message: " + request.responseText)
                                console.log("error: " + error);
                            }

                        })
                    }

                </script>

            </body>

            </html>