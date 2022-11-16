<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable= no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>상품검색</title>
<link rel="stylesheet" href="/resources/css/product/search.css">
<link rel="stylesheet" href="/resources/css/fonts.css">
<link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body>
	<article class="search">
		<form id="searchForm" name="" action="/product/search" enctype="multipart/form-data">
			<div class="wrap form">
					<input type="text" id="keyword" name="keyword" class="inputTypeText" placeholder="search text" size="15" value="" >					
					<button type="submit" onclick="searchResult()"></button>
			</div>
			<p class="record">총 <strong>${searchCt }</strong> 개의 제품이 검색되었습니다.</p>
			<div class="noData ">
				<br><strong class="warning">검색결과가 없습니다.</strong><br>
			</div>
		</form>
	</article>
	 <article class="list">
        <ul id="list">

            <c:if test="${!empty pList }">
	            <c:forEach var="product" items="${pList}" varStatus="i">
		            <li class="xans-record-">
		             <c:if test="${product.productStock eq 0 }">
			            	<a href="/product/productDetail?productNo=${product.productNo }" id="soldOut">Sold Out</div>
			            </c:if>
		            <a href="/product/productDetail?productNo=${product.productNo }">
		                        <span class="thumbNail" style="background-image:url('../resources/puploadFiles/${product.mainFileRename}')"></span>
		                        <span class="box">
		                            <p class="name">${product.productName }</p>
		                            <p class="color">${product.productColor }</p>
		                          <c:if test="${product.discount eq 0}">
			                            	<span id="priceBox">${product.productPrice}</span>
			                            </c:if>
			                            <c:if test="${product.discount ne 0}">
				                            <span id="priceBox">
				                            	<span class="befPrice" style="text-decoration:line-through" val="${product.productPrice}">${product.productPrice}</span>
				                            	<span class="discount" style="color:red;" value="${product.discount }">${product.discount }%↓</span>
				                            	<span class="resultPrice">${resultPrice[i.index] }</span>
				                            </span>
			                            </c:if>
		                        </span> 
		                    </a>
		                                
		            </li>
		         </c:forEach>
	         </c:if>
        </ul>
            
    </article>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script>
	function searchResult(){
		
		if($("#keyword").val()==""){
			alert("검색어를 입력해 주세요!")
		}
	}
	
	
	if(${pList ne null}){
		
		$(".noData").hide();
	}
</script>
</html>