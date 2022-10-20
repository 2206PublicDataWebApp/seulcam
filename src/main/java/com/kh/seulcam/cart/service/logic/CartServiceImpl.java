package com.kh.seulcam.cart.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.cart.service.CartService;
import com.kh.seulcam.cart.store.CartStore;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private SqlSession session;
	
	@Autowired
	private CartStore cStore;

	@Override
	public List<Cart> printAllCart(String memberId) {
		List<Cart>cList= cStore.selectCart(session,memberId);
		
		return cList;
	}

}
