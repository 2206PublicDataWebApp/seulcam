package com.kh.seulcam.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.cart.service.CartService;
import com.kh.seulcam.member.domain.Member;

import oracle.net.aso.i;

@Controller
public class CartController {
	
	@Autowired
	private CartService cService;
	
//	@RequestMapping(value="/cart/cart.kh", method=RequestMethod.GET)
//	public String showCart() {
//		
//		return "cart/cart";
//	}
	//장바구니 보여지기
	@RequestMapping(value="/cart/cart.kh", method=RequestMethod.GET)
	public ModelAndView viewCart(
			ModelAndView mv
			,HttpSession session) {
		String memberId ="wy"; 
		List<Cart>cList = cService.printAllCart(memberId);
		if(!cList.isEmpty()) {
		for(int i=0;i<=cList.size();i++) {
			
		}
			mv.addObject("cList",cList);
		}
		mv.setViewName("cart/cart");
		
		
		return mv;
	}
	
	
	


}
