<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<html>
<head>
	<base href="<%=request.getContextPath()%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
    <link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet">
</head>
<body>
    <!-- 栏目管理 -->
            <div class="AccountManagement_c" id="ColumnManagement_c">
                <h3>栏目管理 
                    <div class="amcl fr">
                    
	                    <form action="${pageContext.request.contextPath }/column_listcondition.do?currentPage=1" method="post" id="condition">
                        	<input type="text" placeholder="栏目名称" class="fl" name="cname">
                        	<div class="search fl" id="search"><img src="<%=request.getContextPath()%>/images/search.png"></div>
                    	</form>
                    </div> 
                </h3>
                <div class="AM_ct text_center">
                    <div class="AM_ct_in">
                        <div class="add_btn df_btn fl" id="add_column_btn">添加</div>
                        <div class="edit_btn df_btn fl" id="edit_column_btn">编辑</div>
                        <div class="delete_btn df_btn fl" id="delete_column_btn">删除</div>
                    </div>
                </div>

                <div class="list">
                    <ul class="list_h">
                        <li class="b20"><label>序号</label></li>
                        <li class="b20"><label>栏目名称</label></li>
                        <li class="b20"><label>栏目创建人</label></li>
                        <li class="b40"><label>栏目描述</label></li>
                    </ul>
                    <div class="list_b_c">
                    	<c:forEach items="${pageBean.list }" var="column">
	                        <ul class="list_b">
								   <input type="hidden" name="cids" value="${column.id }"/>
		                           <li class="b20"><label><input type="checkbox" name="checks"><span name="nums"}">${column.num }</span></label></li>
		                           <li class="b20"><label name="cnames">${column.cname }</label></li>
		                           <li class="b20"><label name="unames">${column.username }</label></li>
		                           <li class="b40"><label name="descriptors">${column.cdescriptor }</label></li>
		                    </ul>
	                    </c:forEach>
                    </div>

                    <!-- <div class="pull_page">
                        <div class="fl pull_page_up">上一页</div>
                            <ul>
                                <li class="on">1</li>
                                <li>2</li>
                                <li>3</li>
                                <li>4</li>
                                <li class="pull_page_df_btn">…</li>
                                <li>12</li>
                            </ul>
                        <div class="fl pull_page_down">下一页</div>
                    </div> -->


					<c:if test="${pageBean.totalPage!=0}">
	                    <div class="pull_page">
							<c:if test="${pageBean.currentPage!=1}">
		                        <form id="up" action="${pageContext.request.contextPath }/column_listpage.do?currentPage=${pageBean.currentPage-1}" method="post">
		                        	<%-- <input type="hidden" class="like" name="username" value="${pageBean.name }"> --%>
		                        	<div class="fl pull_page_up">上一页</div>
		                        </form>
		                    </c:if>
	                            <ul>
	                            	<form action="${pageContext.request.contextPath }/column_listpage.do?" id="pageindex" method="post">
		                            	<input type="hidden" name="currentPage" id="cp"/>
		                            	<c:forEach var="s" begin="1" end="${pageBean.totalPage-1}">
		                            		<c:choose>
			                            		<c:when test="${s>1}"><li>${s }</li></c:when>
				                                <c:otherwise  ><li class="on">1</li></c:otherwise>
			                                </c:choose>
		                                </c:forEach>
		                                <c:if test="${pageBean.totalPage>10}"><li class="pull_page_df_btn">…</li></c:if> 
		                                <li>${pageBean.totalPage}</li>
		                            </form>
	                            </ul>
	                        <c:if test="${pageBean.currentPage!=pageBean.totalPage&&pageBean.totalPage>1}">
		                        <form id="down" action="${pageContext.request.contextPath }/column_listpage.do?currentPage=${pageBean.currentPage+1}" method="post">
		                        	<div class="fl pull_page_down">下一页</div>
		                        </form>
		                    </c:if>
                    	</div>
					</c:if>
                    
                </div>
            </div>


            <!-- 添加栏目 -->
    <div class="add_Account dn" id="add_column">
        <div class="add_Account_c">
            <div class="add_Account_h">
                <div class="add_Account_h_in">
                    添加栏目
                    <span class="fr add_Account_close"><img src="<%=request.getContextPath()%>/images/close.png"></span>
                </div>
            </div>
            
             <form action="${pageContext.request.contextPath }/column_add.do" method="post" id="addcolumn">
             	<input type="hidden" name="uid" value="${select_user.id }" />
             	<input type="hidden" name="username" value="${select_user.username }" />
	            <div class="user_name user_i">
	                <label>栏目名</label> <input type="text" placeholder="输入栏目名" name="cname">     
	            </div>
	            <div class="user_name user_i">
	                <label>栏目描述</label> <input type="text" placeholder="输入栏目描述 " name="cdescriptor">     
	            </div>
	            <div class="add_Account_ok_btn text_center" id="add_column_ok_btn">确<i>皮</i>定</div>
            </form>
        </div>
    </div>

    <!-- 编辑栏目 -->
    <div class="add_Account dn" id="edit_column">
        <div class="add_Account_c">
            <div class="add_Account_h">
                <div class="add_Account_h_in">
                    编辑栏目
                    <span class="fr add_Account_close"><img src="<%=request.getContextPath()%>/images/close.png"></span>
                </div>
            </div>
            
            <form action="${pageContext.request.contextPath }/column_update.do" method="post" id="updatecolumn">
	            <input type="hidden" name="id" class="cid" />
	            <div class="user_name user_i">
	                <label>栏目名</label> <input type="text" id="colname" placeholder="输入栏目名" name="cname">     
	            </div>
	            <div class="user_password user_i">
	                <label>栏目描述</label> <input type="text" placeholder="输入栏目描述" id="coldescr" name="cdescriptor">     
	            </div>
	            <div class="add_Account_ok_btn text_center" id="edit_column_ok_btn">确<i>皮</i>定</div>
            </form>
        </div>
    </div>

    <!-- 删除栏目 -->
    <div class="add_Account dn" id="delete_column">
        <div class="add_Account_c">
            <div class="add_Account_h">
                <div class="add_Account_h_in">
                    删除栏目
                    <span class="fr add_Account_close"><img src="<%=request.getContextPath()%>/images/close.png"></span>
                </div>
            </div>
            
            <form action="${pageContext.request.contextPath }/column_delete.do" method="post" id="deletecolumn">
	            <input type="hidden" name="id" class="cid" />
	            <div class="delete_text">确定删除“ <span class="columnname"></span> ”栏目吗？</div>
	            <div class="add_Account_ok_btn text_center" id="delete_column_ok_btn">确<i>皮</i>定</div>
	        </form>
            
            
           <!--  <div class="delete_text">确定删除“ <span>jiaopwuchu</span> ”栏目吗？</div>
            <div class="add_Account_ok_btn text_center" id="delete_column_ok_btn">确<i>皮</i>定</div> -->
        </div>
    </div>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
</html>