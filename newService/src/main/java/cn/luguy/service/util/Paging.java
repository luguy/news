package cn.luguy.service.util;

import cn.luguy.service.bean.ElementPageBean;

public class Paging{

	public static<T> ElementPageBean<T> paging(ElementPageBean<T> pageBean,int totalCount,int currentPage){

		//当前页
		pageBean.setCurrentPage(currentPage);
		//总记录数
		pageBean.setTotalCount(totalCount);
		//每页显示记录数
		int pageSize = 3;
		pageBean.setPageSize(pageSize);
		//总页数
		//总记录数除以每页显示记录数
		//能够整除
		int totalPage = 0;
		if(totalCount%pageSize==0) {//整除
			totalPage = totalCount/pageSize;
		} else {
			totalPage = totalCount/pageSize+1;
		}
		pageBean.setTotalPage(totalPage);
		//开始位置
		int begin = (currentPage-1)*pageBean.getPageSize();
		pageBean.setBegin(begin);
		return pageBean;
	}
	
}
