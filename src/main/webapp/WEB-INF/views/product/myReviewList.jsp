<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no">
    <title>마이페이지</title>
    <link rel="stylesheet" href="/resources/css/product/myReviewList.css">
    <link rel="stylesheet" href="/resources/css/fonts.css">
    <link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <script src="../../../resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
<header>
	<div id="header-block">
          <div class="header-wrapper">
              <div class="back-layout">
                  <button class="go-back" onclick="history.back()">
                      <img src="/resources/images/back_arrow.png">
                  </button>
              </div>
              <h2>
                  후기내역
              </h2>
          </div>
     </div>
</header>
    <div class="body-wrapper">
	   <section>
		   <c:if test="${!empty rList }">
		   		<c:forEach var="review" items="${rList }" varStatus="i">
				       <div class="layout-wrapper">
							<div class="review-information">
								<p>상품후기</p>
								<span>${review.uploadDate }</span>
							</div>
							<div class="review-product-information">
								<div class="review-product-information_thumbnail">
									<img src="../resources/puploadFiles/${rpList[i.index].mainFileRename}">
								</div>
								<div class="review-product-information-text">
									<a href="/product/productDetail?productNo=${rpList[i.index].productNo }">${rpList[i.index].productName}</a>
								</div>
							</div>
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
			</c:if>
	   </section>

</div>
<script >

</script>
</body>
</html>