package com.kh.seulcam.campBooking.service;

import com.kh.seulcam.campBooking.domain.BookingStatus;
import com.kh.seulcam.campBooking.domain.CampBooking;
import com.kh.seulcam.campBooking.domain.bookingStatusSearch;

public interface CampBookingService {

    public int campBookingRegist(CampBooking cBooking);

    public int bookingStatus(BookingStatus bs);

    public String bookingCount(bookingStatusSearch bss);

}
