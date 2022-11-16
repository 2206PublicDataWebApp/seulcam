<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable= no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>브랜드별 상품</title>
<link rel="stylesheet" href="/resources/css/product/search.css">
<link rel="stylesheet" href="/resources/css/fonts.css">
<link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
</head>
<body>
<article class="head">
	<div id="sortCdDiv">
			<form id="searchForm" name="" action="/product/groupCategory?cate_no=${cate_no }" enctype="multipart/form-data" method="get">
			<input type="hidden" name="cate_no" value="${cate_no }">
				<select name="sortCd" id="sortCd" onchange="this.form.submit()">
					<option>전체</option>
					<option value="new" <c:if test="${sortCd eq 'new' }">selected</c:if>>최신순</option>
					<option value="highPrice" <c:if test="${sortCd eq 'highPrice' }">selected</c:if>>높은가격순</option>
					<option value="rowPrice" <c:if test="${sortCd eq 'rowPrice' }">selected</c:if>>낮은가격순</option>
					<option value="sale" <c:if test="${sortCd eq 'sale' }">selected</c:if>>인기순</option>
				</select>
			</form>
	</div>
	<div id="category">
	
	</div>
</article>
	 <article class="list">
        <ul id="sort-list" >

            <c:if test="${!empty pList }">
	            <c:forEach var="product" items="${pList}" varStatus="i">
		            <li class="xans-record-">
		            <a href="/product/productDetail?productNo=${product.productNo }">
		                        <span class="thumbNail" style="background-image:url('../resources/puploadFiles/${product.mainFileRename}')"></span>
		                        <span class="box">
		                            <p class="name">${product.productName }</p>
		                            <p class="color">${product.productColor }</p>
									<c:if test="${product.discount eq 0}">
			                            	<span id="priceBox"><fmt:formatNumber value="${product.productPrice}" pattern="#,###"/></span>
		                            </c:if>
		                            <c:if test="${product.discount ne 0}">
			                            <span id="priceBox">
			                            	<span class="befPrice" style="text-decoration:line-through" val="${product.productPrice}">${product.productPrice}</span>
			                            	<span class="discount" style="color:red;" value="${product.discount }">${product.discount }%↓</span>
			                            	<span class="resultPrice"><fmt:formatNumber value="${resultPrice[i.index] }" pattern="#,###"/></span>
			                            </span>
		                            </c:if>
		                        </span> 
		                    </a>
		                                
		            </li>
		         </c:forEach>
	         </c:if>
        </ul>
            
    </article>  

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
<footer>
</footer>
<script>
var query = window.location.search;
var param = new URLSearchParams(query);
var cate_no = param.get('cate_no');
console.log(cate_no);

switch (cate_no) {
case "1":$("#category").append("<span>텐트/타프 > 전체</span>");break;
case "2":$("#category").append("<span>텐트/타프 > 텐트</span>");break;
case "3":$("#category").append("<span>텐트/타프 > 타프</span>");break;
case "4":$("#category").append("<span>테이블/체어 > 전체</span>");break;
case "5":$("#category").append("<span>테이블/체어 > 테이블</span>");break;
case "6":$("#category").append("<span>테이블/체어 > 체어</span>");break;
case "7":$("#category").append("<span>침낭/매트 > 전체</span>");break;
case "8":$("#category").append("<span>침낭/매트 > 침낭</span>");break;
case "9":$("#category").append("<span>침낭/매트 > 매트</span>");break;
case "10":$("#category").append("<span>침낭/매트 > 야전침대</span>");break;
case "11":$("#category").append("<span>식기 > 전체</span>");break;
case "12":$("#category").append("<span>식기 > 코펠</span>");break;
case "13":$("#category").append("<span>식기 > 취사도구</span>");break;
case "14":$("#category").append("<span>식기 > 컵/머그컵</span>");break;
case "15":$("#category").append("<span>화로/버너 > 전체</span>");break;
case "16":$("#category").append("<span>화로/버너 > 스토브</span>");break;
case "17":$("#category").append("<span>화로/버너 > 화로대</span>");break;
case "18":$("#category").append("<span>화로/버너 > 난로</span>");break;
case "19":$("#category").append("<span>캠핑소품 > 전체</span>");break;
case "20":$("#category").append("<span>캠핑소품 > 전자용품</span>");break;
case "21":$("#category").append("<span>캠핑소품 > 기타용품</span>");break;
}



</script>
</html>