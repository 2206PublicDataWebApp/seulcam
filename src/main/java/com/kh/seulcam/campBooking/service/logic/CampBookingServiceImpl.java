package com.kh.seulcam.campBooking.service.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.seulcam.campBooking.service.CampBookingService;
import com.kh.seulcam.campBooking.store.CampBookingStore;

@Service
public class CampBookingServiceImpl implements CampBookingService{
    @Autowired
    private SqlSessionTemplate session;
    
    @Autowired
    private CampBookingStore bStore;

}
