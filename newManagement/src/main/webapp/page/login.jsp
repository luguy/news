<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=request.getContextPath()%>">
<meta charset="utf-8" />
<title>登录页面</title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/login1.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/vue.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
  //  判断     判断该页面是否是顶层页面   如果不是   设置该页面为顶层页面
     if(self!=top){
    	top.location.href="log.jsp";
    } 
</script>
	</head>
	<body>
		<div class="container bg">
			<transition
				appear
				appear-active-class="animated bounceInDown"
				enter-active-class="animated slideInDown"
				>
				<div class="login-wrapper" ref="a" v-if="isTrue">
					 <s:fielderror/> 
					<div class="login-title">
						News Management System
					</div>
					<form class="login-content" id="login-animation" method="post" action="${pageContext.request.contextPath }/user_login.do" >
						<p>
							<label>用户</label>
							<input type="text" v-model="account" id="em" name="account"/>
						</p>
						<p>
							<label>密码</label>
							<input type="password" v-model="psw" name="password" id="pwd"/>
						</p>
						<p>
							<input type="button" value="提交" @click="isCheck"/>
						</p>
						<div id="identify">
							<div class="drag" ref="dragDiv">
						        <div class="drag_bg"></div>
						        <div class="drag_text">{{confirmWords}}</div>
						        <div ref="moveDiv" @mousedown="mousedownFn($event)" :class="{'handler_ok_bg':confirmSuccess}" class="handler handler_bg" style="position: absolute;top: 0px;left: 0px;"></div>
						    </div>
						</div>
						<p>
							${fail }
						</p>
					</form>
				</div>
			</transition>
		</div>
		<script type="text/javascript">
		var app = new Vue({
			el: ".container",
			data: {
				isTrue: false,
				beginClientX:0,           /*距离屏幕左端距离*/
                mouseMoveStata:false,     /*触发拖动状态  判断*/
                maxwidth:'',               /*拖动最大宽度，依据滑块宽度算出来的*/
                confirmWords:'请拖动滑块',   /*滑块文字*/
                confirmSuccess:false,
                account: '',
                psw: ''
			},
			created: function() {
				let _this = this;
				setTimeout(function(){
					_this.isTrue = true;
				},700);
			},
			methods: {
				mousedownFn:function (e) {
	                if(!this.confirmSuccess){
	                    e.preventDefault && e.preventDefault();   //阻止文字选中等 浏览器默认事件
	                    this.mouseMoveStata = true;
	                    this.beginClientX = e.clientX;
	                }
	            },        //mousedoen 事件
	            successFunction(){
	                this.confirmSuccess = true
	                this.confirmWords = '拖动成功';
	                if(window.addEventListener){
	                    document.getElementsByTagName('html')[0].removeEventListener('mousemove',this.mouseMoveFn);
	                    document.getElementsByTagName('html')[0].removeEventListener('mouseup',this.moseUpFn);
	                }else {
	                    document.getElementsByTagName('html')[0].removeEventListener('mouseup',()=>{});
	                }
	                document.getElementsByClassName('drag_text')[0].style.color = '#fff'
	                document.getElementsByClassName('handler')[0].style.left = this.maxwidth + 'px';
	                document.getElementsByClassName('drag_bg')[0].style.width = this.maxwidth + 'px';
	            },                //验证成功函数
	            mouseMoveFn(e){
	                if(this.mouseMoveStata){
	                    let width = e.clientX - this.beginClientX;
	                    if(width>0 && width<=this.maxwidth){
	                        document.getElementsByClassName('handler')[0].style.left = width + 'px';
	                        document.getElementsByClassName('drag_bg')[0].style.width = width + 'px';
	                    }else if(width>this.maxwidth){
	                        this.successFunction();
	                    }
	                }
	            },                   //mousemove事件
	            moseUpFn(e){
	                this.mouseMoveStata = false;
	                var width = e.clientX - this.beginClientX;
	                if(width<this.maxwidth){
	                    document.getElementsByClassName('handler')[0].style.left = 0 + 'px';
	                    document.getElementsByClassName('drag_bg')[0].style.width = 0 + 'px';
	                }
	            },
	            isCheck() {
	            	let account = this.account,
	            	psw = this.psw;
	            	//var reg=/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
	            	if(""==account.trim()|| account==null){
	        			alert("请输入账号");
	        			return;
	        		} 
	        		if(""==psw.trim() || psw==null){
	        			alert("请输入密码");
	        			return;
	        		}
	        		 /* if(reg.test(account)==false){
	        				alert("Email格式不正确");
	        				return;
	        		}  */
	            	if (!this.confirmSuccess) {
	            		alert("请拖动滑块");
	            		return;
	            	}
	            	document.getElementById("login-animation").submit();
	            }
			},
			mounted: function () {
				let self = this;
				setTimeout(function() {
					self.maxwidth = self.$refs.dragDiv.clientWidth - self.$refs.moveDiv.clientWidth;
		            document.getElementsByTagName('html')[0].addEventListener('mousemove',self.mouseMoveFn);
		            document.getElementsByTagName('html')[0].addEventListener('mouseup',self.moseUpFn)
				},1000);
			}
		});
			
			
		</script>
	</body>
</html>