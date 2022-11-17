package com.kh.seulcam.cart.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.cart.store.CartStore;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.order.domain.OrderList;
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

	@Override
	public int insertOrder(SqlSession session, OrderList order) {
		int result = session.insert("OrderMapper.insertProduct",order);
		int result2 = session.delete("CartMapper.deleteCartProduct",order);
		return result;
	}


	@Override
	public int deleteCheck(SqlSession session, String productNo, String memberId) {
		 HashMap<String,String>paramMap=new HashMap<String,String>();
		  paramMap.put("productNo",productNo );
		  paramMap.put("memberId",memberId);
		int result=session.delete("CartMapper.deleteCheck",paramMap);
		
		return result;
	}

	@Override
	public int registCart(SqlSession session,Cart cart) {
		int result=session.insert("CartMapper.insertProduct",cart);
		return result;
	}

	@Override
	public List<Cart> printCart(SqlSession session, String memberId) {
		List<Cart>cList = session.selectList("CartMapper.selectAllCart",memberId);
		return cList;
	}
	

}
