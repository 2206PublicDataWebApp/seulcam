package com.kh.seulcam.cart.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.product.domain.Product;

public interface CartStore {

	public List<Cart> selectCart(SqlSession session, Member memberId);

	public List<Product> selectProduct(SqlSession session, int productNo);

	public int updateCount(SqlSession session, Cart cart);

	public int deleteOne(SqlSession session, Integer cartNo);

}
