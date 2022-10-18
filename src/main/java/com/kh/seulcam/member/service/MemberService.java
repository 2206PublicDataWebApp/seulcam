package com.kh.seulcam.member.service;

import com.kh.seulcam.member.domain.Member;

public interface MemberService {
	// 회원가입
	public int registerMember(Member member);
	
	// 로그인
	public Member loginMember(Member member);
}
