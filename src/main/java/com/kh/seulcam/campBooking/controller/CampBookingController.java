package com.kh.seulcam.campBooking.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.seulcam.camp.domain.CampSite;
import com.kh.seulcam.camp.service.CampServie;
import com.kh.seulcam.campBooking.domain.BookingStatus;
import com.kh.seulcam.campBooking.domain.CampBooking;
import com.kh.seulcam.campBooking.service.CampBookingService;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.member.service.MemberService;
import com.kh.seulcam.order.service.OrderService;
import com.kh.seulcam.point.domain.Point;

@Controller
public class CampBookingController {
    @Autowired
    private CampBookingService bService;
    
    @Autowired
    private CampServie cService;
    
    @Autowired
    private MemberService mService;
    
    @Autowired
    private OrderService oService;
    
 // 캠핑장 예약 페이지
    @RequestMapping(value = "/campBooking/campBookingView.kh", method = RequestMethod.GET)
    public ModelAndView campList(
            @RequestParam(value="memberId", required = false) String memberCheck,
            @RequestParam(value="contentId", required = false) int contentId,
            @RequestParam(value="firstDayJs", required = false) String firstDayJs,
            @RequestParam(value="lastDayJs", required = false) String lastDayJs,
            @RequestParam(value="siteNo", required = false) int siteNo,
            HttpServletRequest request,
            ModelAndView mv,
            HttpSession session) {
        try {
            //로그인세션 아이디 없으면 로그인화면으로 보낸다
            System.out.println(session.getAttribute("loginUser"));;
            if(session.getAttribute("loginUser") == null) {
                request.setAttribute("msg", "로그인이 필요한 서비스 입니다.");
                request.setAttribute("url", "/camp/campSiteDetail.kh?contentId=" + contentId);
                mv.setViewName("common/alert");
                return mv;
            }else{
                Member member = (Member)session.getAttribute("loginUser");
                String memberId = member.getMemberId();
                Member mOne = mService.printOneById(memberId);
                if(!memberId.equals(memberCheck)) {
                    System.out.println("수정창 로그인없이 접근");
                    request.setAttribute("msg", "정상적인 접근이 아닙니다.");
                    request.setAttribute("url", "/");
                    mv.setViewName("common/alert");
                    return mv;
                }
                CampSite campSite = cService.printSite(siteNo);
                //데이트 포멧
                Date firstDay = Date.valueOf(firstDayJs);
                Date lastDay = Date.valueOf(lastDayJs);
                // 날짜사이 일수 구하기
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                String countDay = (format.parse(lastDayJs).getTime() - format.parse(firstDayJs).getTime())/(24*60*60)/1000+"";
                
                mv.addObject("firstDay",firstDay);
                mv.addObject("lastDay",lastDay);
                mv.addObject("countDay",countDay);
                mv.addObject("campSite",campSite);
                mv.addObject("mOne",mOne);
                mv.setViewName("campBooking/campBooking");
            }
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("msg", "예약페이지 조회 실패").setViewName("common/errorPage");
        }
        
        return mv;
    }
    
  //캠핑장 예약
    @ResponseBody
    @RequestMapping(value = "/campBooking/campBooking.kh", method = RequestMethod.POST )
    public String campBookingRegist(
            @ModelAttribute CampBooking cBooking) {
        try {
            System.out.println(cBooking);
            //잔여좌석 없으면 예약안되도록
            
            // 예약저장
            int result = bService.campBookingRegist(cBooking);
            
            // 포인트 차감 / 적립
            Point pointUse = new Point();
            pointUse.setMemberId(cBooking.getMemberId());
            pointUse.setPoint(cBooking.getBookUsePoint()+"");
            int result2 = oService.registUsePoint(pointUse);
            //포인트 / 적립
            Point pointAdd = new Point();
            pointAdd.setMemberId(cBooking.getMemberId());
            pointAdd.setPoint(cBooking.getBookGetPoint()+"");
            int result3 = oService.registGetPoint(pointAdd.getPoint(),pointAdd.getMemberId());
            
            
            // 예약 현황 저장
            int bsInsert=0;
            BookingStatus bs = new BookingStatus();
            bs.setMemberId(cBooking.getMemberId());
            bs.setsBookDate(cBooking.getFirstDay());
            bs.setSiteNo(cBooking.getSiteNo());
            bs.setTotalDay(cBooking.getTotalDay()-1);
            if(result == 1) {
                bsInsert = bService.bookingStatus(bs);
            }
            System.out.println(bsInsert);
            if(result ==1 && bsInsert == -1) {
                return "success";
            }else {
                return "fail";
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "error";
        
    }
    
    
  //캠핑장 예약 조회
    @ResponseBody
    @RequestMapping(value = "/campBooking/campBookingCheck.kh", method = RequestMethod.POST )
    public String campBookingCheck() {
        try {
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
}
