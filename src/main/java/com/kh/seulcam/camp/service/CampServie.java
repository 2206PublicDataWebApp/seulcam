package com.kh.seulcam.camp.service;

import java.util.List;

import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.SearchList;
import com.kh.seulcam.camp.domain.campReview;

public interface CampServie {

	public int insertCampList(Camp camp);

	public List<Camp> printCampList(SearchList sList);

	public Camp printCampDetail(String contentId);

	public int campReviewWrite(campReview cReview);

	public List<campReview> campReviewList(String contentId);

}
