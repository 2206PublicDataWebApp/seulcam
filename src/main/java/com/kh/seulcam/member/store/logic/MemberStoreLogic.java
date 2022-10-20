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
	public List<Member> selectIdListByEmail(SqlSession session, String memberEmail) {
		List<Member> mList = session.selectList("MemberMapper.selectIdListByEmail", memberEmail);
		return mList;
	}
}
