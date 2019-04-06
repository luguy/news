package cn.luguy.service.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.luguy.service.bean.User;
import cn.luguy.service.bean.UserRelation;

public interface UserMapper {

	List<UserRelation> get_listpage(Map<Object, Object> map);

	int find_count(HashMap<Object, Object> hashmap);

	void add_user(User user);

	void update_user(User user);

	void delete_user(User user);

}
