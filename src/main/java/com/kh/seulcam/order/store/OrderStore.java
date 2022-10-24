package com.kh.seulcam.order.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.member.domain.Member;

public interface OrderStore {

	public Member printMemberInfo(SqlSession session, Member memberId);

	public int changeAddress(SqlSession session, Member member);


}
