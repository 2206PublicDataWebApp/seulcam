package com.kh.seulcam.camp.service;

import java.util.List;

import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.SearchList;
import com.kh.seulcam.camp.domain.CampReview;
import com.kh.seulcam.camp.domain.CampSite;

public interface CampServie {

	public int insertCampList(Camp camp);

	public List<Camp> printCampList(SearchList sList);

	public Camp printCampDetail(String contentId);

	public int campReviewWrite(CampReview cReview);

	public List<CampReview> campReviewList(String contentId);

	public int removeReview(CampReview cReview);

	public int modifyReview(CampReview cReview);

	public int printListCount(SearchList sList);

    public int printSiteListCount(int contentId);

    public int registerSite(CampSite campSite);

    public int campRegistAviModify(int contentId, int yes);

}
