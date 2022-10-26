package com.kh.seulcam.camp.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.SearchList;
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

}
