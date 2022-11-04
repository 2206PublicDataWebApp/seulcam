
var productNo=${product.productNo};
var productCount=$('.inp').val();

function produce_cart(){
$.ajax({
	url:"/product/cart",
	type:"post",
	data:{"productNo":productNo,"cartCount":productCount},
	sucsess:function(data){
	if(data=="success"){
		alert("장바구니에 담겼습니다.");
		}else{
		alert("로그인하세요");
		}
	},error:function(){
	 alert("ajax 통신 오류! 관리자에게 문의해 주세요!");
	
	}
});

}

function product_buy(){
	
$.ajax({
	url:"/product/order",
	type:"post",
	data:{"productNo":productNo,"orderCount":productCount},
	sucsess:function(data){
	if(data=="success"){
		location.replace("/order/order.kh");
		}else{
		alert("로그인하세요");
		}
	},error:function(){
	 alert("ajax 통신 오류! 관리자에게 문의해 주세요!");
	
	}
	
	});

}