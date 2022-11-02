<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 사이트 등록</title>
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

</style>
<body>
	<div class="container">
		<div class="table-responsive">
				<form action="/campAdmin/campSiteInsert.kh" enctype="multipart/form-data" method="post">
				<h1 style="margin-top: 20px;">캠핑장 사이트 등록</h1>
				<div class="leftForm">
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
							class="selectList form-select">
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
							class="selectList form-select">
								<option value="">인원추가비용</option>
								<option value="5000">5000원</option>
								<option value="10000">10000원</option>
								<option value="15000">15000원</option>
								<option value="20000">20000원</option>
								<option value="25000">25000원</option>
						</select></label>
					</div>

				</div>
				<div class="rightForm">

					<div>
						<label> 입실시간 <select name="inTime" id=""
							class="selectList form-select">
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
							class="selectList form-select">
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
							class="selectList form-select">
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
			<div style="text-align: center;">
				<a href="/campAdmin/campAdminSite.kh?contentId=${camp.contentId}" class="btn btn-secondary">취소</a>
				<button type="submit" class="btn btn-secondary">등록</button>
			</form>
			</div>
		</div>
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