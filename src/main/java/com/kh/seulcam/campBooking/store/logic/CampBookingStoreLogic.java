package com.kh.seulcam.campBooking.store.logic;

import java.util.List;

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

    @Override
    public CampBooking selectBookinginfo(SqlSession session, String bookingNo) {
        CampBooking campBooking = session.selectOne("CampBookingMapper.selectBookinginfo",bookingNo);
        return campBooking;
    }

    @Override
    public List<CampBooking> selectBookList(SqlSession session, String memberId) {
        List<CampBooking> cbList = session.selectList("CampBookingMapper.selectBookList",memberId);
        return cbList;
    }

}
