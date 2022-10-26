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
</style>
<body>
	<form action="/" method="post">
		<div class="container">
			<div class="table-responsive">
				<h1 style="margin-top: 20px;">캠핑장 사이트 등록</h1>
				<div class="leftForm">
					<div>
						<label>캠핑장이름 <input type="text" class="form-control">
						</label>
					</div>

					<div>
						<label>특징 <input type="text" class="form-control">
						</label>
					</div>


					<div>
						<label>정보 <input type="text" class="form-control">
						</label>
					</div>

					<div>
						<label> 소개 <textarea name="" id="" cols="50" rows="5"
								class="form-control"></textarea>
						</label>
					</div>
					<div>
						<label> 기준인원 <select name="" id=""
							class="selectList form-select">
								<option value="">기준인원</option>
						</select></label>
					</div>
					<div>
						<label> 최대인원 <select name="" id=""
							class="selectList form-select">
								<option value="">최대인원</option>
						</select></label>
					</div>
					<div>
						<label> 인원추가비용 <select name="" id=""
							class="selectList form-select">
								<option value="">최대인원</option>
						</select></label>
					</div>

				</div>
				<div class="rightForm">

					<div>
						<label> 입실시간 <select name="" id=""
							class="selectList form-select">
								<option value="">입실시간</option>
						</select></label>
					</div>
					<div>
						<label> 퇴실시간 <select name="" id=""
							class="selectList form-select">
								<option value="">퇴실시간</option>
						</select></label>
					</div>
					<div>
						<label> 사이트가격 <input type="text" class="form-control">
							</select></label>
					</div>
					<div>
						<label> 사이트갯수 <select name="" id=""
							class="selectList form-select">
								<option value="">사이트갯수</option>
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
				<a href="#" class="btn btn-secondary">취소</a>
				<button type="submit" class="btn btn-secondary">등록</button>
			</div>
		</div>
	</form>
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