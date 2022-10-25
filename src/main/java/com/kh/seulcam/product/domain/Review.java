package com.kh.seulcam.product.domain;

import java.util.Date;

public class Review {
	
	private int reviewNo;
	private int productNo;
	private String memberId;
	private int reviewGrade;
	private String reviewTitle;
	private String reviewContents;
	private String reviewFileName1;
	private String reviewFilePath1;
	private String reviewFileRename1;
	private String reviewFileName2;
	private String reviewFilePath2;
	private String reviewFileRename2;
	private String reviewFileName3;
	private String reviewFilePath3;
	private String reviewFileRename3;
	private Date uploadDate;
	
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
	public int getReviewGrade() {
		return reviewGrade;
	}
	public void setReviewGrade(int reviewGrade) {
		this.reviewGrade = reviewGrade;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContents() {
		return reviewContents;
	}
	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}
	public String getReviewFileName1() {
		return reviewFileName1;
	}
	public void setReviewFileName1(String reviewFileName1) {
		this.reviewFileName1 = reviewFileName1;
	}
	public String getReviewFilePath1() {
		return reviewFilePath1;
	}
	public void setReviewFilePath1(String reviewFilePath1) {
		this.reviewFilePath1 = reviewFilePath1;
	}
	public String getReviewFileRename1() {
		return reviewFileRename1;
	}
	public void setReviewFileRename1(String reviewFileRename1) {
		this.reviewFileRename1 = reviewFileRename1;
	}
	public String getReviewFileName2() {
		return reviewFileName2;
	}
	public void setReviewFileName2(String reviewFileName2) {
		this.reviewFileName2 = reviewFileName2;
	}
	public String getReviewFilePath2() {
		return reviewFilePath2;
	}
	public void setReviewFilePath2(String reviewFilePath2) {
		this.reviewFilePath2 = reviewFilePath2;
	}
	public String getReviewFileRename2() {
		return reviewFileRename2;
	}
	public void setReviewFileRename2(String reviewFileRename2) {
		this.reviewFileRename2 = reviewFileRename2;
	}
	public String getReviewFileName3() {
		return reviewFileName3;
	}
	public void setReviewFileName3(String reviewFileName3) {
		this.reviewFileName3 = reviewFileName3;
	}
	public String getReviewFilePath3() {
		return reviewFilePath3;
	}
	public void setReviewFilePath3(String reviewFilePath3) {
		this.reviewFilePath3 = reviewFilePath3;
	}
	public String getReviewFileRename3() {
		return reviewFileRename3;
	}
	public void setReviewFileRename3(String reviewFileRename3) {
		this.reviewFileRename3 = reviewFileRename3;
	}
	
	
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", productNo=" + productNo + ", memberId=" + memberId + ", reviewGrade="
				+ reviewGrade + ", reviewTitle=" + reviewTitle + ", reviewContents=" + reviewContents
				+ ", reviewFileName1=" + reviewFileName1 + ", reviewFilePath1=" + reviewFilePath1
				+ ", reviewFileRename1=" + reviewFileRename1 + ", reviewFileName2=" + reviewFileName2
				+ ", reviewFilePath2=" + reviewFilePath2 + ", reviewFileRename2=" + reviewFileRename2
				+ ", reviewFileName3=" + reviewFileName3 + ", reviewFilePath3=" + reviewFilePath3
				+ ", reviewFileRename3=" + reviewFileRename3 + ", uploadDate=" + uploadDate + "]";
	}

	
	
}
