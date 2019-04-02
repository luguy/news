<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
    <base href="<%=request.getContextPath()%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet">
</head>
<body>

<h1></h1>
			<div class="AccountManagement_c " id="AccountManagement_c">
                <h3>账户管理 
                    <div class="amcl fr">
                    	<form action="${pageContext.request.contextPath }/user_listcondition.action?currentPage=1" method="post" id="condition">
                        	<input type="text" placeholder="用户名" class="fl" id="searchu" name="username">
                        	<div class="search fl" id="searchUser"><img src="<%=request.getContextPath()%>/images/search.png"></div>
                    	</form>
                    </div> 
                </h3>
                <div class="AM_ct text_center">
                    <div class="AM_ct_in">
                        <div class="add_btn df_btn fl" id="add_Account_btn">添加</div>
                        <div class="edit_btn df_btn fl" id="edit_Account_btn">编辑</div>
                        <div class="delete_btn df_btn fl" id="delete_Account_btn">删除</div>
                        </form>
                        <div class="fr df_btn ac_btn" id="ac_Account_btn" onclick="handle()" >账号授权</div>
                    </div>
                </div>

                <div class="list">
                    <ul class="list_h">
                        <li class="b20"><label><span>用户名</span></label></li>
                        <li class="b20"><label>账号</label></li>
                        <li class="b20"><label>账号级别</label></li>
                        <li class="b40"><label>授权栏目</label></li>
                    </ul>
                    
                    <script type="text/javascript">
                    	function handle() {
	                   
					    	var checks=document.getElementsByName("checks");
					    	var ids=document.getElementsByName("ids");
					    	var u=new Array();
					        var c=new Array();
					        for(var i=0;i<checks.length;i++){
					        	if(checks[i].checked==true){
					        		c.push(checks[i].value);
					        		u.push(ids[i].value);
					        	}
					        }
					        if(c.length>1){
					        	alert("你选的太多了，请选择一条记录！");
					        	return;
					        }
					        if(c.length==0){
					        	alert("请选择一条记录！")
					        	return;
					        }
					        $(".uid").val(u[0]);
					    	$("#ac_Account").fadeIn(100);
					    }
                    </script>
                    
                    
                    
                    
                    <div class="list_b_c">
                      	<ul class="list_null">
                            <li class="text_center">未添加管理员账户！</li>
                        </ul>
                        
                        
                     <c:forEach items="${pageBean.list }" var="user">	
						<ul class="list_b">
						   <input type="hidden" name="ids" value="${user.id }"/>
                           <li class="b20"><label><input type="checkbox" name="checks"><span name="names"}">${user.username }</span></label></li>
                           <li class="b20"><label name="pwds">${user.account }</label></li>
                           <li class="b20"><label name="pwds">${user.level }</label></li>
                           <li class="b40">
	                           <%-- <label>
		                           <c:forEach items="${user.setRelation}" var="relation">
		                           		${relation.column.cname }&nbsp;&nbsp;
		                           </c:forEach>
	                           </label> --%>
                           </li>
                      	</ul>
					</c:forEach>               
                    </div>
					
					
					<!-- 因为在查询的时候设置了请求为空时自动查询所有内容所以一下分页请求全部设置为查询请求 -->
					<%-- <c:choose>
                		<c:when test="${pageBean.cookie==0}"><c:set var="cook" value="user_listcondition.action"></c:set></c:when>
                     	<c:otherwise  ><c:set var="cook" value="user_listpage.action"></c:set></c:otherwise>
                    </c:choose> --%>
                
					<c:if test="${pageBean.totalPage!=0}">
	                    <div class="pull_page">
							<c:if test="${pageBean.currentPage!=1}">
		                        <form id="up" action="${pageContext.request.contextPath }/user_listpage.do?currentPage=${pageBean.currentPage-1}" method="post">
		                        	<%-- <input type="hidden" class="like" name="username" value="${pageBean.name }"> --%>
		                        	<div class="fl pull_page_up">上一页</div>
		                        </form>
		                    </c:if>
	                            <ul>
	                            	<form action="${pageContext.request.contextPath }/user_listpage.do?" id="pageindex" method="post">
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
		                        <form id="down" action="${pageContext.request.contextPath }/user_listpage.do?currentPage=${pageBean.currentPage+1}" method="post">
		                        	<div class="fl pull_page_down">下一页</div>
		                        </form>
		                    </c:if>
                    	</div>
					</c:if>

                </div>
            </div>


            <!-- 弹窗 -->
    <!-- 添加账户 -->
    <div class="add_Account dn" id="add_Account">
        <div class="add_Account_c">
            <div class="add_Account_h">
                <div class="add_Account_h_in">
                    添加账户
                    <span class="fr add_Account_close"><img src="<%=request.getContextPath()%>/images/close.png"></span>
                </div>
            </div>
            <form action="${pageContext.request.contextPath }/user_add.action" method="post" id="adduser">
	            <div class="user_name user_i">
	                <label>用户名</label> <input type="text" placeholder="输入用户名" name="username">     
	            </div>
	            <div class="user_password user_i">
	                <label>密<i>调</i>码</label> <input type="password" placeholder="输入密码" name="password">     
	            </div>
	            <div class="add_Account_ok_btn text_center" id="add_Account_ok_btn">确<i>皮</i>定</div>
            </form>
        </div>
    </div>

    <!-- 账户编辑 -->
    <div class="add_Account dn" id="user_column">
        <div class="add_Account_c">
            <div class="add_Account_h">
                <div class="add_Account_h_in">
                    编辑账户
                    <span class="fr add_Account_close"><img src="<%=request.getContextPath()%>/images/close.png"></span>
                </div>
            </div>
            <div class="column_now ">正在编辑 “<span class="uname" ></span>”账户</div>
            <form action="${pageContext.request.contextPath }/user_update.do" method="post" id="updateuser">
	            <input type="hidden" name="uid" class="uid" />
	            <div class="user_name user_i">
	                <label>用户名</label> <input type="text" id="uname" placeholder="输入用户名" name="username">     
	            </div>
	            <div class="user_password user_i">
	                <label>密<i>调</i>码</label> <input type="password" placeholder="输入密码" id="upwd" name="password">     
	            </div>
	            <div class="add_Account_ok_btn text_center" id="user_column_ok_btn">确<i>皮</i>定</div>
            </form>
        </div>
    </div>

    <!-- 删除账户 -->
    <div class="add_Account dn" id="delete_Account">
        <div class="add_Account_c">
            <div class="add_Account_h">
                <div class="add_Account_h_in">
                    删除账户
                    <span class="fr add_Account_close"><img src="<%=request.getContextPath()%>/images/close.png"></span>
                </div>
            </div>
            <form action="${pageContext.request.contextPath }/user_delete.action" method="post" id="deleteuser">
	            <input type="hidden" name="uid" class="uid" />
	            <div class="delete_text">确定删除“ <span class="uname"></span> ”账户吗？</div>
	            <div class="add_Account_ok_btn text_center" id="delete_Account_ok_btn">确<i>皮</i>定</div>
	        </form>
        </div>
    </div>

    <!-- 账户授权 -->
    <div class="add_Account dn" id="ac_Account">
        <div class="add_Account_c">
            <div class="add_Account_h">
                <div class="add_Account_h_in">
                    账户栏目授权
                    <span class="fr add_Account_close"><img src="<%=request.getContextPath()%>/images/close.png"></span>
                </div>
            </div>
            <form action="${pageContext.request.contextPath }/user_authorization.action" method="post" id="authorizationuser">
	            <ul>
	            	<input type="hidden" name="relation.user.uid" class="uid" />
	            	<input type="hidden" name="relation.column.cid" id="cid"/>	
	            	<%-- <c:forEach items="${list }" var="column">
	            	
	            		<c:forEach items="${user1.setRelation}" var="relation">
		                	<c:if test="${relation.column.cname }!=${column.cname }">
		                		<input type="hidden" name="colid" value="${column.cid }" />	
						 		<li><label><input type="checkbox" name="check1">&nbsp;<span>${column.cname }</span></label></li>
		                	</c:if>           		
		                </c:forEach>
					</c:forEach>    --%>
	            </ul>
            	<div class="add_Account_ok_btn text_center" id="ac_Account_ok_btn">保<i>呀</i>存</div>
            </form>
        </div>
    </div>   
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
</html>