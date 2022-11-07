package com.kh.seulcam.campBooking.store.logic;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.seulcam.campBooking.domain.BookingStatus;
import com.kh.seulcam.campBooking.domain.CampBooking;
import com.kh.seulcam.campBooking.domain.bookingStatusSearch;
import com.kh.seulcam.campBooking.store.CampBookingStore;
import com.kh.seulcam.order.domain.OrderCancle;
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
        System.out.println(memberId != null);
        List<CampBooking> cbList;
        if(memberId != null) {
            cbList = session.selectList("CampBookingMapper.selectBookList",memberId);
        }else {
            cbList = session.selectList("CampBookingMapper.selectABookList",memberId);
        }
        return cbList;
    }

    @Override
    public int updateBookingStatus(SqlSession session, OrderCancle orderCancle) {
        int result = session.update("CampBookingMapper.updateBookingStatus",orderCancle);
        return result;
    }

    @Override
    public int deleteBookStatus(SqlSession session, int orderNo) {
        int result = session.delete("CampBookingMapper.deleteBookStatus",orderNo);
        return result;
    }

}
