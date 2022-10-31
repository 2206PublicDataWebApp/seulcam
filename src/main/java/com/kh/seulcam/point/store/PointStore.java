package com.kh.seulcam.point.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.point.domain.Point;

public interface PointStore {

	public List<Point> printAllPointList(SqlSession session, String memberId);

	public Member printTotalPoint(SqlSession session, String memberId);

}
