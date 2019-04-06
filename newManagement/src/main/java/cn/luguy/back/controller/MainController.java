package cn.luguy.back.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("goto_main")
	public String goto_login() {
		
		return "main";
	}
	
	@RequestMapping("exit_login")
	public String exit_login(HttpSession session) {
		session.invalidate();
		return "redirect:/goto_login.do";
	}
	
}
