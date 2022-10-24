package com.kh.seulcam.order.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.order.store.OrderStore;

@Repository
public class OrderStoreLogic implements OrderStore {

	@Override
	public Member printMemberInfo(SqlSession session, Member memberId) {
		Member member = session.selectOne("OrderMapper.selectMemberInfo",memberId);
		return member;
	}

	@Override
	public int changeAddress(SqlSession session, Member member) {
		int result = session.update("OrderMapper.updateAddress",member);
		return result;
	}

}
