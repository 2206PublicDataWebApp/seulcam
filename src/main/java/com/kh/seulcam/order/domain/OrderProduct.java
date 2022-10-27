package com.kh.seulcam.order.domain;

public class OrderProduct {
	
	private int orderProductNo;
	private int productNo;
	private String memberId;
	private int orderCount;
	private int orderNo;
	private String orderStatus;
	public int getOrderProductNo() {
		return orderProductNo;
	}
	public void setOrderProductNo(int orderProductNo) {
		this.orderProductNo = orderProductNo;
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
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	
	@Override
	public String toString() {
		return "OrderProduct [orderProductNo=" + orderProductNo + ", productNo=" + productNo + ", memberId=" + memberId
				+ ", orderCount=" + orderCount + ", orderNo=" + orderNo + ", orderStatus=" + orderStatus + "]";
	}
	
	
	

}
