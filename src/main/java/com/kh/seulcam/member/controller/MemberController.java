package com.kh.seulcam.member.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.kh.seulcam.member.service.MemberService;
import com.kh.seulcam.member.domain.Member;


@Controller
public class MemberController {
	@Autowired
	private MemberService mService;
	@Autowired
	private JavaMailSender mailSender;
	
		/* 로그인 관련 */
	// 비로그인 상태일 때 로그인 창으로 이동
	@RequestMapping(value="/member/loginView", method=RequestMethod.GET)
	public String memberJoinView(Model model) {
		return "member/login";
	}
	
	// 아이디 찾기 창으로 이동
	@RequestMapping(value="/member/findIdView", method=RequestMethod.GET)
	public String findIdView(Model model) {
		return "member/findId";
	}
	
	// 비밀번호 찾기 창으로 이동
	@RequestMapping(value="/member/findPwView", method=RequestMethod.GET)
	public String findPwView(Model model) {
		return "member/findPw";
	}
	
	// 비밀번호 찾기 결과 창으로 이동
	@RequestMapping(value="/member/pwResultView", method=RequestMethod.GET)
	public String pwResultView(Model model) {
		return "member/pwResult";
	}
	
	// 회원가입 창으로 이동
	@RequestMapping(value="/member/registerView", method=RequestMethod.GET)
	public String registerView(Model model) {
		return "member/register";
	}
	
	// 회원가입 축하 창으로 이동
	@RequestMapping(value="/member/congView", method=RequestMethod.GET)
	public String congView(Model model) {
		return "member/cong";
	}
	
	
		/* 마이페이지 관련 */
	// 로그인 상태일 때 마이페이지 창으로 이동
	@RequestMapping(value="/member/myPageView", method=RequestMethod.GET)
	public String memberMyPageView(Model model) {
		return "member/mypage";
	}
	
	// 닉네임 변경 창으로 이동
	@RequestMapping(value="/member/nicknameChangeView", method=RequestMethod.GET)
	public String nicknameChangeView(Model model) {
		return "member/nicknameChange";
	}
	
	// 마이페이지 회원정보 관리 창으로 이동
	@RequestMapping(value="/member/mypageMemberView", method=RequestMethod.GET)
	public String mypageMemberView(Model model) {
		return "member/mypageMember";
	}
	
	// 마이페이지 회원정보 비밀번호 변경 창으로 이동
	@RequestMapping(value="/member/passwordChangeView", method=RequestMethod.GET)
	public String passwordChangeView(Model model) {
		return "member/passwordChange";
	}
	
	// 마이페이지 회원정보 환불 계좌 변경 창으로 이동
	@RequestMapping(value="/member/accountChangeView", method=RequestMethod.GET)
	public String accountChangeView(Model model) {
		return "member/accountChange";
	}
	
	// 마이페이지 회원정보 배송지 관리 창으로 이동
	@RequestMapping(value="/member/addressChangeView", method=RequestMethod.GET)
	public String addressChangeView(Model model) {
		return "member/addressChange";
	}
	
	// 이메일 DB에 존재하는 지 검사하는 기능
	@ResponseBody
	@RequestMapping(value= "/member/memberEmailCheck", method = RequestMethod.GET)
	public String EmailCheck(@RequestParam("memberEmail") String memberEmail) {
		
		int result = mService.checkOneEmail(memberEmail);
		
		return result+"";
	}
	
	// 이메일 인증 기능
	@ResponseBody
	@RequestMapping(value = "emailAuth", method = RequestMethod.POST)
	public String emailAuth(String email) {		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		/* 이메일 보내기 */
        String setFrom = "cji3604@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        return Integer.toString(checkNum);
	}
	
	// 로그인 기능
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public ModelAndView memberLogin(
			@ModelAttribute Member member
			, ModelAndView mv
			, HttpServletRequest request) {
		try {
			Member loginUser = mService.loginMember(member);
			if(loginUser != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				mv.setViewName("redirect:/");
			}else {
				mv.addObject("msg", "회원정보를 찾을 수 없습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 회원가입 기능
	@RequestMapping(value="/member/register", method=RequestMethod.POST)
	public ModelAndView memberRegister(
			@ModelAttribute Member member
			, ModelAndView mv) {
		try {
			int result = mService.registerMember(member);
			// 회원가입에 성공하면,
			if(result > 0) {
				mv.setViewName("redirect:/member/congView"); 
			}
			// 회원가입에 실패하면,
			else {
				mv.addObject("msg", "회원가입을 실패했습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 아이디 찾기 결과 창으로 이동
	@RequestMapping(value="/member/idResult", method=RequestMethod.GET)
	public ModelAndView idResult(@RequestParam("memberEmail") String memberEmail
			, ModelAndView mv) {
	try {
		List<Member> mList = mService.listIdByEmail(memberEmail);
		mv.addObject("mList", mList);
		mv.setViewName("/member/idResult");
	} catch (Exception e) {
		mv.addObject("msg", e.getMessage());
		mv.setViewName("common/errorPage");
	}
	return mv;
	}

	

}
