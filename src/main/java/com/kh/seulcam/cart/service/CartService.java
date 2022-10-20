package com.kh.seulcam.cart.service;

import java.util.List;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.product.domain.Product;

public interface CartService {

	public List<Cart> printAllCart(Member memberId);

	public List<Product> printAllProduct(int productNo);

	public int changeCart(Cart cart);

	public int deleteOne(Integer cartNo);

}
