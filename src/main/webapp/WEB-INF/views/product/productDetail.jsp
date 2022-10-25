<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable= no">
<title>상품상세</title>
</head>
<link rel="stylesheet" href="/resources/css/product/productDetail.css">
<link rel="stylesheet" href="/resources/css/fonts.css">

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zj6zbz23cl"></script>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<section class="shop detail">
		<article class="gallery">
			<div class="swiper-container">
				<div class="swiper-wrapper" id="product-image">
					<a href="" class="swiper-slide"> <img
						src="../resources/puploadFiles/${product.mainFileRename}">
					</a>
				</div>
			</div>
		</article>
		<article class="order">
			<div class="cont">
				<h1>${product.productName }</h1>
				<p class="color">
					${product.productColor } <span class="colorchip"
						style="background-color:${product.productColor };">□</span>
				</p>
				<span class="price"> <span id="product-price"
					class="ProductPrice">${product.productPrice }</span> <input
					id="product_price" name="product_price" value="389000"
					type="hidden">
				</span> <br>
			</div>

			<div class="count-wrap _count">
				<button type="button" class="minus">-</button>
				<input type="text" class="inp" value="1" />
				<button type="button" class="plus">+</button>
			</div>
			<br>
			<br>
			<br>
			<div class="totalPrice">
				<span id="totalPriceSum">0</span> <span style="float: left">총액</span>

			</div>

			<div class="buttons">
				<button type="button" class onclick="product_cart()" id="actionCart">장바구니</button>
				<button type="button" class onclick="product_buy()" id="actionBuy">바로구매</button>
			</div>


		</article>
		<br> <br> <br> <br>

	</section>
	<section class="detail_menu">
		<div class="ac">
			<input class="ac-input" id="ac-1" name="ac-1" type="checkbox"
				checked="on" /> <label class="ac-label" for="ac-1">상세정보</label>

			<article class="ac-text">

				<div class="ac-sub">
					<p id="detail_photo_info"></p>
				</div>
			</article>

		</div>
		<div class="ac">
			<input class="ac-input" id="ac-2" name="ac-2" type="checkbox" /> <label
				class="ac-label" for="ac-2">오프라인 매장</label>

			<article class="ac-text">
				<div class="ac-sub">
					<div id="map" style="width: 100%; height: 400px;"></div>
					<p id="store_addr">오프라인매장 지도 주소</p>

				</div>
			</article>

		</div>
		<div class="ac">
			<input class="ac-input" id="ac-3" name="ac-3" type="checkbox" /> <label
				class="ac-label" for="ac-3">배송/반품/교환 안내</label>

			<article class="ac-text">

				<div class="ac-sub">

					<pre>
배송안내

1. 배송업체
-우체국택배
2. 배송비
-전상품 무료배송
3. 배송기간
-오후 5시 이전 결제 또는 입금건에 한하여 당일 출고
-출고 후 2~3일 이내 배송(일, 공휴일 제외)
-도서산간 지역 : 7일 이내 배송
-해외배송 : 최대 2주 이내 배송(지역에 따라 상이함)

반품 / 교환 안내

1. 반품/교환 택배비
-왕복택비비 5,000원~화물택배
-상품불량, 오배송 : 반품 배송비 무료
-단순변심, 고객사정 : 반품 배송비 부담
2. 신청 방법
-전화 접수->영업일 기준 2~3일 이내 지정 택배기사 직접 방문->상품 수거
-반품/교환 신청 : 1544-3039 ㅣ 02-6207-3039ㅣMON-FRI 09:00 ~ 18:00
3. 반품/교환 가능 시점
-변심, 주문 실수로 인한 교환/반품 : 7일 이내 신청 가능
-제품 하자, 피부 이상 증상으로 인한 교환/반품 : 28일 이내 신청 가능

반품 / 교환 신청 안내

