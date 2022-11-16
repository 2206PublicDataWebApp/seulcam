<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalabel=no">
            <title>관리자 페이지</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
                integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
            <link rel="stylesheet" href="/resources/css/sb-admin-2.min.css">
            <link rel="stylesheet" href="/resources/css/dataTables.bootstrap4.min.css">
            <link rel="stylesheet" href="/resources/css/fonts.css">
            <link rel="stylesheet" href="/resources/css/memberCommon.css">
            <link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
            <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"
                integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk"
                crossorigin="anonymous"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <script type="text/javascript" charset="utf8"
                src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
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
                        <a class="nav-link" href="/admin/member/ListView">
                            <i class="fas fa-fw fa-table"></i>
                            <span>회원관리</span></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/admin/product/ListView">
                            <i class="fas fa-fw fa-table"></i>
                            <span>상품관리</span></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/admin/review/ListView">
                            <i class="fas fa-fw fa-table"></i>
                            <span>상품 리뷰 관리</span></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/admin/product/BrandListView">
                            <i class="fas fa-fw fa-table"></i>
                            <span>브랜드관리</span></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/admin/order/ListView">
                            <i class="fas fa-fw fa-table"></i>
                            <span>주문관리</span></a>
                    </li>

                    <!-- Divider -->
                    <hr class="sidebar-divider">

                    <!-- Heading -->
                    <div class="sidebar-heading">
                        캠핑장
                    </div>

                    <li class="nav-item ">
                        <a class="nav-link" href="/admin/camp/campList">
                            <i class="fas fa-fw fa-chart-area"></i>
                            <span>캠핑장 관리</span></a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link" href="/admin/camp/reviewList">
                            <i class="fas fa-fw fa-chart-area"></i>
                            <span>캠핑장 댓글 관리</span></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/admin/camp/bookingList">
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
                                        <span
                                            class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.loginUser.memberNickname}</span>
                                        <c:if test="${member.memberFilername==null}"><img
                                                class="img-profile rounded-circle"
                                                src="https://image.msscdn.net/mfile_s01/_simbols/_basic/c.png"></c:if>
                                        <c:if test="${member.memberFilername!=null}"><img
                                                class="img-profile rounded-circle"
                                                src="/resources/profileImageFiles/${member.memberFilername }"></c:if>
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
                                    <h6 class="m-0 font-weight-bold text-primary">전체 상품리뷰</h6>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>리뷰번호</th>
                                                    <th>캠핑장</th>
                                                    <th>작성자</th>
                                                    <th>리뷰점수</th>
                                                    <th>리뷰내용</th>
                                                    <th>작성일</th>
                                                    <th>최종수정일</th>
                                                    <th style="text-align:center">삭제</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${rList}" var="campReview" varStatus="i">
                                                    <tr>
                                                        <td>${i.count}</td>
                                                        <td id="campReviewNo">${campReview.campReviewNo}</td>
                                                        <td><a
                                                                href="/camp/campDetail.kh?contentId=${campReview.campId}">${campReview.campName}</a>
                                                        </td>
                                                        <td>${campReview.memberId}</td>
                                                        <td>${campReview.campReviewStar}</td>
                                                        <td>${campReview.campReviewContents}</td>
                                                        <td>${campReview.rCreateDate}</td>
                                                        <td>${campReview.rModifyDate}</td>
                                                        <td style="text-align:center"><input type="checkbox"
                                                                class="delCheck" name="delCheck"></td>

                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <input type="button" class="page-link" onclick="selectDel()"
                                            style="margin-left: 0px; float:right; color:red; display:inline;border-radius: 0.35rem;"
                                            value="선택삭제">
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
            <script src="/resources/js/datatables-demo.js"></script>
            <script src="/resources/js/jquery.dataTables.js"></script>
            <script src="/resources/js/dataTables.bootstrap4.min.js"></script>
            <script type="text/javascript">

                function selectDel() {
                    var checked = $('input[name="delCheck"]:checked');
                    console.log(checked);
                    var checkNoArr = [];
                    if (checked.length < 1) {
                        alert("삭제할 댓글을 선택해 주세요")
                    }
                    else if (confirm("선택하신 댓글을 삭제 하시겠습니까?")) {
                        if (checked.length > 0) {
                            checked.each(function (i) {
                                campReviewNo = checked.parent().eq(i).siblings('#campReviewNo').text();
                                console.log(i);
                                checkNoArr.push(campReviewNo);
                                console.log(checkNoArr)
                            });
                            $.ajax({
                                url: "/campAdmin/campReviewDelete.kh",
                                type: "POST",
                                data: { "rNo": checkNoArr },
                                dataType: 'text',
                                success: function (data) {
                                    if (data == "success") {
                                        alert("성공.");
                                        location.replace("/admin/camp/reviewList");
                                    } else {
                                        alert("실패");
                                    }
                                }, error: function () {
                                    alert("ajax 통신에러!");

                                }

                            });
                        }

                    }
                }

            </script>
        </body>

        </html>