package com.kh.seulcam.order.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.order.domain.Order;
import com.kh.seulcam.order.domain.OrderProduct;
import com.kh.seulcam.order.store.OrderStore;
import com.kh.seulcam.product.domain.Product;

@Repository
public class OrderStoreLogic implements OrderStore {

	@Override
	public Member printMemberInfo(SqlSession session, Member memberId) {
		Member member = session.selectOne("OrderMapper.selectMemberInfo",memberId);
		return member;
	}

	@Override
	public int changeAddress(SqlSession session, Member member) {
		int result = session.update("OrderMapper.updateAddress",member);
		return result;
	}

	@Override
	public List<OrderProduct> printProductInfo(SqlSession session, Member memberId) {
		List<OrderProduct>oList = session.selectList("OrderMapper.selectProductInfo",memberId);
		return oList;
	}

	//장바구니에서상품 불러온거
	@Override
	public List<Product> selectProduct(SqlSession session, int productNo) {
		List<Product>pList = session.selectList("CartMapper.selectAllProduct",productNo);
		return pList;
	}

	//주문 등록
	@Override
	public int registOrder(SqlSession session,Order order) {
		int result = session.insert("OrderMapper.insertOrder",order);
		return result;
	}

}
