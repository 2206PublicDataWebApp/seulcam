package com.kh.seulcam.camp.service;

import java.util.List;

import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.CampLike;
import com.kh.seulcam.camp.domain.SearchList;
import com.kh.seulcam.order.domain.OrderPay;
import com.kh.seulcam.camp.domain.CampReview;
import com.kh.seulcam.camp.domain.CampSite;

public interface CampServie {

	public int insertCampList(Camp camp);

	public List<Camp> printCampList(SearchList sList);

	public Camp printCampDetail(int contentId);

	public int campReviewWrite(CampReview cReview);

	public List<CampReview> campReviewList(int contentId);

	public int removeReview(CampReview cReview);

	public int modifyReview(CampReview cReview);

	public int printListCount(SearchList sList);

    public int printSiteListCount(int contentId);

    public int registerSite(CampSite campSite);

    public int campRegistAviModify(int contentId, int yes);

    public List<CampSite> printSiteList(int contentId);

    public int removeSite(int siteNo);

    public CampSite printSite(int siteNo);

    public int modifySite(CampSite campSite);

    public List<OrderPay> printAllPayInfo(int bookingNo);

    public List<CampReview> campReviewAllList();

    public Integer campLikeCount(CampLike campLike);

    public Integer campLikeDelete(CampLike campLike);

    public Integer campLikeUpdate(CampLike campLike);

    public String printStarAvg(int contentId);

    public Integer campMinPrice(int contentId);

    public List<CampLike> likeListView(String memberId);

    public List<CampReview> myCampReviewView(String memberId);

    public int campSiteReUpdate(int siteNo);

    public Integer myCampReviewCount(String memberId);

    public List<Camp> selectAllCamp();

    public int updateBlogData(Camp camp);


}
