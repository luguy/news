<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>新闻发布管理平台</title>
<meta name="description" content="">
<meta name="keywords" content="">
<link href="css/main.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
    <div class="header">
        <div class="header_in">
            <img src="images/tit.png">
           <div class="quit text_center" id="quit_login">安全退出</div>
        </div>
        <form action="exit_login.do" method="post" id="quit_user"></form>
        
    </div>

    <div class="content ">
        <div class="user">
            <div class="user_status fl text_center">当前用户： <span>${select_user.username }</span></div>
            <div class="user_location fl">当前： 首页-<span>账户管理</span>  </div>
        </div>
        <div class="nav_side text_center fl">
            <div class="nav AccountManagement active">账户管理</div>
            <div class="nav ColumnManagement">栏目管理</div>
            <div class="nav NewsManagement">新闻管理</div>
        </div>


        <div class="main_fx">
            
            <div class="AccountManagement_c_iframe">
                <iframe src="user_listpage.do?currentPage=1" id="iframe"></iframe>
            </div>

        </div>
    </div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</html>