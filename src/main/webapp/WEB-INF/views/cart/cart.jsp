<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>장바구니</title>
	<link rel="stylesheet" href="/resources/css/fonts.css">
	<link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
<script src="../../../resources/js/jquery-3.6.1.min.js"></script>
</head>
<style>
body {
        font-size: 14px;
       /*  color: #000; */
    }
    header {
        position: fixed;
        left: 0px;
        right: 0px;
        top: 0px;
        height: 50px;
        background-color: rgb(255, 255, 255);
        z-index: 200;
        max-width: 600px;
        margin: 0 auto; 
    }

.wrap{
 		max-width: 600px;
        margin: 0 auto; 
        background-color: white;
        min-height: 100vh;
}
.contents{
padding-top: 50px;
}


.title {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	height: 50px;
	position: relative;
	font-size: 16px;
}

.click_table {
	width: 100%;
	border-bottom:solid 3px lightgray;
}

.list_table {
	width: 100%;
	border-bottom:solid 3px lightgray;
	text-align: center;
}

.price_table {
	width: 100%;
	height: 120px;
	border-bottom:solid 3px lightgray;
	text-align: center;
}

.count-wrap {
	position: relative;
	padding: 0 38px;
	border: 1px solid #ddd;
	overflow: hidden;
}

.count-wrap>button {
	border: 0;
	background: #fff;
	color: #000;
	width: 38px;
	height: 38px;
	position: absolute;
	top: 0;
	font-size: 12px;
}

.count-wrap>button.minus {
	left: 0;
}

.count-wrap>button.plus {
	right: 0;
}

.count-wrap .inp {
	border: 0;
	height: 38px;
	text-align: center;
	display: block;
	width: 100%;
}

.cart_delete {
	border: none;
	position: relative;
	left: 10px;
	top: 10px;
	align: left;
	valign: top;
	display: inline-block;
	width: 30px;
	height: 30px;
	opacity: .3;
	font-size: 50;
}

.order {
	background: #000;
	color: #fff;
	width: 100%;
	height: 50px;
	line-height: 30px;
	font-size: 20px;
}

.delete {
	border: none;
	width: 50px;
	height: 50px;
	font-size: 40px;
	display: inline-block;
	opacity: .3;
}

.cart_button {
	background: #000;
	color: #fff;
	width: 100px;
}
.p-img{
width:100px;
height:100px;
}
.info-middle{
width:30%
}
</style>

