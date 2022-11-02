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
</head>
<style>
    .table-reponsive {
        margin: auto;
    }
    
    div.leftForm, div.rightForm {
        width: 45%;
        margin: 20px;
        float: left;
    }
    
    .leftForm>div {
        margin: 20px;
    }
    
    .rightForm>div {
        margin: 20px;
    }
    
    #thumbnailzone {
        position: relative;
        width: auto;
        height: 300px;
        border: 1px solid #aaa;
        border-radius: .25rem;
    }
    
    #thumbnailzone img {
        position: absolute;
        width: 100%;
        height: 100%;
        object-fit: cover;
        /* border-radius: 5%; */
        top: 50%;
        left: 50%;
        margin-top: 0;
        transform: translate(-50%, -50%);
    }
    
    #thumbnailzone .form-label {
        width: 100%;
    }
    
    #thumbnailzone input {
        position: relative;
        width: 100%;
    }
    label {
        width: 100%;
    }
    div {
  scrollbar-width: none;
  -ms-overflow-style: none;
}
div::-webkit-scrollbar {
  display: none;
}
    
    </style>

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
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>상품관리</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>상품 리뷰 관리</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>브랜드관리</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="tables.html">
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
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>캠핑장 댓글 관리</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="charts.html">
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
                            <h6 class="m-0 font-weight-bold text-primary">캠핑장 사이트 등록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <form action="/campAdmin/campSiteInsert.kh" enctype="multipart/form-data" method="post">
                                   
                                    <div class="row">

                                        <div class="col-md-6">
                                            <input type="hidden" class="form-control hidden" name="campId" value="${camp.contentId}" readonly>
                                            <div>
                                                <label>캠핑장이름 
                                                    <input type="text" class="form-control" name="campName" value="${camp.facltNm}" readonly>
                                                </label>
                                            </div>
                        
                                            <div>
                                                <label>사이트이름 <input type="text" name="siteName" class="form-control">
                                                </label>
                                            </div>
                        
                                            <div>
                                                <label>특징 <input type="text" name="siteChar" class="form-control">
                                                </label>
                                            </div>
                        
                        
                                            <div>
                                                <label>정보 <input type="text" name="siteInfo" class="form-control">
                                                </label>
                                            </div>
                        
                                            <div>
                                                <label> 소개 <textarea name="siteIntro" id="" cols="50" rows="5"
                                                        class="form-control"></textarea>
                                                </label>
                                            </div>
                                            <div>
                                                <label> 기준인원 <select name="standardPeople" id=""
                                                    class="selectList form-select">
                                                        <option value="">기준인원</option>
                                                        <option value="2">2인</option>
                                                        <option value="3">3인</option>
                                                        <option value="4">4인</option>
                                                        <option value="5">5인</option>
                                                        <option value="6">6인</option>
                        
                                                </select></label>
                                            </div>
                                            <div>
                                                <label> 최대인원 <select name="maxPeople" id=""
                                                    class="form-control bg-light border-0 small">
                                                        <option value="">최대인원</option>
                                                        <option value="2">2인</option>
                                                        <option value="3">3인</option>
                                                        <option value="4">4인</option>
                                                        <option value="5">5인</option>
                                                        <option value="6">6인</option>
                                                        <option value="7">7인</option>
                                                        <option value="8">8인</option>
                                                </select></label>
                                            </div>
                                            <div>
                                                <label> 인원추가비용 <select name="excessCharge" id=""
                                                    class="form-control bg-light border-0 small">
                                                        <option value="">인원추가비용</option>
                                                        <option value="5000">5000원</option>
                                                        <option value="10000">10000원</option>
                                                        <option value="15000">15000원</option>
                                                        <option value="20000">20000원</option>
                                                        <option value="25000">25000원</option>
                                                </select></label>
                                            </div>
                        
                                        </div>
                                        <div class="col-md-6">
                        
                                            <div>
                                                <label> 입실시간 <select name="inTime" id=""
                                                    class="form-control bg-light border-0 small">
                                                        <option value="">입실시간</option>
                                                        <option value="12">12시</option>
                                                        <option value="13">1시</option>
                                                        <option value="14">2시</option>
                                                        <option value="15">3시</option>
                                                        <option value="16">4시</option>
                                                        <option value="17">5시</option>
                        
                                                </select></label>
                                            </div>
                                            <div>
                                                <label> 퇴실시간 <select name="outTime" id=""
                                                    class="form-control bg-light border-0 small">
                                                        <option value="">퇴실시간</option>
                                                        <option value="10">10시</option>
                                                        <option value="11">11시</option>
                                                        <option value="12">12시</option>
                                                        <option value="13">1시</option>
                                                        <option value="14">2시</option>
                                                        <option value="15">3시</option>
                                                </select></label>
                                            </div>
                                            <div>
                                                <label> 사이트가격 <input type="text" name="sitePrice" class="form-control">
                                                    </select></label>
                                            </div>
                                            <div>
                                                <label> 사이트갯수 <select name="siteCount" id=""
                                                    class="form-control bg-light border-0 small">
                                                        <option value="">사이트갯수</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                        <option value="6">6</option>
                                                        <option value="7">7</option>
                                                        <option value="8">8</option>
                                                        <option value="9">9</option>
                                                        <option value="10">10</option>
                        
                                                </select></label>
                                            </div>
                                            <div>
                                                <label for="thumbnail" class="form-label">썸네일 사진 선택</label>
                                                <div id="thumbnailzone">
                                                    <label for="thumbnail" class="form-label"> <img
                                                        onerror="" src=""> <input type="file" name="uploadFile"
                                                        class="form-control" id="thumbnail"
                                                        accept="image/jpeg, image/png, image/jpg"
                                                        onchange="imgView(this);" required>
                                                    </label>
                                                    <div class="invalid-feedback">Valid last name is required.</div>
                                                </div>
                                            </div>
                        
                                        </div>
                                    </div>
                                </div>
                                <div style="text-align: center; margin-top: 10px;">
                                    <a href="/campAdmin/campAdminSite.kh?contentId=${camp.contentId}" class="btn btn-secondary">취소</a>
                                    <button type="submit" class="btn btn-secondary">등록</button>
                                </form>
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
    <script>
		function imgView(obj) {
			var imgid = obj.previousElementSibling;
			imgid.src = URL.createObjectURL(event.target.files[0]);
			imgid.onload = function() {
				URL.revokeObjectURL(imgid.src);// free memory
			}
		};
	</script>
</body>

</html>