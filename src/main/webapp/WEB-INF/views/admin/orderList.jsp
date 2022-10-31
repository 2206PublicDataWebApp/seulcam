<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역관리자</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/fonts.css">
<link rel="shortcut icon" href="/resources/images/faviconlogo.ico"
	type="image/x-icon">
<link rel="icon" href="/resources/images/faviconlogo.ico"
	type="image/x-icon">
<script src="../../../resources/js/jquery-3.6.1.min.js"></script>
</head>
<style>
.title{
	width:100%;
	height:90px;
	margin-top:50px;
	
}
.title-name{
	margin-left:30px;
	font-size:30px;
	font-weight: bold;
}
.title-button{
	margin-left:10px;
}
</style>
<body>

<div class="title">
<span class="title-name">주문내역</span>
<span class="title-button">
<button type="button" class="btn btn-sm btn-warning"
onclick="location.href='/orderAdmin/cancle/list.kh'">
 	취소 리스트 보기
</button>
</span>
</div>


	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>No</th>
					<th>주문번호</th>
					<th>구매자</th>
					<th>주문날짜</th>
					<th>구매내역</th>
					<th>입금여부</th>
					<th>배송상태</th>
					<th>취소여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${oList}" var="order" varStatus="i">
					<tr>
						<td>${i.count}</td>
						<td id="orderNo">${order.orderNo }</td>
						<td>${order.memberId }</td>
						<td>${order.orderDate }</td>
						<td>${order.orderMainProductName }</td>
						<td>${order.payStatus }</td>
						<td>${order.dirivaryStatus }
						<select name="dilivaryStatus" id="dilivaryStatus"  onchange="cngStatus(this)">
						<option value="" disabled selected hidden>상태선택</option>
						<option value="입금전">입금전</option>
						<option value="입금확인">입금확인</option>
						<option value="배송중">배송중</option>
						<option value="배송완료">배송완료</option>
						<option value="구매확정">구매확정</option>
						</select>
						
						
						</td>
						<td>${order.cancleStatus }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

<script type="text/javascript">
function cngStatus(obj){
	var change=$("#dilivaryStatus").val();
	var orderNo=$(obj).parent().parent().children("#orderNo").text();
	
	$.ajax({
		url:"/order/admin/cngDilivary",
		type:"post",
		data:{"orderNo":orderNo,"dirivaryStatus":change},
		success:function(data){
			if(data=="success"){
				alert("변경 완료되었습니다.");
				window.location.replace("/orderAdmin/list.kh");
			}else{
				alert("변경 실패");
			}
			},
		error:function(){
				alert("ajax 통신 실패! 관리자에게 문의해 주세요!");
				
			}
	})
}
</script>


</body>
</html>