package cn.luguy.service.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.luguy.service.bean.Relation;
import cn.luguy.service.mapper.RelationMapper;

@Service
public class RelationServiceImp implements MyRelationService{

	@Autowired
	RelationMapper relationMapper;
	
	public List<Relation> get_byuid(int uid) {
		List<Relation> list=relationMapper.get_byuid(uid);
		return list;
	}

	public void add_authorization(List<Relation> list) {
		relationMapper.add_relation(list);
	}

}
