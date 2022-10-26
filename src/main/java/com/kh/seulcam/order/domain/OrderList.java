package com.kh.seulcam.order.domain;

import java.util.List;

public class OrderList {
	private List<Order> orders;

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	@Override
	public String toString() {
		return "OrderList [orders=" + orders + "]";
	}
	
	

}
