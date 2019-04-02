package cn.luguy.service.mapper;

import java.util.List;
import java.util.Map;

import cn.luguy.service.bean.User;

public interface UserMapper {

	List<User> get_listpage(Map<Object, Object> map);

	int find_count();

}
