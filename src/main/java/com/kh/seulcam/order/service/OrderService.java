package com.kh.seulcam.order.service;

import java.util.List;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.order.domain.Order;
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


	

	


}
