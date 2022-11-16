package com.kh.seulcam.cart.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletResponse;
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
			,HttpSession session
			, HttpServletResponse response)throws Exception {
		Member memberId = (Member)session.getAttribute("loginUser");
		/*
		 * if(member == null) { response.setContentType("text/html; charset=UTF-8");
		 * PrintWriter out = response.getWriter();
		 * out.println("<script>alert('로그인 해주세요.'); history.go(-1);</script>");
		 * out.flush(); }else {
		 */
		//String memberId=member.getMemberId();
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
		//}
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


	//주문하기로 넘겨주기 -> //장바구니 물건 지우기
	@RequestMapping(value="/cart/order.kh",method=RequestMethod.POST)
	public ModelAndView cartOrder(
			ModelAndView mv
			,@ModelAttribute(value="OrderList")OrderList order
			) {
		int result = cService.orderProduct(order);
		
		
		mv.setViewName("redirect:/order/order.kh");
		return mv;
		
		}
		
	//체크박스 선택 지우기	
	@ResponseBody
	@RequestMapping(value="/cart/checkdelete",method=RequestMethod.POST)
	public String cartDeleteCheck(
			 @RequestParam(value="pNo[]") List<String>pNo, 
			HttpSession session
			/*@ModelAttribute(value="Cart")Cart cart*/
		
			) {
		Member member = (Member) session.getAttribute("loginUser");
		String memberId=member.getMemberId();
		int result=0;
		for (int i = 0; i < pNo.size(); i++) {
			
			/*
			 * cart.setProductNo(Integer.parseInt(productNo.get(i)));
			 * cart.setMemberId(memberId);
			 */
			String productNo = pNo.get(i);
		    System.out.println();
		   result=cService.deleteCheck(productNo,memberId);
		}
		if(result>0) {
		return "success";
		}else {
			return"error";
		}
		
	}
	
	//장바구니 담기
	@ResponseBody
	@RequestMapping(value="/product/cart",method=RequestMethod.POST)
	public String getCart(
			@ModelAttribute Cart cart,
			@RequestParam(value="productNo")String productNo,
			HttpSession session
			) {
		Member member=(Member)session.getAttribute("loginUser");
		if(member == null) {
			return "noLogin";
		}
		String memberId=member.getMemberId();
		cart.setProductNo(Integer.parseInt(productNo));
		if(memberId!=null) {
		List<Cart> cList = cService.printCart(memberId);
		if(cList != null) {
			for(int i=0;i<cList.size();i++) { 
				 int pNo=cList.get(i).getProductNo();
				 System.out.println(cList);
				 if(pNo == (Integer.parseInt(productNo))) {
					 System.out.println(pNo);
					 return "sameProduct";
				 }
		}
		}
			cart.setMemberId(memberId);
		//장바구니 등록
		int result=cService.registCart(cart);
		if(result>0) {
			return "success";
		}else {
		
		return "error";
				
		
	}
	}else {
		return "error";
	}
}
}



	
	
	



