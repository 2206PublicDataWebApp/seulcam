package com.kh.seulcam.camp.domain;

import java.sql.Date;

public class campReview {
	private int campReviewNo;
	private String memberId;
	private String memberNickname;
	private String campId;
	private String campName;
	private String campReviewContents;
	private String campReviewStar;
	private Date rCreateDate;
	private Date rModifyDate;
	
	
	public campReview() {}
	
	
	public campReview(int campReviewNo, String memberId, String memberNickname, String campId, String campName,
			String campReviewContents, String campReviewStar, Date rCreateDate, Date rModifyDate) {
		super();
		this.campReviewNo = campReviewNo;
		this.memberId = memberId;
		this.memberNickname = memberNickname;
		this.campId = campId;
		this.campName = campName;
		this.campReviewContents = campReviewContents;
		this.campReviewStar = campReviewStar;
		this.rCreateDate = rCreateDate;
		this.rModifyDate = rModifyDate;
	}

	@Override
	public String toString() {
		return "campReview [campReviewNo=" + campReviewNo + ", memberId=" + memberId + ", memberNickname="
				+ memberNickname + ", campId=" + campId + ", campName=" + campName + ", campReviewContents="
				+ campReviewContents + ", campReviewStar=" + campReviewStar + ", rCreateDate=" + rCreateDate
				+ ", rModifyDate=" + rModifyDate + "]";
	}

	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public int getCampReviewNo() {
		return campReviewNo;
	}
	public void setCampReviewNo(int campReviewNo) {
		this.campReviewNo = campReviewNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getCampId() {
		return campId;
	}
	public void setCampId(String campId) {
		this.campId = campId;
	}
	public String getCampName() {
		return campName;
	}
	public void setCampName(String campName) {
		this.campName = campName;
	}
	public String getCampReviewContents() {
		return campReviewContents;
	}
	public void setCampReviewContents(String campReviewContents) {
		this.campReviewContents = campReviewContents;
	}
	public String getCampReviewStar() {
		return campReviewStar;
	}
	public void setCampReviewStar(String campReviewStar) {
		this.campReviewStar = campReviewStar;
	}
	public Date getrCreateDate() {
		return rCreateDate;
	}
	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}
	public Date getrModifyDate() {
		return rModifyDate;
	}
	public void setrModifyDate(Date rModifyDate) {
		this.rModifyDate = rModifyDate;
	}
	
}
