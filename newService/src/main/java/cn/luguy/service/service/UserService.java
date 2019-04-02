package cn.luguy.service.service;


import cn.luguy.service.bean.ElementPageBean;
import cn.luguy.service.bean.User;

public interface UserService {

	ElementPageBean<User> get_listpage(int currentPage);
}
