package com.kh.seulcam.campBooking.service;

import java.util.List;

import com.kh.seulcam.campBooking.domain.BookingStatus;
import com.kh.seulcam.campBooking.domain.CampBooking;
import com.kh.seulcam.campBooking.domain.bookingStatusSearch;
import com.kh.seulcam.order.domain.OrderCancle;

public interface CampBookingService {

    public int campBookingRegist(CampBooking cBooking);

    public int bookingStatus(BookingStatus bs);

    public String bookingCount(bookingStatusSearch bss);

    public CampBooking printBookingInfo(String bookingNo);

    public List<CampBooking> BooingListView(String memberId);

    public int changeBookingStatus(OrderCancle orderCancle);

    public int deleteBookStatus(int orderNo);

}
