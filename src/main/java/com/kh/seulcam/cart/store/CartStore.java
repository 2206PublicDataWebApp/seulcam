package com.kh.seulcam.cart.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.order.domain.OrderList;
import com.kh.seulcam.product.domain.Product;

public interface CartStore {

	public List<Cart> selectCart(SqlSession session, Member memberId);

	public List<Product> selectProduct(SqlSession session, int productNo);

	public int updateCount(SqlSession session, Cart cart);

	public int deleteOne(SqlSession session, Integer cartNo);

	public int insertOrder(SqlSession session, OrderList order);

	public int deleteCheck(SqlSession session, String productNo, String memberId);

	//장바구니 등록
	public int registCart(SqlSession session, Cart cart);
	//장바구니 가져오기(중복확인)
	public List<Cart> printCart(SqlSession session, String memberId);

}
