package com.kh.seulcam.member.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.member.store.MemberStore;

@Repository
public class MemberStoreLogic implements MemberStore{
	
	@Override
	public int insertMember(SqlSession session, Member member) {
		int result = session.insert("MemberMapper.insertMember", member);
		return result;
	}
	
	@Override
	public Member selectLoginMember(SqlSession session, Member member) {
		Member mOne 
		= session.selectOne("MemberMapper.selectLoginOne", member);
		return mOne;
	}
}
