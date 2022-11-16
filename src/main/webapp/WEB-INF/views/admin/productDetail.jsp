<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalabel=no">
    <title>상품상세 관리자</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/resources/css/sb-admin-2.min.css">
    <link rel="stylesheet" href="/resources/css/dataTables.bootstrap4.min.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/product/productRegist.css">
<link rel="stylesheet" href="/resources/css/fonts.css">
    <link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
</head>

<body id="page-top">
<div id="wrapper">
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
	            <li class="nav-item ">
	                <a class="nav-link" href="/admin/member/ListView">
	                    <i class="fas fa-fw fa-table"></i>
	                    <span>회원관리</span></a>
	            </li>
	
	            <li class="nav-item active">
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
	
	            <li class="nav-item">
	                <a class="nav-link" href=/admin/camp/campList>
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
                       
	
		    <div class="container-fluid">
			   <section class="productDetail">
					   	<div class="card shadow mb-4">
					   		<div class="card-header py-3">
							   <h6 class="m-0 font-weight-bold text-primary">상품번호 : ${product.productNo }</h6>
							   <h6 class="m-0 font-weight-bold text-primary">등록날짜 : ${product.updateDate }</h6>
							</div>
						<div class="card-body">
					       <div class="table-responsive">
									<form action="/admin/product/Modify" enctype="multipart/form-data" method="post">
									<input type="hidden" name="productNo" value="${product.productNo }">
									 <div class="row">

                                        <div class="col-md-6">
								            <div class="box-form">
								                <label>상품명</label>
								                <input type="text" class="g-inputbox-medium textarea-title" placeholder="${product.productName }" name="productName" value="${product.productName }"  readonly>
								            </div>
								            <div class="box-form">
								                <label>브랜드</label>
								                <select class="selectBox"  name="brandName" id="brand_selectBox" onchange="chageBrand()">
								                    <c:forEach items="${sNameList }" var="brandName" varStatus="i">
								                   		 <option value="${brandName.brandName }">${brandName.brandName }</option>
								                    </c:forEach>
								                </select>
								            </div>
								            <div class="box-form">
								                <label>카테고리</label>
								                <select class="selectBox" name="category" id="category_selectBox" onchange="chageCategory()">
														<option value="텐트">텐트</option>
														<option value="타프">타프</option>
														<option value="테이블">테이블</option>
														<option value="체어">체어</option>
														<option value="침낭">침낭</option>
														<option value="매트">매트</option>
														<option value="야전침대">야전침대</option>
														<option value="코펠">코펠</option>
														<option value="취사도구">취사도구</option>
														<option value="컵/머그컵">컵/머그컵</option>
														<option value="스토브">스토브</option>
														<option value="화로대">화로대</option>
														<option value="난로">난로</option>
														<option value="전자용품">전자용품</option>
														<option value="기타소품">기타소품</option>
								                </select>
								            </div>
								            <div class="box-form">
								                <label>가격</label>
								                <input type="text" class="g-inputbox-medium textarea-title" name="productPrice" value="${product.productPrice }" >
								            </div>
								             <div class="box-form">
								                <label>색상</label>
								                <input type="text" class="g-inputbox-medium textarea-title" name="productColor" value="${product.productColor }" >
								            </div>
								            <div class="box-form">
								                <label>재고</label>
								                <input type="text" class="g-inputbox-medium textarea-title"  name="productStock" value="${product.productStock }">
								            </div>
								            <div class="box-form">
								                <label>소재</label>
								                <input type="text" class="g-inputbox-medium textarea-title" name="productMaterial" value="${product.productMaterial }" >
								            </div>
								             <div class="box-form">
								                <label>판매량</label>
								                <input type="text" class="g-inputbox-medium textarea-title" name="updateDate" value="${product.saleCount }" readonly>
								            </div>
								             <div class="box-form">
								                <label>할인율(%)</label>
								                <input type="text" class="g-inputbox-medium textarea-title" name="discount" value="${product.discount }">
								            </div>
								            <br><br><br>
					       			 </div>
			           <div class="col-md-6">
					        <div id="upload-box-form">
					            <div class="box-form">
					                <label>메인사진</label>
					                <div class="box-img-upload" style="width: 200px; height: 260px;">
					                     <c:if test="${product.mainFileName eq null }">
								            <span class="drop-zone__prompt" >+</span>
								          </c:if>
					                    <input type="file" name="uploadFile" class="drop-zone__input">
					                    <c:if test="${product.mainFileName ne null }">
								             		<div class="drop-zone__thumb" data-label="${product.mainFileRename }" 
											             style="background-image:url('/resources/puploadFiles/${product.mainFileRename}')"></div>
								          </c:if>
					                </div>
								<div><input type="button" class="img-delete-bt" value="삭제"></div>
					            </div>
					           
					          
						            <div class="box-form">
						            <label>상세 사진</label>
					           					<input type="hidden" value="${dList[0].detailFileName }" name="dList[0].detailFileName">
					           					<input type="hidden" value="${dList[0].detailFilePath }" name="dList[0].detailFilePath">
					           					<input type="hidden" value="${dList[0].detailFileRename }" name="dList[0].detailFileRename">
					                	<div class="box-img-upload">
						                	<c:if test="${dList[0].detailFileName eq null }">
							                    <span class="drop-zone__prompt">+</span>
						                    </c:if>
						                    <input type="file" name="dList[0].detailFileNameMPF" class="drop-zone__input" >
						                    <c:if test="${dList[0].detailFileName ne null }">
						                		 <div class="drop-zone__thumb" data-label="${dList[0].detailFileRename }" style="background-image:url('/resources/puploadFiles/${dList[0].detailFileRename}')"></div>
					           				</c:if>
						                </div>
						                <div class="box-textarea">
						                    <textarea placeholder="상세설명을 입력해주세요." name="dList[0].detailContents">${dList[0].detailContents }</textarea>
						                </div>
						           </div>
					               <div><input type="button" class="img-delete-bt" value="삭제"></div><br>
					               
					   	           <div class="box-form">
					           					<input type="hidden" value="${dList[1].detailFileName }" name="dList[1].detailFileName">
					           					<input type="hidden" value="${dList[1].detailFilePath }" name="dList[1].detailFilePath">
					           					<input type="hidden" value="${dList[1].detailFileRename }" name="dList[1].detailFileRename">
						                <div class="box-img-upload">
						                	<c:if test="${dList[1].detailFileName eq null }">
						                   		 <span class="drop-zone__prompt">+</span>
					                  		  </c:if>
							                     <input type="file" name="dList[1].detailFileNameMPF" class="drop-zone__input" >
						                    <c:if test="${dList[1].detailFileName ne null }">
							                    <div class="drop-zone__thumb" data-label="${dList[1].detailFileRename }" 
															             style="background-image:url('/resources/puploadFiles/${dList[1].detailFileRename}')"></div>
					           				</c:if>
						                </div>
						                <div class="box-textarea">
						                    <textarea placeholder="상세설명을 입력해주세요." name="dList[1].detailContents">${dList[1].detailContents}</textarea>
						                </div>
						           </div>
					               <div><input type="button" class="img-delete-bt" value="삭제"></div>
						           
					          
					            
					        </div>
					     
					      </div>
			        </div>
					        <div class="bottomButton">
						        <button type="button" class="page-link" id="goBack" onclick="goList()" style="float:left">뒤로가기</button>
						        <button id="submit" class="page-link">수정하기</button>
						        <button type="button" id="p_delete" onclick="productDelete()"class="page-link">삭제하기</button>
			        </div>
			       </div>
						</form>
			       </div>
			       </div>
		    </section>
		</div>
	</div>
