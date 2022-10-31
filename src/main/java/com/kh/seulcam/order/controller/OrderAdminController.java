package com.kh.seulcam.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.seulcam.order.domain.Order;
import com.kh.seulcam.order.service.OrderService;

@Controller
public class OrderAdminController {

		@Autowired
		private OrderService oService;
		
		
	//주문 보여주기
		@RequestMapping(value="/orderAdmin/list.kh",method=RequestMethod.GET)
		public ModelAndView printOrderList(
				ModelAndView mv
				) {
			List<Order>oList=oService.printAllOrder();
			
			
			mv.addObject("oList",oList);
			mv.setViewName("admin/orderList");
			
			return mv;
		}
		
		
	//취소주문 보여주기(환불 여부도 반영)
		@RequestMapping(value="/orderAdmin/cancle/list.kh",method=RequestMethod.GET)
		public ModelAndView printCancleList(
				ModelAndView mv
				) {
			List<Order>oList=oService.printAllOrder();
			
			
			mv.addObject("oList",oList);
			mv.setViewName("admin/orderCancleList");
			
			return mv;
		}
		
		
	//주문상태 바꿔주기
		@ResponseBody
		@RequestMapping(value="/order/admin/cngDilivary",method=RequestMethod.POST)
		public String cngDilivary(
				@ModelAttribute Order order
				) {
			int result=oService.cngDilivary(order);
			
			if(result>0) {
			return"success";
			}else {
				return"error";
			}
		}
	
	

}
