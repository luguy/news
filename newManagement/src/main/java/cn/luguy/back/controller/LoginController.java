package cn.luguy.back.controller;



import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.luguy.service.bean.User;
import cn.luguy.service.mapper.LoginMapper;

@Controller
public class LoginController {
	
	@Autowired
	LoginMapper loginMapper;
	
	
	@RequestMapping("goto_login")
	public String goto_login() {

		return "login";
	}
	
	@RequestMapping("user_login")
	public ModelAndView user_login(HttpSession session, User user) {
		ModelAndView mv;
		User select_user=loginMapper.select_user(user);
		if(select_user==null) {
			mv = new ModelAndView("forward:/goto_login.do");
			mv.addObject("fail","登陆失败！");
			return mv;
		} else {
			session.setAttribute("select_user", select_user);
		}
		mv = new ModelAndView("redirect:/goto_main.do");
		return mv;
	}
	

}