</div> 
 
<script>

//불러온값에 따라 셀렉트박스 미리 선택
var cate = '${product.category}';
var bn ='${product.brandName}';
$("#category_selectBox").val(cate).prop("selected", true);
$("#brand_selectBox").val(bn).prop("selected", true);



if(${product.mainFileName!=null}){
	$(".img-delete-bt").eq(0).click(function(){
		$('div:nth-child(1) > div.box-img-upload>div').remove();
		$('div:nth-child(1) > div.box-img-upload').prepend('<span class="drop-zone__prompt" >+</span>');
		$('div:nth-child(1) > div.box-img-upload').append('<input type="hidden" name="mainFileName" value="del">');
	});
}
if(${dList[0].detailFileName !=null}){
	$(".img-delete-bt").eq(1).click(function(){
		$('div:nth-child(2) > div.box-img-upload>div').remove();
		$('div:nth-child(2) > input[type=hidden]:nth-child(2)').remove();
		$('div:nth-child(2) > div.box-img-upload').prepend('<input type="hidden" name="dList[0].detailFileName" value="del">');
		$('div:nth-child(2) > div.box-img-upload').append('<span class="drop-zone__prompt" >+</span>');
	});
}
if(${dList[1].detailFileName !=null}){
	$(".img-delete-bt").eq(2).click(function(){
		$('div:nth-child(5) > div.box-img-upload>div').remove();
		$('div:nth-child(5) > input[type=hidden]:nth-child(2)').remove();
		$('div:nth-child(5) > div.box-img-upload').prepend('<input type="hidden" name="dList[1].detailFileName" value="del">');
		$('div:nth-child(5) > div.box-img-upload').append('<span class="drop-zone__prompt" >+</span>');
	});
}
function goList() {
	location.href = "/admin/product/ListView";
	}
