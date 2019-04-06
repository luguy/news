package cn.luguy.back.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.luguy.service.bean.Relation;
import cn.luguy.service.bean.RelationList;
import cn.luguy.service.service.MyRelationService;


@Controller
public class AuthorizationController {
	
	
	@Autowired
	MyRelationService relationService;
	
	@ResponseBody
	@RequestMapping("query_authorization")
	public List<Relation> query_authorization(int uid) {
		List<Relation> list= relationService.get_byuid(uid);
		return list;
	}
	
	
	
	@RequestMapping("user_authorization")
	public String user_authorization(RelationList relationList) {
		relationService.add_authorization(relationList.getList());
		return "redirect:/user_listpage.do?currentPage=1";
	}
	
}
