package com.kh.seulcam.point.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.point.domain.Point;
import com.kh.seulcam.point.store.PointStore;

@Repository
public class PointStoreLogic implements PointStore {


	@Override
	public Member printTotalPoint(SqlSession session, String memberId) {
		Member totalPoint=session.selectOne("OrderMapper.selectTotalPoint",memberId);
		return totalPoint;
	}

	@Override
	public int getTotalCount(SqlSession session, String memberId) {
		int totalCount=session.selectOne("PointMapper.selectTotalCount",memberId);
		return totalCount;
	}

	@Override
	public List<Point> printAllPointList(SqlSession session, String memberId, int currentPage, int boardLimit) {
		int offset=(currentPage-1)*boardLimit;
		RowBounds rowBounds = new RowBounds(offset,boardLimit);
		
		List<Point>pList=session.selectList("PointMapper.selectPrintPointList",memberId,rowBounds);
		return pList;
	}
	

}
