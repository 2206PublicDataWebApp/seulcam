<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
 .title{
            
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    height: 50px;
    position: relative;
    font-size: 16px;

        }


        .MOrderCartGoodsCheckBar__wrap{
            display: flex;
    padding: 15px;
    justify-content: space-between;
    align-items: center;
        }
    
        .MOrderCartSale {
    padding-bottom: 24px;
}
body {
    font-size: 14px;
    font-family: '-apple-system',HelveticaNeue,Roboto,'Noto Sans KR',helvetica,Gulim,sans-serif;
    line-height: 1.5;
    color: #000;
}
.form {
    position: relative;
}

.count-wrap {position: relative;padding: 0 38px;border: 1px solid #ddd;overflow: hidden;width: 60px;}
.count-wrap > button {border: 0;background: #fff;color: #000;width: 38px;height: 38px;position: absolute;top: 0;font-size: 12px;}
.count-wrap > button.minus {left: 0;}
.count-wrap > button.plus {right: 0;}
.count-wrap .inp {border: 0;height: 38px;text-align: center;display: block;width: 100%;}
    </style>
<body>

 <div class="wrap">
    <div class="title">
        <h2 class="common_layout">장바구니</h2>

    </div>
    <div class="MOrderCartGoodsCheckBar__wrap">
        <div class="MOrderCartGoodsCheckBar__checkbox" data-ga-event="cart" data-ga-dimension19="button" data-ga-label="전체선택 선택|해제">
            <input type="checkbox" id="check_all" name="check_all" class="blind" onclick="Cart.checkCartNo(this);" checked="">
            <label for="check_all" class="MOrderCartGoodsCheckBar__checkbox__label">전체&nbsp;</label>
            <span id="total_cart_cnt"><strong>28</strong>개</span>
        </div>
        <button class="MOrderCartGoodsCheckBar__clear MOrderCartGoodsCheckBar__clear--active" data-ga-event="cart" data-ga-dimension19="button" data-ga-label="선택삭제" id="delete_checked_cart" onclick="Cart.viewDeleteSelectPopup(); return false;" style="">선택 삭제
        </button>
    </div>

    <div class="order-cart__goods">
				<div class="MOrderCartGoods" data-goodsno="2774157" data-price="21000" data-brand="wick" data-dimension17="0" data-dimension18="장바구니/리스트" data-gtm-vis-first-on-screen-11584968_1136="1241" data-gtm-vis-total-visible-time-11584968_1136="100" data-gtm-vis-has-fired-11584968_1136="1" data-gtm-vis-first-on-screen-11584968_147="1661" data-gtm-vis-total-visible-time-11584968_147="2500" data-gtm-vis-first-on-screen-11584968_1453="1783" data-gtm-vis-total-visible-time-11584968_1453="2500" data-gtm-vis-has-fired-11584968_147="1" data-gtm-vis-has-fired-11584968_1453="1">
			<div class="order-goods-thumbnail
																					">
				<input type="hidden" name="cart_goods_no" value="2774157">
				<input type="hidden" name="no" value="726602388">
				<input type="hidden" id="goods_2774157_0_CHARCOAL / FREE" value="0">
				<input type="hidden" name="cart_info" value="2774157|0|CHARCOAL / FREE">
				<input type="hidden" name="sale_yn" value="Y">
				<input type="hidden" name="sales_pause_yn" value="N">
				<input type="hidden" name="domestic_disable_order_yn" value="N">
				<input type="hidden" name="good_qty" value="724">
				<input type="hidden" name="goods_cnt" id="goods_cnt_0" value="1">
				<input type="hidden" name="good_price" id="good_price_0" value="21000">
				<input type="hidden" name="goods_normal_price" id="goods_normal_price_0" value="21000">
				<input type="hidden" name="goods_opt_price" value="0">
				<input type="hidden" name="goods_addopt_amt" value="0">
				<input type="hidden" name="used_yn" value="N">
				<input type="hidden" name="offline_goods_yn" value="">
				<input type="hidden" name="goods_nm" value="ACID 워싱 볼캡-차콜">
				<input type="hidden" name="brand_nm" value="윅">
				<input type="hidden" name="raffle_purchase" value="Y">
				<input type="hidden" name="raffle_yn" value="N">
				<input type="hidden" name="ptn_dc_amt" value="0">
				<input type="hidden" name="app_goods_yn" value="">
				<input type="hidden" name="release_yn" value="">
				<input type="hidden" name="release_dt" value="-111300000">
				<input type="hidden" name="exclusive_msspay" value="N">
				<input type="hidden" name="exclusive_msspay_hyundaicard" value="N">
				<input type="hidden" name="group_dc_limit_yn" value="Y">

				<input type="hidden" name="goods_no_726602388" value="2774157">
				<input type="hidden" name="goods_sub_726602388" value="0">
				<input type="hidden" name="limited_qty_yn_726602388" value="">
				<input type="hidden" name="limited_total_qty_yn_726602388" value="">
				<input type="hidden" name="limited_total_qty_period_726602388" value="0">
				<input type="hidden" name="limited_min_qty_726602388" value="1">
				<input type="hidden" name="limited_max_qty_726602388" value="999">

				<div class="order-goods-thumbnail__checkbox" data-ga-event="cart_product" data-ga-dimension19="button" data-ga-label="선택|해제">
										<input type="checkbox" class="checked_cart cart_no blind" name="cart_no" value="726602388" id="no_726602388" checked="checked" onclick="Cart.checkCartNo(this);">
					<label for="no_726602388" class="order-goods-thumbnail__checkbox__label" style="font-size: 0">상품 선택</label>
									</div>

				<a href="/app/goods/2774157/0" class="order-goods-thumbnail__link">
										<img src="//image.msscdn.net/images/goods_img/20220906/2774157/2774157_1_160.jpg" alt="윅(WICK) ACID 워싱 볼캡-차콜" class="order-goods-thumbnail__image order-goods-thumbnail__image--center">
									</a>
			</div>

			<div class="COrderCartGoodsItem">
				<div class="COrderCartGoodsItem__goods-wrap">
					<div class="COrderCartGoodsItem__goods">
												<a href="/app/goods/2774157/0" class="COrderCartGoodsItem__goods__brand">윅</a>
						<a href="/app/goods/2774157/0" class="COrderCartGoodsItem__goods__name">ACID 워싱 볼캡-차콜</a>
					</div>
										<button type="button" class="COrderCartGoodsItem__delete" aria-label="상품 삭제" data-ga-event="cart_product" data-ga-dimension19="button" data-ga-label="삭제" onclick="Cart.viewDeleteSelectPopup('726602388'); return false;">
						<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 22 22">
							<title></title>
							<path class="svg-color" fill-rule="evenodd" d="M17.646 3.646l.708.708L11.707 11l6.647 6.646-.708.708L11 11.707l-6.646 6.647-.708-.708L10.293 11 3.646 4.354l.708-.708L11 10.293l6.646-6.647z"></path>
						</svg>
					</button>
									</div>

				<div class="COrderCartGoodsItem__option-wrap">
					<span class="COrderCartGoodsItem__option">
													CHARCOAL / FREE
																												  	</span>
									</div>

					
					<div class="COrderCartGoodsItem__price">
						<span>21,000</span>원
					</div>

				</div>
			</div>
		</div>

    
        <div class="count-wrap _count">
            <button type="button" class="minus">-</button>
            <input type="text" class="inp" value="1" />
            <button type="button" class="plus">+</button>
        </div>
						
				<div class="MOrderCartSale">
									<div class="MOrderCartSale__charge" style="display:none">
				<dl class="order-item order-item--14">
					<dt class="order-item__title order-item__title--black">배송비</dt>
					<dd class="order-item__value order-item__value--black">
													<input type="hidden" name="good_dlv" value="0">
							<span class="text-dc">0원</span>
											</dd>
				</dl>
			</div>
								

				
						
									
		</div>
			</div>

    </div>
</body>
</html>