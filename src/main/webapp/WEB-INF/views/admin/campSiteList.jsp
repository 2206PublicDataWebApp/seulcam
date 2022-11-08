<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
    <style>
        .infoTitle {
        font-weight: bold;
        color: darkslategray;
        width: 100px;
        padding: 5px;
    }
    .siteInfo {
        pointer-events: all;
    }
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
                            <h6 class="m-0 font-weight-bold text-primary"><b>${camp.facltNm}</b> 사이트 리스트 관리
                            <c:if test="${camp.registAvi == 'Y'}">
                                <span><b style="color: blue;">[예약가능]</b></span>
                            </c:if>
                            <c:if test="${camp.registAvi == 'N'}">
                                <span><b style="color: red;">[예약불가]</b></span>
                            </c:if>
                        </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <div class="row" style="margin-bottom: 10px;">
                                        <div  class="col-12 text-right">
                                            <form action="/campAdmin/campAdminMain.kh" method="get">
                                                <div align="right">
                                                    <div style="display: inline-block;">
                                                        <a href="/campAdmin/campRegistAviCon.kh?contentId=${camp.contentId}" class="btn btn-secondary btn-sm">예약가능여부 변경</a>
                                                    </div>
                                                    <div style="display: inline-block;">
                                                        <a href="/campAdmin/campAdminSiteRegist.kh?contentId=${camp.contentId}" class="btn btn-secondary btn-sm">캠핑장 사이트 등록하기</a>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <thead>
                                        <tr>
                                            <th width="50">No.</th>
                                            <th width="80">캠핑장ID</th>
                                            <th width="100">캠핑장이름</th>
                                            <th width="100">사이트명
                                                (클릭)</th>
                                            <th width="100">사이트가격</th>
                                            <th width="100">기준/최대인원</th>
                                            <th width="100">사이트갯수</th>
                                            <th width="80">잔여사이트</th>
                                            <th width="100">사이트관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${!empty stList }">
                                            <c:forEach items="${stList }" var="campSiteList" varStatus="i">
                                                <tr align="center" >
                                                    <!-- style="text-decoration: line-through;" -->
                                                    <td>${i.count }</td>
                                                    <td>${campSiteList.campId}</td>
                                                    <td><a
                                                        href="/camp/campDetail.kh?contentId=${campSiteList.campId}">${campSiteList.campName}</a></td>
                                                    <td><a class="siteInfo" data-bs-toggle='modal' data-bs-target='#exampleModal' onclick='modal(${campSiteList.siteNo})'>${campSiteList.siteName}</a></td>
                                                    <td><fmt:formatNumber value="${campSiteList.sitePrice}" pattern="#,###" />원</td>
                                                    <td>${campSiteList.standardPeople}명/${campSiteList.maxPeople}명</td>
                                                    <td>${campSiteList.siteCount}개</td>
                                                    <td>-</td>
                                                    <td>
                                                        <a onclick="modifySite(${campSiteList.siteNo})" class="btn btn-secondary btn-sm">수정</a> <a onclick="deleteSite(${campSiteList.siteNo},${campSiteList.campId})" class="btn btn-secondary btn-sm">삭제</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
				                        </c:if>
                                        <c:if test="${empty stList }">
                                            <tr>
                                                <td align="center" colspan="9"><h5>등록된 사이트 정보가 없습니다.</h5></td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                                <div>
                                    <a href="/campAdmin/campAdminMain.kh" class="btn btn-secondary btn-sm">리스트관리메인</a>
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

        <!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title fs-5" id="exampleModalLabel">Modal
							title</h3>
					</div>
					<div class="modal-body">
						<div class="siteImg-area" style="width: 450px; height: 200px;" align="center">
							
						</div>
						<div class="siteInfoDetail">
							
						</div>

					</div>
					<div class="modal-footer" style="padding: 10px;">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>

        <!-- End of Content Wrapper -->
    </div>
    
    <script src="/resources/js/sb-admin-2.min.js"></script>
    <script src="/resources/js/datatables-demo.js"></script>
    <script src="/resources/js/jquery.dataTables.js"></script>
    <script src="/resources/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script>
		function deleteSite(siteNo,contentId){
			if(confirm("정말 삭제하시겠습니까?")){
				location.href = "/campAdmin/campSiteRemove.kh?siteNo="+siteNo+"&contentId="+contentId;
			}
			console.log(contentId)
		}

		function modifySite(siteNo){
			console.log(siteNo)
			location.href = "/campAdmin/campSiteModifyView.kh?siteNo="+siteNo;
		}

		function modal(siteNo){
			console.log(siteNo)
			$.ajax({
				url : "/camp/campSiteDetailView.kh",
				type : "get",
				data : {
					"siteNo" : siteNo
				},
				success : function(data){
					$("#exampleModalLabel").html("<b>"+data.siteName+" 사이트 상세 정보</b>");
					$(".siteImg-area").html('<img class="img-thumbnail" style="width: 100%; height: 100% ;object-fit: cover;" src="/resources/ruploadFiles/'+data.siteThumbnailRename+'" alt="">')
					var str=""
					str += "<table><tr><td class='infoTitle'>특징</td><td>"+data.siteChar+"</td></tr>"
					str += 	"<tr><td class='infoTitle'>정보</td><td>"+data.siteInfo+"</td></tr>"
					str += 	"<tr><td class='infoTitle'>소개</td><td>"+data.siteIntro+"</td></tr>"
					str += 	"<tr><td class='infoTitle'>사이트가격</td><td>"+data.sitePrice.toLocaleString('ko-KR')+"원~</td></tr>"
					str += 	"<tr><td class='infoTitle'>사이트갯수</td><td>"+data.siteCount+"개</td></tr>"
					str += 	"<tr><td class='infoTitle'>인원정보</td><td>기준인원 "+data.standardPeople+"명 / 최대인원 "+data.maxPeople+"명</td></tr>"
					str += 	"<tr><td class='infoTitle'>추가인원가격</td><td>1인당 "+data.excessCharge.toLocaleString('ko-KR')+"원</td></tr>"
					str += 	"<tr><td class='infoTitle'>입/퇴실시간</td><td>입실 "+data.inTime+"시 / 퇴실 "+data.outTime+"</td></tr>"
					str += 	"<tr><td class='infoTitle'>등록일자</td><td>"+data.sCreateDate+"</td></tr></table>"
					$(".siteInfoDetail").html(str);

				},
				error : function(request, status, error){
                    console.log("code: " + request.status)
                    console.log("message: " + request.responseText)
                    console.log("error: " + error);
                }
			})
		}

	</script>
</body>

</html>