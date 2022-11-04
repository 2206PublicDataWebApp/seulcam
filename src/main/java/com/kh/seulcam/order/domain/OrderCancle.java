package com.kh.seulcam.order.domain;

public class OrderCancle {
	private int refundNo;
	private String orderNo;
	private String memberId;
	private String imp_uid;
	private String merchant_uid;
	private String refundDate;
	private String refundPrice;
	private String refundPoint;
	private String payType;
	public int getRefundNo() {
		return refundNo;
	}
	public void setRefundNo(int refundNo) {
		this.refundNo = refundNo;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public String getRefundDate() {
		return refundDate;
	}
	public void setRefundDate(String refundDate) {
		this.refundDate = refundDate;
	}
	public String getRefundPrice() {
		return refundPrice;
	}
	public void setRefundPrice(String refundPrice) {
		this.refundPrice = refundPrice;
	}
	public String getRefundPoint() {
		return refundPoint;
	}
	public void setRefundPoint(String refundPoint) {
		this.refundPoint = refundPoint;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	
	@Override
	public String toString() {
		return "OrderCancle [refundNo=" + refundNo + ", orderNo=" + orderNo + ", memberId=" + memberId + ", imp_uid="
				+ imp_uid + ", merchant_uid=" + merchant_uid + ", refundDate=" + refundDate + ", refundPrice="
				+ refundPrice + ", refundPoint=" + refundPoint + ", payType=" + payType + "]";
	}
	
	

}
