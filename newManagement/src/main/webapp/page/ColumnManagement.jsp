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
                        <input type="text" placeholder="栏目名称" class="fl" name="">
                        <div class="search fl"><img src="<%=request.getContextPath()%>/images/search.png"></div>
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
                        <li class="b60"><label>栏目主编</label></li>
                    </ul>
                    <div class="list_b_c">
                    	<c:forEach items="${list }" var="column">
	                        <ul class="list_b">
								   <input type="hidden" name="cids" value="${column.cid }"/>
		                           <li class="b20"><label><input type="checkbox" name="cchecks"><span name="nums"}">${column.num }</span></label></li>
		                           <li class="b20"><label name="cnames">${column.cname }</label></li>
		                           <li class="b60"><label name="usernames">${column.username }</label></li>
		                    </ul>
	                    </c:forEach>
                    </div>

                    <div class="pull_page">
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
                    </div>

                    
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
            
             <form action="${pageContext.request.contextPath }/column_add.action" method="post" id="addcolumn">
	            <div class="user_name user_i">
	                <label>栏目名</label> <input type="text" placeholder="输入栏目名" name="cname">     
	            </div>
	            <div class="user_name user_i">
	                <label>主编名</label> <input type="text" placeholder="输入主编名" name="username">     
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
            
            <form action="${pageContext.request.contextPath }/column_update.action" method="post" id="updatecolumn">
	            <input type="hidden" name="cid" class="cid" />
	            <div class="user_name user_i">
	                <label>栏目名</label> <input type="text" id="colname" placeholder="输入栏目名" name="cname">     
	            </div>
	            <div class="user_password user_i">
	                <label>主编名</label> <input type="text" placeholder="输入主编名" id="coluser" name="username">     
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
            
            <form action="${pageContext.request.contextPath }/column_delete.action" method="post" id="deletecolumn">
	            <input type="hidden" name="cid" class="cid" />
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