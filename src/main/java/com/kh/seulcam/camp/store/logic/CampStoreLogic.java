package com.kh.seulcam.camp.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.CampLike;
import com.kh.seulcam.camp.domain.SearchList;
import com.kh.seulcam.camp.domain.CampReview;
import com.kh.seulcam.camp.domain.CampSite;
import com.kh.seulcam.camp.store.CampStore;
import com.kh.seulcam.order.domain.Order;
import com.kh.seulcam.order.domain.OrderPay;
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
	public Camp selectCampDetail(SqlSession session, int contentId) {
		Camp camp = session.selectOne("CampMapper.selectCampDetail",contentId);
		return camp;
	}

	@Override
	public int insertCampReview(SqlSession session, CampReview cReview) {
		int result = session.insert("CampMapper.insertCampReview", cReview);
		return result;
	}

	@Override
	public List<CampReview> selectCampReview(SqlSession session, int contentId) {
		List<CampReview> rList = session.selectList("CampMapper.selectCampReview",contentId);
//		System.out.println(rList);
		return rList;
	}

	@Override
	public int deleteReview(SqlSession session, CampReview cReview) {
		int result= session.delete("CampMapper.deleteReview",cReview);
		return result;
	}

	@Override
	public int updateReview(SqlSession session, CampReview cReview) {
		int result = session.update("CampMapper.updateReview",cReview);
		return result;
	}

	@Override
	public int selectListCount(SqlSession session, SearchList sList) {
		int result=session.selectOne("CampMapper.selectListCount",sList);
		return result;
	}

    @Override
    public int selectSiteListCount(SqlSession session, int contentId) {
        int result = session.selectOne("CampAdminMapper.selectSiteListCount",contentId);
        return result;
    }

    @Override
    public int insertSite(SqlSession session, CampSite campSite) {
        int result = session.insert("CampAdminMapper.insertSite",campSite);
        return result;
    }

    @Override
    public int updateCampRegistAvi(SqlSession session, int contentId, int confirm) {
        HashMap<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("contentId", contentId);
        paramMap.put("confirm",confirm);
        int result = session.update("CampAdminMapper.updateCampRegistAvi",paramMap);
        return result;
    }

    @Override
    public List<CampSite> selectSiteList(SqlSession session, int contentId) {
        List<CampSite> stList = session.selectList("CampAdminMapper.selectSiteList",contentId);
        return stList;
    }

    @Override
    public int deleteSite(SqlSession session, int siteNo) {
        int result = session.delete("CampAdminMapper.deleteSite",siteNo);
        return result;
    }

    @Override
    public CampSite selectSite(SqlSession session, int siteNo) {
        CampSite campSite = session.selectOne("CampAdminMapper.selectSite",siteNo);
        return campSite;
    }

    @Override
    public int updateSite(SqlSession session, CampSite campSite) {
        int result;
        if(campSite.getSiteThumbnailName() == null || campSite.getSiteThumbnailName() =="") {
            result = session.update("CampAdminMapper.updateSiteNoImg",campSite);
        }else {
            result = session.update("CampAdminMapper.updateSite",campSite);
        }
        return result;
    }

    @Override
    public List<OrderPay> printAllPayInfo(SqlSession session, int bookingNo) {
        List<OrderPay> opList = session.selectList("CampAdminMapper.printAllPayInfo",bookingNo);
        return opList;
    }

    @Override
    public List<CampReview> selectAllReview(SqlSession session) {
        List<CampReview> rList = session.selectList("CampMapper.selectAllReview");
        return rList;
    }

    @Override
    public Integer selectLikeCount(SqlSession session, CampLike campLike) {
        Integer result = session.selectOne("CampMapper.selectLikeCount",campLike);
        return result;
    }

    @Override
    public Integer deleteCampLike(SqlSession session, CampLike campLike) {
        Integer result = session.delete("CampMapper.deleteCampLike",campLike);
        return result;
    }

    @Override
    public Integer insertCampLike(SqlSession session, CampLike campLike) {
        Integer result = session.insert("CampMapper.insertCampLike",campLike);
        return result;
    }

    @Override
    public String selectStarAvg(SqlSession session, int contentId) {
        String result = session.selectOne("CampMapper.selectStarAvg",contentId);
        return result;
    }

    @Override
    public Integer selectMinPrice(SqlSession session, int contentId) {
        Integer result = session.selectOne("CampMapper.selectMinPrice",contentId);
        return result;
    }

}
