package com.kh.seulcam.campBooking.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.seulcam.campBooking.domain.BookingStatus;
import com.kh.seulcam.campBooking.domain.CampBooking;
import com.kh.seulcam.campBooking.domain.bookingStatusSearch;
import com.kh.seulcam.campBooking.store.CampBookingStore;
@Repository
public class CampBookingStoreLogic implements CampBookingStore{

    @Override
    public int bookingInsert(SqlSession session, CampBooking cBooking) {
        int result = session.insert("CampBookingMapper.bookingInsert",cBooking);
        return result;
    }

    @Override
    public int bStatusInsert(SqlSession session, BookingStatus bs) {
        int bsInsert = session.insert("CampBookingMapper.bStatusInsert",bs);
        return bsInsert;
    }

    @Override
    public String selectBookCount(SqlSession session, bookingStatusSearch bss) {
        String result = session.selectOne("CampBookingMapper.selectBookCount",bss);
        return result;
    }

}
