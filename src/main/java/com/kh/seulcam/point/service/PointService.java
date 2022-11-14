package com.kh.seulcam.point.service;

import java.util.List;

import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.point.domain.Point;

public interface PointService {

	//포인트 내역 보여주기
	public List<Point> printAllPointList(String memberId, int currentPage, int boardLimit);
	
	//총 포인트 보여주기(맴버 테이블)
	public Member printTotalPoint(String memberId);

	//페이징
	public int getTotalCount(String memberId);

}
