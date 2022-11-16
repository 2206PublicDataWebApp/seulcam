<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
 <div class="body-wrapper">
		<header>
			<div id="header-block">
		          <div class="header-wrapper">
		              <div class="back-layout">
		                  <button class="go-back" onclick="myHome()">
		                      <img src="/resources/images/back_arrow.png">
		                  </button>
		              </div>
		              <div class="home-layout">
                                    <button class="go-home" onclick="location.href='/';">
                                        <img src="/resources/images/home.png">
                                    </button>
                                </div>
		              <h2>
		                  후기내역
		              </h2>
		          </div>
				<div class="cm-line"></div>
		     </div>
		</header>

	   <section>
	   <div class="order-check">
                            <div class="check-bar">

                                <label for="check-all">전체리뷰 <b>
                                        ${rList.size()}
                                    </b>개</label>
                                <!-- <button class="delete-btn">선택</button> -->
                            </div>
                        </div>
		   <c:if test="${!empty rList }">
		   		<c:forEach var="review" items="${rList }" varStatus="i">
				       <div class="layout-wrapper">
							<div class="review-information">
							<c:if test="${review.reviewFileRename1 eq null }">
								<p>일반 상품후기</p>
							</c:if>
							<c:if test="${review.reviewFileRename1 ne null }">
								<p>포토 상품후기</p>
							</c:if>
								<span style="color:#aaas"><fmt:formatDate value="${review.uploadDate }" pattern="yyyy-MM-dd"/></span>
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
							<br>
							<div class="image_panel">
								<c:if test="${review.reviewFileRename1 ne null }">
									<img src="../resources/puploadFiles/${review.reviewFileRename1  }">
								</c:if>
								<c:if test="${review.reviewFileRename2 ne null }">
									<img src="../resources/puploadFiles/${review.reviewFileRename2  }">
								</c:if>
								<c:if test="${review.reviewFileRename3 ne null }">
									<img src="../resources/puploadFiles/${review.reviewFileRename3  }">
								</c:if>
							</div>
							<br>
							<div class="button">
								<button type="button" id="review_modi" onclick="review_modi(${review.reviewNo})">수정</button>
								<br><br>
								<button type="button" id="review_del" onclick="review_del(${review.reviewNo})">삭제</button>
							</div>
				       </div>
				       <div class="cm-line"></div>
			       </c:forEach>
			</c:if>
			  <c:if test="${empty rList}">
                    <div class="product-box noreview">
                        <h3>작성하신 리뷰가 없습니다.</h3>
                        <p style="color: gray;">리뷰를 작성해 보세요.</p>
                        <a href="/order/delliveryMenu?dirivaryStatus=구매확정" class="goreview">구매완료 페이지로 이동</a>

                    </div>
                </c:if>
	   </section>

</div>
<script >

function review_del(reviewNo){
	console.log(reviewNo);
		if(confirm("리뷰 삭제하시겠습니까?")){
 		 $.ajax({
 			 url: "/product/reviewDelete",
 			 data: {"reviewNo":reviewNo},
 			 type:"get",
 			 success:function(data){
 				if(data=="success"){
 					alert("리뷰가 삭제되었습니다.");
 					document.location.href = document.location.href;
				}else{
					alert("리뷰 삭제 실패!");
				}
 			 }, error : function(){
 				alert("ajax 통신 오류! 관리자에게 문의하세요!!");
			 }
 			 
 		 });
		}
};

function review_modi(reviewNo){
	location.href="/product/reviewModify?reviewNo="+reviewNo;
}
function myHome(){
	location.href="/member/myPageView";
}
</script>
</body>
</html>