01 .반품 / 교환 불가사유
-제품 포장 손상 또는 개봉 및 사용한 경우
-배송일로부터 7일이 경과된 경우
-교환 또는 반품 요청 후 5일 이내에 도착하지 않는 경우
-고객님의 부주의로 제품이 파손 및 손상된 경우
-제품 파손 및 손상이 아닌 경우, 화장소품은 불가
-제품의 겉포장이 손상되거나 분실한 경우
-부작용으로 인한 교환 및 반품 요청시 진단서가 제출되지 않은 경우
-부작용으로 인한 교환 및 반품 요청시 배송일로 부터 28일이 지난 경우
-왕복택배비가 동봉되지 않은 경우
</pre>


				</div>
			</article>

		</div>

		<div class="ac">
			<input class="ac-input" id="ac-4" name="ac-4" type="checkbox" /> <label
				class="ac-label" for="ac-4">상품후기</label>

			<article class="ac-text">

				<ol class="ac-sub" id="review_title">

				</ol>
				<div>
			 		<a href="/product/reviewRegist?productNo=${product.productNo }">후기작성 </a>
				</div>
			</article>

			<article class="ac-sub-text">
				<div class="ac-sub">
					<p id="review_list"></p>
				</div>
<!-- 				<p>
				<div>
					<span style="float: left;">수정</span> <span style="float: right;">삭제</span>
				</div>
				</p> -->
			</article>
		</div>
		<br>
		<br>

	</section>


<script>
 
 //갯수변경, 총액계산
 
 	$(".inp").val(0);
    $('._count :button').on({
    'click' : function(e){
        e.preventDefault();
        var $count = $(this).parent('._count').find('.inp');
        var now = parseInt($count.val());
        var min = 0;
        var max = ${product.productStock};
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
            }else{
            	alert("재고가 부족합니다!");
            }
        }
        if(num != now){
            $count.val(num);
        }
    }
});
    
    $('.minus').click(function(e){
        e.preventDefault();
    	var now = $(".inp").val();
        
	    var price=$('#product-price').text();
	    $('.totalPrice').children("#totalPriceSum").text(price*now);
    });
    	
   
    $('.plus').click(function(e){
        e.preventDefault();
    	var now = $(".inp").val();
	    var price=$('#product-price').text();
	    $('.totalPrice').children("#totalPriceSum").text(price*now);
    });
 
