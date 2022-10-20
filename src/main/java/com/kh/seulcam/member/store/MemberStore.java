package com.kh.seulcam.member.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.kh.seulcam.member.domain.Member;

public interface MemberStore {
	
	// 회원가입
	public int insertMember(SqlSession session, Member member);
	
	// 로그인
	public Member selectLoginMember(SqlSession session, Member member);
	
	// selectOneByEmail
	public int countByEmail(SqlSession session, String memberEmail);
	
	// 이메일로 아이디 리스트 가져오기
	public List<Member> selectIdListByEmail(SqlSession session, String memberEmail);
}
