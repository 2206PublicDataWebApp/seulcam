package com.kh.seulcam.member.service;

import java.util.List;
import com.kh.seulcam.member.domain.Member;

public interface MemberService {
	// 회원가입
	public int registerMember(Member member);
	
	// 로그인
	public Member loginMember(Member member);
	
	// 이메일로 회원 정보 값 리턴
	public int checkOneEmail(String memberEmail);
	
	// 아이디 리스트를 이메일로 조회
	public List<Member> listIdByEmail(String memberEmail);
}
