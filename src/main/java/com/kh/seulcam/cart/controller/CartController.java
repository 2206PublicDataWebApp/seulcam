package com.kh.seulcam.cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.cart.service.CartService;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.order.domain.OrderList;
import com.kh.seulcam.product.domain.Product;


@Controller
public class CartController {
	
	@Autowired
	private CartService cService;
	

	//장바구니 보여지기
	@RequestMapping(value="/cart/cart.kh", method=RequestMethod.GET)
	public ModelAndView viewCart(
			ModelAndView mv
			,HttpSession session) {
		Member memberId = (Member)session.getAttribute("loginUser");
		List<Cart> cList = cService.printAllCart(memberId);
		if(!cList.isEmpty()) {
			List<Product>pList = new ArrayList(); 
			 for(int i=0;i<cList.size();i++) { 
				 int productNo=cList.get(i).getProductNo();
				 
				 List<Product>ppList= cService.printAllProduct(productNo);
				pList.addAll(ppList);
				 	
			  }
			 int count=pList.size();
			 int totalPrice=0;
			 for(int i=0;i<pList.size();i++) {
			 int price=pList.get(i).getProductPrice();
			 totalPrice+=price;
			 }
			mv.addObject("totalPrice",totalPrice);
			mv.addObject("count",count);
			mv.addObject("memberId",memberId);
			mv.addObject("pList",pList);
			mv.addObject("cList",cList);
		}
		mv.setViewName("cart/cart");
		
		
		return mv;
	}

	
	@ResponseBody
	@RequestMapping(value="/cart/changeCount.kh",method=RequestMethod.POST)
	public String cartChange(
			@ModelAttribute Cart cart
			) {
		int result = cService.changeCart(cart);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/cart/deleteOne.kh",method=RequestMethod.GET)
	public String cartDeleteOne(
			@RequestParam("cartNo")Integer cartNo
			) {
		int result = cService.deleteOne(cartNo);
		if(result>0) {
			return "success";
		}else {
			return"fail";
		}
	}


	//주문하기로 넘겨주기
	@RequestMapping(value="/cart/order.kh",method=RequestMethod.POST)
	public ModelAndView cartOrder(
			ModelAndView mv
			,@ModelAttribute(value="OrderList")OrderList order
			) {
		int result = cService.orderProduct(order);
		
		mv.setViewName("redirect:/order/order.kh");
		return mv;
		
		}
		
		
	
	
	
	


}
