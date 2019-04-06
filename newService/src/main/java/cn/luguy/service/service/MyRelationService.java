package cn.luguy.service.service;

import java.util.List;

import cn.luguy.service.bean.Relation;

public interface MyRelationService {

	List<Relation> get_byuid(int uid);

	void add_authorization(List<Relation> list);

}
