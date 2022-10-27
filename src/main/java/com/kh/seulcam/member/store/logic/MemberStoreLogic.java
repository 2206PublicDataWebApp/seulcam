package com.kh.seulcam.member.store.logic;

import java.util.List;
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
	
	@Override
	public int countByEmail(SqlSession session, String memberEmail) {
		int result = session.selectOne("MemberMapper.selectOneByEmail", memberEmail);
		return result;
	}
	
	@Override
	public int countByNickname(SqlSession session, String memberNickname) {
		int result = session.selectOne("MemberMapper.selectOneByNickname", memberNickname);
		return result;
	}
	
	@Override
	public int countById(SqlSession session, String memberId) {
		int result = session.selectOne("MemberMapper.selectCountById", memberId);
		return result;
	}
	
	@Override
	public int countByIdPw(SqlSession session, Member member) {
		int result = session.selectOne("MemberMapper.selectOneByidPw", member);
		return result;
	}
	
	@Override
	public int countByIdEmail(SqlSession session, Member member) {
		int result = session.selectOne("MemberMapper.selectCountByIdEmail", member);
		return result;
	}
	
	@Override
	public List<Member> selectIdListByEmail(SqlSession session, String memberEmail) {
		List<Member> mList = session.selectList("MemberMapper.selectIdListByEmail", memberEmail);
		return mList;
	}
	
	@Override
	public Member selectOneById(SqlSession session, String memberId) {
		Member member = session.selectOne("MemberMapper.selectOneById", memberId);
		return member;
	}

	@Override
	public int updateMemberNickname(SqlSession session, Member member) {
		int result = session.update("MemberMapper.updateMemberNickname", member);
		return result;
	}
	
	@Override
	public int updateMemberAccount(SqlSession session, Member member) {
		int result = session.update("MemberMapper.updateMemberAccount", member);
		return result;
	}
	
	@Override
	public int updateMemberAddress(SqlSession session, Member member) {
		int result = session.update("MemberMapper.updateMemberAddress", member);
		return result;
	}
	
	@Override
	public int updateMemberPw(SqlSession session, Member member) {
		int result = session.update("MemberMapper.updateMemberPw", member);
		return result;
	}
}
