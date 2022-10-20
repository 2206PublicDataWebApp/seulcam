package com.kh.seulcam.member.service.logic;

import java.util.List;

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
	
	@Override
	public int checkOneEmail(String memberEmail) {
		int result = mStore.countByEmail(session, memberEmail);
		return result;
	}
	
	@Override
	public List<Member> listIdByEmail(String memberEmail) {
		List<Member> mList = mStore.selectIdListByEmail(session, memberEmail);
		return mList;
	}
}
