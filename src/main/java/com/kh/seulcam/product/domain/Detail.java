package com.kh.seulcam.product.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Detail {
	private int productNo;
	private MultipartFile detailFileNameMPF;
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
	

	public MultipartFile getDetailFileNameMPF() {
		return detailFileNameMPF;
	}
	public void setDetailFileNameMPF(MultipartFile detailFileNameMPF) {
		this.detailFileNameMPF = detailFileNameMPF;
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
		return "Detail [productNo=" + productNo + ", detailFileNameMPF=" + detailFileNameMPF + ", detailFileName="
				+ detailFileName + ", detailFilePath=" + detailFilePath + ", detailFileRename=" + detailFileRename
				+ ", detailContents=" + detailContents + ", dList=" + dList + "]";
	}


	
}
