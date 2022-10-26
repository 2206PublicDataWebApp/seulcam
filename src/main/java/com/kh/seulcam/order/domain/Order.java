package com.kh.seulcam.order.domain;

public class Order {
	
	private int orderNo;
	private int productNo;
	private String memberId;
	private int orderCount;
	private String memberName;
	private String memberPhone;
	private String orderMessage;
	private String orderAddressPost;
	private String orderAddress1;
	private String orderAddress2;
	private String payStatus;
	private String dirivaryStatus;
	private String cancleStatus;
	private String refundStatus;
	

	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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
	public int getorderCount() {
		return orderCount;
	}
	public void setorderCount(int orderCount) {
		this.orderCount = orderCount;
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
	public String getOrderMessage() {
		return orderMessage;
	}
	public void setOrderMessage(String orderMessage) {
		this.orderMessage = orderMessage;
	}
	public String getOrderAddressPost() {
		return orderAddressPost;
	}
	public void setOrderAddressPost(String orderAddressPost) {
		this.orderAddressPost = orderAddressPost;
	}
	public String getOrderAddress1() {
		return orderAddress1;
	}
	public void setOrderAddress1(String orderAddress1) {
		this.orderAddress1 = orderAddress1;
	}
	public String getOrderAddress2() {
		return orderAddress2;
	}
	public void setOrderAddress2(String orderAddress2) {
		this.orderAddress2 = orderAddress2;
	}
	public String getPayStatus() {
		return payStatus;
	}
	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}
	public String getDirivaryStatus() {
		return dirivaryStatus;
	}
	public void setDirivaryStatus(String dirivaryStatus) {
		this.dirivaryStatus = dirivaryStatus;
	}
	public String getCancleStatus() {
		return cancleStatus;
	}
	public void setCancleStatus(String cancleStatus) {
		this.cancleStatus = cancleStatus;
	}
	public String getRefundStatus() {
		return refundStatus;
	}
	public void setRefundStatus(String refundStatus) {
		this.refundStatus = refundStatus;
	}
	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", productNo=" + productNo + ", memberId=" + memberId + ", orderCount="
				+ orderCount + ", memberName=" + memberName + ", memberPhone=" + memberPhone + ", orderMessage="
				+ orderMessage + ", orderAddressPost=" + orderAddressPost + ", orderAddress1=" + orderAddress1
				+ ", orderAddress2=" + orderAddress2 + ", payStatus=" + payStatus + ", dirivaryStatus=" + dirivaryStatus
				+ ", cancleStatus=" + cancleStatus + ", refundStatus=" + refundStatus + "]";
	}
	
	
	
	
	
	
}