<body>

	<div class="wrap">

		<div class="head">
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>
		<div class="contents">
		
		<div class="title">
			<h2 class="common_layout">장바구니</h2>

		</div>
		<div class="cart_wrap">


			<table class="click_table">
				<tr>
					<td><input type="checkbox" id="check_all" name="cart_selectAll" onclick="selectAll(this)" /> <label>전체</label>
						<span id="total_cart_cnt"><strong id="p-count"></strong>개</span>
					</td>
					<td align="right">
						<button class="cart_button" onclick="cart_delete()">선택 삭제</button>
					</td>
				</tr>
				<tr>
					<td><label>물건을 더 추가하시겠습니까?</label></td>
					<td align="right">
						<button class="cart_button" onclick="location.href='/product/top20List'")>추가하기</button>
					</td>
				</tr>


			</table>


			<div class="cart_list">
			<table class="list_table">
			
				<c:forEach items="${cList}" var="cart" varStatus="i">
				<input id="cartNo" type="hidden" value=${cart.cartNo }>
				<input id="memberId" type="hidden" value=${cart.memberId }>
					<c:forEach items="${pList}" var="product" varStatus="p">
						<c:if test="${cart.productNo eq product.productNo }">
							<input id="cc" type="hidden" value= "${p.count }">
							
							<%-- <table class="list_table">

								<tr>
									<td rowspan="4">
									<input type="checkbox" id="check_select" name="cartbox" onclick="checkSelectAll()" />
									</td>
									<td rowspan="4">
									<img class="p-img" src="//image.msscdn.net/images/goods_img/20220906/2774157/2774157_1_160.jpg" alt="윅(WICK) ACID 워싱 볼캡-차콜"></td>
									<td id="product-name"style="width:50% ; font-weight:bold">${product.productName }</td>
									<td align="right">
										<button class="delete" id="one-delete" onclick="deleteOne(${cart.cartNo })">X</button>
									</td>
								</tr>

								<tr id="countt">
									<td style="width:50%">수량</td>
									<td style="width:50%" id="counttt">
										<div class="count-wrap _count">
											<input type="hidden" class="no" value="${cart.productNo }" />
											<button type="button" class="minus" >-</button>
											<input type="text" class="inp" id="p-count"value="${cart.cartCount }" />
											<button type="button" class="plus" >+</button>
										</div>
									</td>
									
								</tr>
								
								<tr id="price">
									<td style="width:50%">가격</td>
									<td style="width:50%"><span id="p-price" data-value="${product.productPrice }">${product.productPrice }</span></td>
								</tr>
							</table> --%>
							
							<tr>
									
									<td><input type="checkbox"  name="cartbox" onclick="checkSelectAll()" />
									<input id="productNo" type="hidden" value= "${product.productNo }"/></td>
									<td><img class="p-img" alt="상품이미지" src="/resources/puploadFiles/${product.mainFileRename}" ></td>
									<td class="info-middle">
									<ul>
									<li style="font-weight: bold;" id="p-product">${product.productName }</li>
									<li>수량</li>
									<li>가격</li>
									</ul>
									</td>
									<td>
									<ul style="text-align:right;">
									<li>
									
										<button class="delete" id="one-delete" onclick="deleteOne(${cart.cartNo })">X</button>
									
									</li>
									<li style="float:right" id="count" >
										<div class="count-wrap _count" >
											<input type="hidden" class="no" value="${cart.productNo }" />
											<button type="button" class="minus" >-</button>
											<input type="text" class="inp" id="p-count"value="${cart.cartCount }" />
											<button type="button" class="plus" >+</button>
										</div>
									</li>
									<li id="p-price">${product.productPrice }</li>
									</ul>
									</td>
									
								</tr>
						</c:if>
					</c:forEach>
				</c:forEach>
				</table>
			</div>

			<div class="price">
				<table class="price_table">
					<tr>
						<td align="right">결제할 상품</td>
						<td align="right">총 <span id="c-count">0</span>개
						</td>

					</tr>
					<tr>
						<td align="right">상품금액</td>
						<td align="right">
						<span id="totalPrice"> ${totalPrice }원 </span>
						</td>
					</tr>
				</table>

			</div>
			<div>
				<button class="order" id="orderCart">주문하기</button>
			</div>
			
			<form action="/cart/order.kh" method="post" class="order-form">
			<%-- <input type="text" class="form-memberId" value="${memberId.memberId }"/> --%>
			</form>
			

			</div>
		</div>
	</div>



	<script type="text/javascript">
	
	var totalPrice=$("#price").data('value');
	
	$("#totalPrice").html(totalPrice);

	
	function checkSelectAll()  {
		  // 전체 체크박스
		  const checkboxes 
		    =$('input[name="cartbox"]');
		  // 선택된 체크박스
		  const checked 
		  =$('input[name="cartbox"]:checked');
		  //$("#p-count").html(checked.length);
		  // select all 체크박스
		  const selectAll 
		    = $('input[name="cart_selectAll"]');
		  $("#p-count").html(checked.length);
		  $("#c-count").html(checked.length);
		
		  if(checkboxes.length === checked.length)  {
			  selectAll.checked = true;
		  }else {
			  selectAll.checked = false;
		  }
		}

		function selectAll(selectAll)  {
		  const checkboxes 
		     = document.getElementsByName('cartbox');
		   $("#p-count").html($('input[name="cartbox"]').length); 
		   $("#c-count").html($('input[name="cartbox"]').length); 
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		  
		  
		  })
		}
	
		
	$('._count :button').on({
	    'click' : function(e){
	        e.preventDefault();
	        var productNo= $(this).parent('._count').find('.no').val();
	        var $count = $(this).parent('._count').find('.inp');
	        var now = parseInt($count.val());
	        var min = 1;
	        var max = 999;
	        var num = now;
	        if($(this).hasClass('minus')){
	            var type = 'm';
	        }else{
	            var type = 'p';
	        }
	        if(type=='m'){
	            if(now>min){
	                num = now - 1;
	            }
	        }else{
	            if(now<max){
	                num = now + 1;
	            }
	        }
	        if(num != now){
	        	alert(productNo);
	        	$.ajax({
	        		url:"/cart/changeCount.kh",
	        		type:"post",
	        		data:{"productNo":productNo, "cartCount":num},
	        		success:function(data){
	        			if(data =="success"){
	        				$count.val(num);
	        				alert("수정 되었습니다.");
	        			}else{
	        				alert("수정 실패");
	        				
	        			}
	        		},error:function(){
	        			alert("ajax 통신 실패! 관리자에게 문의해 주세요!")
	        		}
	        		
	        		
	        	});
	            
	            
	        }
	    }
	});
	
	
	function deleteOne(cartNo){
		$.ajax({
			url:"/cart/deleteOne.kh",
			type:"get",
			data:{"cartNo":cartNo},
			success:function(data){
				if(data=="success"){
					alert("삭제되었습니다.");
				}else{
					alert("삭제 실패");
				}
			},error:function(){
				alert("ajax 통신 실패! 관리자에게 문의해 주세요!");
				
			}
		})
		
	}
	var checked =$('input[name="cartbox"]:checked');
	if(checked.length>0){
	checked.each(function(i){
	price=checked.parent().parent().eq(i).children().eq(3).children().children('#p-price').text();
	alert(price);
	})}
	
