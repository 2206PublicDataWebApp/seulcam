package com.kh.seulcam.camp.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.SearchList;

public interface CampStore {

	public int insertCampList(SqlSession session, Camp camp);

	public List<Camp> selectCampList(SqlSession session, SearchList sList);

}
