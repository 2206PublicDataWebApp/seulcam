package com.kh.seulcam.cart.service;

import java.util.List;

import com.kh.seulcam.cart.domain.Cart;

public interface CartService {

	List<Cart> printAllCart(String memberId);

}
