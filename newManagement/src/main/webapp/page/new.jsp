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
                <h3>新闻管理 
                    <div class="amcl fr">
                        <input type="text" placeholder="新闻名称" class="fl" name="">
                        <div class="search fl"><img src="<%=request.getContextPath()%>/images/search.png"></div>
                    </div> 
                </h3>
                <div class="AM_ct text_center">
                    <div class="AM_ct_in">
                        <a href="<%=request.getContextPath()%>/page/NewsManagement.jsp"><div class="add_btn df_btn fl" id="add_news_btn">添加</div></a>
                        <div onclick="handleUpdate()" class="edit_btn df_btn fl" id="edit_news_btn">编辑</div>
                        <div class="delete_btn df_btn fl" id="delete_news_btn">删除</div>
                    </div>
                </div>
			    <script>
						function handleUpdate () {
							var checks=document.getElementsByName("checks1");
						    var nids=document.getElementsByName("nids");
						    var c=new Array();
						    var u=new Array();
						    for(var i=0;i<checks.length;i++){
						    	if(checks[i].checked==true){
						    		c.push(checks[i].value);
						    		u.push(nids[i].value);
						    	}
						    }
						    if(c.length>1){
						    	alert("你选的太多了，请选择一条记录！");
						    	return;
						    }
						    if(c.length==0){
						    	alert("请选择一条记录！");
						    	return;
						    }
						   var id=u[0];
						    location.href = '${pageContext.request.contextPath }/news_findOne.action?nid='+id;
						}
				</script>
                <div class="list">
                    <ul class="list_h">
                        <li class="b20"><label>新闻标题</label></li>
                        <li class="b20"><label>所属栏目</label></li>
                        <li class="b60"><label>所属用户</label></li>
                    </ul>
                    <div class="list_b_c">
                    	<c:forEach items="${list }" var="news">
	                        <ul class="list_b">
								   <input type="hidden" name="nids" value="${news.nid }"/>
		                           <li class="b20"><label><input type="checkbox" name="checks1"><span name="titles"}">${news.title }</span></label></li>
		                           <li class="b20"><label name="cnames1">${news.relation.column.cname }</label></li>
		                           <li class="b60"><label name="usernames1">${news.relation.user.username }</label></li>
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


            

    

    <!-- 删除栏目 -->
    <div class="add_Account dn" id="delete_news">
        <div class="add_Account_c">
            <div class="add_Account_h">
                <div class="add_Account_h_in">
                    删除新闻
                    <span class="fr add_Account_close"><img src="<%=request.getContextPath()%>/images/close.png"></span>
                </div>
            </div>
            
            <form action="${pageContext.request.contextPath }/news_delete.action" method="post" id="deletenews">
	            <input type="hidden" name="nid" class="newsid"/>
	            <div class="delete_text">确定删除“ <span class="newstit">战争之神</span> ”新闻吗？</div>
	            <div class="add_Account_ok_btn text_center" id="delete_news_ok_btn">确<i>皮</i>定</div>
	        </form>
        </div>
    </div>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
</html>