package com.kh.seulcam.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.seulcam.cart.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	private CartService cService;
	
	@RequestMapping(value="/cart/cart.kh", method=RequestMethod.GET)
	public String showCart() {
		return "cart/cart";
	}
	
	@RequestMapping(value="/order.kh", method=RequestMethod.GET)
	public String showpay() {
		return "order/pay";
	}

}
