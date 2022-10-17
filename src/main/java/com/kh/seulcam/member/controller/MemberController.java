package com.kh.seulcam.member.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	// 비로그인 상태일 때 로그인 창으로 이동
	@RequestMapping(value="/member/loginView.kh", method=RequestMethod.GET)
	public String memberJoinView(Model model) {
		return "member/login";
	}
}
