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
	public int checkOneId(String memberId) {
		int result = mStore.countById(session, memberId);
		return result;
	}
	
	@Override
	public int checkOneNickname(String memberNickname) {
		int result = mStore.countByNickname(session, memberNickname);
		return result;
	}
	
	@Override
	public int checkOnePw(Member member) {
		int result = mStore.countByIdPw(session, member);
		return result;
	}
	
	@Override
	public int checkIdEmail(Member member) {
		int result = mStore.countByIdEmail(session, member);
		return result;
	}
	
	@Override
	public List<Member> listIdByEmail(String memberEmail) {
		List<Member> mList = mStore.selectIdListByEmail(session, memberEmail);
		return mList;
	}
	
	@Override
	public Member printOneById(String memberId) {
		Member member = mStore.selectOneById(session, memberId);
		return member;
	}
	
	@Override
	public int modifyMemberNickname(Member member) {
		int result = mStore.updateMemberNickname(session, member);
		return result;
	}
	
	@Override
	public int modifyMemberAccount(Member member) {
		int result = mStore.updateMemberAccount(session, member);
		return result;
	}
	
	@Override
	public int modifyMemberAddress(Member member) {
		int result = mStore.updateMemberAddress(session, member);
		return result;
	}
	
	@Override
	public int modifyMemberPw(Member member) {
		int result = mStore.updateMemberPw(session, member);
		return result;
	}
}
