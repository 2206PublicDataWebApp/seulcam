<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 user-scalable=no">
<title>마이 캠핑장 예약</title>
<link rel="stylesheet" href="/resources/css/camp/switch.css">
<!-- <link href="../resources/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="/resources/css/fonts.css">
<link rel="shortcut icon" href="/resources/images/faviconlogo.ico"
	type="image/x-icon">
<link rel="icon" href="/resources/images/faviconlogo.ico"
	type="image/x-icon">
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

.check-all:checked + label::before {
	background-color: #0078ff;
	border: 1px solid #0078ff;
}

.check-all:checked + label::after {
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
    width: calc(100% );
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
  
  .cm-line{
      height: 10px;
    background-color: #f1f1f1;
    width:100%;
  }
  .review-information{
  	padding-left:3%;
    display: flex;
    margin: 0 15px 20px;
    border-bottom: 1px solid #f5f5f5;
    justify-content: space-between;
}
.review-product-information {
    display: flex;
    max-height: 54px;
    padding: 0 15px 15px 53px;
    align-items: center;
}
.review-product-information_thumbnail >img{
  position: absolute;
    top: 50%;
    left: 50%;
    height: 100%;
    border-radius: 4px;
    transform: translate(-50%,-50%);
    -o-object-fit: contain;
    object-fit: contain;

}
.review-product-information_thumbnail{
	overflow: hidden;
    position: relative;
    width: 45px;
    height: 54px;
}
.review-information>span{
	align:right;
	margin-top:15px;
}
.review-product-information-text{
	
	width: calc(100% - 55px);
	    margin-left: 10px;
	    font-size: 12px;
}
.review-grade{
	
    height: 40px;
    padding-bottom: 10px;
    width:90%;
    padding-left:5%;
}
.review-contents{
	padding-left:5%;
}
    .nocamp{
        display: flex;
    height: 300px;
    justify-content: center;
    align-items: center;
    flex-direction: column;
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
                    <h2>캠핑장 댓글 조회</h2>
                </div>
            </header>
        </div>
        <div class="cm-line"></div>
        <section>
            <div class="order-check">
                <div class="check-bar">
                    
                    <label for="check-all" >캠핑장 댓글 <b>
                        ${cbList.size()}
                    <c:if test="${empty cbList}">0</c:if>    
                    </b>개</label>
                    <!-- <button class="delete-btn">선택</button> -->
                </div>
            </div>
            <c:forEach var="review" items="${rList }" varStatus="i">
				       <div class="layout-wrapper">
							<div class="review-information">
								<p>상품후기</p>
								<span>${review.uploadDate }</span>
							</div>
							<a href="/product/productDetail?productNo=${rpList[i.index].productNo }">
								<div class="review-product-information">
									<div class="review-product-information_thumbnail">
										<img src="../resources/puploadFiles/${rpList[i.index].mainFileRename}">
									</div>
									<div class="review-product-information-text">
										<a href="/product/productDetail?productNo=${rpList[i.index].productNo }">${rpList[i.index].productName}</a>
									</div>
								</div>
							</a>
							<div class="review-grade">
								<span class="star">
	                            ★★★★★
		                            <span id="checkstar" style="width:${review.reviewGrade*10 }%">★★★★★</span>
	                        	</span>
							</div>
							<div class="review-contents">
								<p>${review.reviewTitle}</p>
								<p>${review.reviewContents}</p>
							</div>
				       </div>
				       <div class="cm-line"></div>
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

        </footer>
    </div>

</body>
</html>