package com.kh.seulcam.cart.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.seulcam.cart.domain.Cart;

public interface CartStore {

	List<Cart> selectCart(SqlSession session, String memberId);

}
