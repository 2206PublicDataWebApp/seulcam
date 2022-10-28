package com.kh.seulcam.order.domain;

public class OrderPay {

	private int payNo;
	private int orderNo;
	private String memberId;
	private String payDate;
	private String payPrice;
	private String productPrice;
	private String usePoint;
	private String getPoint;
	private String payStatus;
	public int getPayNo() {
		return payNo;
	}
	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public String getPayPrice() {
		return payPrice;
	}
	public void setPayPrice(String payPrice) {
		this.payPrice = payPrice;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(String usePoint) {
		this.usePoint = usePoint;
	}
	public String getGetPoint() {
		return getPoint;
	}
	public void setGetPoint(String getPoint) {
		this.getPoint = getPoint;
	}
	public String getPayStatus() {
		return payStatus;
	}
	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}
	@Override
	public String toString() {
		return "OrderPay [payNo=" + payNo + ", orderNo=" + orderNo + ", memberId=" + memberId + ", payDate=" + payDate
				+ ", payPrice=" + payPrice + ", productPrice=" + productPrice + ", usePoint=" + usePoint + ", getPoint="
				+ getPoint + ", payStatus=" + payStatus + "]";
	}
	
	
	
	
}
