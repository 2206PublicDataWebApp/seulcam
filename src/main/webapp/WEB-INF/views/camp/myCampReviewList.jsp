<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<!DOCTYPE html>
			<html lang="ko">

			<head>
				<meta charset="UTF-8">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no">
				<title>마이페이지</title>
				<link rel="stylesheet" href="/resources/css/camp/myReviewList.css">
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
							<h2 style="font-size: 16px;">
								캠핑장 댓글 내역
							</h2>
						</div>
					</div>
				</header>
				<div class="body-wrapper">
					<div class="cm-line"></div>
					<section>
						<div class="order-check">
							<div class="check-bar">

								<label for="check-all">전체댓글 <b>
										${rCount}
									</b>개</label>
								<!-- <button class="delete-btn">선택</button> -->
							</div>
						</div>
						<!-- <c:if test="${!empty rList }"> -->
						<c:forEach var="review" items="${rList }" varStatus="i">
							<div class="layout-wrapper">
								<div class="review-information">
									<div>
										<p>캠핑장 댓글 내역</p>
									</div>
									<span>
										<fmt:formatDate value="${review.rCreateDate }" pattern="yyyy-MM-dd" />
									</span>
								</div>
								<div class="review-product-information"
									onclick='location.href="/camp/campDetail.kh?contentId="+${review.campId }+""'>
									<div class="review-product-information_thumbnail">
										<img src="${review.imgUrl}">
									</div>
									<div class="review-product-information-text">
										<p style="font-size: 16px;">${review.campName }</p>
									</div>
								</div>
								<!-- <a href="/product/productDetail?productNo=${rpList[i.index].productNo }">
										<div class="review-product-information">
											<div class="review-product-information_thumbnail">
												<img src="../resources/puploadFiles/${rpList[i.index].mainFileRename}">
											</div>
											<div class="review-product-information-text">
												<a
													href="/product/productDetail?productNo=${rpList[i.index].productNo }">${rpList[i.index].productName}</a>
											</div>
										</div>
									</a> -->
								<div class="review-grade">
									<span class="star">
										★★★★★
										<span id="checkstar" style="width:${review.campReviewStar*10 }%">★★★★★</span>
									</span>
								</div>
								<div class="review-contents">
									<p>${review.campReviewContents}</p>
								</div>
								<div class="button">
									<button type="button" id="review_del"
										onclick="review_del(${review.campReviewNo})">삭제</button>

								</div>
							</div>
							<div class="cm-line"></div>
						</c:forEach>
						<!-- </c:if> -->
						<c:if test="${empty rList }">
							<div class="product-box nocamp">
								<h3>캠핑장 댓글 내역이 없습니다.</h3>
								<p style="color: gray;">캠핑장에 댓글을 작성해 보세요</p>
								<a href="/camp/campList.kh" class="campListBtn">캠핑장 보러가기</a>

							</div>
						</c:if>
					</section>

				</div>
				<script>

					function review_del(campReviewNo) {
						var memberId = "${sessionScope.loginUser.memberId}";
						console.log(campReviewNo);
						if (confirm("리뷰 삭제하시겠습니까?")) {
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
										location.href = "/camp/myCampReview.kh";
									} else {
										alert("댓글 삭제 실패");
										location.href = "/camp/myCampReview.kh";
									}
								},
								error: function (request, status, error) {
									console.log("code: " + request.status)
									console.log("message: " + request.responseText)
									console.log("error: " + error);
								}


							})
						}
					};

					function review_modi(reviewNo) {
						location.href = "/product/reviewModify?reviewNo=" + reviewNo;
					}

				</script>
			</body>

			</html>