function productDelete(){
	if(confirm("상품을 삭제하시겠습니까?")){
		location.href="/admin/product/Delete?productNo=${product.productNo}";
	}
}

	    document.querySelectorAll(".drop-zone__input").forEach((inputElement) => {
	  const dropZoneElement = inputElement.closest(".box-img-upload");
	
	  dropZoneElement.addEventListener("click", (e) => {
	    inputElement.click();
	  });
	
	  inputElement.addEventListener("change", (e) => {
	    if (inputElement.files.length) {
	      updateThumbnail(dropZoneElement, inputElement.files[0]);
	    }
	  });
	
	  dropZoneElement.addEventListener("dragover", (e) => {
	    e.preventDefault();
	    dropZoneElement.classList.add("drop-zone--over");
	  });
	
	  ["dragleave", "dragend"].forEach((type) => {
	    dropZoneElement.addEventListener(type, (e) => {
	      dropZoneElement.classList.remove("drop-zone--over");
	    });
	  });
	
	  dropZoneElement.addEventListener("drop", (e) => {
	    e.preventDefault();
	
	    if (e.dataTransfer.files.length) {
	      inputElement.files = e.dataTransfer.files;
	      updateThumbnail(dropZoneElement, e.dataTransfer.files[0]);
	    }
	
	    dropZoneElement.classList.remove("drop-zone--over");
	  });
	});
	
	/**
	 * Updates the thumbnail on a drop zone element.
	 *
	 * @param {HTMLElement} dropZoneElement
	 * @param {File} file
	 */
	function updateThumbnail(dropZoneElement, file) {
	  let thumbnailElement = dropZoneElement.querySelector(".drop-zone__thumb");
	
	  // First time - remove the prompt
	  if (dropZoneElement.querySelector(".drop-zone__prompt")) {
	    dropZoneElement.querySelector(".drop-zone__prompt").remove();
	  }
	
	  // First time - there is no thumbnail element, so lets create it
	  if (!thumbnailElement) {
	    thumbnailElement = document.createElement("div");
	    thumbnailElement.classList.add("drop-zone__thumb");
	    dropZoneElement.appendChild(thumbnailElement);
	  }
	
	  thumbnailElement.dataset.label = file.name;
	
	  // Show thumbnail for image files
	  if (file.type.startsWith("image/")) {
	    const reader = new FileReader();
	
	    reader.readAsDataURL(file);
	    reader.onload = () => {
	      thumbnailElement.style.backgroundImage = `url(`+reader.result+`)`;
	    };
	  } else {
	    thumbnailElement.style.backgroundImage = null;
	  }
	}
 </script>
</body>
</html>