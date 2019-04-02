package cn.luguy.service.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.luguy.service.bean.ElementPageBean;
import cn.luguy.service.bean.User;
import cn.luguy.service.mapper.UserMapper;
@Service
public class UserServiceImp implements UserService{
	
	@Autowired
	UserMapper userMapper;
	
	public ElementPageBean<User> get_listpage(int currentPage) {
		//创建ElementPageBean对象
		ElementPageBean<User> pageBean = new ElementPageBean<User>();
		//当前页
		pageBean.setCurrentPage(currentPage);
		//总记录数
		int totalCount = userMapper.find_count();
		pageBean.setTotalCount(totalCount);
		//每页显示记录数
		int pageSize = 3;
		//总页数
		//总记录数除以每页显示记录数
		//能够整除
		int totalPage = 0;
		if(totalCount%pageSize==0) {//整除
			totalPage = totalCount/pageSize;
		} else {
			totalPage = totalCount/pageSize+1;
		}
		pageBean.setTotalPage(totalPage);
		//开始位置
		int begin = (currentPage-1)*pageSize;
		//每页记录的list集合
		HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
		hashMap.put("begin", begin);
		hashMap.put("pageSize", pageSize);
		List<User> listpage=userMapper.get_listpage(hashMap);
		pageBean.setList(listpage);
		return pageBean; 
	}
	

}
