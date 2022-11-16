<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>배송조회</title>
	<link rel="stylesheet" href="/resources/css/fonts.css">
	<link rel="shortcut icon" href="/resources/images/faviconlogo.ico"
		type="image/x-icon">
	<link rel="icon" href="/resources/images/faviconlogo.ico"
		type="image/x-icon">
		<script src="../../../resources/js/jquery-3.6.1.min.js"></script>
<style>
    * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
body {
        font-size: 14px;
      	color: #000;
		background-color: #f1f1f1;
    }
header {
    position: fixed;
    left: 0px;
    right: 0px;
    top: 0px;
    height: 50px;
    background-color: rgb(255, 255, 255);
    z-index: 200;
    max-width: 768px;
    margin: 0 auto;
}

.wrap{
 		max-width: 768px;
        margin: 0 auto; 
        background-color: white;
        min-height: 100vh;
}
.contents{
padding-top: 50px;
}
.delivary-img{
padding-bottom:30px; 
text-align:center;
}
/* 헤더 */
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
h2 {
    font-size: 16px;
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
    background-color:white;
    boaer:0px;
    outline:0px;
}

.go-back {
	background-color:white;
	border:none;
    display:inline-flex;
    position: relative;
    width: 40px;
    height: 40px;
    padding: 5px;
}

.go-back img {
    width: 25px;
    height: 25px;
}
.home-layout {
    display: flex;
    position: absolute;
    align-items: center;
    top: 8px;
    right: 5px;
}
button {
    border: 0;
    background: 0 0;
    cursor: pointer;
}
.go-home {
    display: inline-flex;
    position: relative;
    width: 40px;
    height: 40px;
    padding: 5px;
}
.go-home img {
    width: 25px;
    height: 25px;
}
/* Section */
.cm-line {
    height: 8px;
    background-color: #f1f1f1;
}


/*  */
.info-area {
    display: block;
    margin-bottom: 25px;
}
.no-padding {
    padding: 0px !important;
}

.info-back-line {
    position: relative;
}
.info-back-line:before {
    content: ''; 
    position: absolute; 
    background-color: #e2e5e8;
    height: 1px;
    top: 40px;
    right: 8%;
    left: 13%;
}
.text-center {
    position: relative;
    
    display: inline-block;
    margin: 5px;
} 
.tracking-status-item-list{
	padding-left: 40px;
	margin-top:40px;
}
.vertical-line {
    position: absolute;
    width: 2px;
    height: 80px;
    background: #03a9f4;
    left: 230px;
   	top: 400px; 
}
.list-circle {
    border: 2px solid #03a9f4;
    position: relative;
    top: 10px;
    left: 0px;
    width: 8px;
    height: 8px;
    background: #ffffff;
    border-radius: 5px;
    z-index: 10;
}
.location-text{
margin-left:90px;

}
.tracking-status-item{
padding-bottom:30px;
padding-left: 50px;
} 
.status-text-clear{
font-weight: bold;
color:#03a9f4;
}