//상품상세 ajax

	 var productNo="${product.productNo}";
	 if($("#ac-1").is(":checked")){
		 $.ajax({
			 url:"/product/productDetailInfo",
			 data:{"productNo":productNo},
			 type:"get",
			 success : function(dList){
				 $("#detail_photo_info").html("");				
				 var strDOM="";
				 if(dList != null){
					 for(var i in dList){
					 	var pUrl="../resources/puploadFiles/";
						var title = dList[i].detailContents;
			  			strDOM += '<div class="image_panel">';
				        strDOM += '<img src='+pUrl+dList[i].detailFileRename+' >';
				        strDOM += '<p class="title">'+ title +'</p>';
				        strDOM += '</div>';
					 }
				$("#detail_photo_info").append(strDOM);
				 
				 }
			 },
			 error : function(){
				 console.log("에러");
			 }
		 });
	 }
	 
  
 //상품별 리뷰리스트
 $("#ac-4").change(function(){
	 var productNo="${product.productNo}";
	 if($("#ac-4").is(":checked")){
		 $.ajax({
			 url :"/product/reviewList",
			 data:{"productNo":productNo},
			 type:"get",
			 success : function(rList){
				 console.log(rList);
				 $("#review_title").html("");				
				 var strDOM="<div id='no_review'>등록된 상품평이 없습니다.</div>";
				 if(rList != null){
					 var strDOM="";
					 for(var i in rList){
						var rUrl="../resources/puploadFiles/";
						strDOM+='<li>';
					 	strDOM+='<input class="ac-input" id="review-'+i+'" name="review-'+i+'" type="checkbox"/>';
					 	strDOM+='<label class="ac-label" name="reviewTitle" id="reviewTitle" for="review-'+i+'">';
					 	strDOM+= rList[i].memberId+'님의 상품후기</label>';
					 	strDOM+='<article class="ac-text"><div class="ac-sub">';
					 	strDOM += '<div class="image_panel">';
					 	if(rList[i].reviewFileRename1!=null){
				        	strDOM +='<img src='+rUrl+rList[i].reviewFileRename1 +'>';
					 	}
					 	if(rList[i].reviewFileRename2!=null){
				        strDOM +='<img src='+rUrl+rList[i].reviewFileRename2 +'>';
					 	}
					 	if(rList[i].reviewFileRename3!=null){
				        	strDOM +='<img src='+rUrl+rList[i].reviewFileRename3 +'>';
					 	}
					 	strDOM+='</div>';
					 	strDOM+= '<p>'+rList[i].reviewTitle+'</p>';
					 	strDOM+= '<p>'+rList[i].reviewContents+'</p>';
					 	strDOM+='</div></article>'
					 	strDOM+='</li>';
					 	
					 }
				
					$("#review_title").append(strDOM);
				} 
			 },
			 error : function(){
				 console.log("에러");
			 }
			 
		 });
	 }
	 
 });
 
 $("#ac-2").change(function(){
	 var brandName = '${product.brandName}';
	 if($("#ac-2").is(":checked")){
		 $.ajax({
			 url:"/product/brandStore",
			 data:{"brandName":brandName},
			 type:"get",
			 
			 success:function(brand){
				 
				 var map = new naver.maps.Map("map", {
				        center: new naver.maps.LatLng(37.5666103, 126.9783882),
				        zoom: 16
				    }),
				    infoWindow = null;

				function initGeocoder() {
				    var latlng = map.getCenter();
				    var utmk = naver.maps.TransCoord.fromLatLngToUTMK(latlng); // 위/경도 -> UTMK
				    var tm128 = naver.maps.TransCoord.fromUTMKToTM128(utmk);   // UTMK -> TM128
				    var naverCoord = naver.maps.TransCoord.fromTM128ToNaver(tm128); // TM128 -> NAVER

				    infoWindow = new naver.maps.InfoWindow({
				        content: ''
				    });

				    map.addListener('click', function(e) {
				        var latlng = e.coord,
				            utmk = naver.maps.TransCoord.fromLatLngToUTMK(latlng),
				            tm128 = naver.maps.TransCoord.fromUTMKToTM128(utmk),
				            naverCoord = naver.maps.TransCoord.fromTM128ToNaver(tm128);

				        utmk.x = parseFloat(utmk.x.toFixed(1));
				        utmk.y = parseFloat(utmk.y.toFixed(1));

				        infoWindow.setContent([
				            '<div style="padding:10px;width:380px;font-size:14px;line-height:20px;">',
				            '<strong>LatLng</strong> : '+ '좌 클릭 지점 위/경도 좌표' +'<br />',
				            '<strong>UTMK</strong> : '+ '위/경도 좌표를 UTMK 좌표로 변환한 값' +'<br />',
				            '<strong>TM128</strong> : '+ '변환된 UTMK 좌표를 TM128 좌표로 변환한 값' +'<br />',
				            '<strong>NAVER</strong> : '+ '변환된 TM128 좌표를 NAVER 좌표로 변환한 값' +'<br />',
				            '</div>'
				        ].join(''));

				        infoWindow.open(map, latlng);
				        console.log('LatLng: ' + latlng.toString());
				        console.log('UTMK: ' + utmk.toString());
				        console.log('TM128: ' + tm128.toString());
				        console.log('NAVER: ' + naverCoord.toString());
				    });
				}

				naver.maps.onJSContentLoaded = initGeocoder;
			 },
			 error : function(){
				 console.log("에러");
			 }
		 });
		 
		 
	 }
	 
    
 });    
    
 
    
    
 
</script>
</body>
</html>