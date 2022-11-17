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
          	 <div class="back-layout">
	          	 <button class="go-back" onclick="history.back()">
	                      <img src="/resources/images/back_arrow.png">
	            </button>
             </div>
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
	                 <a href="/admin/member/ListView"><i class="member-icon"></i></a>
	                </c:if>
                </li>
            </ul>
        </div>
    </header>

   


    <script src="/resources/js/menu.js"></script>
</body>
</html>



