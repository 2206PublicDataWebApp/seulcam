<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <link rel="stylesheet" href="/resources/css/header.css">
    <!-- 제이쿼리 로드 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <header>
        <div class="wrapper">
            <h1><a href="/"><img class="logo" src="/resources/images/small-logo.png">슬기로운 캠핑 생활</a></h1>
            <button class="more-btn">
                <i class="icon"></i>
            </button>
            <ul class="icon-list">
                <li><a href="/product/search"><i class="search-icon"></i></a></li>
                <li><a href="/cart/cart.kh"><i class="cart-icon"></i></a></li>
                <li>
	                <c:if test="${sessionScope.loginUser eq null}">
	                <a href="/member/loginView"><i class="member-icon"></i></a>
	                </c:if>
	                
	                <c:if test="${loginUser.adminCheck == false}">
	                <a href="/member/myPageView"><i class="member-icon"></i></a>
	                </c:if>
	                
	                <c:if test="${loginUser.adminCheck == true }">
	                <a href="/member/memberListView"><i class="member-icon"></i></a>
	                </c:if>
                </li>
            </ul>
        </div>
    </header>

    <nav class="main-navigation">
        <ul>
            <li>
                <a class="top20" href="/product/top20List"><b>TOP 20</b></a>
            </li>
            
            <li>
                <a class="newarrival" href="/product/newArrivalList"><b>NEW ARRIVAL</b></a>
            </li>

             <li class="main-menu">
                <a>브랜드</a>
                <div class="content">
                    <ul class="sub-menu">
                        <li><a href="/product/brandCategory"><b>전체 보기</b></a></li>
						<c:forEach var="brandName" items="${sNameList}" varStatus="i">
							 <li><a href="/product/brandCategory?brandName=${brandName.brandName }">${brandName.brandName }</a></li>
						</c:forEach>
                    </ul>
                </div>
            </li>

            <li class="main-menu">
                <a>텐트/타프</a>
                <div class="content">
                    <ul class="sub-menu">
                        <li><a href="/product/groupCategory?cate_no=1"><b>전체 보기</b></a></li>
                        <li><a href="/product/groupCategory?cate_no=2">텐트</a></li>
                        <li><a href="/product/groupCategory?cate_no=3">타프</a></li>
                    </ul>
                </div>
            </li>

            <li class="main-menu">
                <a>테이블/체어</a>
                <div class="content">
                    <ul class="sub-menu">
                        <li><a href="/product/groupCategory?cate_no=4"><b>전체 보기</b></a></li>
                        <li><a href="/product/groupCategory?cate_no=5">테이블</a></li>
                        <li><a href="/product/groupCategory?cate_no=6">체어</a></li>
                    </ul>
                </div>
            </li>


            <li class="main-menu">
                <a>침낭/매트</a>
                <div class="content">
                    <ul class="sub-menu">
                        <li><a href="/product/groupCategory?cate_no=7"><b>전체 보기</b></a></li>
                        <li><a href="/product/groupCategory?cate_no=8">침낭</a></li>
                        <li><a href="/product/groupCategory?cate_no=9">매트</a></li>
                        <li><a href="/product/groupCategory?cate_no=10">야전침대</a></li>
                    </ul>
                </div>
            </li>

            <li class="main-menu">
                <a>식기</a>
                <div class="content">
                    <ul class="sub-menu">
                        <li><a href="/product/groupCategory?cate_no=11"><b>전체 보기</b></a></li>
                        <li><a href="/product/groupCategory?cate_no=12">코펠</a></li>
                        <li><a href="/product/groupCategory?cate_no=13">취사도구</a></li>
                        <li><a href="/product/groupCategory?cate_no=14">컵/머그컵</a></li>
                    </ul>
                </div>
            </li>

            <li class="main-menu">
                <a>화로/버너</a>
                <div class="content">
                    <ul class="sub-menu">
                        <li><a href="/product/groupCategory?cate_no=15"><b>전체 보기</b></a></li>
                        <li><a href="/product/groupCategory?cate_no=16">스토브</a></li>
                        <li><a href="/product/groupCategory?cate_no=17">화로대</a></li>
                        <li><a href="/product/groupCategory?cate_no=18">난로</a></li>
                    </ul>
                </div>
            </li>

            <li class="main-menu">
                <a>캠핑소품</a>
                <div class="content">
                    <ul class="sub-menu">
                        <li><a href="/product/groupCategory?cate_no=19"><b>전체 보기</b></a></li>
                        <li><a href="/product/groupCategory?cate_no=20">전자용품</a></li>
                        <li><a href="/product/groupCategory?cate_no=21">기타소품</a></li>
                    </ul>
                </div>
            </li>

        </ul>

        <a href="/camp/campList.kh"><b>캠핑장 검색</b></a>
        
       <c:if test="${sessionScope.loginUser eq null}">
	   		<a href="/member/loginView"><b>로그인</b></a>
	   </c:if>
	                
	   <c:if test="${not empty loginUser }">
	        <a href="/member/logout"><b>로그아웃</b></a>
	   </c:if>
    </nav>

    <script src="/resources/js/menu.js"></script>
</body>
</html>



