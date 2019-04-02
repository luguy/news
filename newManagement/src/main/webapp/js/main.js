$(function(){

    
    // 适配
    // iframe
    $(".AccountManagement_c_iframe").css("height",$(document).height());
    // 导航高度
    $(".nav_side").css("height",$(document).height()-100);
    
    // iframe  链接
    $(".AccountManagement").click(function(){
        $(".AccountManagement_c_iframe iframe").attr("src","user_listpage.do?currentPage=1")
    })
    $(".ColumnManagement").click(function(){
        $(".AccountManagement_c_iframe iframe").attr("src","user_listpage.do?currentPage=1")
    })
    $(".NewsManagement").click(function(){
        $(".AccountManagement_c_iframe iframe").attr("src","user_listpage.do?currentPage=1")
    	/*$(".AccountManagement_c_iframe iframe").attr("src","page/new.jsp");*/
    })

	// pull page   翻页
    $(document).ready(function(){
    	var index=$("#cupage").val()-1;
    	$(".pull_page ul form li:eq("+index+")").addClass("on").siblings().removeClass("on");	
    })
	$(".pull_page ul form li").click(function(){
		var index =$(this).index();
		var txt=$(this).text();
		$("#cp").val(txt)
		if( $(this).hasClass("pull_page_df_btn")){
			return;
		}
		$("#pageindex").submit();
	})
    
	// nav
	$(".nav_side>div").click(function(){
		var index = $(this).index();
		$(this).addClass("active").siblings().removeClass("active");
		$(".main_fx>div").eq(index).show().siblings().hide();
        if( index == 0 ){
            $(".user_location span").text("账户管理");
        }else if( index == 1){
            $(".user_location span").text("栏目管理");
        }else if( index == 2){
            $(".user_location span").text("新闻管理");
        }
	})

	// 弹窗   all
	// z账户管理 -
	// 添加账户
    $("#add_Account_btn").click(function(){
        $("#add_Account").fadeIn(100);
    })
    $(".add_Account_close").click(function(){
        $("#add_Account").fadeOut(100);
        $("#user_column").fadeOut(100);
        $("#delete_Account").fadeOut(100);
        $("#ac_Account").fadeOut(100);
        $("#add_column").fadeOut(100);
        $("#edit_column").fadeOut(100);
        $("#delete_column").fadeOut(100);
        $("#delete_news").fadeOut(100);
    })
    // 编辑账户
    $("#edit_Account_btn").click(function(){
    	var checks=document.getElementsByName("checks");
        var names=document.getElementsByName("names");
        var ids=document.getElementsByName("ids");
        var pwds=document.getElementsByName("pwds");
        var c=new Array();
        var u=new Array();
        for(var i=0;i<checks.length;i++){
        	if(checks[i].checked==true){
        		c.push(checks[i].value);
        		u.push(ids[i].value);
        		u.push(names[i].innerText);
        		u.push(pwds[i].innerText);
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
        $(".uname").append(u[1]);
        $("#uname").val(u[1]);
        $("#upwd").val(u[2]);
    	$("#user_column").fadeIn(100);
    })
    //删除账户
    $("#delete_Account_btn").click(function(){
    	var checks=document.getElementsByName("checks");
        var names=document.getElementsByName("names");
        var ids=document.getElementsByName("ids");
        var c=new Array();
        var u=new Array();
       /* var u=new Array();*/
        for(var i=0;i<checks.length;i++){
        	if(checks[i].checked==true){
        		c.push(checks[i].value);
        		u.push(ids[i].value);
        		u.push(names[i].innerText);
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
        $(".uname").append(u[1]);
        $("#delete_Account").fadeIn(100);
    })
    // 账户授权
    /*$("#ac_Account_btn").click(function(){
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
        location.href = 'user_find.action?uid='+u[0];
    	$("#ac_Account").fadeIn(100);
    })*/


    // 栏目管理 
    $("#add_column_btn").click(function(){
        $("#add_column").fadeIn(100);
    })
    // 编辑栏目
    $("#edit_column_btn").click(function(){
    	
    	var checks=document.getElementsByName("cchecks");
        var cnames=document.getElementsByName("cnames");
        var cids=document.getElementsByName("cids");
        var usernames=document.getElementsByName("usernames");
        var c=new Array();
        var u=new Array();
        for(var i=0;i<checks.length;i++){
        	if(checks[i].checked==true){
        		c.push(checks[i].value);
        		u.push(cids[i].value);
        		u.push(cnames[i].innerText);
        		u.push(usernames[i].innerText);
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
       
        $(".cid").val(u[0]);
        $("#colname").val(u[1]);
        $("#coluser").val(u[2]);
        $("#edit_column").fadeIn(100);
    })
    // 删除栏目
    $("#delete_column_btn").click(function(){
    	var checks=document.getElementsByName("cchecks");
        var cnames=document.getElementsByName("cnames");
        var cids=document.getElementsByName("cids");
        var c=new Array();
        var u=new Array();
        for(var i=0;i<checks.length;i++){
        	if(checks[i].checked==true){
        		c.push(checks[i].value);
        		u.push(cids[i].value);
        		u.push(cnames[i].innerText);
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
        
       
        $(".cid").val(u[0]);
        $(".columnname").append(u[1]);
    	$("#delete_column").fadeIn(100);
    })
 
    //新闻管理
   /*  $("#add_news_btn").click(function(){
    	$(".AccountManagement_c_iframe iframe").attr("src","page/NewsManagement.jsp");
    })
    // 编辑新闻
    $("#edit_news_btn").click(function(){
    
    })*/
    // 删除新闻
    $("#delete_news_btn").click(function(){
    	var checks=document.getElementsByName("checks1");
        var titles=document.getElementsByName("titles");
        var nids=document.getElementsByName("nids");
        var c=new Array();
	    var u=new Array();
	    for(var i=0;i<checks.length;i++){
	    	if(checks[i].checked==true){
	    		c.push(checks[i].value);
	    		u.push(nids[i].value);
	    		u.push(titles[i].innerText);
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
	    $(".newsid").val(u[0]);
	    $(".newstit").val(u[1]);
    	$("#delete_news").fadeIn(100);
    })
    
    

    // 确定 btn 
    $("#add_Account_ok_btn").click(function(){
	    	$("#adduser").submit();
	        $("#add_Account").fadeOut(100);
	})
    $("#user_column_ok_btn").click(function(){
    	$("#updateuser").submit();
    	$("#user_column").fadeOut(100);
    })
    $("#delete_Account_ok_btn").click(function(){
    	$("#deleteuser").submit();
        $("#delete_Account").fadeOut(100);
    })
    $("#ac_Account_ok_btn").click(function(){
    	var cids=document.getElementsByName("colid");
    	var checks=document.getElementsByName("check1");
    	var u=new Array();
        var c=new Array();
        for(var i=0;i<checks.length;i++){
        	if(checks[i].checked==true){
        		c.push(checks[i].value);
        		u.push(cids[i].value);
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
        $("#cid").val(u[0]);
    	$("#authorizationuser").submit();
        $("#ac_Account").fadeOut(100);
    })
    
    
    $("#add_column_ok_btn").click(function(){
    	$("#addcolumn").submit();
    	$("#add_column ").fadeOut(100);
    })
    $("#edit_column_ok_btn").click(function(){
    	$("#updatecolumn").submit();
        $("#edit_column ").fadeOut(100);
    })

    $("#delete_column_ok_btn").click(function(){
    	$("#deletecolumn").submit();
        $("#delete_column").fadeOut(100);
    })
     $(".pull_page_up").click(function(){
    	$("#up").submit();
    })
   $(".pull_page_down").click(function(){
    	$("#down").submit();
    })
   $("#searchUser").click(function(){
	   /*	var name=document.getElementById("searchu");
	   	$(".like").val(name.value);*/
    	$("#condition").submit();
    })
   $("#add_news_ok_btn").click(function(){
   		$("#addnews").submit();
   	})


	
	$("#delete_news_ok_btn").click(function(){
		$("#deletenews").submit();
		$("#delete_news").fadeOut(100);
	})
	$("#edit_news_ok_btn").click(function(){
		$("#updatenews").submit();
	})
	
	$("#quit_login").click(function(){
		$("#quit_user").submit();
	})
	
	
	
	
})