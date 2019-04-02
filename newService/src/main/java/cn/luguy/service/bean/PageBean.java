package cn.luguy.service.bean;



public class PageBean {
		//区别是查询还是分页的page;
//		private Integer cookie; 
		//查询时的查询条件
//		private String name;
	
		private Integer currentPage;
		//总记录数
		private Integer totalCount;
		//每页显示记录数
		private Integer pageSize;
		//总页数
		private Integer totalPage;
		//开始位置
		private Integer begin;
		
		
		
		public Integer getCurrentPage() {
			return currentPage;
		}
		public void setCurrentPage(Integer currentPage) {
			this.currentPage = currentPage;
		}
		public Integer getTotalCount() {
			return totalCount;
		}
		public void setTotalCount(Integer totalCount) {
			this.totalCount = totalCount;
		}
		public Integer getPageSize() {
			return pageSize;
		}
		public void setPageSize(Integer pageSize) {
			this.pageSize = pageSize;
		}
		public Integer getTotalPage() {
			return totalPage;
		}
		public void setTotalPage(Integer totalPage) {
			this.totalPage = totalPage;
		}
		public Integer getBegin() {
			return begin;
		}
		public void setBegin(Integer begin) {
			this.begin = begin;
		}
}
