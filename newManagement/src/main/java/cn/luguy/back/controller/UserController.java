package cn.luguy.back.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.luguy.service.bean.ElementPageBean;
import cn.luguy.service.bean.User;
import cn.luguy.service.bean.UserRelation;
import cn.luguy.service.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	
	@RequestMapping("user_listpage")
	public String user_listpage(@RequestParam("currentPage") int currentPage,ModelMap map,
			HttpSession session) {
		User user=(User)session.getAttribute("select_user");
		ElementPageBean<UserRelation> pageBean=userService.get_listpage(currentPage,user);
		map.put("pageBean",pageBean);
		return "UserManagement";
	}
	
	
	@RequestMapping("user_listcondition")
	public String user_listcondition(@RequestParam("currentPage") int currentPage,String username,ModelMap map,
			HttpSession session) {
		User user=(User)session.getAttribute("select_user");
		ElementPageBean<UserRelation> pageBean=userService.get_listcondition(currentPage,username,user);
		map.put("pageBean",pageBean);
		return "UserManagement";
	}
	
	
	@RequestMapping("user_add")
	public String user_add(User user,HttpSession session) {
		User select_user=(User)session.getAttribute("select_user");
		if(select_user.getLevel()<=2&&user.getLevel()>select_user.getLevel()){
			userService.add_user(user);
		}
		return "redirect:/user_listpage.do?currentPage=1";
	}
	
	@RequestMapping("user_update")
	public String user_update(User user) {

		userService.update_user(user);
		return "redirect:/user_listpage.do?currentPage=1";
	}
	
	@RequestMapping("user_delete")
	public String user_delete(User user) {

		userService.delete_user(user);
		return "redirect:/user_listpage.do?currentPage=1";
	}
}
