package com.kh.seulcam.campBooking.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.seulcam.campBooking.service.CampBookingService;

@Controller
public class CampBookingController {
    @Autowired
    private CampBookingService bService;
    
 // 캠핑장 예약 페이지
    @RequestMapping(value = "/campBooking/campBookingView.kh", method = RequestMethod.GET)
    public ModelAndView campList(
            HttpServletRequest request,
            ModelAndView mv) {
        try {
            
            //로그인세션 아이디 없으면 로그인화면으로 보낸다
            
            mv.setViewName("campBooking/campBooking");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("msg", "예약페이지 조회 실패").setViewName("common/errorPage");
        }
        
        return mv;
    }
    
}
