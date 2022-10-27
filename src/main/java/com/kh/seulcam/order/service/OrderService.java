package com.kh.seulcam.order.service;

import java.util.List;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.order.domain.Order;
import com.kh.seulcam.order.domain.OrderProduct;
import com.kh.seulcam.product.domain.Product;

public interface OrderService {

	public Member printMemberInfo(Member memberId);

	public int changeAddress(Member member);

	public List<OrderProduct> printProductInfo(Member memberId);

	public List<Product> printAllProduct(int productNo);

	public int conpleteOrder(Order order);


}
