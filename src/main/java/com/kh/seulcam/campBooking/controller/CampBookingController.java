package com.kh.seulcam.campBooking.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.seulcam.camp.domain.CampSite;
import com.kh.seulcam.camp.service.CampServie;
import com.kh.seulcam.campBooking.service.CampBookingService;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.member.service.MemberService;

@Controller
public class CampBookingController {
    @Autowired
    private CampBookingService bService;
    
    @Autowired
    private CampServie cService;
    
    @Autowired
    private MemberService mService;
    
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
    
}
