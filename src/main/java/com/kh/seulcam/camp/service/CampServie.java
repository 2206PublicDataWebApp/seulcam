package com.kh.seulcam.camp.service;

import java.util.List;

import com.kh.seulcam.camp.domain.Camp;

public interface CampServie {

	public int insertCampList(Camp camp);

	public List<Camp> printCampList(int page);

}
