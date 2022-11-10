<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
 <link rel="stylesheet" href="../../../resources/css/cart/cart.css">
    <link rel="shortcut icon" href="/faviconlogo.ico" type="image/x-icon">
    <link rel="icon" href="/faviconlogo.ico" type="image/x-icon">
    <script src="../../../resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
    <div class="body-wrapper">
        <div id="header-block">
            <header>
                <div class="header-wrapper">
                    <div class="back-layout">
                        <button class="go-back" onclick="history.back()">
                            <img src="../../../resources/images/back_arrow.png">
                        </button>
                    </div>
                    <h2>장바구니</h2>
                </div>
            </header>
        </div>
        <div class="cm-line"></div>
        <section>
            <div class="order-check">
                <div class="check-bar">
                    <input type="checkbox" name="cart_selectAll" id="check-all" class="check-all" onclick="selectAll(this)">
                    <label for="check-all" class="check-label">전체 <b id="p-count"class="p-count"></b>개</label>
                    <button class="delete-btn"onclick="cart_delete()">선택 삭제</button>
                </div>
            </div>
            <div>
            <!-- c:foreach 시작 -->
            <c:forEach items="${cList}" var="cart" varStatus="i">
				<input id="cartNo" type="hidden" value=${cart.cartNo }>
				<input id="memberId" type="hidden" value=${cart.memberId }>
					<c:forEach items="${pList}" var="product" varStatus="p">
						<c:if test="${cart.productNo eq product.productNo }">
                                <div class="product-box">
                                <div class="order-thumbnail">
                                	<div class="hidden-info">
                                	  	<input type="hidden"  class="info-cNo" value= "${cart.cartNo }"/> 
                                        <input type="hidden"  class="info-pNo" value= "${product.productNo }"/> 
                                        <input type="hidden"  class="info-cCount" value= "${cart.cartCount }"/> 
                                    </div>
                                    <div class="thumbnail-box">
                                        <input type="checkbox" name="cartbox" id="product${i.count }" class="check-all"onclick="checkSelectAll()">
                                        <label for="product${i.count }" class="check-label"></label>
                                        <a href='/product/productDetail?productNo=${product.productNo}' class="thumbnail-link">
                                            <img class="thumbnail-image"src="/resources/puploadFiles/${product.mainFileRename}"/>
                                        </a>
                                    </div>
                                </div>
                                <div class="product-info" onclick="location.href='/product/productDetail?productNo=${product.productNo}'">
                                    <div class="product">
                                        <div class="brand-info">
                                            <div class="a-wrap">
                                                <a href="#" class="brand-name">${product.brandName }</a>
                                                <a href="#" class="product-name"id="p-product">${product.productName }</a>
                                            </div>
                                        </div>
                                        <button class="x-button" onclick="deleteOne(${cart.cartNo })"></button>
                                    </div>
                                    <div class="option-value">
                                        <span class="product-option">${product.productColor }</span>
                                        <span class="product-price"><span id="p-price${i.count }" class="p-price"> ${product.productPrice }</span><span>원</span></span>
                                    </div>
                                    <div class="item-amount-wrap">
                                        <div class="item-amount count-wrap _count"">
                                            <input type="hidden" class="no" value="${cart.productNo }" />
                                            <button class="amount-minus minus">-</button>
                                            <input type="text" class="product-amount inp p-count" id="p-count${i.count }" value="${cart.cartCount }" />
                                            <button class="amount-plus plus">+</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
					</c:forEach>
				</c:forEach>
				
				</div>  
                            <!-- foreach 끝 -->
            
                            <!-- 상품 끝 -->
                            <div class="order-payment">
                                <div class="order-title-wrap">
                                    <h3 class="order-title">결제할 상품 <span class="order-title-count">총<span id="c-count"class="c-count">0</span>개</span></h3>
                                </div>
                                <div class="order-line"></div>
                                <div class="order-cart-payment">
                                    <span class="total-span">결제 금액</span>
                                    <span class="totalPrice" ><span id="total-price" class="total-price">0</span><span class="totalPrice">원</span></span>

                                </div>
                            </div>
                        </section>

                  <!--    <footer>  -->
                            <div class="footer-wrapper">
                                <button type="button" class="submit-button" id="orderCart">
                                    <span class="footer-span1">총 <span id="c-count" class="c-count">0</span>개</span>
                                    <span class="footer-span2"><span id="total-price" class="total-price">0</span><span>원 결제하기</span></span>
                                </buttn>
                            </div>
                            <form action="/cart/order.kh" method="post" class="order-form">
                            
                            </form>
                   <!--     </footer> -->
                    </div>


    <script>
    function priceToString(price) {
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }
    function stringNumberToInt(stringNumber){
        return parseInt(stringNumber.replace(/,/g , ''));
    }
    
     //수량별 상품가격  
	<c:forEach items="${cList}" var="cart" varStatus="i">
	var productPrice=$("#p-count${i.count }.inp").val()*$("#p-price${i.count }").text();
	$("#p-price${i.count }").html(productPrice.toLocaleString('ko-KR'));
	</c:forEach>
	//체크 전 체크한 갯수
	
	$("#p-count").html($('input[name="cartbox"]:checked').length); 
	
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
		    = document.querySelector('input[name="cart_selectAll"]');
		 
		  $(".p-count").html(checked.length);
		  $(".c-count").html(checked.length);
		var pname=checked.parent().parent().children().children('.info-pName').val();
		
		if(checkboxes.length === checked.length)  {
			 selectAll.checked = true;
			 	  
				  
		  }else {
			  //alert(checkboxes.length);
			  selectAll.checked = false;
		  }
		  if(checked.length>0){
			 	var totalPrice = 0;
			 	checked.each(function(i){
			 		price=checked.parent().parent().eq(i).parent().children('.product-info').children('.option-value').children().children('.p-price').text();
				
				totalPrice += stringNumberToInt(price);
				$(".total-price").html(totalPrice.toLocaleString('ko-KR'));
		  })
		  
		  }else{
			  $(".total-price").html("0");
		  }
		}

		function selectAll(selectAll)  {
			if(selectAll.checked){			 
			$(".p-count").html($('input[name="cartbox"]').length); 
			$(".c-count").html($('input[name="cartbox"]').length);
		  const checkboxes 
		     = document.getElementsByName('cartbox');
		  checkboxes.forEach((checkbox) => {
			    checkbox.checked = selectAll.checked	
			    
			    const checked
				  =$('input[name="cartbox"]:checked');
			    var totalPrice = 0;
			 	checked.each(function(i){
			 		price=checked.parent().parent().eq(i).parent().children('.product-info').children('.option-value').children().children('.p-price').text();
				
				totalPrice += stringNumberToInt(price);
				$(".total-price").html(totalPrice.toLocaleString('ko-KR'));
			 	});
			  })

			}else{
				const checkboxes 
			     = document.getElementsByName('cartbox');
				checkboxes.forEach((checkbox) => {
				    checkbox.checked = selectAll.checked		  
				  })
		   $(".p-count").html($('input[name="cartbox"]:checked').length); 
		   $(".c-count").html($('input[name="cartbox"]:checked').length); 
		   $(".total-price").html("0");
		  
			}
		}
	//수량 수정	
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
	        	//alert(productNo);
	        	$.ajax({
	        		url:"/cart/changeCount.kh",
	        		type:"post",
	        		data:{"productNo":productNo, "cartCount":num},
	        		success:function(data){
	        			if(data =="success"){
	        				$count.val(num);
	        				alert("수정 되었습니다.");
	        				location.replace("/cart/cart.kh");
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
	
	//한개씩 삭제
	function deleteOne(cartNo){
		$.ajax({
			url:"/cart/deleteOne.kh",
			type:"get",
			data:{"cartNo":cartNo},
			success:function(data){
				if(data=="success"){
					alert("삭제되었습니다.");
					location.replace("/cart/cart.kh");
				}else{
					alert("삭제 실패");
				}
			},error:function(){
				alert("ajax 통신 실패! 관리자에게 문의해 주세요!");
				
			}
		})
		
	}
	/* var checked =$('input[name="cartbox"]:checked');
	if(checked.length>0){
	checked.each(function(i){
	price=checked.parent().parent().eq(i).children().eq(3).children().children('#p-price').text();
	alert(price);
	})} */
	
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
	
	//주문하기
	$("#orderCart").on("click",function(){
		var checked =$('input[name="cartbox"]:checked');
		//var productNoArr=new Array();
		//var countArr = new Array();
		let orderNumber = 0;
		if(checked.length>0){
			checked.each(function(i){
			count=checked.parent().parent().eq(i).children().children('.info-cCount').val();
			productNo=checked.parent().parent().eq(i).children().children('.info-pNo').val();
			//alert(count);
			//alert(productNo);
			var input = ("<input type='hidden'name='orders[" + orderNumber + "].productNo' value='"+productNo+"'/>")
			input+=("<input type='hidden' name='orders[" + orderNumber + "].orderCount'value='"+count+"'/>")
			input+=("<input type='hidden'name='orders[" + orderNumber + "].memberId' value='${memberId.memberId}'/>")
			
			orderNumber += 1;
			$(".order-form").append(input);
			
		$(".order-form").submit();
		
			})
		}
	})
	
	//체크박스 선택 삭제
	function cart_delete(){
		var checked =$('input[name="cartbox"]:checked');
		var checkNoArr = []; 
		if(checked.length>0){
		checked.each(function(i){
		productNo=checked.parent().parent().eq(i).children().children('.info-pNo').val();
		checkNoArr.push(productNo);
			});
	 	$.ajax({//맴버아이디//상품번호
			 url:"/cart/checkdelete",
			 type:"post",
			 dataType:'text',
			 data: {"pNo" : checkNoArr},
			 
			success:function(data){
				if(data=="success"){
					alert("성공.");
					location.replace("/cart/cart.kh");
				}else{
					alert("실패");
				}
			},error:function(){
				alert("ajax 통신 실패! 관리자에게 문의해 주세요!");
				
			}
			 
			}); 
		}
	} 


    </script>

</body>
</html>