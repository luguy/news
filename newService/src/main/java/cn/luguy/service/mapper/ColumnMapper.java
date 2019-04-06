package cn.luguy.service.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.luguy.service.bean.Column;

public interface ColumnMapper {

	int find_count(Map<Object, Object> map);

	List<Column> get_listpage(HashMap<Object, Object> hashMap);

	void add_column(Column column);

	void update_column(Column column);

	void delete_column(Column column);

	Column get_byid(Column column);

}
