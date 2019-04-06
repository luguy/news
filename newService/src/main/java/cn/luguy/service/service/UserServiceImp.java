package cn.luguy.service.service;

import java.util.HashMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.luguy.service.bean.ElementPageBean;
import cn.luguy.service.bean.User;
import cn.luguy.service.bean.UserRelation;
import cn.luguy.service.mapper.RelationMapper;
import cn.luguy.service.mapper.UserMapper;
import cn.luguy.service.util.Paging;
@Service
public class UserServiceImp implements UserService{
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	RelationMapper relationMapper;
	
	public ElementPageBean<UserRelation> get_listpage(int currentPage,User user) {
		//创建ElementPageBean对象
		ElementPageBean<UserRelation> pageBean = new ElementPageBean<UserRelation>();
		//总记录数
		HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
		hashMap.put("id", user.getId());
		hashMap.put("level", user.getLevel());
		int totalCount = userMapper.find_count(hashMap);
		//调用分页工具包装类，为分页类填充数据
		pageBean=Paging.paging(pageBean, totalCount, currentPage);
		//每页记录的list集合
		hashMap.put("begin", pageBean.getBegin());
		hashMap.put("pageSize", pageBean.getPageSize());
		List<UserRelation> listpage=userMapper.get_listpage(hashMap);
		pageBean.setList(listpage);
		return pageBean; 
	}

	public ElementPageBean<UserRelation> get_listcondition(int currentPage, String username,User user) {
		//创建ElementPageBean对象
		ElementPageBean<UserRelation> pageBean = new ElementPageBean<UserRelation>();
		//总记录数
		HashMap<Object, Object> hashMap=new HashMap<Object, Object>();
		String condition="and username like '%"+username+"%' ";
		hashMap.put("subSql", condition);
		hashMap.put("id", user.getId());
		hashMap.put("level", user.getLevel());
		int totalCount = userMapper.find_count(hashMap);
		//调用分页工具包装类，为分页类填充数据
		pageBean=Paging.paging(pageBean, totalCount, currentPage);
		//开始位置
		int begin = (currentPage-1)*pageBean.getPageSize();
		//每页记录的list集合
		hashMap.put("begin", begin);
		hashMap.put("pageSize", pageBean.getPageSize());
		List<UserRelation> listpage=userMapper.get_listpage(hashMap);
		pageBean.setList(listpage);
		return pageBean;
	}

	public void add_user(User user) {
		userMapper.add_user(user);
	}

	public void update_user(User user) {
		userMapper.update_user(user);
	}

	public void delete_user(User user) {
		HashMap<Object, Object> map=new HashMap<Object, Object>();
		String subSql="uid="+user.getId();
		map.put("subSql", subSql);
		relationMapper.delete_relation(map);
		userMapper.delete_user(user);
	}
	

}
