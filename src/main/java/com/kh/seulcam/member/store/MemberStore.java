package com.kh.seulcam.member.store;

import org.apache.ibatis.session.SqlSession;
import com.kh.seulcam.member.domain.Member;

public interface MemberStore {
	
	// 회원가입
	public int insertMember(SqlSession session, Member member);
	
	// 로그인
	public Member selectLoginMember(SqlSession session, Member member);
}
