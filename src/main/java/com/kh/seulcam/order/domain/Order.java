package com.kh.seulcam.order.domain;

public class Order {
	
	private int orderNo;
	private String memberId;
	private String memberName;
	private String memberPhone;
	private String orderMessage;
	private String orderAddressPost;
	private String orderAddress1;
	private String orderAddress2;
	private String orderMainProductName;
	private String orderMainFileRename;
	private String orderDate;
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
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
	public String getOrderMainProductName() {
		return orderMainProductName;
	}
	public void setOrderMainProductName(String orderMainProductName) {
		this.orderMainProductName = orderMainProductName;
	}
	public String getOrderMainFileRename() {
		return orderMainFileRename;
	}
	public void setOrderMainFileRename(String orderMainFileRename) {
		this.orderMainFileRename = orderMainFileRename;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
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
		return "Order [orderNo=" + orderNo + ", memberId=" + memberId + ", memberName=" + memberName + ", memberPhone="
				+ memberPhone + ", orderMessage=" + orderMessage + ", orderAddressPost=" + orderAddressPost
				+ ", orderAddress1=" + orderAddress1 + ", orderAddress2=" + orderAddress2 + ", orderMainProductName="
				+ orderMainProductName + ", orderMainFileRename=" + orderMainFileRename + ", orderDate=" + orderDate
				+ ", payStatus=" + payStatus + ", dirivaryStatus=" + dirivaryStatus + ", cancleStatus=" + cancleStatus
				+ ", refundStatus=" + refundStatus + "]";
	}
	
	
	
	
	
	
	
}
