package com.kh.seulcam.point.domain;

public class Point {

	private int pointNo;
	private String memberId;
	private String pointDate;
	private String point;
	private String pointType;
	
	
	public int getPointNo() {
		return pointNo;
	}
	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPointDate() {
		return pointDate;
	}
	public void setPointDate(String pointDate) {
		this.pointDate = pointDate;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public String getPointType() {
		return pointType;
	}
	public void setPointType(String pointType) {
		this.pointType = pointType;
	}
	@Override
	public String toString() {
		return "Point [pointNo=" + pointNo + ", memberId=" + memberId + ", pointDate=" + pointDate + ", point=" + point
				+ ", pointType=" + pointType + "]";
	}
	
	
}