</style>
</head>
<body>
<body>
	<div class="wrap">
		
		 <div id="header-block">
		<header>
		<div class="header-wrapper">
                    <div class="back-layout">
                        <button class="go-back" onclick="history.back()">
                            <img src="/resources/images/back_arrow.png"> 
                        </button>
                    </div>
                    <h2>
                        배송조회
                    </h2>

                    <div class="home-layout">
                        <button class="go-home" onclick="location.href='/';">
                            <img src="/resources/images/home.png">
                        </button>
                    </div>
                </div>
               </header> 
		</div>
		<div class="cm-line"></div>
		
		<div class="contents">
		<div class="delivary-img">
    	<div class="info-back-line">
        <div class="text-center">
            <img src="	https://info.sweettracker.co.kr/static/images/sky/ic_sky_delivery_step1_off.png" class="parcel-img">
            <div class="info-parcel-text-none">상품인수</div>
        </div>
        <div class="text-center">
            <img src="	https://info.sweettracker.co.kr/static/images/sky/ic_sky_delivery_step2_off.png" class="parcel-img">
            <div class="info-parcel-text-none">상품이동중</div>
        </div>

		<c:if test="${order.dirivaryStatus eq '배송완료' or  order.dirivaryStatus eq '구매확정'}">
        <div class="text-center">
            <img src="	https://info.sweettracker.co.kr/static/images/sky/ic_sky_delivery_step3_off.png" class="parcel-img">
            <div class="info-parcel-text-none">배송지도착</div>
        </div>
        </c:if>
		<c:if test="${order.dirivaryStatus ne '배송완료' and order.dirivaryStatus ne '구매확정'}">
        <div class="text-center">
            <img src="	https://info.sweettracker.co.kr/static/images/sky/ic_sky_delivery_step3_on.png" class="parcel-img">
            <div class="info-parcel-text-none">배송지도착</div>
        </div>
        </c:if>

       
        <div class="text-center">
            <img src="https://info.sweettracker.co.kr/static/images/sky/ic_sky_delivery_step2_off.png" class="parcel-img">
            <div class="info-parcel-text-none">배송출발</div>
        </div>
		<c:if test="${order.dirivaryStatus eq '배송완료' or  order.dirivaryStatus eq '구매확정'}">
        <div class="text-center">
            <img src="https://info.sweettracker.co.kr/static/images/sky/ic_sky_delivery_step5_on.png" class="parcel-img">
            <div class="info-parcel-text-active">배송완료</div>
        </div>
        </c:if>
		<c:if test="${order.dirivaryStatus ne '배송완료' and order.dirivaryStatus ne '구매확정'}">
        <div class="text-center">
            <img src="https://info.sweettracker.co.kr/static/images/sky/ic_sky_delivery_step5_off.png" class="parcel-img">
            <div class="info-parcel-text-active">배송완료</div>
        </div>
        </c:if>
    </div>
</div>

<div class="cm-line"></div>
<div class="tracking-status-item-list" >
<c:if test="${order.dirivaryStatus eq '배송완료' or order.dirivaryStatus eq '구매확정'  }">
    <div class="tracking-status-item">
        <div class="list-circle" style="background-color:#03a9f4"></div>
        <span class="location-text">서울 남대문</span> | <span class="status-text-clear">배송완료</span>
        <!-- <div class="vertical-line"></div> -->
    </div>

    <div class="tracking-status-item">
        <div class="list-circle"></div>
        <span class="location-text">서울 남대문</span> | <span class="status-text">배송출발</span>
        <!-- <div class="vertical-line" style="top:110px"></div> -->
    </div>
</c:if>
<c:if test="${order.dirivaryStatus ne '배송완료' and order.dirivaryStatus ne '구매확정' }">
<div class="tracking-status-item">
        <div class="list-circle" style="background-color:#03a9f4"></div>
        <span class="location-text">서울 남대문</span> | <span class="status-text-clear">배송출발</span>
        <!-- <div class="vertical-line" style="top:110px"></div> -->
    </div>
</c:if>
    <div class="tracking-status-item">
        <div class="list-circle"></div>
        <span class="location-text">남서울터미널</span> | <span class="status-text">배달전</span>
      <!--   <div class="vertical-line" style="top:185px"></div> -->
    </div>
    <div class="tracking-status-item">
        <div class="list-circle"></div>
        <span class="location-text">대전HUB</span> | <span class="status-text">간선상차</span>
        <!-- <div class="vertical-line" style="top:260px"></div> -->
    </div>
    <div class="tracking-status-item">
        <div class="list-circle"></div>
        <span class="location-text">성북직영</span> | <span class="status-text">집하처리</span>
        <!-- <div class="vertical-line" style="top:335px"></div> -->
    </div>
    <div class="tracking-status-item">
        <div class="list-circle"></div>
        <span class="location-text">고객</span> | <span class="status-text">인수자등록</span>
       <!--  <div class="vertical-line"></div> -->
    </div>
</div>
          
      </div>
      </div>          

</body>
</html>