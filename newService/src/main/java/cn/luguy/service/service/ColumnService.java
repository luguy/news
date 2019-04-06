package cn.luguy.service.service;


import cn.luguy.service.bean.Column;
import cn.luguy.service.bean.ElementPageBean;

public interface ColumnService {

	ElementPageBean<Column> get_listpage(int currentPage);

	
	ElementPageBean<Column> get_listcondition(int currentPage, String cname);

	void update_column(Column column);
	
	void add_column(Column column);

	void delete_column(Column column);

	
	
}
