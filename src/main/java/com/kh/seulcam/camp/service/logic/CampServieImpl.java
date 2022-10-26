package com.kh.seulcam.camp.service.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.SearchList;
import com.kh.seulcam.camp.domain.CampReview;
import com.kh.seulcam.camp.domain.CampSite;
import com.kh.seulcam.camp.service.CampServie;
import com.kh.seulcam.camp.store.CampStore;

@Service
public class CampServieImpl implements CampServie{
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private CampStore cStore;
	
	//admin 캠핑장 리스트 파싱 후 저장
	@Override
	public int insertCampList(Camp camp) {
		int result = cStore.insertCampList(session , camp);
				
		return result;
	}
	
	//캠핑장 리스트 출력
	@Override
	public List<Camp> printCampList(SearchList sList) {
		List<Camp> cList = cStore.selectCampList(session,sList);
		return cList;
	}
	
	//상세 출력
	@Override
	public Camp printCampDetail(String contentId) {
		Camp camp = cStore.selectCampDetail(session , contentId);
		return camp;
	}
	
	//리뷰 등록
	@Override
	public int campReviewWrite(CampReview cReview) {
		int result = cStore.insertCampReview(session,cReview);
		return result;
	}
	
	//리뷰 출력
	@Override
	public List<CampReview> campReviewList(String contentId) {
		List<CampReview> rList = cStore.selectCampReview(session,contentId);
		return rList;
	}
	
	// 리뷰 삭제
	@Override
	public int removeReview(CampReview cReview) {
		int result = cStore.deleteReview(session,cReview);
		return result;
	}
	
	// 리뷰 수정
	@Override
	public int modifyReview(CampReview cReview) {
		int result = cStore.updateReview(session,cReview);
		return result;
	}
	
	// 캠핑장 검색 갯수 출력
	@Override
	public int printListCount(SearchList sList) {
		int result = cStore.selectListCount(session,sList);
		return result;
	}
	
	// 캠핑장 별 site 갯수 출력
    @Override
    public int printSiteListCount(int contentId) {
        int result = cStore.selectSiteListCount(session, contentId);
        return result;
    }
    
    // site 등록
    @Override
    public int registerSite(CampSite campSite) {
        int result = cStore.insertSite(session,campSite);
        return result;
    }
    
    // 캠핑장 예약가능여부 변경
    @Override
    public int campRegistAviModify(int contentId, int confirm) {
        int result = cStore.updateCampRegistAvi(session,contentId,confirm);
        return result;
    }

}
