<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalabel=no">
		<title>상품등록</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
			integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
			crossorigin="anonymous" referrerpolicy="no-referrer" />
		<link rel="stylesheet" href="/resources/css/sb-admin-2.min.css">
		<link rel="stylesheet" href="/resources/css/dataTables.bootstrap4.min.css">
		<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
		<link rel="stylesheet" href="/resources/css/product/brandRegist.css">
		<link rel="stylesheet" href="/resources/css/fonts.css">
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
		<link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"
			integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk"
			crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script type="text/javascript" charset="utf8"
			src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
	</head>

	<body>

		<body id="page-top">
			<!-- Page Wrapper -->
			<div id="wrapper">

				<!-- Sidebar -->
				<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

					<!-- Sidebar - Brand -->
					<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/member/ListView">
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

					<li class="nav-item active">
						<a class="nav-link" href=" /admin/product/BrandListView">
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

					<li class="nav-item">
						<a class="nav-link" href="/admin/camp/campList">
							<i class="fas fa-fw fa-chart-area"></i>
							<span>캠핑장 관리</span></a>
					</li>

					<li class="nav-item">
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

						<!-- <form action="/admin/brandRegister" method="post">
	    <h1>브랜드 등록</h1>
    <section class="brandRegist"> -->
						<div class="container-fluid">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">브랜드 등록</h6>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<form action="/admin/product/BrandRegister" enctype="multipart/form-data"
											method="post">
											<section class="brandRegist">
												<div class="row">
													<div class="col-md-6">
														<div class="box-form">
															<label>브랜드명</label>
															<input type="text" class="g-inputbox-medium textarea-title"
																placeholder="내용을 입력해주세요." name="brandName" value="">
														</div>
														<div class="box-form">
															<label>오프라인 매장여부</label>
															<input type="checkbox" class="checkbox" id="my_checkbox"
																onclick="toggleTextbox(this)" name="storeCheck">
														</div>
														<div class="box-form">
															<label>매장명</label>
															<input type="text" class="g-inputbox-medium textarea-title"
																placeholder="내용을 입력해주세요." name="storeName"
																id="storeName" value="" disabled>
														</div>
														<div class="box-form">
															<label>우편번호</label>
															<input type="text" id="storeZipcode" name="storeZipcode"
																disabled>
															<button id="btnSearchAddressC" type="Button"
																onclick="findDaumPostcode()" value="우편번호 찾기">
																<img src="/resources/images/search.png" />
															</button>
														</div>
														<div class="box-form">
															<label>기본주소</label>
															<input type="text" class="g-inputbox-medium textarea-title"
																placeholder="내용을 입력해주세요." id="storeAddr"
																name="storeAddr" value="" disabled>
														</div>
														<div class="box-form">
															<label>상세주소</label>
															<input type="text" class="g-inputbox-medium textarea-title"
																placeholder="내용을 입력해주세요." name="storeAddrDetail"
																id="storeAddrDetail" value="" disabled>
														</div>
														
													</div>
												</div>
												<div class="bottomButton">
													<button type="button" id="goBack" class="page-link" onclick="goList()"
														style="float:left">뒤로가기</button>
													<button id="submit" class="page-link">등록하기</button>
												</div>
												<br><br><br>
											</section>
										</form>
									</div>
								</div>
								<br><br><br>
								
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
			function goList(){
				location.href="/admin/product/BrandListView";
			}

				function toggleTextbox(checkbox) {

					const textbox_elem1 = document.getElementById('storeZipcode');
					const textbox_elem2 = document.getElementById('storeAddr');
					const textbox_elem3 = document.getElementById('storeAddrDetail');
					const textbox_elem4 = document.getElementById('storeName');

					textbox_elem1.disabled = checkbox.checked ? false : true;
					textbox_elem2.disabled = checkbox.checked ? false : true;
					textbox_elem3.disabled = checkbox.checked ? false : true;
					textbox_elem4.disabled = checkbox.checked ? false : true;


					if (textbox_elem1.disabled) {
						textbox_elem1.value = null;
						textbox_elem2.value = null;
						textbox_elem3.value = null;
						textbox_elem4.value = null;

					} else {
						textbox_elem4.focus();
					}
				}

				function findDaumPostcode() {
					new daum.Postcode({
						oncomplete: function (data) {
							var zoneCodeCompany = data.zonecode;
							var addressCompany = data.address;
							document.getElementById("storeZipcode").value = zoneCodeCompany; // zipcode
							document.getElementById("storeAddr").value = addressCompany; // 주소 넣기
						}
					}).open();
				}


			</script>
		</body>

	</html>