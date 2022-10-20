package com.kh.seulcam.product.domain;

import java.util.List;

public class Detail {
	private int productNo;
	private String detailFileName;
	private String detailFilePath;
	private String detailFileRename;
	private String detailContents;
	private List<Detail> dList;
	
	
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getDetailFileName() {
		return detailFileName;
	}
	public void setDetailFileName(String detailFileName) {
		this.detailFileName = detailFileName;
	}
	public String getDetailFilePath() {
		return detailFilePath;
	}
	public void setDetailFilePath(String detailFilePath) {
		this.detailFilePath = detailFilePath;
	}
	public String getDetailFileRename() {
		return detailFileRename;
	}
	public void setDetailFileRename(String detailFileRename) {
		this.detailFileRename = detailFileRename;
	}
	public String getDetailContents() {
		return detailContents;
	}
	public void setDetailContents(String detailContents) {
		this.detailContents = detailContents;
	}
	
	
	public List<Detail> getdList() {
		return dList;
	}
	public void setdList(List<Detail> dList) {
		this.dList = dList;
	}
	@Override
	public String toString() {
		return "Detail [productNo=" + productNo + ", detailFileName=" + detailFileName + ", detailFilePath="
				+ detailFilePath + ", detailFileRename=" + detailFileRename + ", detailContents=" + detailContents
				+ "]";
	}
	
	
	
}
