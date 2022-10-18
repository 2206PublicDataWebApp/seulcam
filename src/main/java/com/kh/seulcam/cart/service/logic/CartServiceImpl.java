package com.kh.seulcam.cart.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.seulcam.cart.service.CartService;
import com.kh.seulcam.cart.store.CartStore;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private SqlSession session;
	
	@Autowired
	private CartStore cStore;

}
