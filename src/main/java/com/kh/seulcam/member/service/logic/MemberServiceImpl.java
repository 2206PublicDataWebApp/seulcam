package com.kh.seulcam.member.service.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.member.service.MemberService;
import com.kh.seulcam.member.store.MemberStore;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private MemberStore mStore;
	
	@Override
	public int registerMember(Member member) {
		int result = mStore.insertMember(session, member);
		return result;
	}
	
	@Override
	public Member loginMember(Member member) {
		Member mOne 
		= mStore.selectLoginMember(session, member);
		return mOne;
	}
}
