<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>포인트 내역 조회</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/fonts.css">
<link rel="shortcut icon" href="/resources/images/faviconlogo.ico"
	type="image/x-icon">
<link rel="icon" href="/resources/images/faviconlogo.ico"
	type="image/x-icon">
</head>
<style>
body {
	font-size: 14px;
	line-height: 1.5;
	color: #000;
	background-color: #f1f1f1;
}

th {
	text-align: center;
}

td {
	text-align: center;
}

header {
	position: fixed;
	left: 0px;
	right: 0px;
	top: 0px;
	height: 50px;
	background-color: rgb(255, 255, 255);
	z-index: 200;
	max-width: 768px;
	margin: 0 auto;
}
h2 {
    font-size: 16px;
    margin:0;
    font-weight:bold;
}
#header-block {
    height: 50px;
}

header {
    position: fixed;
    left: 0px;
    right: 0px;
    top: 0px;
    height: 50px;
    background-color: rgb(255, 255, 255);
    z-index: 1;
    max-width: 768px;
    margin: 0 auto; 
}

.header-wrapper {
    display: flex;
    align-items: center;
    justify-content: center;
    max-width: 768px;
    margin: 0 auto;
    height: 50px;
    position: relative;
}

.back-layout {
    display: flex;
    position: absolute;
    align-items: center;
    top: 5px;
    left: 5px;
}

.go-back {
	background-color:white;
	border:none;
    display: inline-flex;
    position: relative;
    width: 40px;
    height: 40px;
    padding: 5px;
}

.go-back img {
    width: 25px;
    height: 25px;
}
/* Section */
.cm-line {
    height: 10px;
    background-color: #f1f1f1;
}

.wrap {
	max-width: 768px;
	margin: 0 auto;
	background-color: white;
	min-height: 100vh;
}



.container{
	font-weight:bold;
	font-size:20px;
	height:50px;
 	padding-top:10px; 
}
.pagination{
        justify-content: center;
    }
.table{
	text-align:center;
}
</style>
<body>

	<div class="wrap">
        <div id="header-block">
            <header>
                <div class="header-wrapper">
                    <div class="back-layout">
                        <button class="go-back" onclick="location.href='/member/myPageView'">
                            <img src="../../../resources/images/back_arrow.png">
                        </button>
                    </div>
                    <h2>포인트 조회</h2>
                </div>        
            </header>
        </div>
        <div class="cm-line"></div>
		<div class="contents">
		 <div class="container text-center ">
		<div class="row">
		    <div class="col">
		     <span>현재 포인트</span>
		    </div>
		    <div class="col">
		      <span><fmt:formatNumber value="${totalPoint.totalPoint }" pattern="#,###,###"/> 원</span>
		    </div>
		  </div>
		  </div>
		
		<div>
		<div class="table-responsive">
		<table class="table">
		<thead>
		<tr>
		<th>날짜</th>
		<th>유형</th>
		<th>포인트</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${pList}" var="point" varStatus="i">
		
		<tr>
		<td>${point.pointDate }</td>
		<td>${point.pointType }</td>
		<c:if test="${point.pointType eq '포인트 사용' }">
		<td style='color:red;'>-<fmt:formatNumber value="${point.point }" pattern="#,###,###"/>원</td>
		</c:if>
		<c:if test="${point.pointType eq '구매확정 적립' }">
		<td style='color:blue;'>+<fmt:formatNumber value="${point.point }" pattern="#,###,###"/>원</td>
		</c:if>
		<c:if test="${point.pointType eq '환불완료 반환' }">
		<td style='color:orange;'>+<fmt:formatNumber value="${point.point }" pattern="#,###,###"/>원</td>
		</c:if>
		</tr>
		
		</c:forEach>
		</tbody>
		</table>
		</div>
		
		
		
		
		
		</div>
		
		<div class="paging">
		<nav aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item">
				<c:if test="${currentPage != 1}">
					<a class="page-link" href="/point/${urlVal }.kh?page=${currentPage - 1 }"><</a>
					
				</c:if>
				</li>
				<c:forEach var="p" begin="${startNavi }" end="${endNavi }">
					<c:if test="${currentPage eq p }">
					<li class="page-item"><b class="page-link">${p }</b></li>						
					</c:if>
					<c:if test="${currentPage ne p }">						
					<li class="page-item"><a class="page-link"  href="/point/${urlVal }.kh?page=${p }">${p }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${maxPage > currentPage }">
				<a class="page-link" href="/point/${urlVal }.kh?page=${currentPage + 1 }">></a>
				</c:if>
				</li>
        </ul>
      </nav>
		</div>
		
		
		
	</div>
	</div>

</body>
</html>