/* 	$("#orderCart").click(function(){
		 var productArr=new Array();
		var countArr=new Array();
		var priceArr=new Array(); 
		var productNoArr=new Array();
		var checked =$('input[name="cartbox"]:checked');
		
		if(checked.length>0){
			checked.each(function(i){
			product=checked.parent().parent().eq(i).children().eq(2).children().children('#p-product').html();
			count=checked.parent().parent().eq(i).children().eq(3).children().children('#count').children().children("#p-count").val();
			price=checked.parent().parent().eq(i).children().eq(3).children().children('#p-price').text();
			
		productNo=checked.parent().children('#productNo').val();
		alert(productNo);
		productNoArr.push(productNo);
		productArr.push(product);
		countArr.push(count);
		priceArr.push(price);
			}) */
			
		//alert(productArr);
		//alert(countArr);
		//alert(priceArr);
/* 		var objParams = {
		   "memberId" : $('#memberId').val(),
           "productArr" : productArr,        
           "countArr" : countArr,        
           "priceArr" : priceArr        
  			}; */
		 /*  	$.ajax({
				url:"/cart/order.kh",
				dataType:"json",
	            contentType:"application/x-www-form-urlencoded; charset=UTF-8",
				type:"post",
				data: objParams,
				success:function(data){
					if(data=="success"){
						alert("성공.");
					}else{
						alert("실패");
					}
				},error:function(){
					alert("ajax 통신 실패! 관리자에게 문의해 주세요!");
					
				}
			}) */
		/* 		
			$.ajax({
				
				url:"/cart/order.kh",
				dataType:"json",
	            contentType:"application/x-www-form-urlencoded; charset=UTF-8",
				type:"post",
				data: {"memberId" : $('#memberId').val(),
		           	  "productNoList" : productNoArr },   
				success:function(data){
					if(data=="success"){
						alert("성공.");
						location.replace();
					}else{
						alert("실패");
					}
				},error:function(){
					alert("ajax 통신 실패! 관리자에게 문의해 주세요!");
					
				}
				
			}); */	
			  
			 
			
/* 		}
	}) */
	
	$("#orderCart").on("click",function(){
		var checked =$('input[name="cartbox"]:checked');
		//var productNoArr=new Array();
		//var countArr = new Array();
		let orderNumber = 0;
		if(checked.length>0){
			checked.each(function(i){
			count=checked.parent().parent().eq(i).children().eq(3).children().children('#count').children().children("#p-count").val();
			productNo=checked.parent().eq(i).children('#productNo').val();
			alert(count);
			alert(productNo);
			var input = ("<input type='text'name='orders[" + orderNumber + "].productNo' value='"+productNo+"'/>")
			input+=("<input type='text' name='orders[" + orderNumber + "].orderCount'value='"+count+"'/>")
			input+=("<input type='text'name='orders[" + orderNumber + "].memberId' value='${memberId.memberId}'/>")
			
			orderNumber += 1;
			$(".order-form").append(input);
			
		$(".order-form").submit();
		
			})
		}
	})
	
	function cart_delete(){
		
		
	}
	</script>

</body>
</html>