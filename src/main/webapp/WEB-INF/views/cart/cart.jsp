<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>장바구니</title>
<script src="../../../resources/js/jquery-3.6.1.min.js"></script>
</head>
<style>
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
.click_table{
	width:100%;
	/* display:block; */
	border: 1px solid #444444;

}
.list_table {
	/* position: relative;
	left:100px; */
	/* display:block;  */
	width:100%;
	border: 1px solid #444444;
	text-align:center;
	/* display: flex;
	align-items: center;
	justify-content: center;
	height: 50px;
	position: relative;
	font-size: 16px; */
}
.price_table{
	width:100%;
	height:120px;
	border: 1px solid #444444;
	text-align:center;
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
.cart_delete{
  border: none;
  position:relative;
  left:10px;
  top:10px;
   align:left;
   valign:top; 
    display: inline-block;
    width: 30px;
    height: 30px;
   /*  transform: rotate(45deg); */
    opacity: .3;
    font-size: 50;
    
}
.order{
    background: #000;
    color: #fff;
    width: 100%;
    height: 50px;
    line-height: 30px;
    font-size:20px;
}
.delete{
  border: none;
width:50px;
height:50px;
font-size:40px;
display: inline-block;
opacity: .3;
}
.cart_button{
	background: #000;
    color: #fff;
    width: 100px;

}
</style>

<body>

	<div class="wrap">

		<div class="head">
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>
		<div class="title">
			<h2 class="common_layout">장바구니</h2>

		</div>
		<div class="cart_wrap">


			<table class="click_table">
				<tr>
					<td>
					<input type="checkbox" id="check_all" name="cart_selectAll" onclick="selectAll(this)" /> 
					<label>전체</label> 
					<span id="total_cart_cnt"><strong id="cart_count"></strong>개</span>
					</td>
					<td align="right">
						<button class="cart_button">선택 삭제</button>
					</td>
				</tr>
				<tr>
					<td>
					<label>물건을 더 추가하시겠습니까?</label></td>
					<td align="right">
						<button class="cart_button">추가하기</button>
					</td>
				</tr>


			</table>
		

		<div class="cart_list">
		
		<table class="list_table">
		<tr>
		<td rowspan="4">
				<input type="checkbox" id="check_select" name="cartbox" onclick="checkSelectAll()" /> 
		</td>
		<td rowspan="4">
		<img src="//image.msscdn.net/images/goods_img/20220906/2774157/2774157_1_160.jpg" alt="윅(WICK) ACID 워싱 볼캡-차콜" >
		</td>
		<td>
		윅(WICK) ACID 워싱 볼캡-차콜
		</td>
		<td align="right" >
		
		<button class="delete">X</button>
		</td>
		</tr>
		
		<tr>
		
		<td>
		수량
		</td>
		<td>
		<div class="count-wrap _count">
			<button type="button" class="minus">-</button>
			<input type="text" class="inp" value="1" />
			<button type="button" class="plus">+</button>
		</div>
		</td>
		</tr>
		<tr>
		<td>
		가격
		</td>
		<td>
		<span id="price">459,000</span>
		</td>
		</tr>
		</table>
		<table class="list_table">
		<tr>
		<td rowspan="4">
				<input type="checkbox" name="cartbox" id="check_select"onclick="checkSelectAll()" /> 
		</td>
		<td rowspan="4">
		<img src="//image.msscdn.net/images/goods_img/20220906/2774157/2774157_1_160.jpg" alt="윅(WICK) ACID 워싱 볼캡-차콜" >
		</td>
		<td>
		윅(WICK) ACID 워싱 볼캡-차콜
		</td>
		<td align="right" >
		
		<button class="delete" onclick="selectDelete(this)">X</button>
		</td>
		</tr>
		
		<tr>
		
		<td>
		수량
		</td>
		<td>
		<div class="count-wrap _count">
			<button type="button" class="minus">-</button>
			<input type="text" class="inp" value="1" />
			<button type="button" class="plus">+</button>
		</div>
		</td>
		</tr>
		<tr>
		<td>
		가격
		</td>
		<td>
		<span id="price">459,000</span>
		</td>
		</tr>
		</table>
		

		</div>
		
		<div class="price">
			<table class="price_table">
			<tr>
			<td align="right">결제할 상품</td>
			<td align="right">
			총*개
			</td>
			
			</tr>
			<tr>
			<td align="right">
			상품금액
			</td>
			<td align="right">
			***원
			</td>
			</tr>
			</table>		
		
		</div>
		<div>
		<button class="order">주문하기</button>
		</div>

	</div>
	</div>
	
	
	
	<script type="text/javascript">
	function checkSelectAll()  {
		  // 전체 체크박스
		  const checkboxes 
		    = document.querySelectorAll('input[name="cartbox"]');
		  // 선택된 체크박스
		  const checked 
		    = document.querySelectorAll('input[name="cartbox"]:checked');
		  // select all 체크박스
		  const selectAll 
		    = document.querySelector('input[name="cart_selectAll"]');
		  
		  if(checkboxes.length === checked.length)  {
		    selectAll.checked = true;
		  }else {
		    selectAll.checked = false;
		  }

	$('.cart_count').innerText=checked.length;
		}

		function selectAll(selectAll)  {
		  const checkboxes 
		     = document.getElementsByName('cartbox');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		  })
		}
	
	$('._count :button').on({
	    'click' : function(e){
	        e.preventDefault();
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
	            $count.val(num);
	        }
	    }
	});
	</script>

</body>
</html>