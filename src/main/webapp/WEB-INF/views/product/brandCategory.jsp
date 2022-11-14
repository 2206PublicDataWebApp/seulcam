<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
				<div id="bodyWrapper">
					<article class="head">
						<div id="sortCdDiv">
							<form id="searchForm" name="" action="/product/brandCategory" enctype="multipart/form-data">
								<input type="hidden" name="brandName" value="${brandNameTemp }">
								<select name="sortCd" id="sortCd" onchange="this.form.submit()">
									<option>전체</option>
									<option value="new" <c:if test="${sortCd eq 'new' }">selected</c:if>>최신순</option>
									<option value="highPrice" <c:if test="${sortCd eq 'highPrice' }">selected</c:if>
										>높은가격순</option>
									<option value="rowPrice" <c:if test="${sortCd eq 'rowPrice' }">selected</c:if>>낮은가격순
									</option>
									<option value="sale" <c:if test="${sortCd eq 'sale' }">selected</c:if>>인기순</option>
								</select>
							</form>
						</div>
						<div id="category">
							<c:if test="${brandNameTemp ne null}">
								<span>브랜드 > ${brandNameTemp }</span>
							</c:if>
							<c:if test="${brandNameTemp eq null}">
								<span>브랜드 > 전체</span>
							</c:if>


						</div>
					</article>
					<article class="list">
						<ul id="sort-list">

							<c:if test="${!empty pList }">
								<c:forEach var="product" items="${pList}" varStatus="i">
									<li class="xans-record-">
										<c:if test="${product.productStock eq 0 }">
											<a href="/product/productDetail?productNo=${product.productNo }"
												id="soldOut">Sold Out</a>
				
										</c:if>
				<a href="/product/productDetail?productNo=${product.productNo }">
					<span class="thumbNail"
						style="background-image:url('../resources/puploadFiles/${product.mainFileRename}')"></span>
					<span class="box">
						<p class="name">${product.productName }</p>
						<p class="color">${product.productColor }</p>
						<c:if test="${product.discount eq 0}">
							<span id="priceBox">
								<fmt:formatNumber value="${product.productPrice}" pattern="#,###" />
							</span>
						</c:if>
						<c:if test="${product.discount ne 0}">
							<span id="priceBox">
								<span class="befPrice" style="text-decoration:line-through"
									val="${product.productPrice}">${product.productPrice}</span>
								<span class="discount" style="color:red;"
									value="${product.discount }">${product.discount }%↓</span>
								<span class="resultPrice">
									<fmt:formatNumber value="${resultPrice[i.index] }" pattern="#,###" />
								</span>
							</span>
						</c:if>
					</span>
				</a>

				</li>
				</c:forEach>
				</c:if>
				</ul>

				</article>

				</div>
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
			</body>


			<script>




			</script>

			</html>