package cn.luguy.service.bean;

import java.util.List;

public class ElementPageBean<T> extends PageBean{
	//每页记录的list集合
	private List<T> list;

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}
	
}
