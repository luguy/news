package cn.luguy.service.service;


import cn.luguy.service.bean.ElementPageBean;
import cn.luguy.service.bean.User;
import cn.luguy.service.bean.UserRelation;

public interface UserService {

	void add_user(User user);

	void update_user(User user);

	void delete_user(User user);

	ElementPageBean<UserRelation> get_listpage(int currentPage, User user);

	ElementPageBean<UserRelation> get_listcondition(int currentPage, String username, User user);
}
