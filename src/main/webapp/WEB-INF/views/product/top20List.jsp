<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable= no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable= no">
<title>상품Top20</title>
<link rel="stylesheet" href="/resources/css/product/shopingList.css">
 <link rel="stylesheet" href="/resources/css/fonts.css">
<link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<section class="top20 shop">
    <article class="list">
        <ul id="list">
            <li class="top20">
                <a>
                    <span class="thumbNail" style="padding-bottom: 120%;">
                        <p>TOP20</p>
                    </span>
                    <span class="box"></span>
                </a>
            </li>
            <c:if test="${!empty pList }">
	            <c:forEach var="product" items="${pList}" varStatus="i">
		            <li class="xans-record-">
		            <span id="rank">${i.index+1}위</span>
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
</section>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>

</html>