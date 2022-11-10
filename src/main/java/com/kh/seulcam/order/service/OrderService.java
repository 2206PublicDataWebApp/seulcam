package com.kh.seulcam.order.service;

import java.util.List;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.order.domain.Order;
import com.kh.seulcam.order.domain.OrderCancle;
import com.kh.seulcam.order.domain.OrderPay;
import com.kh.seulcam.order.domain.OrderProduct;
import com.kh.seulcam.point.domain.Point;
import com.kh.seulcam.product.domain.Product;

public interface OrderService {

	public Member printMemberInfo(Member memberId);

	public int changeAddress(Member member);

	public List<OrderProduct> printProductInfo(Member memberId);

	public List<Product> printAllProduct(int productNo);

	public int conpleteOrder(Order order);

	public int registOrderNo(int orderNo, String memberId);

	public Order printOrderInfo(Integer orderNo);

	public int registOrderPrice(OrderPay orderPay);

	public OrderPay printOrderPayInfo(Integer orderNo);

	public int changeCompleteAddress(Order order);

	public List<OrderProduct> printCompleteProduct(Integer orderNo);

	public List<Order> printCompleteList(String memberId);

	public List<OrderPay> printOrderPay(int orderNo);
	//포인트
	public int registUsePoint(Point point);

	public int registGetPoint(String point, String memberId);
	
	//관리자
	
	//리스트 가져오기(관리자)
	public List<Order> printAllOrder();

	//배송정보 변경(관리자)
	public int cngDilivary(Order order);
	
	//구매확정으로 변경
	public int updateDilivaryStatus(Integer orderNo);

	//구매 취소로 변경
	public int changeOrderCancle(String orderNo, String memberId);

	//결제 정보 가져오기(관리자)
	public List<OrderPay> printAllPayInfo(int orderNo);

	//결제 취소 정보 저장(관리자)
	public int registRefund(OrderCancle orderCancle);
    
	//환불->주문테이블 상태 바꾸기(관리자)
	public int changeStatus(OrderCancle orderCancle);

	//환불->포인트 반환(관리자)
	public int registRefundPoint(String point, String memberId);

	//상세페이지->주문으로 넘기기
	public int orderProduct(OrderProduct orderProduct);

	//배송 상세조회 메뉴 바꾸기
	public List<Order> printChangeCompleteList(String memberId, String dirivaryStatus);

	//상품갯수 카운트 올리기(상품번호 가져오기)(주문시)
	public List<OrderProduct> plusProduct(int orderNo);

	//상품갯수 카운트 올리기(주문시)
	public int plusProductCount(int productNo);

	//상품갯수 카운트 줄이기(구매취소시)
	public int minusProductCount(int productNo);

	//주문중 페이지 벗어날시 주문상품 삭제(주문취소)
	public int deleteOrderProduct(String memberId);

	//갯수 구하기
	public int countDelStatus(String memberId, String dirivaryStatus);




	

	


}
