package com.kh.seulcam.campBooking.service.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.seulcam.campBooking.domain.BookingStatus;
import com.kh.seulcam.campBooking.domain.CampBooking;
import com.kh.seulcam.campBooking.domain.bookingStatusSearch;
import com.kh.seulcam.campBooking.service.CampBookingService;
import com.kh.seulcam.campBooking.store.CampBookingStore;
import com.kh.seulcam.order.domain.OrderCancle;

@Service
public class CampBookingServiceImpl implements CampBookingService{
    @Autowired
    private SqlSessionTemplate session;
    
    @Autowired
    private CampBookingStore bStore;

    @Override
    public int campBookingRegist(CampBooking cBooking) {
        int result = bStore.bookingInsert(session,cBooking);
        return result;
    }

    @Override
    public int bookingStatus(BookingStatus bs) {
        int bsInsert = bStore.bStatusInsert(session,bs);
        return bsInsert;
    }

    @Override
    public String bookingCount(bookingStatusSearch bss) {
        String result = bStore.selectBookCount(session,bss);
        return result;
    }

    @Override
    public CampBooking printBookingInfo(String bookingNo) {
        CampBooking campBooking = bStore.selectBookinginfo(session,bookingNo);
        return campBooking;
    }

    @Override
    public List<CampBooking> BooingListView(String memberId) {
        System.out.println("서비스");
        List<CampBooking> cbList = bStore.selectBookList(session,memberId);
        return cbList;
    }

    @Override
    public int changeBookingStatus(OrderCancle orderCancle) {
        int result = bStore.updateBookingStatus(session, orderCancle);
        return result;
    }

    @Override
    public int deleteBookStatus(int orderNo) {
        int result = bStore.deleteBookStatus(session,orderNo);
        return result;
    }

}
