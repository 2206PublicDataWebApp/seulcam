package com.kh.seulcam.order.domain;

import java.util.List;

public class OrderList {
	private List<OrderProduct> orders;

	public List<OrderProduct> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderProduct> orders) {
		this.orders = orders;
	}

	@Override
	public String toString() {
		return "OrderList [orders=" + orders + "]";
	}
	
	

}
