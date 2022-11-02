package com.kh.seulcam.order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.seulcam.order.domain.Order;
import com.kh.seulcam.order.domain.OrderPay;
import com.kh.seulcam.order.service.OrderService;
import com.kh.seulcam.order.service.PaymentService;

@Controller
public class OrderAdminController {

		@Autowired
		private OrderService oService;
		
		@Autowired
		private PaymentService paymentService;
		
		
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
			if(!oList.isEmpty()) {
				List<OrderPay>opList=new ArrayList();
			for (int i = 0; i < oList.size(); i++) {
				int orderNo = oList.get(i).getOrderNo();
				List<OrderPay>opList1=oService.printAllPayInfo(orderNo);
				opList.addAll(opList1);

			}
			mv.addObject("opList",opList);
			}
			
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
		
		
		//@PostMapping("/order/payment/complete")
		@RequestMapping(value="/payments/cancel",method=RequestMethod.POST)
		public ResponseEntity<String> paymentComplete(
				HttpSession session,
				OrderPay orderInfo,
				long totalPrice) throws IOException {
		 
		
		String token = paymentService.getToken();
		System.out.println("토큰 : " + token);
		
		return new ResponseEntity<String>(HttpStatus.OK);

		}
		
		/*@RequestMapping(value="/payments/cancel",method=RequestMethod.POST)
		public ResponseEntity<String> orderCancle(OrderCancelDto orderCancelDto) throws IOException {
			System.out.println(orderCancelDto.toString());
		    if(!"".equals(orderCancelDto.getImpUid())) {
		        String token = paymentService.getToken();
		        int amount = paymentService.paymentInfo(orderCancelDto.getImpUid(), token);
		        paymentService.payMentCancle(token, orderCancelDto.getImpUid(), amount, "관리자 취소");
		    }
			
			adminService.orderCancel(orderCancelDto);

			return ResponseEntity.ok().body("주문취소완료");
		}*/


}
