package com.kh.seulcam.order.controller;

import java.util.ArrayList;
import java.util.Arrays;
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


	/**
	 *주문화면
	 * 
	 * @param mv
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/order/order.kh", method = RequestMethod.GET)
	public ModelAndView order(ModelAndView mv, HttpSession session) {
		Member memberId = (Member) session.getAttribute("loginUser");
		Member member = oService.printMemberInfo(memberId);
		List<OrderProduct> oList = oService.printProductInfo(memberId);
		int pCount=0;
		if (!oList.isEmpty()) {
			pCount=oList.size();
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
			mv.addObject("pCount",pCount);
		}
		mv.addObject("oList", oList);
		mv.addObject("member", member);
		mv.setViewName("order/orderDetail");
		return mv;
	}

	
	/**
	 * 
	 * 주문 완료
	 *
	 * @param mv
	 * @param orderNo
	 * @param session
	 * @return
	 */
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

	
	/**
	 * 주문 주소 변경
	 * 
	 * @param member
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/order/addressChange.kh", method = RequestMethod.POST)
	public String addressChange(@ModelAttribute Member member) {
		int result = oService.changeAddress(member);
		return "success";

	}
	
	/*@RequestMapping(value = "/order/payment/complete/mobile", method = RequestMethod.POST)
	public String orderCompleteMobile(
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
		System.out.println(orderPay);
		int result2 = oService.registOrderPrice(orderPay);
		// 포인트테이블에 정보 넣기
		if(point.getPoint() != "") {
		int result3=oService.registUsePoint(point);
		}
		//상품 갯수 카운트 올리기
		List<OrderProduct>pNoList=oService.plusProduct(orderNo);
		for (int i = 0; i < pNoList.size(); i++) {
			int productNo = pNoList.get(i).getProductNo();
			int result4=oService.plusProductCount(productNo);

		}
		
		return String.valueOf(orderNo);

	}*/

	/**
	 * 
	 * 주문성공
	 * 
	 * @param order
	 * @param orderPay
	 * @param point
	 * @return
	 */
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
		System.out.println(orderPay);
		int result2 = oService.registOrderPrice(orderPay);
		// 포인트테이블에 정보 넣기
		if(point.getPoint() != "") {
		int result3=oService.registUsePoint(point);
		}
		//상품 갯수 카운트 올리기
		List<OrderProduct>pNoList=oService.plusProduct(orderNo);
		for (int i = 0; i < pNoList.size(); i++) {
			int productNo = pNoList.get(i).getProductNo();
			int result4=oService.plusProductCount(productNo);

		}
		
		return String.valueOf(orderNo);

	}

	/**
	 * 주문성공 배송지 변경
	 * 
	 * @param order
	 * @return
	 */
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

	/**
	 * 주문 상세 페이지
	 * 
	 * @param mv
	 * @param orderNo
	 * @return
	 */
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

	/**
	 * 주문리스트
	 * 
	 * @param mv
	 * @param session
	 * @return
	 */
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
			
		}
		
	int count1=0; 
	int count2=0;
	int count3=0; 
	int count4=0; 
	
	
	for (int i = 0; i < oList.size(); i++) { 
		String dStatus =oList.get(i).getDirivaryStatus(); 
		System.out.println(dStatus);
		 if(dStatus!=null) {
	if(dStatus.equals("입금확인")) {
		count1++;
	}else if(dStatus.equals("배송중")) { 
		count2++; 
		}else if(dStatus.equals("배송완료")) { 
			count3++; 
			}else if(dStatus.equals("구매확정")) {
				count4++; 
				}
	}
	}
	int count6=count1+count2+count3+count4;
	
	mv.addObject("count1",count1);
	mv.addObject("count2",count2);
	mv.addObject("count3",count3);
	mv.addObject("count4",count4);
	mv.addObject("count6",count6);
	mv.addObject("dirivaryStatus","전체");
	
		mv.addObject("oList", oList);
		mv.setViewName("order/orderCompleteList");
		return mv;

	}

	/**
	 * 취소주문 리스트
	 * 
	 * @param mv
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/order/complete/Cancle/list", method = RequestMethod.GET)
	public ModelAndView printCompleteCancleList(ModelAndView mv, 
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
			
		}
		
	int count1=0; 
	int count2=0;
	
	
	
	for (int i = 0; i < oList.size(); i++) { 
		String dStatus =oList.get(i).getDirivaryStatus(); 
		System.out.println(dStatus);
		 if(dStatus!=null) {
	 if(dStatus.equals("구매취소")) {
					count1++; 
	}else if(dStatus.equals("환불완료")) {
		count2++;
	}
	}
	}
	//취소 전체갯수
	int count3=count1+count2;
	mv.addObject("count1",count1);
	mv.addObject("count2",count2);
	mv.addObject("count3",count3);
	mv.addObject("dirivaryStatus","전체");

		mv.addObject("oList", oList);
		mv.setViewName("order/orderCompleteCancleList");
		return mv;

	}

	
	
	
	
	
	
	
	/**
	 * //오더테이블 구매확정으로 바꾸고//맴버 포인트 바꾸고//포인트 적립
	 * 
	 * @param orderNo
	 * @param session
	 * @return
	 */
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
	
	/**
	 * 구매 취소로 바꾸기
	 * 
	 * @param orderNo
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/order/cancleOrder",method=RequestMethod.POST)
		public String calcleOrder(
				@RequestParam("orderNo")String orderNo,
				HttpSession session
				) {
		Member member = (Member) session.getAttribute("loginUser");
		String memberId=member.getMemberId();
		int result=oService.changeOrderCancle(orderNo,memberId);
		//상품 카운트 줄이기
		List<OrderProduct>pNoList=oService.plusProduct(Integer.parseInt(orderNo));
		for (int i = 0; i < pNoList.size(); i++) {
			int productNo = pNoList.get(i).getProductNo();
			int result4=oService.minusProductCount(productNo);

		}
		if(result>0) {
		
		return"success";
		}else {
			return "fail";
		}
	}

	
	/**
	 * 상세페이지에서 주문으로 넘겨주기//주문하기로 넘겨주기
	 * 
	 * @param orderProduct
	 * @param session
	 * @return
	 */
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
		
		
		/**
		 * 취소 배송 상세조회 메뉴 바꾸기
		 * 
		 * @param mv
		 * @param dirivaryStatus
		 * @param session
		 * @return
		 */
		@RequestMapping(value="/order/cancle/delliveryMenu",method=RequestMethod.GET)
		public ModelAndView cancleChangeMenu(
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

				List<Order> allList = oService.printCompleteList(memberId);
				int count1=0; 
				int count2=0;
				
				
				
				for (int i = 0; i < allList.size(); i++) { 
					String dStatus =allList.get(i).getDirivaryStatus(); 
					 if(dStatus!=null) {
				 if(dStatus.equals("구매취소")) {
								count1++; 
				}else if(dStatus.equals("환불완료")) {
					count2++;
				}
				}
				}
				int count3=count1+count2;
				
				mv.addObject("count1",count1);
				mv.addObject("count2",count2);
				mv.addObject("count3",count3);
				
					mv.addObject("dirivaryStatus",dirivaryStatus);
					mv.addObject("oList", oList);
					mv.setViewName("order/orderCompleteCancleList");
					return mv;
		}
		
		
		
		
		/**
		 * 배송 상세조회 메뉴 바꾸기
		 * 
		 * @param mv
		 * @param dirivaryStatus
		 * @param session
		 * @return
		 */
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

				List<Order> allList = oService.printCompleteList(memberId);
				int count1=0; 
				int count2=0;
				int count3=0; 
				int count4=0; 
				int count5=0;
			
				
				
				for (int i = 0; i < allList.size(); i++) { 
					String dStatus =allList.get(i).getDirivaryStatus(); 
					System.out.println(dStatus);
					 if(dStatus!=null) {
				if(dStatus.equals("입금확인")) {
					count1++;
				}else if(dStatus.equals("배송중")) { 
					count2++; 
					}else if(dStatus.equals("배송완료")) { 
						count3++; 
						}else if(dStatus.equals("구매확정")) {
							count4++; 
							}else if(dStatus.equals("구매취소")) {
								count5++; 
								}
				
				
				}
				}
				int count6=count1+count2+count3+count4+count5;
				
				mv.addObject("count1",count1);
				mv.addObject("count2",count2);
				mv.addObject("count3",count3);
				mv.addObject("count4",count4);
				mv.addObject("count5",count5);
				mv.addObject("count6",count6);
				mv.addObject("dirivaryStatus",dirivaryStatus);
				
				mv.addObject("oList", oList);
				mv.setViewName("order/orderCompleteList");
				return mv;
		}
		
		
		/**
		 * 배송조회 화면 보여주기
		 * 
		 * @param orderNo
		 * @param mv
		 * @return
		 */
		@RequestMapping(value="/order/delliveryDtail",method=RequestMethod.GET)
		public ModelAndView changeMenu(
				@RequestParam("orderNo")int orderNo,
				ModelAndView mv) {
			Order order=oService.printOrderInfo(orderNo);
		mv.addObject("order",order);
		mv.setViewName("order/dilivery");
			return mv;
		}
		
		
		/**
		 * 주문중 페이지 벗어날시 주문상품 삭제(주문취소)
		 * 
		 * @param memberId
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="/order/notCompleteOrder",method=RequestMethod.GET)
		public String notCompleteOrder(
				@RequestParam(value="memberId")String memberId
				) {
			int result=oService.deleteOrderProduct(memberId);
			return "success";
		}
		
			
}
