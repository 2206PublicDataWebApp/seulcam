package com.kh.seulcam.member.domain;

import java.sql.Date;

public class Member {
	private String memberId;
	private String memberPw;
	private String memberNickname;
	private String memberEmail;
	private String memberRecommend;
	private String memberName;
	private String memberPhone;
	private String memberZip;
	private String memberAddress1;
	private String memberAddress2;
	private String memberAccountName;
	private String memberAccountBank;
	private String memberAccountNumber;
	private Boolean adminCheck;
	private Date memberDate;
	private int totalPoint;
	private String memberImage;
	private String memberFilename;
	private String memberFilername;
	private String memberCategory;
	
	public Member() {}
	
	public Member(String memberId, String memberPw) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberRecommend() {
		return memberRecommend;
	}
	public void setMemberRecommend(String memberRecommend) {
		this.memberRecommend = memberRecommend;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberZip() {
		return memberZip;
	}
	public void setMemberZip(String memberZip) {
		this.memberZip = memberZip;
	}
	public String getMemberAddress1() {
		return memberAddress1;
	}
	public void setMemberAddress1(String memberAddress1) {
		this.memberAddress1 = memberAddress1;
	}
	public String getMemberAddress2() {
		return memberAddress2;
	}
	public void setMemberAddress2(String memberAddress2) {
		this.memberAddress2 = memberAddress2;
	}
	public String getMemberAccountName() {
		return memberAccountName;
	}
	public void setMemberAccountName(String memberAccountName) {
		this.memberAccountName = memberAccountName;
	}
	public String getMemberAccountBank() {
		return memberAccountBank;
	}
	public void setMemberAccountBank(String memberAccountBank) {
		this.memberAccountBank = memberAccountBank;
	}
	public String getMemberAccountNumber() {
		return memberAccountNumber;
	}
	public void setMemberAccountNumber(String memberAccountNumber) {
		this.memberAccountNumber = memberAccountNumber;
	}
	public Boolean getAdminCheck() {
		return adminCheck;
	}
	public void setAdminCheck(Boolean adminCheck) {
		this.adminCheck = adminCheck;
	}
	public Date getMemberDate() {
		return memberDate;
	}
	public void setMemberDate(Date memberDate) {
		this.memberDate = memberDate;
	}
	public int getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}
	public String getMemberImage() {
		return memberImage;
	}
	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
	}
	public String getMemberFilename() {
		return memberFilename;
	}
	public void setMemberFilename(String memberFilename) {
		this.memberFilename = memberFilename;
	}
	public String getMemberFilername() {
		return memberFilername;
	}
	public void setMemberFilername(String memberFilername) {
		this.memberFilername = memberFilername;
	}
	public String getMemberCategory() {
		return memberCategory;
	}
	public void setMemberCategory(String memberCategory) {
		this.memberCategory = memberCategory;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberNickname=" + memberNickname
				+ ", memberEmail=" + memberEmail + ", memberRecommend=" + memberRecommend + ", memberName=" + memberName
				+ ", memberPhone=" + memberPhone + ", memberZip=" + memberZip + ", memberAddress1=" + memberAddress1
				+ ", memberAddress2=" + memberAddress2 + ", memberAccountName=" + memberAccountName
				+ ", memberAccountBank=" + memberAccountBank + ", memberAccountNumber=" + memberAccountNumber
				+ ", adminCheck=" + adminCheck + ", memberDate=" + memberDate + ", totalPoint=" + totalPoint
				+ ", memberImage=" + memberImage + ", memberFilename=" + memberFilename + ", memberFilername="
				+ memberFilername + ", memberCategory=" + memberCategory + "]";
	}
}
