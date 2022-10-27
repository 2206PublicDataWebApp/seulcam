package com.kh.seulcam.order.service.logic;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.order.domain.Order;
import com.kh.seulcam.order.domain.OrderProduct;
import com.kh.seulcam.order.service.OrderService;
import com.kh.seulcam.order.store.OrderStore;
import com.kh.seulcam.product.domain.Product;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderStore oStore;
	
	@Autowired
	private SqlSession session;

	@Override
	public Member printMemberInfo(Member memberId) {
		Member member =oStore.printMemberInfo(session,memberId);
		return member;
	}

	@Override
	public int changeAddress(Member member) {
		int result = oStore.changeAddress(session,member);
		return result;
	}

	@Override
	public List<OrderProduct> printProductInfo(Member memberId) {
		List<OrderProduct>oList = oStore.printProductInfo(session,memberId);
		return oList;
	}

	@Override
	public List<Product> printAllProduct(int productNo) {
		List<Product>pList = oStore.selectProduct(session,productNo);
		return pList;
	}

	@Override
	public int conpleteOrder(Order order) {
		int result = oStore.registOrder(session,order);
		return result;
	}
	
	
}
