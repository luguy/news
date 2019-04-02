package cn.luguy.back.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.luguy.service.bean.ElementPageBean;
import cn.luguy.service.bean.User;
import cn.luguy.service.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	
	@RequestMapping("user_listpage")
	public String user_listpage(@RequestParam("currentPage") int currentPage,ModelMap map) {
		
		ElementPageBean<User> pageBean=userService.get_listpage(currentPage);
		map.put("pageBean",pageBean);
		return "UserManagement";
	}
	
	

}
