var productCount=Number($('.inp').val());

function product_cart(pNo){
alert(productCount);

$.ajax({
	url:"/product/cart",
	type:"post",
	data:{"productNo": pNo,"cartCount":productCount},
	success:function(message){
	if(message=="success"){
		alert("장바구니에 담겼습니다.");
		}
	if(message=="noLogin"){
		alert("로그인하세요");
		location.replace("/member/loginView");
		}
	},error:function(){
	 alert("ajax 통신 오류! 관리자에게 문의해 주세요!");
	
	}
});

}
function product_buy(pNo){
	
$.ajax({
	url:"/product/order",
	type:"post",
	data:{"productNo":pNo,"orderCount":productCount},
	success:function(message){
	if(message=="success"){
		location.replace("/order/order.kh");
		}
	if(message=="noLogin"){
		alert("로그인하세요");
		location.replace("/member/loginView");
		}
	},error:function(){
	 alert("ajax 통신 오류! 관리자에게 문의해 주세요!");
	
	}
	
	});

}
