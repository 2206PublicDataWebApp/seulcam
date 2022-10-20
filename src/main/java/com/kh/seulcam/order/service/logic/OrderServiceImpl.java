package com.kh.seulcam.order.service.logic;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.seulcam.order.service.OrderService;
import com.kh.seulcam.order.store.OrderStore;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderStore oStore;
	
	@Autowired
	private SqlSession session;
	
	
}
