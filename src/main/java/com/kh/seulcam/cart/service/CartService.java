package com.kh.seulcam.cart.service;

import java.util.List;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.order.domain.OrderList;
import com.kh.seulcam.product.domain.Product;

public interface CartService {

	public List<Cart> printAllCart(Member memberId);

	public List<Product> printAllProduct(int productNo);

	public int changeCart(Cart cart);

	//선택지우기
	public int deleteOne(Integer cartNo);

	//주문하기
	public int orderProduct(OrderList order);

	//체크한 상품만 지우기
	public int deleteCheck(String productNo, String memberId);

	//장바구니 등록
	public int registCart(Cart cart);
	
	//장바구니 리스트 가져오기
	public List<Cart> printCart(String memberId);

}
