package cn.luguy.back.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.luguy.service.bean.Column;
import cn.luguy.service.bean.ElementPageBean;
import cn.luguy.service.bean.User;
import cn.luguy.service.service.ColumnService;


@Controller
public class ColumnController {

	@Autowired
	ColumnService columnService;
	
	@RequestMapping("column_listpage")
	public String column_listpage(@RequestParam("currentPage") int currentPage,ModelMap map) {
		
		ElementPageBean<Column> pageBean=columnService.get_listpage(currentPage);
		map.put("pageBean",pageBean);
		return "ColumnManagement";
	}
	
	
	@RequestMapping("column_listcondition")
	public String column_listcondition(@RequestParam("currentPage") int currentPage,String cname,ModelMap map) {
		
		
		ElementPageBean<Column> pageBean=columnService.get_listcondition(currentPage,cname);
		map.put("pageBean",pageBean);
		return "ColumnManagement";
	}
	
	@RequestMapping("column_add")
	public String column_add(Column column,HttpSession session) {
		User select_user=(User)session.getAttribute("select_user");
		if(select_user.getLevel()<=2){
			columnService.add_column(column);
		}
		return "redirect:/column_listpage.do?currentPage=1";
	}
	
	@RequestMapping("column_update")
	public String column_update(Column column,HttpSession session) {
		User select_user=(User)session.getAttribute("select_user");
		if(select_user.getLevel()<=2){
			columnService.update_column(column);
		}
		
		return "redirect:/column_listpage.do?currentPage=1";
	}
	
	@RequestMapping("column_delete")
	public String column_delete(Column column,HttpSession session) {
		User select_user=(User)session.getAttribute("select_user");
		if(select_user.getLevel()<=2){
			columnService.delete_column(column);
		}
		return "redirect:/column_listpage.do?currentPage=1";
	}
}
