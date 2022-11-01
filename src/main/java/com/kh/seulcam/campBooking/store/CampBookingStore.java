package com.kh.seulcam.campBooking.store;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.seulcam.campBooking.domain.BookingStatus;
import com.kh.seulcam.campBooking.domain.CampBooking;
import com.kh.seulcam.campBooking.domain.bookingStatusSearch;

public interface CampBookingStore {

    public int bookingInsert(SqlSession session, CampBooking cBooking);

    public int bStatusInsert(SqlSession session, BookingStatus bs);

    public String selectBookCount(SqlSession session, bookingStatusSearch bss);

}
