package com.kh.seulcam.camp.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.SearchList;
import com.kh.seulcam.camp.domain.CampReview;
import com.kh.seulcam.camp.store.CampStore;
@Repository
public class CampStoreLogic implements CampStore{

	@Override
	public int insertCampList(SqlSession session, Camp camp) {
		int result = session.insert("CampAdminMapper.insertCampList",camp);
		return result;
	}

	@Override
	public List<Camp> selectCampList(SqlSession session, SearchList sList) {
		List<Camp> cList = session.selectList("CampMapper.selectCampList",sList);
		return cList;
	}

	@Override
	public Camp selectCampDetail(SqlSession session, String contentId) {
		Camp camp = session.selectOne("CampMapper.selectCampDetail",contentId);
		return camp;
	}

	@Override
	public int insertCampReview(SqlSession session, CampReview cReview) {
		int result = session.insert("CampMapper.insertCampReview", cReview);
		return result;
	}

	@Override
	public List<CampReview> selectCampReview(SqlSessionTemplate session, String contentId) {
		List<CampReview> rList = session.selectList("CampMapper.selectCampReview",contentId);
		return rList;
	}

}
