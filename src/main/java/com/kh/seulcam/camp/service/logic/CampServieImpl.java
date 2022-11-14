package com.kh.seulcam.camp.service.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.CampLike;
import com.kh.seulcam.camp.domain.SearchList;
import com.kh.seulcam.camp.domain.CampReview;
import com.kh.seulcam.camp.domain.CampSite;
import com.kh.seulcam.camp.service.CampServie;
import com.kh.seulcam.camp.store.CampStore;
import com.kh.seulcam.order.domain.OrderPay;

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
	public Camp printCampDetail(int contentId) {
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
	public List<CampReview> campReviewList(int contentId) {
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
    
    // site 목록 출력
    @Override
    public List<CampSite> printSiteList(int contentId) {
        List<CampSite> stList = cStore.selectSiteList(session, contentId);
        return stList;
    }
    
    // site 삭제
    @Override
    public int removeSite(int siteNo) {
        int result = cStore.deleteSite(session,siteNo);
        return result;
    }
    
    // site 정보 출력
    @Override
    public CampSite printSite(int siteNo) {
        CampSite campSite = cStore.selectSite(session,siteNo);
        return campSite;
    }
    // site 수정
    @Override
    public int modifySite(CampSite campSite) {
        int result = cStore.updateSite(session,campSite);
        return result;
    }
    
    // 캠핑장 관리 예약리스트 결제파트 데이터 출력
    @Override
    public List<OrderPay> printAllPayInfo(int bookingNo) {
        List<OrderPay> opList = cStore.printAllPayInfo(session,bookingNo);
        return opList;
    }
    
    //캠핑장 all 리뷰
    @Override
    public List<CampReview> campReviewAllList() {
        List<CampReview> rList = cStore.selectAllReview(session);
        return rList;
    }
    //좋아요 갯수 카운트
    @Override
    public Integer campLikeCount(CampLike campLike) {
        Integer result = cStore.selectLikeCount(session,campLike);
        return result;
    }
    
    //좋아요 삭제
    @Override
    public Integer campLikeDelete(CampLike campLike) {
        Integer result = cStore.deleteCampLike(session,campLike);
        return result;
    }
    
    //좋아요 등록
    @Override
    public Integer campLikeUpdate(CampLike campLike) {
        Integer result = cStore.insertCampLike(session,campLike);
        return result;
    }
    
    //별점 평균
    @Override
    public String printStarAvg(int contentId) {
        String result = cStore.selectStarAvg(session,contentId);
        return result;
    }
    
    //최저가 확인
    @Override
    public Integer campMinPrice(int contentId) {
        Integer result = cStore.selectMinPrice(session,contentId);
        return result;
    }
    // 좋아요 캠핑장 리스트
    @Override
    public List<CampLike> likeListView(String memberId) {
        List<CampLike> lList = cStore.selectLikeList(session,memberId);
        return lList;
    }
    // 마이 리뷰 리스트
    @Override
    public List<CampReview> myCampReviewView(String memberId) {
        List<CampReview> rList = cStore.selectMyCampReview(session, memberId);
        return rList;
    }
    
    //캠핑장 사이트 삭제처리
    @Override
    public int campSiteReUpdate(int siteNo) {
        int result = cStore.siteRemoveUpdate(session,siteNo);
        return result;
    }
    
    //리뷰 갯수 체크
    @Override
    public Integer myCampReviewCount(String memberId) {
        Integer result = cStore.myCampReviewCounts(session,memberId);
        return result;
    }

    
    //데이터 파싱 저장용
    @Override
    public List<Camp> selectAllCamp() {
        List<Camp> cList = cStore.selectAllCamp(session);
        return cList;
    }

    @Override
    public int updateBlogData(Camp camp) {
        int result = cStore.updateBlog(session,camp);
        return result;
    }
    
    

}
