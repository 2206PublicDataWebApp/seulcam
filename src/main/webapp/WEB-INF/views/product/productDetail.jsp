<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
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
<link rel="shortcut icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/faviconlogo.ico" type="image/x-icon">

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zj6zbz23cl"></script>

<body>
	<jsp:include page="/WEB-INF/views/common/headerBack.jsp" />

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
				<br><br>
				<table id="info-table">
					<tr>
						<td>제품번호</td>
						<td>${product.productNo }</td>
					</tr>
					<tr>
						<td>브랜드명</td>
						<td>${product.brandName }</td>
					</tr>
					<tr>
						<td>소재</td>
						<td>${product.productMaterial }</td>
					</tr>
					<tr>
						<td>색상</td>
						<td>${product.productColor } <span class="colorchip"
						style="background-color:${product.productColor };">　</span></td>
					</tr>
				</table>
				<c:if test="${reviewCount ne 0}">
					<span id="go-review">후기 ${reviewCount }개 보기</span>
				</c:if>
			
				<span class="price"> 
					<c:if test="${product.discount eq 0}">
                          	<span id="priceBox">
                          		<span class="resultPrice">
                          			<fmt:formatNumber value="${product.productPrice}" pattern="#,###"/>원
                          			<input type="hidden" id="intPrice" value="${product.productPrice}">
                       			</span>
                       		</span>
                          			
                    </c:if>
                    <c:if test="${product.discount ne 0}">
                           <span id="priceBox">
                           	<span class="befPrice" style="text-decoration:line-through" val="${product.productPrice}">${product.productPrice}</span>
                           	<span class="discount" style="color:red;" value="${product.discount }">${product.discount }%↓</span>
                           	<span class="resultPrice" value="${resultPrice }"><fmt:formatNumber value="${resultPrice }" pattern="#,###"/>원</span>
                           	<input type="hidden" id="intPrice" value="${resultPrice }">
                           </span>
                   	</c:if>
				</span> <br>
			</div>
		
			<div class="count-wrap _count">
				<button type="button" class="minus">-</button>
				<input type="text" class="inp"  />
				<button type="button" class="plus">+</button>
			</div>
			<br>
			<br>
			<br>
			<div class="totalPrice">
				<span id="totalPriceSum">0</span> <span style="float: left">총액</span>

			</div>

			<c:if test="${product.productStock eq 0 }">
				<div id="soldOut">품절된 상품입니다.</div>
			</c:if>
			<c:if test="${product.productStock ne 0 }">
				<div class="buttons">
					<button type="button" class onclick="product_cart(${product.productNo})" id="actionCart">장바구니</button>
					<button type="button" class onclick="product_buy(${product.productNo})" id="actionBuy">바로구매</button>
				</div>
				
			</c:if>


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
					<div id="map" style="width: 100%; height: 400px;"></div><br><br>
					<p><b>${product.brandName }</b></p><br>
					<p id="store_addr"></p>
					<div class="search" style="">
			            <input id="address" type="hidden" value="">
			        </div>

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

				<ol class="ac-sub" id="review_title_all">

				</ol>
			</article>

			<article class="ac-sub-text">
				<div class="ac-sub">
					<p id="review_list"></p>
				</div>
			</article>
		</div>
		<br>
		<br>

	</section>
