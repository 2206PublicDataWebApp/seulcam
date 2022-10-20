package com.kh.seulcam.product.domain;

public class Product {
	private int productNo;
	private String productName;
	private String category;
	private int productPrice;
	private String productColor;
	private int productStock;
	private String mainFileName;
	private String mainFilePath;
	private String mainFileRename;
	private String updateDate;
	private String brandName;
	private String productMaterial;
	private int saleCount;
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductColor() {
		return productColor;
	}
	public void setProductColor(String productColor) {
		this.productColor = productColor;
	}
	public int getProductStock() {
		return productStock;
	}
	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}
	public String getMainFileName() {
		return mainFileName;
	}
	public void setMainFileName(String mainFileName) {
		this.mainFileName = mainFileName;
	}
	public String getMainFilePath() {
		return mainFilePath;
	}
	public void setMainFilePath(String mainFilePath) {
		this.mainFilePath = mainFilePath;
	}
	public String getMainFileRename() {
		return mainFileRename;
	}
	public void setMainFileRename(String mainFileRename) {
		this.mainFileRename = mainFileRename;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getProductMaterial() {
		return productMaterial;
	}
	public void setProductMaterial(String productMaterial) {
		this.productMaterial = productMaterial;
	}
	public int getSaleCount() {
		return saleCount;
	}
	public void setSaleCount(int saleCount) {
		this.saleCount = saleCount;
	}
	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", category=" + category
				+ ", productPrice=" + productPrice + ", productColor=" + productColor + ", productStock=" + productStock
				+ ", mainFileName=" + mainFileName + ", mainFilePath=" + mainFilePath + ", mainFileRename="
				+ mainFileRename + ", updateDate=" + updateDate + ", brandName=" + brandName + ", productMaterial="
				+ productMaterial + ", saleCount=" + saleCount + "]";
	}
	
	
	
}
