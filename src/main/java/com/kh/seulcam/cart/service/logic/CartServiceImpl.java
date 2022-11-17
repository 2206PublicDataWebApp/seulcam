package com.kh.seulcam.cart.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.cart.service.CartService;
import com.kh.seulcam.cart.store.CartStore;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.order.domain.OrderList;
import com.kh.seulcam.product.domain.Product;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private SqlSession session;
	
	@Autowired
	private CartStore cStore;

	@Override
	public List<Cart> printAllCart(Member memberId) {
		List<Cart>cList= cStore.selectCart(session,memberId);
		
		return cList;
	}

	@Override
	public List<Product> printAllProduct(int productNo) {
		List<Product>pList = cStore.selectProduct(session,productNo);
		return pList;
	}

	@Override
	public int changeCart(Cart cart) {
		int result = cStore.updateCount(session,cart);
		return result;
	}

	@Override
	public int deleteOne(Integer cartNo) {
		int result = cStore.deleteOne(session,cartNo);
		return result;
	}

	@Override
	public int orderProduct(OrderList order) {
		int result =cStore.insertOrder(session,order);
		
		return result;
	}

	//체크선택 삭제
	@Override
	public int deleteCheck(String productNo, String memberId) {
			int result=cStore.deleteCheck(session,productNo,memberId);
		
		return result;
	}

	//장바구니 등록
	@Override
	public int registCart(Cart cart) {
		int result=cStore.registCart(session,cart);
		return result;
	}

	@Override
	public List<Cart> printCart(String memberId) {
		List<Cart>cList= cStore.printCart(session,memberId);
		return cList;
	}

	

}
