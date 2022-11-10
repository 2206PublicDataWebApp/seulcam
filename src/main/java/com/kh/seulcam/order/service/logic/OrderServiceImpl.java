package com.kh.seulcam.order.service.logic;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.order.domain.Order;
import com.kh.seulcam.order.domain.OrderCancle;
import com.kh.seulcam.order.domain.OrderPay;
import com.kh.seulcam.order.domain.OrderProduct;
import com.kh.seulcam.order.service.OrderService;
import com.kh.seulcam.order.store.OrderStore;
import com.kh.seulcam.point.domain.Point;
import com.kh.seulcam.product.domain.Product;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderStore oStore;
	
	@Autowired
	private SqlSession session;

	@Override
	public Member printMemberInfo(Member memberId) {
		Member member =oStore.printMemberInfo(session,memberId);
		return member;
	}

	@Override
	public int changeAddress(Member member) {
		int result = oStore.changeAddress(session,member);
		return result;
	}

	@Override
	public List<OrderProduct> printProductInfo(Member memberId) {
		List<OrderProduct>oList = oStore.printProductInfo(session,memberId);
		return oList;
	}

	@Override
	public List<Product> printAllProduct(int productNo) {
		List<Product>pList = oStore.selectProduct(session,productNo);
		return pList;
	}

	@Override
	public int conpleteOrder(Order order) {
		int result = oStore.registOrder(session,order);
		return result;
	}

	//주문 상품들에게 주문번호 넣기
	@Override
	public int registOrderNo(int orderNo, String memberId) {
		int result = oStore.registOrderNo(session,orderNo,memberId);
		return result;
	}

	//주문 완료 정보 가져오기
	@Override
	public Order printOrderInfo(Integer orderNo) {
		Order order= oStore.printOrder(session,orderNo);
		return order;
	}

	//결제테이블에 넣기
	@Override
	public int registOrderPrice(OrderPay orderPay) {
		int result = oStore.registPay(session,orderPay);
		return result;
	}

	//결제정보 불러오기
	@Override
	public OrderPay printOrderPayInfo(Integer orderNo) {
		OrderPay orderPay = oStore.printOrderPayInfo(session,orderNo);
		return orderPay;
	}

	//주문 완료페이지 배송지 변경
	@Override
	public int changeCompleteAddress(Order order) {
		int result = oStore.changeCompleteAddress(session, order);
		return result;
	}

	//주문 완료 상품리스트 불러오기
	@Override
	public List<OrderProduct> printCompleteProduct(Integer orderNo) {
		List<OrderProduct>pList = oStore.printCompleteProduct(session,orderNo);
		return pList;
	}

	
	//주문 완료 리스트 불러오기
	@Override
	public List<Order> printCompleteList(String memberId) {
		List<Order>oList = oStore.printCompleteList(session,memberId);
		return oList;
	}

	@Override
	public List<OrderPay> printOrderPay(int orderNo) {
		List<OrderPay>opList=oStore.printOrderPay(session,orderNo);
		return opList;
	}

	@Override
	public int registUsePoint(Point point) {
		int result=oStore.registPoint(session,point);
		return result;
	}
	
	//관리자P 주문리스트 보여주기
	@Override
	public List<Order> printAllOrder() {
		List<Order>oList=oStore.printAllOrder(session);
		return oList;
	}

	//관리자 주문 상태 변경
	@Override
	public int cngDilivary(Order order) {
		int result = oStore.cngDilivary(session,order);
		return result;
	}

	//구매확정->포인트 얻기/맴버에도 반영
	@Override
	public int registGetPoint(String point, String memberId) {
		int result=oStore.registGetPoint(session,point,memberId);
		return result;
	}

	@Override
	public int updateDilivaryStatus(Integer orderNo) {
		int result=oStore.updateDilivaryStatus(session,orderNo);
		return result;
	}
	//구매취소로 변경
	@Override
	public int changeOrderCancle(String orderNo, String memberId) {
		int result=oStore.changeOrderCancle(session,orderNo,memberId);
		return result;
	}

	//결제정보 가져오기(관리자)
	@Override
	public List<OrderPay> printAllPayInfo(int orderNo) {
		List<OrderPay>opList=oStore.printAllPayInfo(session,orderNo);
		return opList;
	}

	@Override
	public int registRefund(OrderCancle orderCancle) {
		int result=oStore.registRefund(session,orderCancle);
		return result;
	}
	
	//주문테이블 상태 바꾸기(관리자)
	@Override
	public int changeStatus(OrderCancle orderCancle) {
		int result=oStore.changeStatus(session,orderCancle);
		return result;
	}

	//환불->포인트 반환(관리자)
	@Override
	public int registRefundPoint(String point, String memberId) {
		int result=oStore.registRefundPoint(session,point,memberId);
		return result;
	}

	//상세페이지->주문 넘겨주기
	@Override
	public int orderProduct(OrderProduct orderProduct) {
		int result=oStore.registOrderProduct(session,orderProduct);
		return result;
	}

	//배송 상세조회 메뉴 바꾸기
	@Override
	public List<Order> printChangeCompleteList(String memberId, String dirivaryStatus) {
		List<Order>oList = oStore.printCompleteList(session,memberId,dirivaryStatus);
		return oList;
	}

	//상품 갯수 카운트 올리기(상품번호 가져오기)
	@Override
	public List<OrderProduct> plusProduct(int orderNo) {
	List<OrderProduct>pNoList=oStore.plusProduct(session,orderNo);	
		return pNoList;
	}
	
	//상품갯수 카운트 올리기
	@Override
	public int plusProductCount(int productNo) {
		int result=oStore.plusProductCount(session,productNo);
		return result;
	}

	//상품갯수 카운트 줄이기
	@Override
	public int minusProductCount(int productNo) {
		int result=oStore.minusProductCount(session,productNo);
		return result;
	}

	//주문중 페이지 벗어날시 주문상품 삭제(주문취소)
	@Override
	public int deleteOrderProduct(String memberId) {
		int result = oStore.deleteOrderProduc(session,memberId);
		return result;
	}

	//갯수구하기
	@Override
	public int countDelStatus(String memberId, String dirivaryStatus) {
		int count=oStore.selectCountDel(session,memberId,dirivaryStatus);
		return count;
	}

	
	
}
