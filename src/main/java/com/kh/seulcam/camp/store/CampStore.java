package com.kh.seulcam.camp.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.CampLike;
import com.kh.seulcam.camp.domain.SearchList;
import com.kh.seulcam.order.domain.OrderPay;
import com.kh.seulcam.camp.domain.CampReview;
import com.kh.seulcam.camp.domain.CampSite;

public interface CampStore {

	public int insertCampList(SqlSession session, Camp camp);

	public List<Camp> selectCampList(SqlSession session, SearchList sList);

	public Camp selectCampDetail(SqlSession session, int contentId);

	public int insertCampReview(SqlSession session, CampReview cReview);

	public List<CampReview> selectCampReview(SqlSession session, int contentId);

	public int deleteReview(SqlSession session, CampReview cReview);

	public int updateReview(SqlSession session, CampReview cReview);

	public int selectListCount(SqlSession session, SearchList sList);

    public int selectSiteListCount(SqlSession session, int contentId);

    public int insertSite(SqlSession session, CampSite campSite);

    public int updateCampRegistAvi(SqlSession session, int contentId, int confirm);

    public List<CampSite> selectSiteList(SqlSession session, int contentId);

    public int deleteSite(SqlSession session, int siteNo);

    public CampSite selectSite(SqlSession session, int siteNo);

    public int updateSite(SqlSession session, CampSite campSite);

    public List<OrderPay> printAllPayInfo(SqlSession session, int bookingNo);

    public List<CampReview> selectAllReview(SqlSession session);

    public Integer selectLikeCount(SqlSession session, CampLike campLike);

    public Integer deleteCampLike(SqlSession session, CampLike campLike);

    public Integer insertCampLike(SqlSession session, CampLike campLike);

    public String selectStarAvg(SqlSession session, int contentId);

    public Integer selectMinPrice(SqlSession session, int contentId);

    public List<CampLike> selectLikeList(SqlSession session, String memberId);

    public List<CampReview> selectMyCampReview(SqlSession session, String memberId);

    public int siteRemoveUpdate(SqlSessionTemplate session, int siteNo);

    public Integer myCampReviewCounts(SqlSessionTemplate session, String memberId);

    public List<Camp> selectAllCamp(SqlSessionTemplate session);

    public int updateBlog(SqlSessionTemplate session, Camp camp);

    public int selectWalking(SqlSessionTemplate session, int contentId, String memberId);

}
