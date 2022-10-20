<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable= no">
<title>상품상세</title>
</head>
<link rel="stylesheet" href="/resources/css/product/productDetail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zj6zbz23cl"></script>

<body>
 <section class="shop detail">
        <article class="gallery">
            <div class="swiper-container">
                <div class="swiper-wrapper" id="product-image">
                    <a href="" class="swiper-slide">
                        <img src="http://helinoxstore.co.kr/shopimages/helinox/0020030001272.jpg?1658475962">
                    </a>
                </div>
            </div>
        </article>
        <article class="order">
            <div class="cont">
                <h1>제품이름 / 제품색상</h1>
                <p class="color">
                    "색상"
                    <span class="colorchip" ></span>
                </p>
                <span class="price">
                    <span id="product-price" class="ProductPrice">389,000</span>
                    <input id="product_price" name="product_price" value="389000" type="hidden">
                </span>
                <br>
            </div>
            
            <div class="count-wrap _count">
                <button type="button" class="minus">-</button>
                <input type="text" class="inp" value="1" />
                <button type="button" class="plus">+</button>
            </div>
            <br><br><br>
            <div class="totalPrice">
                <span>총액</span>

            </div>
            
            <div class="buttons">
                <button type="button" class onclick="product_cart()" id="actionCart">장바구니</button>
                <button type="button" class onclick="product_buy()" id="actionBuy">바로구매</button>           
            </div>
            
           
        </article>
        <br>
        <br>
        <br>
        <br>

    </section>
    <section class="detail_menu">
        <div class="ac">
            <input class="ac-input" id="ac-1" name="ac-1" type="checkbox"/>
            <label class="ac-label" for="ac-1">상세정보</label>

            <article class="ac-text">

                <div class="ac-sub">                
                        <p>상품 상세정보</p>                     
                </div>
            </article>

        </div>
        <div class="ac">
            <input class="ac-input" id="ac-2" name="ac-2" type="checkbox"/>
            <label class="ac-label" for="ac-2">오프라인 매장</label>

            <article class="ac-text">
                <div class="ac-sub">                
                        <div id="map" style="width:100%;height:400px;"></div>   
                        <p>오프라인매장 지도 주소</p>                  
                </div>
            </article>

        </div>
        <div class="ac">
            <input class="ac-input" id="ac-3" name="ac-3" type="checkbox"/>
            <label class="ac-label" for="ac-3">배송/반품/교환 안내</label>

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
            <input class="ac-input" id="ac-4" name="ac-4" type="checkbox"/>
            <label class="ac-label" for="ac-4">상품후기</label>

            <article class="ac-text">

                <div class="ac-sub">
                    <input class="ac-input" id="review-1" name="review-1" type="checkbox"/>
                    <label class="ac-label reviewList" name="reviewTitle" id="reviewTitle" for="review-1">(아이디)님의 상품후기</label>
                    <article class="ac-sub-text">
                        <br>
                        <p>(아이디)님의 상품후기</p>

                        <p>상품후기내용상품후기내용상품후기내용상품후기내용상품후기내용상
                            상품후기내용상품후기내용상품후기내용상품후기내용상품후기내용상
                            상품후기내용상품후기내용상품후기내용상품후기내용상품후기내용
                            상품후기내용상품후기내용상품후기내용상품후기내용상품후기내용
                            상품후기내용상품후기내용상품후기내용상품후기내용상품후기내용.</p>
                        <br>
                        <p>
                            <div>
                                <span style="float: left;">수정</span>
                                <span style="float: right;">삭제</span>
                            </div>
                        </p>
                    </article>
                </div>
                <br><br>
                <a href="/product/reviewForm">후기작성</div>
            </article>
        </div>
    </section>
 <script>
    $('._count :button').on({
    'click' : function(e){
        e.preventDefault();
        var $count = $(this).parent('._count').find('.inp');
        var now = parseInt($count.val());
        var min = 1;
        var max = 999;
        var num = now;
        var price=$('#product-price').text();
        $('.totalPrice').html(price*now);
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
    
    var mapOptions = {
    	    center: new naver.maps.LatLng(37.3595704, 127.105399),
    	    zoom: 10
    	};

    	var map = new naver.maps.Map('map', mapOptions);
    	var map = new naver.maps.Map("map", {
            zoom: 6,
            center: new naver.maps.LatLng(36.2253017, 127.6460516),
            zoomControl: true,
            zoomControlOptions: {
                position: naver.maps.Position.TOP_LEFT,
                style: naver.maps.ZoomControlStyle.SMALL
            }
        }),
        markers = [];

    var HOME_PATH = window.HOME_PATH || '.';

    var cityhall = new naver.maps.LatLng(37.5666805, 126.9784147),
        map = new naver.maps.Map('map', {
            center: cityhall.destinationPoint(0, 500),
            zoom: 15
        }),
        marker = new naver.maps.Marker({
            map: map,
            position: cityhall
        });

    var contentString = [
            '<div class="iw_inner">',
            '   <h3>서울특별시청</h3>',
            '   <p>서울특별시 중구 태평로1가 31 | 서울특별시 중구 세종대로 110 서울특별시청<br />',
            '       <img src="'+ HOME_PATH +'/img/example/hi-seoul.jpg" width="55" height="55" alt="서울시청" class="thumb" /><br />',
            '       02-120 | 공공,사회기관 &gt; 특별,광역시청<br />',
            '       <a href="http://www.seoul.go.kr" target="_blank">www.seoul.go.kr/</a>',
            '   </p>',
            '</div>'
        ].join('');

    var infowindow = new naver.maps.InfoWindow({
        content: contentString
    });

    naver.maps.Event.addListener(marker, "click", function(e) {
        if (infowindow.getMap()) {
            infowindow.close();
        } else {
            infowindow.open(map, marker);
        }
    });

    infowindow.open(map, marker);

</script>
</body>
</html>