package com.kh.seulcam.order.controller;

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
import com.kh.seulcam.order.service.OrderService;

import oracle.net.aso.i;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService oService;
	
	
	//결제
	@RequestMapping(value="/order.kh", method=RequestMethod.GET)
	public String showpay() {
		return "order/pay";
	}
	
	
	//주문 완료
	@RequestMapping(value="/order/finish.kh", method=RequestMethod.GET)
	public String orderFinish() {
		
		return "order/orderComplete";
	}


}
