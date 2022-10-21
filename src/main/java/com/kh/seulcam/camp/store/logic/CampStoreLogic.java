package com.kh.seulcam.camp.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.SearchList;
import com.kh.seulcam.camp.store.CampStore;
@Repository
public class CampStoreLogic implements CampStore{

	@Override
	public int insertCampList(SqlSession session, Camp camp) {
		int result = session.insert("CampAdminMapper.insertCampList",camp);
		return result;
	}

	@Override
	public List<Camp> selectCampList(SqlSession session, SearchList sList) {
		System.out.println(sList.getCity());
		String citys = "강원도";
		sList.setCity(citys);
		List<Camp> cList = session.selectList("CampMapper.selectCampList",sList);
		
		System.out.println(cList);
		return cList;
	}

}
