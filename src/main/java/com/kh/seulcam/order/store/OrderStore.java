package com.kh.seulcam.order.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.order.domain.Order;
import com.kh.seulcam.order.domain.OrderPay;
import com.kh.seulcam.order.domain.OrderProduct;
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


}
