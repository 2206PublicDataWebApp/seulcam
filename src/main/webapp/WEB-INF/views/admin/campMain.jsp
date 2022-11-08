<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalabel=no">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/resources/css/sb-admin-2.min.css">
    <link rel="stylesheet" href="/resources/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="/resources/css/fonts.css">
	<link rel="stylesheet" href="/resources/css/memberCommon.css">
    <link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
    <link rel="stylesheet" href="/resources/css/camp/switch.css">
<style>
    div {
  scrollbar-width: none;
  -ms-overflow-style: none;
}
div::-webkit-scrollbar {
  display: none;
}
</style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">SEULCAM <sup>관리자</sup></div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            쇼핑몰
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link" href="/member/memberListView">
                <i class="fas fa-fw fa-table"></i>
                <span>회원관리</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="/admin/productList">
                <i class="fas fa-fw fa-table"></i>
                <span>상품관리</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="/admin/reviewList">
                <i class="fas fa-fw fa-table"></i>
                <span>상품 리뷰 관리</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="/admin/brandList">
                <i class="fas fa-fw fa-table"></i>
                <span>브랜드관리</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="/orderAdmin/list.kh">
                <i class="fas fa-fw fa-table"></i>
                <span>주문관리</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            캠핑장
        </div>

        <li class="nav-item active">
            <a class="nav-link" href="/campAdmin/campAdminMain.kh?">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>캠핑장 관리</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="/campAdmin/campReviewList.kh">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>캠핑장 댓글 관리</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="/campAdmin/campBookingList.kh">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>캠핑장 예약 관리</span></a>
        </li>


        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">
        
        <li class="nav-item">
            <a class="nav-link" href="/">
                <span>메인으로</span></a>
        </li>
        
        <li class="nav-item">
            <a class="nav-link" href="/member/logout">
                <span>로그아웃</span></a>
        </li>
        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>
            
                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.loginUser.memberNickname}</span>
                                <c:if test="${member.memberFilername==null}"><img class="img-profile rounded-circle" src="https://image.msscdn.net/mfile_s01/_simbols/_basic/c.png"></c:if>
                                <c:if test="${member.memberFilername!=null}"><img class="img-profile rounded-circle" src="/resources/profileImageFiles/${member.memberFilername }"></c:if>
                            </a>      
                        </li>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">캠핑장 리스트</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-sm-3">
                                        <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">[검색갯수 : ${count} ]
                                           <p>${sList.city} ${sList.category} ${sList.search} 검색결과</p> </div>
                                    </div>
                                    <div class="col-sm-9">
                                        <form action="/campAdmin/campAdminMain.kh" method="get">
                                            <div align="center">
                                                <div style="display: inline-block;">
                                                    <span id="switchName"> <b>예약가능 캠핑장만 보기</b>
                                                    </span> <span id="switch"> <label class="switch-button">
                                                            <input type="checkbox" name="regist" value="Y" /> <span
                                                            class="onoff-switch"></span>
                                                    </label>
                                                    </span>
                                                </div>
                                                <div style="display: inline-block;">
                                                    <select class="form-control bg-light border-0 small" name="city"
                                                        id="city_select">
                                                        <option value="" selected>지역 시/도 전체</option>
                                                        <option value="강원도">강원도</option>
                                                        <option value="경기도">경기도</option>
                                                        <option value="경상남도">경상남도</option>
                                                        <option value="경상북도">경상북도</option>
                                                        <option value="광주시">광주시</option>
                                                        <option value="대구시">대구시</option>
                                                        <option value="대전시">대전시</option>
                                                        <option value="부산시">부산시</option>
                                                        <option value="서울시">서울시</option>
                                                        <option value="세종시">세종시</option>
                                                        <option value="울산시">울산시</option>
                                                        <option value="인천시">인천시</option>
                                                        <option value="전라남도">전라남도</option>
                                                        <option value="전라북도">전라북도</option>
                                                        <option value="제주도">제주도</option>
                                                        <option value="충청남도">충청남도</option>
                                                        <option value="충청북도">충청북도</option>
                                                    </select>
                                                </div>
                                                <div style="display: inline-block;">
                                                    <select class="form-control bg-light border-0 small" name="category"
                                                        id="category_select">
                                                        <option value="" selected>카테고리 전체</option>
                                                        <option value="글램핑">글램핑</option>
                                                        <option value="일반야영장">일반야영장</option>
                                                        <option value="자동차야영장">자동차야영장</option>
                                                        <option value="카라반">카라반</option>
                                                    </select>
                                                </div>
                                                <div style="display: inline-block;">

                                                    <div class="input-group">
                                                        <input type="text" name="search" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                                        <div class="input-group-append" >
                                                            <button type="submit" class="btn btn-primary" type="button">
                                                                <i class="fas fa-search fa-sm"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- <div style="display: inline-block;">
                                                    <input class="form-control form-control-sm" style="width: 300px; height: 33px;" type="text"
                                                        name="search">
                                                </div>
                                                <div style="display: inline-block;">
                                                    <button type="submit" class="btn btn-secondary btn-icon-split">
                                                        <span class="icon text-white-50">
                                                            <i class="fas fa-arrow-right"></i>
                                                        </span>
                                                        <span class="text">검색</span>
                                                    </button>
                                                </div> -->
                                            </div>
                                        </form>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr align="center">
                                                    <th >캠핑장ID</th>
                                                    <th >캠핑장이름</th>
                                                    <th >주소</th>
                                                    <th >전화번호</th>
                                                    <th>홈페이지주소</th>
                                                    <th >예약가능여부</th>
                                                    <th >우선순위</th>
                                                    <th >사이트관리</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${cList }" var="campList" varStatus="i">
                                                    <tr align="center">
                                                        <td>${campList.contentId}</td>
                                                        <td><a
                                                            href="/camp/campDetail.kh?contentId=${campList.contentId}">${campList.facltNm}</a></td>
                                                        <td>${campList.addr1}</td>
                                                        <td>${campList.tel}</td>
                                                        <td><a>${campList.homepage}</a></td>
                                                        <td>${campList.registAvi}</td>
                                                        <td>${campList.blogCount}</td>
                                                        <td><a href="/campAdmin/campAdminSite.kh?contentId=${campList.contentId}">관리페이지</a></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">

                                    </div>
                                    <div class="col-sm-6">
                                        <div class="dataTables_paginate paging_simple_numbers " id="dataTable_paginate">
                                            <ul class="pagination">
                                                <c:if test="${currentPage == 1 }">
                                                    <li class="paginate_button page-item previous disabled" id="dataTable_previous">
                                                        <a href="/campAdmin/campAdminMain.kh?page=0&city=${sList.city}&category=${sList.category}&search=${sList.search}&regist=${sList.regist}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">first</a>
                                                    </li>
                                                    <li class="paginate_button page-item previous disabled" id="dataTable_previous">
                                                        <a href="/campAdmin/campAdminMain.kh?page=${currentPage -2}&city=${sList.city}&category=${sList.category}&search=${sList.search}&regist=${sList.regist}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"><</a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${currentPage != 1 }">
                                                    <li class="paginate_button page-item previous" id="dataTable_previous">
                                                        <a href="/campAdmin/campAdminMain.kh?page=0&city=${sList.city}&category=${sList.category}&search=${sList.search}&regist=${sList.regist}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">first</a>
                                                    </li>
                                                    <li class="paginate_button page-item previous" id="dataTable_previous">
                                                        <a href="/campAdmin/campAdminMain.kh?page=${currentPage -2}&city=${sList.city}&category=${sList.category}&search=${sList.search}&regist=${sList.regist}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"><</a>
                                                    </li>
                                                </c:if>
                                                <c:forEach var="p" begin="${startNavi }" end="${endNavi }">
                                                    <c:if test="${currentPage eq p }">
                                                        <li class="paginate_button page-item active">
                                                            <a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">${p }</a>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${currentPage ne p }">
                                                        <li class="paginate_button page-item">
                                                            <a href="/campAdmin/campAdminMain.kh?page=${p -1 }&city=${sList.city}&category=${sList.category}&search=${sList.search}&regist=${sList.regist}" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">${p }</a>
                                                        </li>
                                                     </c:if>
                                                </c:forEach>
                                                <c:if test="${maxPage > currentPage }">
                                                    <li class="paginate_button page-item next" id="dataTable_next">
                                                        <a href="/campAdmin/campAdminMain.kh?page=${currentPage }&city=${sList.city}&category=${sList.category}&search=${sList.search}&regist=${sList.regist}" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">></a>
                                                    </li>
                                                    <li class="paginate_button page-item next" id="dataTable_next">
                                                        <a href="/campAdmin/campAdminMain.kh?page=${maxPage-1}&city=${sList.city}&category=${sList.category}&search=${sList.search}&regist=${sList.regist}" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">Last</a>
                                                    </li>
                                                </c:if>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; SEULCAM 2022</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->
    </div>
    
    <script src="/resources/js/sb-admin-2.min.js"></script>
    <!-- <script src="/resources/js/datatables-demo.js"></script> -->
    <script src="/resources/js/jquery.dataTables.js"></script>
    <script src="/resources/js/dataTables.bootstrap4.min.js"></script>
</body>

</html>