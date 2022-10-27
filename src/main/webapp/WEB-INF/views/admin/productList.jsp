<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품리스트</title>
<link rel="stylesheet" href="/resources/css/product/productList.css">
<link rel="stylesheet" href="/resources/css/fonts.css">
</head>
<body>
	<h1 align="center">전체 제품 목록</h1>
	<br><br>
	<table align="center" border="1" class="table-scroll small-first-col">
		<thead>
			<tr>
				<th>제품번호</th>
				<th>제품명</th>
				<th>브랜드</th>
				<th>카테고리</th>
				<th>가격</th>
				<th>색상</th>
				<th>소재</th>
				<th>재고</th>
				<th>판매량</th>
				<th>메인사진첨부</th>
				<th>등록날짜</th>
			</tr>
		</thead>
		<tbody class="table-scroll small-first-col">
			<c:if test="${!empty pList }">
				<c:forEach items="${pList }" var="product" varStatus="i">
					<tr>
						<td>${product.productNo }</td>
						<td><a href="/admin/productDetail?productNo=${product.productNo}">${product.productName }</a></td>
						<td>${product.brandName }</td>
						<td>${product.category }</td>
						<td>${product.productPrice }</td>
						<td>${product.productColor }</td>
						<td>${product.productMaterial }</td>
						<td>${product.productStock }</td>
						<td>${product.saleCount }</td>
						<td>
							<c:if test="${!empty product.mainFileName }">
								O
							</c:if>
							<c:if test="${empty product.mainFileName }">
								X
							</c:if>
						</td>
						<td>${product.updateDate }</td>
					</tr>
				</c:forEach>
				
			</c:if>
			<c:if test="${empty pList }">
				<tr>
					<td colspan="6" align="center"><b>데이터가 존재하지 않습니다.</b></td>
				</tr>
			</c:if>
			
		<tr>
			<td colspan="5" align="center">
				<form action="/#" method="get">
					<select name="searchCondition">
						<option value="all" <c:if test="${searchCondition eq 'all' }">selected</c:if>>전체</option>
						<option value="writer" <c:if test="${searchCondition eq 'writer' }">selected</c:if>>제품명</option>
						<option value="title" <c:if test="${searchCondition eq 'title' }">selected</c:if>>브랜드</option>
						<option value="contents" <c:if test="${searchCondition eq 'contents' }">selected</c:if>>카테고리</option>
					</select>
					<input type="text" name="searchValue" value="${searchValue }">
					<input type="submit" value="검색">
				</form>
			</td>
		</tr>
		</tbody>
	</table>
	<a href="/admin/brandRegistView" >브랜드등록</a>
	<a href="/admin/productRegist" >상품등록</a>
<script>
	
</script>
</body>
</html>