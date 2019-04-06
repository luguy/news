package cn.luguy.service.mapper;

import java.util.HashMap;
import java.util.List;

import cn.luguy.service.bean.Relation;

public interface RelationMapper {

	void add_relation(List<Relation> list);

	List<Relation> get_byuid(int uid);

	void delete_relation(HashMap<Object, Object> map);

}
