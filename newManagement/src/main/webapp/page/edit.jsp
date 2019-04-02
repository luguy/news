<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<base href="<%=request.getContextPath()%>">
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet">
</head>
<body>

<!-- 新闻管理 -->
            <div class="AccountManagement_c" id="NewsManagement_c">
                <h3>新闻管理 </h3>
                <div class="list" id="release_news">
                    <ul class="list_h">
                        <li class="b80"><label>编辑新闻</label></li>
                    </ul>
                    <div class="list_b_c" id="release_news_in">
                        <div class="release_news">
                        	<form action="${pageContext.request.contextPath }/news_update.action" method="post" id="updatenews">
	                            <input type="hidden" name="nid" value="${news.nid }">
	                            <div class="news_title">
	                                <label class="text_center">标题</label>
	                                <input type="text" placeholder="填写标题" name="title" value="${news.title }">
	                            </div>
	                            <div class="column_name">
	                                <label class="text_center">栏目</label>
	                                <select  class="column_name_release" name="relation.rid">
	                                   <c:forEach items="${user.setRelation }" var="relation">
	                            			<option value="${relation.rid}">${relation.column.cname}</option>
	                            	   </c:forEach>
	                                </select>
	                            </div>
	                            <textarea class="release_news_content" rows="50" cols="60" name="content" placeholder="编辑正文">${news.content }</textarea>
	                        </form>      
                            <div class="release_news_ok_btn text_center" id="edit_news_ok_btn" >修<i>我</i>改</div>
                        </div>
                        
                    </div>
                </div>
            </div>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
</html>