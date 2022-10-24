package com.kh.seulcam.order.service;

import java.util.List;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.member.domain.Member;

public interface OrderService {

	public Member printMemberInfo(Member memberId);

	public int changeAddress(Member member);


}
