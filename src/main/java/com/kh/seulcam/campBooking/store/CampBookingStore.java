package com.kh.seulcam.campBooking.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.seulcam.campBooking.domain.BookingStatus;
import com.kh.seulcam.campBooking.domain.CampBooking;
import com.kh.seulcam.campBooking.domain.bookingStatusSearch;
import com.kh.seulcam.order.domain.OrderCancle;

public interface CampBookingStore {

    public int bookingInsert(SqlSession session, CampBooking cBooking);

    public int bStatusInsert(SqlSession session, BookingStatus bs);

    public String selectBookCount(SqlSession session, bookingStatusSearch bss);

    public CampBooking selectBookinginfo(SqlSession session, String bookingNo);

    public List<CampBooking> selectBookList(SqlSession session, String memberId);

    public int updateBookingStatus(SqlSession session, OrderCancle orderCancle);

    public int deleteBookStatus(SqlSession session, int orderNo);

}
