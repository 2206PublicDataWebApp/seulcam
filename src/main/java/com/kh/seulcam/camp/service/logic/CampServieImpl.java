package com.kh.seulcam.camp.service.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.SearchList;
import com.kh.seulcam.camp.domain.campReview;
import com.kh.seulcam.camp.service.CampServie;
import com.kh.seulcam.camp.store.CampStore;

@Service
public class CampServieImpl implements CampServie{
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private CampStore cStore;
	
	@Override
	public int insertCampList(Camp camp) {
		int result = cStore.insertCampList(session , camp);
				
		return result;
	}

	@Override
	public List<Camp> printCampList(SearchList sList) {
		List<Camp> cList = cStore.selectCampList(session,sList);
		return cList;
	}

	@Override
	public Camp printCampDetail(String contentId) {
		Camp camp = cStore.selectCampDetail(session , contentId);
		return camp;
	}

	@Override
	public int campReviewWrite(campReview cReview) {
		int result = cStore.insertCampReview(session,cReview);
		return result;
	}

	@Override
	public List<campReview> campReviewList(String contentId) {
		List<campReview> rList = cStore.selectCampReview(session,contentId);
		return rList;
	}

}
