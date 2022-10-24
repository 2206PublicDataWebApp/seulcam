package com.kh.seulcam.order.service.logic;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.order.service.OrderService;
import com.kh.seulcam.order.store.OrderStore;

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
	
	
}
