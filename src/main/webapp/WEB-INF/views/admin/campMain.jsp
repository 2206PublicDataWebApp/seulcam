<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 관리</title>
<link rel="stylesheet" href="/resources/css/camp/switch.css">
	<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/fonts.css">
	<link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <!-- jQuery -->
    <script src="../../../resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
	<a href="/campAdmin/campInsert.kh" style="visibility: hidden;">캠핑장 정보 삽입</a>
	<div class="container">
		<div class="table-responsive">
		<p align="left" style="font-size:34px; "><a href="/campAdmin/campAdminMain.kh" style="color : black;text-decoration: none;">캠핑장 리스트 관리</a></p>
		<table align="center" border="1" width="" class="table table-striped table-hover">
			<tr> <!-- class="table-info" -->
				<td colspan="8" align="center">
					<form action="/campAdmin/campAdminMain.kh" method="get">
						<div align="center">
							<div style="display:inline-block;">
								<span id="switchName">
									<b>예약가능 캠핑장만 보기</b>
								</span>
								<span id="switch">
									<label class="switch-button">
										<input type="checkbox" name="regist" value="Y"/>
										<span class="onoff-switch"></span>
									</label>
								</span>
							</div>
							<div style="display:inline-block;">
								<select class="selectList form-select" name="city" id="city_select">
									<option value="" selected>지역 시/도 전체</option>
									<option value="강원도" >강원도</option>
									<option value="경기도" >경기도</option>
									<option value="경상남도" >경상남도</option>
									<option value="경상북도" >경상북도</option>
									<option value="광주시" >광주시</option>
									<option value="대구시" >대구시</option>
									<option value="대전시" >대전시</option>
									<option value="부산시" >부산시</option>
									<option value="서울시" >서울시</option>
									<option value="세종시" >세종시</option>
									<option value="울산시" >울산시</option>
									<option value="인천시" >인천시</option>
									<option value="전라남도" >전라남도</option>
									<option value="전라북도" >전라북도</option>
									<option value="제주도" >제주도</option>
									<option value="충청남도" >충청남도</option>
									<option value="충청북도" >충청북도</option>
								</select>
							</div>
							<div style="display:inline-block;">
								<select class="selectList form-select" name="category" id="category_select">
									<option value="" selected>카테고리 전체</option>
									<option value="글램핑" >글램핑</option>
									<option value="일반야영장" >일반야영장</option>
									<option value="자동차야영장" >자동차야영장</option>
									<option value="카라반" >카라반</option>
								</select>
							</div>
							<div style="display:inline-block;">
								<input style="width:300px; height:33px;" type="text" name="search">
							</div>
							<div style="display:inline-block;">
								<input type="submit" value="검색" class="btn btn-secondary">
							</div>
						</div>
					</form>
				</td>
			</tr>
			<tr align="center">
				<th width="80">캠핑장ID</th>
				<th width="100">캠핑장이름</th>
				<th width="200">주소</th>
				<th width="100">전화번호</th>
				<th width="100">홈페이지주소</th>
				<th width="100">예약가능여부</th>
				<th width="60">우선순위</th>
				<th width="80">사이트관리</th>
			</tr>
			<c:if test="${!empty cList }">
			<c:forEach items="${cList }" var="campList" varStatus="i">
				<tr align="center">
					<td>${campList.contentId}</td>
					<td><a href="/camp/campDetail.kh?contentId=${campList.contentId}">${campList.facltNm}</a></td>
					<td>${campList.addr1}</td>
					<td>${campList.tel}</td>
					<td><a>${campList.homepage}</a></td>
					<td>${campList.registAvi}</td>
					<td>${campList.blogCount}</td>
					<td><a href="#">관리페이지</a></td>
				</tr>
			</c:forEach>
		</c:if>
			<c:if test="${empty cList }">
				<tr>
					<td colspan="8" align="center"><b>검색결과가 없습니다</b></td>
				</tr>
			</c:if>
			<c:if test="${!empty cList }">
				<tr>
					<td colspan="8" align="center"><b>검색갯수, 검색어 넣어주면될듯</b></td>
				</tr>
			</c:if>
			<tr align="center" height="20">
				<td colspan="8">
					<c:if test="${currentPage != 1 }">
						<a href="/communitymanage/${urlVal }.kh?page=${currentPage - 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}" class="btn btn-primary"><</a>
					</c:if>
					<c:forEach var="p" begin="${startNavi }" end="${endNavi }">
						<c:if test="${currentPage eq p }">
							<b class="btn btn-primary">${p }</b>
						</c:if>
						<c:if test="${currentPage ne p }">
							<a href="/communitymanage/${urlVal }.kh?page=${p }&searchCondition=${searchCondition}&searchValue=${searchValue}" class="btn btn-light">${p }</a>
						</c:if>
					</c:forEach>
					<c:if test="${maxPage > currentPage }">
						<a href="/communitymanage/${urlVal }.kh?page=${currentPage + 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}" class="btn btn-primary">></a>
					</c:if>
				</td>
			</tr>
			
		</table>
		</div>
		</div>
</body>
</html>