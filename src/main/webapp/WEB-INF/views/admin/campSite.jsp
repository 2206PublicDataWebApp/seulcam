<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>캠핑장 사이트 관리</title>
    <link rel="stylesheet" href="/resources/css/camp/switch.css">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
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
<body>
<div class="container">
		<div class="table-responsive">
			<p align="left" style="font-size: 34px;">
				<a href="/campAdmin/campAdminSite.kh?contentId=${camp.contentId}"
					style="color: black; text-decoration: none;"><b>${camp.facltNm}</b> 사이트 리스트 관리</a>
			</p>
			<table align="center" border="1" width=""
				class="table table-striped table-hover">
				<tr>
					<!-- class="table-info" -->
					<td colspan="9" align="center">
						<form action="/campAdmin/campAdminMain.kh" method="get">
							<div align="right">
								<div style="display: inline-block;">
									<a href="/campAdmin/campAdminSiteRegist.kh?contentId=${camp.contentId}" class="btn btn-secondary">캠핑장 사이트 등록하기</a>
								</div>
							</div>
						</form>
					</td>
				</tr>
				<tr align="center">
					<th width="80">No.</th>
					<th width="80">캠핑장ID</th>
					<th width="100">캠핑장이름</th>
					<th width="200">사이트명</th>
					<th width="100">사이트가격</th>
					<th width="100">기준인원</th>
					<th width="100">최대인원</th>
					<th width="60">사이트갯수</th>
					<th width="80">사이트관리 ${stList[0].campId}</th>
				</tr>
				<!-- <c:if test="${!empty stList }"> -->
					<c:forEach items="${stList }" var="campSiteList" varStatus="i">
						<tr align="center">
							<td></td>
							<td>${campSiteList.campId}</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</c:forEach>
				<!-- </c:if> -->
				<tr>
					<td align="center" colspan="9"><h5>등록된 사이트 정보가 없습니다.</h5></td>
				</tr>
			</table>
		</div>
	</div>

</body>
</html>