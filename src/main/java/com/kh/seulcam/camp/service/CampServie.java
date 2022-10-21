package com.kh.seulcam.camp.service;

import java.util.List;

import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.SearchList;

public interface CampServie {

	public int insertCampList(Camp camp);

	public List<Camp> printCampList(SearchList sList);

}