<script src="/resources/js/product/cart-order.js"></script>
<script>
$("#go-review").click(function(){
	$('html, body').scrollTop( $(document).height() );
});
 
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
            $count.attr("value",num);
        }
    }
});
    $(function(){
    	var num = $('.totalPrice').children("#totalPriceSum").text()
        	//아이디 tag인 태그의 text를 읽어온다 
    	num2 = $.numberWithCommas(parseInt(num));
      	// 받아온 text값을 정수로 변환하여 numberwithCommas 함수의 인자값으로 넣는다
    })
    $.numberWithCommas = function (x) {
    	  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    	}
    
    $('.minus').click(function(e){
        e.preventDefault();
    	var now = $(".inp").val();
        
	    var price=$("#intPrice").val();
	    console.log(price);
	    var totalPrice=(price*now).toLocaleString()
	    $('.totalPrice').children("#totalPriceSum").text(totalPrice);
    });
    	
   
    $('.plus').click(function(e){
        e.preventDefault();
    	var now = $(".inp").val();
        var price=$("#intPrice").val();
        console.log(price);
        var totalPrice=(price*now).toLocaleString()
	    $('.totalPrice').children("#totalPriceSum").text(totalPrice);
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
			  			if(dList[i].detailFileRename!=null){
			  				
					        strDOM += "<img src="+pUrl+dList[i].detailFileRename+">";
			  			}
				        if(title!=null){
					        strDOM += '<p class="title">'+ title +'</p>';
				        }
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
		 var strDOM="";
		 $.ajax({
			 url :"/product/reviewList",
			 data:{
				 "productNo":productNo,
				
				 },
			 type:"get",
			dataType: 'json',
			 success : function(data){
				 console.log(data);
				 if(data.totalCount!=null){
					 
					  $("#review_title_all").html("");	
									strDOM+='<div id="review_count">구매후기'+data.totalCount+'개</div>';
						 for(var i in data.rList){
							 var rList = data.rList[i];
							 var idx = Number(data.startNum)+Number(i)+1;   
								 
							 
									var rUrl="../resources/puploadFiles/";
									strDOM+='<li>';
								 	strDOM+='<input class="ac-input" id="review-'+i+'" name="review-'+i+'" type="checkbox"/>';
								 	strDOM+='<label class="ac-label" name="reviewTitle" id="reviewTitle" for="review-'+i+'">';
								 	if(rList.reviewFileRename1!=null){
									 	strDOM+= '<img src='+rUrl+rList.reviewFileRename1+' class="review-thumbNail">';
								 	}
								 	strDOM+='<div class="review_title_text"><span>';
								 	if(rList.reviewFileRename1!=null){
									 	strDOM+='<b>'+rList.memberId+'님의 포토 상품후기</b></span><br><br><span>'+rList.reviewTitle+'</span></div>';
								 	}else{
									 	strDOM+=rList.memberId+'님의 상품후기</span><br><br><span>'+rList.reviewTitle+'</span></div>';
								 	}
								 	strDOM +='</label>';
								 	strDOM+='<article class="ac-text"><div class="ac-sub">';
								 	strDOM += '<div class="image_panel">';
								 	if(rList.reviewFileRename1!=null){
							        	strDOM +='<img src='+rUrl+rList.reviewFileRename1 +'>';
								 	}
								 	if(rList.reviewFileRename2!=null){
							        strDOM +='<img src='+rUrl+rList.reviewFileRename2 +'>';
								 	}
								 	if(rList.reviewFileRename3!=null){
							        	strDOM +='<img src='+rUrl+rList.reviewFileRename3 +'>';
								 	}
								 	strDOM+='</div>';
									strDOM+= '<div class="review-grade"><span class="star">★★★★★';
									strDOM+= ' <span id="checkstar" style="width:'+(rList.reviewGrade*10)+'%">★★★★★</span></span><span>('+rList.reviewGrade+'/10)</span></div>';
								 	strDOM+= '<p>'+rList.reviewTitle+'</p>';
								 	strDOM+= '<p>'+rList.reviewTitle+'</p>';
								 	strDOM+= '<p>'+rList.reviewContents+'</p>';
								 	
								 	
					
								 strDOM+='</li>';
						 }
						 strDOM+='<div id="reivew_page_box">';
						 for(var j = 1; j<data.maxPage+1; j++){
							 if(j==1){
								 strDOM+='<button type="button" id="reivew_page" onclick="reivewPage('+j+')" style="font-weight:bold">'+j+'</a>';
							 }else{
								 
							 strDOM+='<button type="button" id="reivew_page" onclick="reivewPage('+j+')" style="color:#aaa">'+j+'</a>';
							 }
						 }
						 strDOM+='</div>';
						
				 }
				 else{
					 $("#review_title_all").html("");	
					 strDOM+='<div id="no_review">등록된 상품평이 없습니다.</div>';
				 }
				 $("#review_title_all").append(strDOM); 
			 },
			 error : function(){
				
				 console.log("리스트불러오기 실패");
				 $("#review_title_all").append(strDOM);
			 }
			 
		 });
	 }
	 
 });
 function reivewPage(currentPage){
	 var productNo="${product.productNo}";
	var page = currentPage;
		 var strDOM="";
		 $.ajax({
			 
			 url :"/product/reviewList",
			 data:{
				 "productNo":productNo,
				 "page":page,
				 },
			 type:"get",
			 success : function(data){
				 console.log(data);
				  $("#review_title_all").html("");	
								strDOM+='<div id="review_count">구매후기'+data.totalCount+'개</div>';
					 for(var i in data.rList){
						 var rList = data.rList[i];
						 var idx = Number(data.startNum)+Number(i)+1;   
							 
						 
								var rUrl="../resources/puploadFiles/";
								strDOM+='<li>';
							 	strDOM+='<input class="ac-input" id="review-'+i+'" name="review-'+i+'" type="checkbox"/>';
							 	strDOM+='<label class="ac-label" name="reviewTitle" id="reviewTitle" for="review-'+i+'">';
							 	if(rList.reviewFileRename1!=null){
								 	strDOM+= '<img src='+rUrl+rList.reviewFileRename1+' class="review-thumbNail">';
							 	}
							 	strDOM+='<div class="review_title_text"><span>';
							 	if(rList.reviewFileRename1!=null){
								 	strDOM+='<b>'+rList.memberId+'님의 포토 상품후기</b></span><br><br><span>'+rList.reviewTitle+'</span></div>';
							 	}else{
								 	strDOM+=rList.memberId+'님의 상품후기</span><br><br><span>'+rList.reviewTitle+'</span></div>';
							 	}
							 	strDOM +='</label>';
							 	strDOM+='<article class="ac-text"><div class="ac-sub">';
							 	strDOM += '<div class="image_panel">';
							 	if(rList.reviewFileRename1!=null){
						        	strDOM +='<img src='+rUrl+rList.reviewFileRename1 +'>';
							 	}
							 	if(rList.reviewFileRename2!=null){
						        strDOM +='<img src='+rUrl+rList.reviewFileRename2 +'>';
							 	}
							 	if(rList.reviewFileRename3!=null){
						        	strDOM +='<img src='+rUrl+rList.reviewFileRename3 +'>';
							 	}
							 	strDOM+='</div>';
								strDOM+= '<div class="review-grade"><span class="star">★★★★★';
								strDOM+= ' <span id="checkstar" style="width:'+(rList.reviewGrade*10)+'%">★★★★★</span></span><span>('+rList.reviewGrade+'/10)</span></div>';
							
							 	strDOM+= '<p>'+rList.reviewTitle+'</p>';
							 	strDOM+= '<p>'+rList.reviewTitle+'</p>';
							 	strDOM+= '<p>'+rList.reviewContents+'</p>';
							 	
							 	
				
							 strDOM+='</li>';
					 }
					 strDOM+='<div id="reivew_page_box">';
					 for(var j = 1; j<data.maxPage+1; j++){
						 if(data.currentPage==j){
							 strDOM+='<button type="button" id="reivew_page" onclick="reivewPage('+j+')" style="font-weight:bold">'+j+'</a>';
						 }else{
							 
						 strDOM+='<button type="button" id="reivew_page" onclick="reivewPage('+j+')"  style="color:#aaa">'+j+'</a>';
						 }
					 }
					 strDOM+='</div>';
					$("#review_title_all").append(strDOM);
			 },
			 error:function(){
				 console.log("리스트불러오기 실패");
				 $("#review_title_all").append(strDOM);
			 }
		 });
		
 }
 
	function reviewDelete(reviewNo){
		console.log(reviewNo);
 		if(confirm("리뷰 삭제하시겠습니까?")){
	 		 $.ajax({
	 			 url: "/product/reviewDelete",
	 			 data: {"reviewNo":reviewNo},
	 			 type:"get",
	 			 success:function(data){
	 				if(data=="success"){
	 					alert("리뷰가 삭제되었습니다.");
	 					$("input:checkbox[id='ac-4']").prop("checked", false);
					}else{
						alert("리뷰 삭제 실패!");
					}
	 			 }, error : function(){
	 				alert("ajax 통신 오류! 관리자에게 문의하세요!!");
				 }
	 			 
	 		 });
 		}
	};
 
 $("#ac-2").change(function(){
	 var brandName = '${product.brandName}';
/* 			 var mapOptions = new naver.maps.Map('map', {
				    center: new naver.maps.LatLng(36.3504119, 127.3845475),
				    zoom: 5
				}); */
	var fullAddr="";
	 if($("#ac-2").is(":checked")){
		 $.ajax({
			 url:"/product/brandStore",
			 data:{"brandName":brandName},
			 type:"get",

			 success:function(data){

	
				var fullAddrs = new Array();
				fullAddr = "";
				$(function() {
					
					initMap();
					
				});


				function initMap() { 
					
					var areaArr = new Array();  // 지역을 담는 배열 ( 지역명/위도경도 )
						 for(var i=0; i<data.bsList.length;i++){
							 if(data.bsList[i].storeName!=null){
								 
								areaArr.push(
								 {location : data.bsList[i].storeName , lat : data.coordsList[i][1] , lng : data.coordsList[i][0] },  
								);
								 fullAddr+="<p><button type='button' onclick='findStore("+i+")' class='findStore'><b>"+data.bsList[i].storeName+"</b>";
								 fullAddr+="</button>ㅤㅤ["+data.bsList[i].storeZipcode+"] ";
								 fullAddr+=data.bsList[i].storeAddr;
								 fullAddr+=" "+data.bsList[i].storeAddrDetail+"</p><br>";
								 fullAddrs.push("<p>"+data.bsList[i].storeAddr+"</p><p>"+data.bsList[i].storeAddrDetail)+"</p>";
							 }
						 }
						 $("#store_addr").append(fullAddr);
						
					
					
					
					
					let markers = new Array(); // 마커 정보를 담는 배열
					let infoWindows = new Array(); // 정보창을 담는 배열
					
					var map = new naver.maps.Map('map', {
				        center: new naver.maps.LatLng(36.3504119, 127.3845475), //지도 시작 지점
				        zoom: 5,
				        zoomControl : true,
					    zoomControlOptions : {
					    	position : naver.maps.Position.TOP_RIGHT,
					    	style : naver.maps.ZoomControlStyle.SMALL
					    }
				    });
					
					
					
					
					for (var i = 0; i < areaArr.length; i++) {
						// 지역을 담은 배열의 길이만큼 for문으로 마커와 정보창을 채워주자 !

					    var marker = new naver.maps.Marker({
					        map: map,
					        title: areaArr[i].location, // 지역구 이름 
					        position: new naver.maps.LatLng(areaArr[i].lat , areaArr[i].lng) // 지역구의 위도 경도 넣기 
					    });
					    
					    /* 정보창 */
						 var infoWindow = new naver.maps.InfoWindow({
						     content: '<div style="width:200px;text-align:center;padding:10px;"><b>' + areaArr[i].location + '</b><br> '+fullAddrs[i]+' </div>'
						 }); // 클릭했을 때 띄워줄 정보 HTML 작성
					    
						 markers.push(marker); // 생성한 마커를 배열에 담는다.
						 infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.
					}

					
				    
					 
				    function getClickHandler(seq) {
						
				            return function(e) {  // 마커를 클릭하는 부분
				                var marker = markers[seq], // 클릭한 마커의 시퀀스로 찾는다.
				                    infoWindow = infoWindows[seq]; // 클릭한 마커의 시퀀스로 찾는다
	
				                if (infoWindow.getMap()) {
				                    infoWindow.close();
				                } else {
				                    infoWindow.open(map, marker); // 표출
				                }
				    		}
				    	}
			  
				              
				    for (var i=0, ii=markers.length; i<ii; i++) {
				    	console.log(markers[i] , getClickHandler(i));
				        naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
				
				    }
				}

			

			 },
			 
			 
			 error : function(){
				 console.log("에러");
				 fullAddr+="<p>오프라인 매장이 등록되어있지 않습니다.</p>";
					 
				 $("#store_addr").append(fullAddr);
			 }
		 });
		 
	 }

 });  

 

</script>
<%-- --%>
</body>
</html>