package com.kh.seulcam.member.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.kh.seulcam.member.domain.Member;

public interface MemberStore {
	
	// 회원가입
	public int insertMember(SqlSession session, Member member);
	
	// 로그인
	public Member selectLoginMember(SqlSession session, Member member);
	
	// 카카오 로그인
	public Member selectKakaoLoginMember(SqlSession session, String memberEmail);
	
	// selectOneByEmail
	public int countByEmail(SqlSession session, String memberEmail);
	
	// selectOneByNickname
	public int countByNickname(SqlSession session, String memberNickname);
	
	// selectOneById
	public int countById(SqlSession session, String memberId);
	
	// selectOneByPw
	public int countByIdPw(SqlSession session, Member member);
	
	// selectOneByPw
	public int countByIdEmail(SqlSession session, Member member);
	
	// 이메일로 아이디 리스트 가져오기
	public List<Member> selectIdListByEmail(SqlSession session, String memberEmail);

	// selectOneById
	public Member selectOneById(SqlSession session, String memberId);
	
	// 닉네임 바꾸기
	public int updateMemberNickname(SqlSession session, Member member);
	
	//환불 계좌 정보 바꾸기
	public int updateMemberAccount(SqlSession session, Member member);
	
	//환불 계좌 정보 바꾸기
	public int updateMemberAddress(SqlSession session, Member member);
	
	// 비밀번호 바꾸기
	public int updateMemberPw(SqlSession session, Member member);
	
	// 프로필 사진 바꾸기
	public int updateMemberProfile(SqlSession session, Member member);
	
	// 멤버 전체 선택
	public List<Member> selectMemberList(SqlSession session);
}
