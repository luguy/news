package cn.luguy.back.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("goto_main")
	public String goto_login() {
		
		return "main";
	}
	
	
}
