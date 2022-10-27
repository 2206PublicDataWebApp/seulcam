package com.kh.seulcam.member.service;

import java.util.List;
import com.kh.seulcam.member.domain.Member;

public interface MemberService {
	// 회원가입
	public int registerMember(Member member);
	
	// 로그인
	public Member loginMember(Member member);
	
	// 이메일로 회원 존재하는 지 리턴
	public int checkOneEmail(String memberEmail);
	
	// 아이디로 회원 존재하는 지 리턴
	public int checkOneId(String memberId);
	
	// 닉네임으로 회원 존재하는 지 리턴
	public int checkOneNickname(String memberNickname);
	
	// 현재 비밀번호 체크
	public int checkOnePw(Member member);
	
	// 아이디와 이메일 값 체크
	public int checkIdEmail(Member member);
	
	// 아이디 리스트를 이메일로 조회
	public List<Member> listIdByEmail(String memberEmail);
	
	// 아이디로 정보 가져오기
	public Member printOneById(String memberId);
	
	// 닉네임 수정
	public int modifyMemberNickname(Member member);
	
	// 환불 계좌 수정
	public int modifyMemberAccount(Member member);
	
	// 배송지 수정
	public int modifyMemberAddress(Member member);
	
	// 비밀번호 수정
	public int modifyMemberPw(Member member);
}
