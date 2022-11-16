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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.seulcam.order.domain.Order;
import com.kh.seulcam.order.domain.OrderCancle;
import com.kh.seulcam.order.domain.OrderPay;
import com.kh.seulcam.order.service.OrderService;
import com.kh.seulcam.order.service.PaymentService;
import com.kh.seulcam.point.domain.Point;

@Controller
public class OrderAdminController {

		@Autowired
		private OrderService oService;
		
		@Autowired
		private PaymentService paymentService;
		
		
	/**
	 * 주문 보여주기
	 * 
	 * @param mv
	 * @return
	 */
		@RequestMapping(value="/admin/order/ListView",method=RequestMethod.GET)
		public ModelAndView printOrderList(
				ModelAndView mv
				) {
			List<Order>oList=oService.printAllOrder();
			
			
			mv.addObject("oList",oList);
			mv.setViewName("admin/orderList");
			
			return mv;
		}
		
		
	/**
	 * 취소주문 보여주기(환불 여부도 반영)
	 * 
	 * @param mv
	 * @return
	 */
		@RequestMapping(value="/admin/order/CancleListView",method=RequestMethod.GET)
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
		
		
	/**
	 * 주문상태 바꿔주기
	 * 
	 * @param order
	 * @return
	 */
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
		
		/**
		 * 환불
		 * 
		 * @param session
		 * @param orderPay
		 * @return
		 * @throws IOException
		 */
		@RequestMapping(value="/payments/cancel",method=RequestMethod.POST)
		public ResponseEntity<String> paymentComplete(
				HttpSession session,
				@ModelAttribute OrderPay orderPay
				) throws IOException {
		// System.out.println(orderPay.getimp_uid());
		String token = paymentService.getToken();
		//System.out.println("토큰 : " + token);
		//int amount = paymentService.paymentInfo(orderInfo.getimpUid(), token);
		int amount=100; 
		paymentService.payMentCancle(token,orderPay.getimp_uid(), amount, "관리자 취소");
		
		
		
		//adminService.orderCancel(orderCancelDto);
		
		//return ResponseEntity.ok().body("주문취소완료");
		
		
		return new ResponseEntity<String>(HttpStatus.OK);

		}
		
	/**
	 * 	//환불정보 저장하기//주문 테이블 환불 Y로 환불완료
	 *	//결제정보 가져오기 use포인트 뽑아서 넣고 
	 *	//포인트 다시 반납
	 *
	 * @param orderCancle
	 * @return
	 */
		@ResponseBody
		@RequestMapping(value="/order/refund/complete",method=RequestMethod.POST)
		public String registRefund(
				@ModelAttribute OrderCancle orderCancle
				) {
			int orderNo=Integer.parseInt(orderCancle.getOrderNo());
			OrderPay orderPay=oService.printOrderPayInfo(orderNo);
			String point=orderCancle.getRefundPoint();
			String memberId=orderCancle.getMemberId();
			if(point!="") {
				orderCancle.setRefundPoint(point);
			int result2=oService.registRefundPoint(point, memberId);
			}else {
				point="0";
				orderCancle.setRefundPoint(point);
			int result2=oService.registRefundPoint(point, memberId);
			}
			orderCancle.setPayType("P");
			//환불정보 저장
			int result=oService.registRefund(orderCancle);
			//주문테이블 상태 바꾸기
			int result1=oService.changeStatus(orderCancle);
			//포인트 테이블 넣어주기//맴버 포인트 더해주기
		
			int result2=oService.registRefundPoint(point, memberId);
			
			
			return"success";
		}
		
		


}
