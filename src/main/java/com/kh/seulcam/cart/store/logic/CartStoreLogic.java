package com.kh.seulcam.cart.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.cart.store.CartStore;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.product.domain.Product;

@Repository
public class CartStoreLogic implements CartStore{

	@Override
	public List<Cart> selectCart(SqlSession session, Member memberId) {
		List<Cart>cList = session.selectList("CartMapper.selectAllCart",memberId);
		return cList;
	}

	@Override
	public List<Product> selectProduct(SqlSession session, int productNo) {
		List<Product>pList = session.selectList("CartMapper.selectAllProduct",productNo);
		return pList;
	}

	@Override
	public int updateCount(SqlSession session, Cart cart) {
		int result = session.update("CartMapper.updateCount",cart);
		return result;
	}

	@Override
	public int deleteOne(SqlSession session, Integer cartNo) {
		int result = session.delete("CartMapper.deleteOne",cartNo);
		return result;
	}
	

}
