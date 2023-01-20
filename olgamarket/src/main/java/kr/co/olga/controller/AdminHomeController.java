package kr.co.olga.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminHomeController {

	// 로그인 페이지 이동
	@RequestMapping(value = "/master")
	public String adminHome() {
		
		return "/admin/adminLogin";
	}
}
