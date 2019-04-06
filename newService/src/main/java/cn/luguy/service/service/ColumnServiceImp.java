package cn.luguy.service.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.luguy.service.bean.Column;
import cn.luguy.service.bean.ElementPageBean;
import cn.luguy.service.bean.Relation;
import cn.luguy.service.mapper.ColumnMapper;
import cn.luguy.service.mapper.RelationMapper;
import cn.luguy.service.mapper.UserMapper;
import cn.luguy.service.util.Paging;
@Service
public class ColumnServiceImp implements ColumnService{

	@Autowired
	UserMapper userMapper;
	
	@Autowired
	RelationMapper relationMapper;
	
	@Autowired
	ColumnMapper columnMapper;
	
	public ElementPageBean<Column> get_listpage(int currentPage) {
		ElementPageBean<Column> pageBean=new ElementPageBean<Column>();
		//总记录数
		int totalCount = columnMapper.find_count(null);
		//调用分页工具包装类，为分页类填充数据
		pageBean=Paging.paging(pageBean, totalCount, currentPage);
		//每页记录的list集合
		HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
		hashMap.put("begin", pageBean.getBegin());
		hashMap.put("pageSize", pageBean.getPageSize());
		List<Column> listpage=columnMapper.get_listpage(hashMap);
		pageBean.setList(listpage);
		
		return pageBean;
	}

	public void add_column(Column column) {
		String num = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		column.setNum(num);
		columnMapper.add_column(column);
		//将栏目用户对应关系注入数据库中
		Relation relation=new Relation();
		relation.setCid(column.getId());
		relation.setCname(column.getCname());
		relation.setUid(column.getUid());
		List<Relation> list=new ArrayList<Relation>();
		list.add(relation);
		relationMapper.add_relation(list);
	}

	public void update_column(Column column) {
		Column col=columnMapper.get_byid(column);
		col.setCdescriptor(column.getCdescriptor());
		col.setCname(column.getCname());
		columnMapper.update_column(col);
	}

	public void delete_column(Column column) {
		HashMap<Object, Object> map=new HashMap<Object, Object>();
		String subSql="cid="+column.getId();
		map.put("subSql", subSql);
		relationMapper.delete_relation(map);
		columnMapper.delete_column(column);
	}

	public ElementPageBean<Column> get_listcondition(int currentPage, String cname) {
		// TODO Auto-generated method stub
		
		//创建ElementPageBean对象
		ElementPageBean<Column> pageBean = new ElementPageBean<Column>();
		//总记录数
		HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
		String condition="where cname like '%"+cname+"%' ";
		hashMap.put("subSql", condition);
		int totalCount = columnMapper.find_count(hashMap);
		//调用分页工具包装类，为分页类填充数据
		pageBean=Paging.paging(pageBean, totalCount, currentPage);
		//每页记录的list集合
		hashMap.put("begin", pageBean.getBegin());
		hashMap.put("pageSize", pageBean.getPageSize());
		List<Column> listpage=columnMapper.get_listpage(hashMap);
		pageBean.setList(listpage);
		return pageBean;
	}
	
}
