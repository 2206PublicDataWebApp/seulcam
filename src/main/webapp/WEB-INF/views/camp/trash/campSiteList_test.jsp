<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>캠핑장 사이트 관리</title>
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
</style>
</head>
<body>
<div class="container">
		<div class="table-responsive">
			<p align="left" style="font-size: 34px;">
				<a href="/campAdmin/campAdminSite.kh?contentId=${camp.contentId}"
					style="color: black; text-decoration: none;"><b>${camp.facltNm}</b> 사이트 리스트 관리
				<c:if test="${camp.registAvi == 'Y'}">
					<span><b style="color: blue;">[예약가능]</b></span>
				</c:if>
				<c:if test="${camp.registAvi == 'N'}">
					<span><b style="color: red;">[예약불가]</b></span>
				</c:if>
				</a>
			</p>
			<table align="center" border="1" width=""
				class="table table-striped table-hover">
				<tr>
					<!-- class="table-info" -->
					<td colspan="9" align="center">
						<form action="/campAdmin/campAdminMain.kh" method="get">
							<div align="right">
								<div style="display: inline-block;">
									<a href="/campAdmin/campRegistAviCon.kh?contentId=${camp.contentId}" class="btn btn-secondary">예약가능여부 변경</a>
								</div>
								<div style="display: inline-block;">
									<a href="/campAdmin/campAdminSiteRegist.kh?contentId=${camp.contentId}" class="btn btn-secondary">캠핑장 사이트 등록하기</a>
								</div>
							</div>
						</form>
					</td>
				</tr>
				<tr align="center">
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
				<c:if test="${!empty stList }">
					<c:forEach items="${stList }" var="campSiteList" varStatus="i">
						<tr align="center" >
							<!-- style="text-decoration: line-through;" -->
							<td>${i.count }</td>
							<td>${campSiteList.campId}</td>
							<td><a
								href="/camp/campDetail.kh?contentId=${campSiteList.campId}">${campSiteList.campName}</a></td>
							<td><a class="siteInfo" data-bs-toggle='modal' data-bs-target='#exampleModal' onclick='modal(${campSiteList.siteNo})'>${campSiteList.siteName}</a></td>
							<td>${campSiteList.sitePrice}원</td>
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
			</table>
			<div>
				<a href="/campAdmin/campAdminMain.kh" class="btn btn-secondary btn-sm">리스트관리메인</a>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title fs-5" id="exampleModalLabel">Modal
							title</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
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
	</div>

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