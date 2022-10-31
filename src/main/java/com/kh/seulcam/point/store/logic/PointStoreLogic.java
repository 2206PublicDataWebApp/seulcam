package com.kh.seulcam.point.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.point.domain.Point;
import com.kh.seulcam.point.store.PointStore;

@Repository
public class PointStoreLogic implements PointStore {

	@Override
	public List<Point> printAllPointList(SqlSession session, String memberId) {
		List<Point>pList=session.selectList("PointMapper.selectPrintPointList",memberId);
		return pList;
	}

	@Override
	public Member printTotalPoint(SqlSession session, String memberId) {
		Member totalPoint=session.selectOne("OrderMapper.selectTotalPoint",memberId);
		return totalPoint;
	}
	

}
