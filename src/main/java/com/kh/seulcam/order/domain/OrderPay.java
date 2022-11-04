package com.kh.seulcam.order.domain;

public class OrderPay {

	private int payNo;
	private int orderNo;
	private String memberId;
	private String imp_uid;
	private String merchant_uid;
	private String payDate;
	private String payPrice;
	private String productPrice;
	private String usePoint;
	private String getPoint;
	private String payStatus;
	private String payType;
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
	public String getimp_uid() {
		return imp_uid;
	}
	public void setimp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
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
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	@Override
	public String toString() {
		return "OrderPay [payNo=" + payNo + ", orderNo=" + orderNo + ", memberId=" + memberId + ", imp_uid=" + imp_uid
				+ ", merchant_uid=" + merchant_uid + ", payDate=" + payDate + ", payPrice=" + payPrice
				+ ", productPrice=" + productPrice + ", usePoint=" + usePoint + ", getPoint=" + getPoint
				+ ", payStatus=" + payStatus + ", payType=" + payType + "]";
	}
	
	
}
