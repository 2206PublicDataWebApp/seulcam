<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no">
                <title>${camp.facltNm}</title>
                <link rel="stylesheet" href="/resources/css/camp/switch.css">
                <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="/resources/css/fonts.css">
                <!-- <link rel="stylesheet" href="/resources/css/memberCommon.css"> -->
                <link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
                <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
                <!-- jQuery -->
                <!-- <script src="../../../resources/js/jquery-3.6.1.min.js"></script> -->
                <!-- slick -->
                <!-- <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/> -->
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
            </head>
            <style>
                ul {
                    padding-left: 0;
                }

                body {
                    font-size: 14px;
                    color: #000;
                }

                header {
                    position: fixed;
                    left: 0px;
                    right: 0px;
                    top: 0px;
                    height: 50px;
                    background-color: rgb(255, 255, 255);
                    z-index: 200;
                    margin: 0 auto;
                }

                .header-wrapper {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    max-width: 385px;
                    margin: 0 auto;
                    height: 50px;
                    position: relative;
                }

                .body-wrapper {
                    max-width: 770px;
                    margin: 0 auto;
                    background-color: white;
                    min-height: 100vh;

                }

                /* 컨텐츠css */
                .detailMain {
                    padding-top: 70px;
                }

                .info_img {
                    padding: 5px 5px;
                    /* border-bottom: 10px solid rgb(243, 243, 243); */
                }

                .iconh {
                    border: 2px solid #000;
                    border-radius: 20%;

                }

                .iconh:hover {
                    background-color: #000;
                    color: #f1f1f1;
                }

                .infoTitle {
                    font-weight: bold;
                    color: rgb(39, 174, 96);
                    width: 100px;
                    padding: 5px;
                }

                .intro {
                    margin: auto;
                    padding: 10px;
                    border: 1px solid #ccc;
                }

                .maps {
                    padding: 10px;
                }

                .moreBlog {
                    border-radius: 5px;
                    border: 1px solid #343a40;
                    text-align: center;
                    padding: 7px;
                    font-size: 16px;
                }

                .moreBlog:hover {
                    background-color: #343a40;
                    color: #ccc;
                }

                .reviewWrite_area>div {
                    float: left;
                }

                .reviewWrite_area::after {
                    content: "";
                    display: block;
                    clear: both;
                }

                #input {
                    width: 80%;
                }

                .button {
                    width: 20%;
                    height: 100px;
                }

                .button>div {
                    position: relative;
                    top: 33px;
                }

                /* #reviewWrite {
        width: 95%;
    } */
                .star {
                    position: relative;
                    font-size: 1.5rem;
                    color: #ddd;
                }

                .star input {
                    width: 100%;
                    height: 100%;
                    position: absolute;
                    left: 0;
                    opacity: 0;
                    cursor: pointer;
                }

                .star span {
                    width: 100%;
                    position: absolute;
                    left: 0;
                    color: red;
                    overflow: hidden;
                    pointer-events: none;
                }

                .reviewList {
                    min-height: 100px;

                    width: 100%;
                }

                .reviewList::after {
                    content: "";
                    display: block;
                    clear: both;
                }

                .review_contents {
                    float: left;
                    width: 80%;
                    height: 100%;
                }

                .review_info {
                    width: 20%;
                    height: 100%;
                    padding: 5px;
                    float: left;
                }

                .review_contents p {
                    font-size: 20px;
                }

                .bi-trash-fill {
                    visibility: hidden;
                }

                .reviewList i {
                    padding-right: 5px;
                }

                .reviewList i:hover {
                    color: blue;
                }

                .post-slider .post-wrapper .card {
                    display: inline-block;
                }

                .card {
                    cursor: pointer;
                    height: 300px;
                }

                .likeBtn {
                    margin-left: 10px;
                    display: flex;
                    align-items: center;
                    color: #dc3545;
                    border: 2px solid #dc3545;
                    border-radius: 5px;
                    cursor: pointer;
                }

                .likeBtn:hover {
                    background-color: #dc3545;
                    color: #f1f1f1;
                }

                .alreadyLike {
                    background-color: #dc3545;
                    color: #f1f1f1;
                }

                .alreadyLike:hover {
                    border: 2px solid #9b1b28;
                    background-color: #9b1b28;
                    color: #f1f1f1;
                }

                .iZone {
                    display: flex;
                }

                .heart {
                    margin-top: 2px;
                    margin-left: 8px;
                    margin-right: 2px;
                }

                .likeCount {
                    font-size: 13pt;
                    margin-left: 5px;
                    margin-right: 6px;
                    margin-top: 3px;
                }

                .starCzone {
                    margin-left: 10px;
                    display: flex;
                    align-items: center;
                    color: #dc3545;
                    border: 2px solid #dc3545;
                    border-radius: 5px;
                }

                .starC {
                    margin-left: 8px;
                    margin-right: 2px;
                }

                .starCount {
                    font-size: 13pt;
                    margin-left: 5px;
                    margin-right: 6px;
                    margin-top: 3px;
                }
            </style>

            <body>

                <!-- 헤더&메뉴바 -->
                <header>
                    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
                </header>

                <!-- 컨텐츠 -->
                <div class="body-wrapper">

                    <div class="detailMain">
                        <div class="container">
                            <div class="info_img">
                                <div class="img-slick">
                                    <div class="img-wrapper">
                                        <div
                                            style='height: 450px; background: url(${camp.firstImageUrl}) no-repeat center center #343a40; background-size: 100%;'>
                                        </div>
                                    </div>

                                </div>
                                <br>
                                <div class='text-right tt' stlyle='padding-bottom: 0.75rem;'><small
                                        class='text-muted'>${camp.induty}</small></div>
                                <h3>${camp.facltNm}</h3>
                                <p>${camp.lineIntro}</p>
                                <div style="height: 100%; overflow:auto; ">
                                    <div class="iZone" style="width: 50%; float: left;">
                                        <a href="${camp.homepage}" target='_blank'>
                                            <svg class="iconh" xmlns="http://www.w3.org/2000/svg" width="36" height="36"
                                                fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
                                                <path fill-rule="evenodd"
                                                    d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
                                                <path fill-rule="evenodd"
                                                    d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
                                            </svg>
                                        </a>
                                        <c:if test="${likeCheck > 0}">
                                            <div class="likeBtn alreadyLike" onclick="likeButton()">
                                        </c:if>
                                        <c:if test="${likeCheck < 1}">
                                            <div class="likeBtn" onclick="likeButton()">
                                        </c:if>
                                        <svg class="heart" xmlns="http://www.w3.org/2000/svg" width="15" height="15"
                                            fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd"
                                                d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z">
                                            </path>
                                        </svg>
                                        <span class="likeCount">${likeCount}</span>
                                    </div>
                                    <div class="starCzone">
                                        <svg class="starC" xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                            <path
                                                d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                        </svg>
                                        </svg>
                                        <span class="starCount">
                                            <fmt:formatNumber type="number" pattern="0.00" value="${starAvg}" />
                                        </span>
                                    </div>
                                </div>
                                <div align="right" style=" width: 50%; float: left;">
                                    <c:if test="${camp.registAvi == 'Y'}">
                                        <a href="/camp/campSiteDetail.kh?contentId=${camp.contentId}"
                                            class="btn btn-outline-success">예약하러가기</a>
                                    </c:if>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div class="info_detail">
                            <h4>기본정보</h4>
                            <table>
                                <tr>
                                    <td class="infoTitle">캠핑형태</td>
                                    <td>${camp.induty}</td>
                                </tr>
                                <tr>
                                    <td class="infoTitle">환경</td>
                                    <td>${camp.lctCl}</td>
                                </tr>
                                <tr>
                                    <td class="infoTitle">대표번호</td>
                                    <td>${camp.tel}</td>
                                </tr>
                                <tr>
                                    <td class="infoTitle">주소</td>
                                    <td>${camp.addr1}</td>
                                </tr>
                            </table>
                            <hr>
                            <h4>캠핑장 소개</h4>
                            <div class="intro">
                                <p style="color: #767676;">${camp.intro}</p>
                            </div>
                            <hr>
                        </div>
                        <div class="blog_area row">
                            <h4>블로그 후기</h4>
                        </div>
                        <div class="moreBlog" onclick="blogMore()">
                            더보기
                        </div>
                        <hr>
                        <div class="map_area">
                            <h4>캠핑장 위치</h4>
                            <div class='text-right tt' stlyle='padding-bottom: 0.75rem;'><small class='text-muted'>주소 :
                                    ${camp.addr1}</small></div>
                            <div id="map" style="width:100%;height:400px;"></div>
                            <hr>
                        </div>
                        <div class="post-slider">
                            <h4 class="sider-title">함께 갈만한 가까운 캠핑장</h4>
                            <div class="post-wrapper">
                            </div>
                        </div>
                        <hr>
                        <div style="display: flex; margin-bottom: 5px;">
                            <h4 style="margin-top: 5px; margin-bottom: 0px;">리뷰등록</h4>
                            <span class="starCzone" style="border: 0; "><svg class="starC" style="margin-left: 0px;"
                                    xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-star-fill" viewBox="0 0 16 16">
                                    <path
                                        d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                </svg>
                                </svg>
                                <span class="starCount">
                                    <fmt:formatNumber type="number" pattern="0.00" value="${starAvg}" />
                                </span></span>
                        </div>
                        <div class="reviewWrite_area">
                            <div id="input">
                                <span class="star">
                                    ★★★★★
                                    <span id="checkstar">★★★★★</span>
                                    <input type="range" id="starCount" oninput="drawStar(this)" value="10" step="1"
                                        min="1" max="10">
                                </span>
                                <textarea style="border-radius: 5px;width: 95%;" name="reviewWrite" id="reviewWrite"
                                    rows="3" placeholder=" 리뷰를 남겨주세요."></textarea>
                            </div>
                            <div class="btn btn-secondary btn-block text-light button" onclick="insertReview()">
                                <div>등록</div>
                            </div>
                        </div>
                        <hr>
                        <div class="review_area">

                        </div>
                    </div>
                </div>

                <!-- 지도api -->
                <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                <script type="text/javascript"
                    src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=2i99b6lxe8&submodules=geocoder"></script>
                <!-- ✅ load jQuery ✅ -->
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

                <!-- ✅ load Slick ✅ -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"
                    integrity="sha512-XtmMtDEcNz2j7ekrtHvOVR4iwwaD6o/FUJe6+Zq+HgcCsk3kj4uSQQR8weQ2QVj1o0Pk6PwYLohm206ZzNfubg=="
                    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
                <script>

                    var page = 1;
                    var memberId = "${sessionScope.loginUser.memberId}";
                    var mapX = ${ camp.mapX };
                    var mapY = ${ camp.mapY };
                    var contentId = ${ camp.contentId };

                    // 블로그 글, 리뷰 리스트, 가까운 캠핑장 출력
                    $(document).ready(function () {
                        likeCheck()
                        campImgLoad()
                        blogLoad();
                        campReviewList();
                        nearCampLoad();
                    })

                    // 좋아요 버튼 클릭시 동작
                    function likeButton() {
                        if (memberId == "") {
                            alert("로그인이 필요한 서비스 입니다.")
                        } else {
                            $.ajax({
                                url: "/camp/campLike.kh",
                                type: "get",
                                data: {
                                    "memberId": memberId,
                                    "campId": contentId,
                                    "mapX": mapX,
                                    "mapY": mapY
                                },
                                async: false,
                                success: function (data) {
                                    if (data == "none") {
                                        alert("로그인이 필요한 서비스 입니다.");
                                        location.href = "/camp/campDetail.kh?contentId=" + contentId;
                                    } else if (data == "abnormal") {
                                        alert("비정상적인 접근입니다.");
                                        location.href = "/camp/campDetail.kh?contentId=" + contentId;
                                    } else {
                                        likeCount();
                                        likeCheck();
                                    }
                                },
                                error: function (request, status, error) {
                                    console.log("code: " + request.status)
                                    console.log("message: " + request.responseText)
                                    console.log("error: " + error);
                                }

                            })
                        }
                    }

                    // 별점 평균 출력
                    function starAvg() {
                        $.ajax({
                            url: "/camp/campStarAvg.kh",
                            type: "get",
                            data: {
                                "contentId": contentId
                            },
                            async: false,
                            success: function (data) {
                                var avg = parseFloat(data).toFixed(2);
                                $(".starCount").html(avg)
                            },
                            error: function (request, status, error) {
                                console.log("code: " + request.status)
                                console.log("message: " + request.responseText)
                                console.log("error: " + error);
                            }

                        })
                    }

                    // 좋아요 갯수 카운트
                    function likeCount() {
                        $.ajax({
                            url: "/camp/campLikeCount.kh",
                            type: "get",
                            data: {

                                "campId": contentId
                            },
                            async: false,
                            success: function (data) {
                                $(".likeCount").html(data)
                            },
                            error: function (request, status, error) {
                                console.log("code: " + request.status)
                                console.log("message: " + request.responseText)
                                console.log("error: " + error);
                            }

                        })
                    }

                    //로그인 한 아이디가 좋아요를 이미 눌렀을경우 표시
                    function likeCheck() {
                        if (memberId != "") {
                            $.ajax({
                                url: "/camp/campLikeCheck.kh",
                                type: "get",
                                data: {

                                    "memberId": memberId,
                                    "campId": contentId
                                },
                                async: false,
                                success: function (data) {
                                    if (data > 0) {
                                        $(".likeBtn").addClass("alreadyLike");
                                    } else {
                                        $(".likeBtn").removeClass("alreadyLike");
                                    }
                                },
                                error: function (request, status, error) {
                                    console.log("code: " + request.status)
                                    console.log("message: " + request.responseText)
                                    console.log("error: " + error);
                                }

                            })

                        }

                    }
                    var k = 0;
                    //블로그 출력용 함수
                    function blogLoad() {
                        var url = 'https://dapi.kakao.com/v2/search/blog'; /*URL*/
                        var queryParams = '?' + encodeURIComponent('sort') + '=' + encodeURIComponent('accuracy'); /**/
                        queryParams += '&' + encodeURIComponent('page') + '=' + encodeURIComponent(page);
                        queryParams += '&' + encodeURIComponent('size') + '=' + encodeURIComponent('5');
                        queryParams += '&' + encodeURIComponent('query') + '=' + encodeURIComponent('${camp.facltNm} 캠핑장'); /**/
                        queryParams += '&' + encodeURIComponent('serviceKey') + '=' + 'qbHoplMaKq5PUqUFEhfVjBpLiBxBcVPOw%2Fio3GvQ91q8xQjh%2BLZMz4caQ5Nqyt%2BU%2BeCGuAPRaJHRIhTzUqKmHw%3D%3D'; /*Service Key*/
                        var urlBlog = url + queryParams;
                        $.ajax({
                            url: urlBlog,
                            type: "GET",
                            data: {},
                            dataType: "json",
                            headers: { Authorization: "KakaoAK 7072f1c5ec76f11a0937d2337e6cad4e" },
                            // async: false,
                            success: function (data) {
                                var str = "";
                                
                                for (var i = 0; i < data.documents.length; i++) {
                                    str += "<a href='" + data.documents[i].url + "' target='_blank'><div class='row blog' style='margin: 10px;'>"
                                    str += "<div class='col-4'  style='max-height: 110px; max-width: 165px; background: url(" + data.documents[i].thumbnail + ") no-repeat center center #343a40; background-size: 100%;'></div>"
                                    str += "<div class='col-8 blog_body' style='overflow: hidden; height: 130px;'><h6><b>" + data.documents[i].title + "</b></h6><div class='text-right tt' stlyle='padding-bottom: 0.25rem;'><small class='text-muted'>작성일 : " + data.documents[i].datetime.substr(0, 10) + " | 블로그 : " + data.documents[i].blogname + "</small></div>"
                                    str += "<p>" + data.documents[i].contents + "</p></div></div></a>"
                                    k++;
                                }
                                if(k <= data.meta.total_count){
                                    $(".blog_area").append(str)

                                }
                                // console.log(data.meta.total_count)
                            },
                            error: function (request, status, error) {
                                console.log("code: " + request.status)
                                console.log("message: " + request.responseText)
                                console.log("error: " + error);
                            }
                        })
                    }

                    // 블로그 글 더보기
                    function blogMore() {
                        page++
                        blogLoad();
                    }

                    // 캠핑장 사진 파싱
                    function campImgLoad() {
                        var mapX = ${ camp.mapX };
                        var mapY = ${ camp.mapY };
                        var url = 'https://apis.data.go.kr/B551011/GoCamping/imageList'; /*URL*/
                        var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'qbHoplMaKq5PUqUFEhfVjBpLiBxBcVPOw%2Fio3GvQ91q8xQjh%2BLZMz4caQ5Nqyt%2BU%2BeCGuAPRaJHRIhTzUqKmHw%3D%3D'; /*Service Key*/
                        queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
                        queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10');
                        queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('WIN');
                        queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('seulcam'); /**/
                        queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('json');
                        queryParams += '&' + encodeURIComponent('contentId') + '=' + encodeURIComponent('${camp.contentId}');
                        var urli = url + queryParams;
                        console.log(urli)
                        $.ajax({
                            url: urli,
                            type: "GET",
                            data: {},
                            dataType: "json",
                            // async: false,
                            success: function (data) {
                                console.log(data)
                                var str = "";
                                for (var i = 1; i < data.response.body.items.item.length; i++) {
                                    var campItem = data.response.body.items.item;
                                    str += "<div  style='height: 450px; background: url(" + campItem[i].imageUrl + ") no-repeat center center #343a40; background-size: 100%;'></div>"
                                }
                                $(".img-wrapper").append(str);
                                $('.img-wrapper').slick({
                                    slide: 'div',
                                    slidesToShow: 1,
                                    slidesToScroll: 1,
                                    draggable: true,
                                    dots: true
                                });

                            },
                            error: function (request, status, error) {
                                console.log("code: " + request.status)
                                console.log("message: " + request.responseText)
                                console.log("error: " + error);
                            }
                        })
                    }

                    // 근처 캠핑장 데이터 파싱
                    function nearCampLoad() {
                        var mapX = ${ camp.mapX };
                        var mapY = ${ camp.mapY };
                        var url = 'https://apis.data.go.kr/B551011/GoCamping/locationBasedList'; /*URL*/
                        var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'qbHoplMaKq5PUqUFEhfVjBpLiBxBcVPOw%2Fio3GvQ91q8xQjh%2BLZMz4caQ5Nqyt%2BU%2BeCGuAPRaJHRIhTzUqKmHw%3D%3D'; /*Service Key*/
                        queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
                        queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10');
                        queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('WIN');
                        queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('seulcam'); /**/
                        queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('json');
                        queryParams += '&' + encodeURIComponent('mapX') + '=' + encodeURIComponent('${camp.mapX}');
                        queryParams += '&' + encodeURIComponent('mapY') + '=' + encodeURIComponent('${camp.mapY}');
                        queryParams += '&' + encodeURIComponent('radius') + '=' + encodeURIComponent('20000');
                        var urli = url + queryParams;
                        console.log(urli)
                        $.ajax({
                            url: urli,
                            type: "GET",
                            data: {},
                            dataType: "json",
                            // async: false,
                            success: function (data) {
                                console.log(data)
                                var str = "";
                                var j = 0;
                                for (var i = 0; i < data.response.body.items.item.length; i++) {
                                    var campItem = data.response.body.items.item;
                                    if (j != 0) {
                                        str += "<div class='card' style='width: 14rem;' onclick ='location.href=\"/camp/campDetail.kh?contentId=" + campItem[i].contentId + "\"'>"
                                        if (campItem[i].firstImageUrl == "") {
                                            str += "<img style='max-height:164.66px; height : 100%;' src='https://campingagains3.s3.ap-northeast-2.amazonaws.com/medium_2021_10_17_11_38_57_fad16366d0.png' class='card-img-top' alt=''><div class='card-body'>"
                                        } else {
                                            str += "<img style='max-height:164.66px;' src='" + campItem[i].firstImageUrl + "' class='card-img-top' alt=''><div class='card-body'>"
                                        }
                                        str += "<p class='card-text'><b>" + campItem[i].facltNm + "</b></p><p>" + campItem[i].addr1 + "</p></div></div>"
                                    }
                                    j++;
                                }
                                if (str == "") {
                                    $(".post-wrapper").append("없서용");
                                }
                                $(".post-wrapper").append(str);
                                slick()

                            },
                            error: function (request, status, error) {
                                console.log("code: " + request.status)
                                console.log("message: " + request.responseText)
                                console.log("error: " + error);
                            }
                        })
                    }

                    // 파싱받은 데이터 슬릭 처리
                    function slick() {
                        $('.post-wrapper').slick({
                            slide: 'div',        //슬라이드 되어야 할 태그
                            infinite: true,     //무한 반복 옵션     
                            slidesToShow: 3,        // 한 화면에 보여질 컨텐츠 개수
                            slidesToScroll: 3,        //스크롤 한번에 움직일 컨텐츠 개수
                            speed: 500,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
                            arrows: false,         // 옆으로 이동하는 화살표 표시 여부
                            dots: true,         // 스크롤바 아래 점으로 페이지네이션 여부
                            autoplay: true,            // 자동 스크롤 사용 여부
                            autoplaySpeed: 2000,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
                            pauseOnHover: true,        // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
                            vertical: false,        // 세로 방향 슬라이드 옵션
                            prevArrow: "<button type='button' class='slick-prev'>Previous</button>",
                            nextArrow: "<button type='button' class='slick-next'>Next</button>",
                            draggable: true,     //드래그 가능 여부 
                            responsive: [ // 반응형 웹 구현 옵션
                                {
                                    breakpoint: 500, //화면 사이즈 960px
                                    settings: {
                                        slidesToShow: 2
                                    }
                                },
                                {
                                    breakpoint: 400, //화면 사이즈 768px
                                    settings: {
                                        slidesToShow: 2
                                    }
                                }
                            ]

                        });


                    }

                    // 댓글 별점 구현
                    var reviewId = "";
                    const drawStar = (target) => {
                        console.log(target.id)
                        if (target.id == "starCount") {
                            $('.star #checkstar').css({ width: target.value * 10 + '%' });
                        } else {
                            $('.star #checkstar' + target.id + '').css({ width: target.value * 10 + '%' });
                        }
                    }

                    // 댓글 수정창 출력
                    function reviewModify(campReviewContents, campReviewNo, memberNickname, campReviewStar) {
                        // $("#11").css({visibility: 'hidden'})
                        // campReviewList()
                        console.log(campReviewContents)
                        var str = ""
                        str += "<br><div class='reviewList' style='padding : 5px; border : none; border-radius : 5px;'><div class='review_contents'>"
                        str += "<span class='star'>★★★★★<span id='checkstar" + campReviewNo + "' style='width : " + campReviewStar * 10 + "%'>★★★★★</span>"
                        str += "<input type='range' id='" + campReviewNo + "' oninput='drawStar(this)' value='" + campReviewStar + "' step='1' min='1' max='10'></span>"
                        str += "<textarea style='border-radius: 5px;width: 95%;' name='reviewWrite' id='revieRewWrite'  rows='3' placeholder=' 리뷰를 남겨주세요.'>" + campReviewContents + "</textarea></div>"
                        str += "<div class='review_info'><div style='height: 50%;text-align: left;font-size: large;'><b>" + memberNickname + "</b><input type='button' class='btn btn-secondary' onclick='modify(" + campReviewNo + ",\"" + campReviewContents + "\"," + campReviewStar + ")' style='width : 100%' value='수정'/></div><div style='height: 50%;text-align: left;'><input type='button' class='btn btn-outline-secondary' onclick='modifyCancle()' style='width : 100%' value='취소'/> </div></div></div><br>"
                        $("#reviewList-" + campReviewNo + "").html(str);
                    }

                    // 수정창 취소
                    function modifyCancle() {
                        campReviewList()
                    }

                    // 댓글 수정
                    function modify(ReviewNo, ReviewContents, ReviewStar) {
                        console.log(ReviewNo + ":" + ReviewContents + ":" + ReviewStar)
                        var campReviewNo = ReviewNo;
                        var campReviewContents = $("#revieRewWrite").val();
                        var campReviewStar = $("#" + ReviewNo + "").val();
                        if (confirm("수정 하시겠습니까?")) {

                            $.ajax({
                                url: "/camp/campReviewModify.kh",
                                type: "post",
                                data: {
                                    "campReviewNo": campReviewNo,
                                    "campReviewContents": campReviewContents,
                                    "campReviewStar": campReviewStar
                                },
                                success: function (result) {
                                    if (result == "success") {
                                        starAvg()
                                        campReviewList()
                                    }
                                },
                                error: function (request, status, error) {
                                    console.log("code: " + request.status)
                                    console.log("message: " + request.responseText)
                                    console.log("error: " + error);
                                }

                            })
                        }
                    }

                    // 댓글 등록
                    function insertReview() {
                        var memberId = "${sessionScope.loginUser.memberId}";
                        var memberNickname = "${sessionScope.loginUser.memberNickname}";
                        var campId = "${camp.contentId}";
                        var campName = "${camp.facltNm}";
                        var campReviewContents = $('#reviewWrite').val();
                        var campReviewStar = $('#starCount').val();
                        if (memberId == "") {
                            alert("로그인 후 작성 가능합니다.");
                            location.href = "/member/loginView";
                        }
                        else if (campReviewContents.trim() == "") {
                            alert("리뷰 내용을 등록하세요.");
                        }
                        else if (confirm("리뷰를 등록하시겠습니까?")) {
                            // location.href="/member/loginView";
                            $.ajax({
                                url: "/camp/campReviewWrite.kh",
                                type: "post",
                                data: {
                                    "memberId": memberId,
                                    "memberNickname": memberNickname,
                                    "campId": campId,
                                    "campName": campName,
                                    "campReviewContents": campReviewContents,
                                    "campReviewStar": campReviewStar
                                },
                                success: function (result) {
                                    if (result == "success") {
                                        alert("등록완료");
                                        starAvg()
                                        campReviewList()
                                    } else {
                                        alert("등록실패");
                                    }

                                },
                                error: function (request, status, error) {
                                    console.log("code: " + request.status)
                                    console.log("message: " + request.responseText)
                                    console.log("error: " + error);
                                }
                            })

                            $('#reviewWrite').val("");
                        }
                    }
                    // 댓글 리스트 출력
                    function campReviewList() {
                        var contentId = "${camp.contentId}";
                        $.ajax({
                            url: "/camp/campReviewList.kh",
                            type: "get",
                            data: {
                                "contentId": contentId
                            },
                            // async: false,
                            success: function (data) {
                                var str = "";
                                for (var i = 0; i < data.length; i++) {
                                    str += "<div class='reviewList' id='reviewList-" + data[i].campReviewNo + "'><div id='" + data[i].campReviewNo + "'><div class='review_contents'><span class='starx' style='position: relative;font-size: 1.5rem;color: #ddd;'>★★★★★";
                                    str += "<span style='width: " + data[i].campReviewStar * 10 + "%; position: absolute; left: 0; color: red;overflow: hidden; pointer-events: none;'>★★★★★</span></span>"
                                    str += "<p style='font-size : 15px;'>" + data[i].campReviewContents + "</p></div><div class='review_info'><div style='height: 50%;text-align: right;font-size: large;'>"
                                    if (data[i].memberId == "${sessionScope.loginUser.memberId}") {
                                        str += "<a><i class='bi bi-pencil-square' style='visibility: initial;' onclick='reviewModify(\"" + data[i].campReviewContents + "\"," + data[i].campReviewNo + ",\"" + data[i].memberNickname + "\"," + data[i].campReviewStar + ")'></i></a>"
                                        str += "<a><i class='bi bi-trash-fill' style='visibility: initial;' onclick='reviewDelete(" + data[i].campReviewNo + ",\"" + data[i].memberId + "\")'></i></a>"
                                    } else {
                                        str += "<a><i class='bi bi-pencil-square' style='visibility: hidden;' onclick='reviewModify(\"" + data[i].campReviewContents + "\"," + data[i].campReviewNo + ",\"" + data[i].memberNickname + "\"," + data[i].campReviewStar + ")'></i></a>"
                                        str += "<a><i class='bi bi-trash-fill' onclick='reviewDelete(" + data[i].campReviewNo + ",\"" + data[i].memberId + "\")'></i></a>"
                                    }
                                    str += "</div><div style='height: 50%;text-align: left;'><h6><b>" + data[i].memberNickname + "</b></h6>"
                                    str += "<small>" + data[i].rCreateDate + "</small></div></div></div></div><hr>"
                                }
                                $(".review_area").html(str);

                            },
                            error: function (request, status, error) {
                                console.log("code: " + request.status)
                                console.log("message: " + request.responseText)
                                console.log("error: " + error);
                            }

                        })
                    }

                    // 댓글 삭제
                    function reviewDelete(campReviewNo, memberId) {
                        if (confirm("댓글을 삭제하시겠습니까?")) {
                            console.log(campReviewNo + ":" + memberId)
                            $.ajax({
                                url: "/camp/campReviewRemove.kh",
                                type: "post",
                                data: {
                                    "campReviewNo": campReviewNo,
                                    "memberId": memberId
                                },
                                success: function (result) {
                                    console.log(result)
                                    if (result == "success") {
                                        alert("댓글 삭제 완료");
                                        starAvg()
                                        campReviewList();
                                    } else {
                                        alert("댓글 삭제 실패");
                                        starAvg()
                                        campReviewList();
                                    }
                                },
                                error: function (request, status, error) {
                                    console.log("code: " + request.status)
                                    console.log("message: " + request.responseText)
                                    console.log("error: " + error);
                                }


                            })
                        }
                    }


                    // 지도 위치 표시
                    function addSearch() {
                        new daum.Postcode({
                            oncomplete: function (data) {
                                console.log(data)
                                document.querySelector("#postCode").value = data.zonecode;
                                document.querySelector("#roadAddr").value = data.roadAddress;
                                document.querySelector("#jibunAddr").value = data.jibunAddress;
                            }
                        }).open();
                    }
                    var mapOptions = {
                        center: new naver.maps.LatLng(${ camp.mapY }, ${ camp.mapX }),
                        zoom: 12,
                        zoomControl: true,
                        zoomControlOption: {
                            position: naver.maps.Position.TOP_RIGHT,
                            style: naver.maps.ZoomControlStyle.SMALL
                        }
                    };
                    //mapOptions를 아래 변수에 넣어서 구문을 하나로 합칠수도있음
                    var map = new naver.maps.Map('map', mapOptions); //지도생성

                    var markerOptions = {};
                    //마커 찍기
                    var marker = new naver.maps.Marker({//마커생성
                        position: new naver.maps.LatLng(${ camp.mapY }, ${ camp.mapX }), //옵션설정
                        map: map
                    });
                    var titleCamp = "${camp.facltNm}";
                    var campAddr = "${camp.addr1}";

                    //마커에 정보창 표시
                    var contentStr = "<div class='maps'><div class=''  style='height: 100px; width: 220px; margin-bottom: 10px; background: url(${camp.firstImageUrl}) no-repeat center center #343a40; background-size: 100%;'></div><span class=col-md-8><h5>" + titleCamp + "</h5><p>" + campAddr + "</p></span></div>";
                    var infoWindow = new naver.maps.InfoWindow({
                        content: contentStr
                    });
                    //말풍선창 제어
                    infoWindow.open(map, marker);
                    naver.maps.Event.addListener(marker, "click", function (e) {
                        //true면 열려있고 fales면 닫혀있고
                        if (infoWindow.getMap()) {
                            infoWindow.close();

                        } else {
                            infoWindow = new naver.maps.InfoWindow({
                                content: contentStr
                            });
                            infoWindow.open(map, marker);
                        }
                    });



	// 	naver.maps.Event.addListener(map,"click", function(e) {
    //      marker.setPosition(e.coord);
    //      if(infoWindow.getMap()) {
    //         infoWindow.close();
    //      }
    //      naver.maps.Service.reverseGeocode({  // < JSON으로 넘겨줌
    //         location : new naver.maps.LatLng(e.coord.lat(),e.coord.lng()) //위도 경도값 넘겨줌
    //      }, function(status, response) {
    //     	 console.log(response)
    //         var data = response.result;
    //         var items = data.items;
    //         var address = items[1].address;
    //         contentStr = "<div><p>" + address + "</p></div>";
    //      });
    //   });


                </script>


            </body>

            </html>