package com.kh.seulcam.cart.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.cart.store.CartStore;

@Repository
public class CartStoreLogic implements CartStore{

	@Override
	public List<Cart> selectCart(SqlSession session, String memberId) {
		List<Cart>cList = session.selectList("CartMapper.selectAllCart",memberId);
		return cList;
	}
	

}
