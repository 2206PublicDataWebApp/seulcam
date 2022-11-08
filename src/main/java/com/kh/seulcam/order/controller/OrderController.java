package com.kh.seulcam.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.seulcam.cart.domain.Cart;
import com.kh.seulcam.cart.service.CartService;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.order.domain.Order;
import com.kh.seulcam.order.domain.OrderList;
import com.kh.seulcam.order.domain.OrderPay;
import com.kh.seulcam.order.domain.OrderProduct;
import com.kh.seulcam.order.service.OrderService;
import com.kh.seulcam.order.service.PaymentService;
import com.kh.seulcam.point.domain.Point;
import com.kh.seulcam.product.domain.Product;

import oracle.net.aso.i;

@Controller
public class OrderController {

	@Autowired
	private OrderService oService;
	
	



	// 주문
	@RequestMapping(value = "/order/order.kh", method = RequestMethod.GET)
	public ModelAndView order(ModelAndView mv, HttpSession session) {
		Member memberId = (Member) session.getAttribute("loginUser");
		Member member = oService.printMemberInfo(memberId);
		List<OrderProduct> oList = oService.printProductInfo(memberId);
		System.out.println(oList);

		if (!oList.isEmpty()) {
			List<Product> pList = new ArrayList();
			for (int i = 0; i < oList.size(); i++) {
				int productNo = oList.get(i).getProductNo();

				List<Product> ppList = oService.printAllProduct(productNo);
				pList.addAll(ppList);

			}
			int totalPrice = 0;
			for (int i = 0; i < pList.size(); i++) {
				int price = pList.get(i).getProductPrice() * oList.get(i).getOrderCount();
				totalPrice += price;

			}
			mv.addObject("totalPrice", totalPrice);
			mv.addObject("pList", pList);
		}
		mv.addObject("oList", oList);
		mv.addObject("member", member);
		mv.setViewName("order/orderDetail");
		return mv;
	}

	// 주문 완료
	@RequestMapping(value = "/order/finish.kh", method = RequestMethod.GET)
	public ModelAndView orderFinish(ModelAndView mv, @RequestParam("orderNo") Integer orderNo, HttpSession session) {
		// Member memberId = (Member)session.getAttribute("loginUser");
		Order order = oService.printOrderInfo(orderNo);
		OrderPay orderPay = oService.printOrderPayInfo(orderNo);

		mv.addObject("orderPay", orderPay);
		mv.addObject("order", order);
		mv.setViewName("order/orderComplete");
		return mv;
	}

	// 주문 주소 변경
	@ResponseBody
	@RequestMapping(value = "/order/addressChange.kh", method = RequestMethod.POST)
	public String addressChange(@ModelAttribute Member member) {
		int result = oService.changeAddress(member);
		return "success";

	}

	// 주문성공
	@ResponseBody
	@RequestMapping(value = "/order/payment/complete", method = RequestMethod.POST)
	public String orderComplete(
			@ModelAttribute Order order,
			@ModelAttribute OrderPay orderPay,
			@ModelAttribute Point point
			) {
		int result = oService.conpleteOrder(order);
		int orderNo = order.getOrderNo();
		String memberId = order.getMemberId();
		// 주문상품에 주문번호 넣고 주문상태 Y로 바꾸는 코드
		int result1 = oService.registOrderNo(orderNo, memberId);
		// 결제테이블에 정보 넣기
		orderPay.setOrderNo(orderNo);
		orderPay.setPayType("P");
		int result2 = oService.registOrderPrice(orderPay);
		// 포인트테이블에 정보 넣기
		if(point.getPoint() != "") {
		int result3=oService.registUsePoint(point);
		}
		return String.valueOf(orderNo);

	}

	// 주문성공 배송지 변경
	@ResponseBody
	@RequestMapping(value = "/order/complete/addressChange.kh", method = RequestMethod.POST)
	public String orderCompleteAddress(@ModelAttribute Order order) {
		int result = oService.changeCompleteAddress(order);

		if (result > 0) {
			return "success";
		} else {
			return "error";
		}
	}

	// 주문 상세 페이지
	@RequestMapping(value = "/order/complete/datail.kh", method = RequestMethod.GET)
	public ModelAndView printCompleteDetail(ModelAndView mv, @RequestParam("orderNo") Integer orderNo) {
		Order order = oService.printOrderInfo(orderNo);
		OrderPay orderPay = oService.printOrderPayInfo(orderNo);
		List<OrderProduct> oList = oService.printCompleteProduct(orderNo);

		if (!oList.isEmpty()) {
			List<Product> pList = new ArrayList();
			for (int i = 0; i < oList.size(); i++) {
				int productNo = oList.get(i).getProductNo();

				List<Product> ppList = oService.printAllProduct(productNo);
				pList.addAll(ppList);

			}
			mv.addObject("pList", pList);
			System.out.println(pList);
		}
		System.out.println(order);
		System.out.println(orderPay);
		System.out.println(oList);
		mv.addObject("order", order);
		mv.addObject("oList", oList);
		mv.addObject("orderPay", orderPay);

		mv.setViewName("order/orderCompleteDetail");

		return mv;
	}

