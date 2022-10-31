package com.kh.seulcam.point.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.point.domain.Point;
import com.kh.seulcam.point.service.PointService;
import com.kh.seulcam.point.store.PointStore;

@Service
public class PointServiceImpl implements PointService {
	
	@Autowired
	private PointStore pStore;
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Point> printAllPointList(String memberId) {
		List<Point>pList=pStore.printAllPointList(session,memberId);
		return pList;
	}

	@Override
	public Member printTotalPoint(String memberId) {
		Member totalPoint=pStore.printTotalPoint(session,memberId);
		return totalPoint;
	}


}
