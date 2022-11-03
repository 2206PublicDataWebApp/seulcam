package com.kh.seulcam.product.domain;

public class Brand {
	private String brandName;
	private String storeName;
	private int storeZipcode;
	private String storeAddr;
	private String storeAddrDetail;
	
	
	
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public int getStoreZipcode() {
		return storeZipcode;
	}
	public void setStoreZipcode(int storeZipcode) {
		this.storeZipcode = storeZipcode;
	}
	public String getStoreAddr() {
		return storeAddr;
	}
	public void setStoreAddr(String storeAddr) {
		this.storeAddr = storeAddr;
	}
	public String getStoreAddrDetail() {
		return storeAddrDetail;
	}
	public void setStoreAddrDetail(String storeAddrDetail) {
		this.storeAddrDetail = storeAddrDetail;
	}
	@Override
	public String toString() {
		return "Brand [brandName=" + brandName + ", storeName=" + storeName + ", storeZipcode=" + storeZipcode
				+ ", storeAddr=" + storeAddr + ", storeAddrDetail=" + storeAddrDetail + "]";
	}

	
}