	// 주문리스트
	@RequestMapping(value = "/order/complete/list.kh", method = RequestMethod.GET)
	public ModelAndView printCompleteList(ModelAndView mv, 
/*			@RequestParam("memberId") String memberId*/	
		HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");
		String memberId=member.getMemberId();
		List<Order> oList = oService.printCompleteList(memberId);
		if (!oList.isEmpty()) {
			List<OrderPay> opList = new ArrayList();
			for (int i = 0; i < oList.size(); i++) {
				int orderNo = oList.get(i).getOrderNo();

				List<OrderPay> opList1 = oService.printOrderPay(orderNo);
				opList.addAll(opList1);
			}
			mv.addObject("opList", opList);
			
			/*
			 * if (!opList.isEmpty()) { List<Product> pList = new ArrayList(); for (int i =
			 * 0; i < oList.size(); i++) { int productNo = opList.get(i).getProductNo();
			 * 
			 * List<Product> ppList = oService.printAllProduct(productNo);
			 * pList.addAll(ppList);
			 * 
			 * } mv.addObject("pList", pList);
			 * 
			 * }
			 */
		}

		mv.addObject("oList", oList);
		mv.setViewName("order/orderCompleteList");
		return mv;

	}

	//오더테이블 구매확정으로 바꾸고//맴버 포인트 바꾸고//포인트 적립
	@ResponseBody
	@RequestMapping(value = "/order/GETPoint", method = RequestMethod.POST)
		public String getPoint(
				@RequestParam("orderNo")Integer orderNo,
				HttpSession session
				) {
		Member member = (Member) session.getAttribute("loginUser");
		String memberId=member.getMemberId();
		int result=oService.updateDilivaryStatus(orderNo);
		System.out.println(orderNo);
		OrderPay orderPay=oService.printOrderPayInfo(orderNo);
		System.out.println(orderPay);
		String point=orderPay.getGetPoint();
		System.out.println(point);
		
		//포인트 테이블에 저장
		int result1=oService.registGetPoint(point,memberId);
		//맴버테이블에 반영
		return"success";
		
	}
	
	//구매 취소로 바꾸기
	@ResponseBody
	@RequestMapping(value="/order/cancleOrder",method=RequestMethod.POST)
		public String calcleOrder(
				@RequestParam("orderNo")String orderNo,
				HttpSession session
				) {
		Member member = (Member) session.getAttribute("loginUser");
		String memberId=member.getMemberId();
		int result=oService.changeOrderCancle(orderNo,memberId);
		
		if(result>0) {
		
		return"success";
		}else {
			return "fail";
		}
	}

	
	//상세페이지에서 주문으로 넘겨주기
	//주문하기로 넘겨주기
		@ResponseBody
		@RequestMapping(value="/product/order",method=RequestMethod.POST)
		public String cartOrder(
				@ModelAttribute OrderProduct orderProduct,
				HttpSession session
				) {
			Member member=(Member)session.getAttribute("loginUser");
			if(member == null) {
				return "noLogin";
			}
			String memberId=member.getMemberId();
			if(memberId!=null) {
			orderProduct.setMemberId(memberId);
			int result = oService.orderProduct(orderProduct);
			System.out.println(result);
			if(result>0) {
			return "success";
			}else {
				return "error";
			}
			}else {
				return"error";
			}
			
			}
		
		//배송 상세조회 메뉴 바꾸기
		@RequestMapping(value="/order/delliveryMenu",method=RequestMethod.GET)
		public ModelAndView changeMenu(
				ModelAndView mv,
				@RequestParam(value="dirivaryStatus")String dirivaryStatus,
				HttpSession session
				) {Member member = (Member) session.getAttribute("loginUser");
				String memberId=member.getMemberId();
				List<Order> oList = oService.printChangeCompleteList(memberId,dirivaryStatus);
				if (!oList.isEmpty()) {
					List<OrderPay> opList = new ArrayList();
					for (int i = 0; i < oList.size(); i++) {
						int orderNo = oList.get(i).getOrderNo();

						List<OrderPay> opList1 = oService.printOrderPay(orderNo);
						opList.addAll(opList1);
					}
					mv.addObject("opList", opList);
				}

				mv.addObject("oList", oList);
				mv.setViewName("order/orderCompleteList");
				return mv;
		}
		
		
		//배송조회 화면 보여주기
		@RequestMapping(value="/order/delliveryDtail",method=RequestMethod.GET)
		public ModelAndView changeMenu(
				@RequestParam("orderNo")int orderNo,
				ModelAndView mv) {
			Order order=oService.printOrderInfo(orderNo);
		mv.addObject("order",order);
		mv.setViewName("order/dilivery");
			return mv;
		}
			
}
