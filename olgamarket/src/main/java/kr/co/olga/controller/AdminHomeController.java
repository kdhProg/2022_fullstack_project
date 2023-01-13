package kr.co.olga.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminHomeController {

	@RequestMapping(value = "/master")
	public String adminHome() {
		
		return "/admin";
	}
}
