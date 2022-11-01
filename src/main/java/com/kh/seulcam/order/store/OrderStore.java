package com.kh.seulcam.order.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.order.domain.Order;
import com.kh.seulcam.order.domain.OrderPay;
import com.kh.seulcam.order.domain.OrderProduct;
import com.kh.seulcam.point.domain.Point;
import com.kh.seulcam.product.domain.Product;

public interface OrderStore {

	public Member printMemberInfo(SqlSession session, Member memberId);

	public int changeAddress(SqlSession session, Member member);

	public List<OrderProduct> printProductInfo(SqlSession session, Member memberId);

	public List<Product> selectProduct(SqlSession session, int productNo);

	public int registOrder(SqlSession session, Order order);

	public int registOrderNo(SqlSession session, int orderNo, String memberId);

	public Order printOrder(SqlSession session, Integer orderNo);

	public int registPay(SqlSession session, OrderPay orderPay);

	public OrderPay printOrderPayInfo(SqlSession session, Integer orderNo);

	public int changeCompleteAddress(SqlSession session, Order order);

	public List<OrderProduct> printCompleteProduct(SqlSession session, Integer orderNo);

	public List<Order> printCompleteList(SqlSession session, String memberId);

	public List<OrderPay> printOrderPay(SqlSession session, int orderNo);
	
	//포인트 테이블에 저장(사용포인트)
	public int registPoint(SqlSession session, Point point);
	
	//관리자 주문 불러오기
	public List<Order> printAllOrder(SqlSession session);

	//관리자 배송 정보 변경
	public int cngDilivary(SqlSession session, Order order);
	//적립포인트 저장
	public int registGetPoint(SqlSession session, String point, String memberId);
	//구매확정으로 상태 변환
	public int updateDilivaryStatus(SqlSession session, Integer orderNo);
	//구매 취소 상태로 변환
	public int changeOrderCancle(SqlSession session, String orderNo, String memberId);



}
