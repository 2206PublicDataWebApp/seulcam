
function product_cart(pNo){
var cartCount=Number($('.inp').val());
if(cartCount == 0){

alert("1개 이상 선택해주세요");

return false;
}else{

$.ajax({
	url:"/product/cart",
	type:"post",
	data:{"productNo": pNo,"cartCount":cartCount},
	success:function(message){
	if(message=="success"){
		alert("장바구니에 담겼습니다.");
		}
	else if(message=="noLogin"){
		alert("로그인하세요");
		location.replace("/member/loginView");
		}
	else if(message="sameProduct"){
		alert("이미 담겨진 물건입니다.");
	}
	},error:function(){
	 alert("ajax 통신 오류! 관리자에게 문의해 주세요!");
	
	}
});
}

}

function product_buy(pNo){
var orderCount=Number($('.inp').val());
if(orderCount == 0){

alert("1개 이상 선택해주세요");

return false;
}else{
	
$.ajax({
	url:"/product/order",
	type:"post",
	data:{"productNo":pNo,"orderCount":orderCount},
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
}
