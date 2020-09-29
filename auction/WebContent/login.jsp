<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>欢迎登录淘优网</title>
<base href="<%=basePath%>" />
<link rel="stylesheet" type="text/css" href="statics/css/login1.css">
<link rel="shortcut icon" href="statics/images//icon/favicon.ico" />
</head>
<script type="text/javascript">
	function checkAll() {
		var user = document.getElementById('username').value;
		var pwd = document.getElementById('pwd').value;
		if (user.length == 0) {
			return false;
		}
		if (pwd.length == 0) {
			return false;
		}
		return true;
	}
	function blurpwd() {
		var pwd = document.getElementById('pwd').value;
		var pwdspan = document.getElementById('pwdspan');
		if(pwd=='')
			pwdspan.innerHTML='密码';
	}
</script>
<body>
<%-- 	<div class="login_box">
		<div class="login_l_img">
			<img src="statics/images/login/login-img.png" />
		</div>
		<div class="login">
			<div class="login_logo">
				<a href="#"><img src="statics/images/login/login_logo.png" /></a>
			</div>
			<div class="login_name">
				<p>欢迎登录</p>
				<div id="msg1">
				<div class="message" id="message">
					<c:choose>
					<c:when test="${message=='error' }">
         	 用户名或密码错误
          </c:when>
          <c:otherwise>&nbsp;&nbsp;&nbsp;</c:otherwise>
					</c:choose>
					
				</div>
				</div>
			</div>

			<form method="post" action="user/login" onsubmit="return checkAll()">
				<input id="username" name="username" type="text" value="用户名/手机号/邮箱"
					onfocus="this.value='';"
					onblur="if(this.value==''){this.value='用户名/手机号/邮箱'}"> 
				<span id="pwdspan" class="pwdspan">密码</span>
					<input id="pwd" name="password" type="password"  onfocus="document.getElementById('pwdspan').innerHTML=''"
					 onblur="blurpwd()" onpaste="return false" /> 
					<input	value="登录" style="width: 100%;" type="submit">
			</form>
			<div style="margin-top: 20px; margin-left: 40px">
				没有账号？<a href="member-add.jsp">立即注册</a>
			</div>
			<!-- <div style="margin-top: -20px; margin-left: 200px">
				<a href="#">忘记密码？</a>
			</div> -->

		</div>
	</div> --%>
	
	
	
	<header class="aui-header">
		<div class="aui-header-box">
			<h1>
				<a href="login.jsp" class="aui-header-box-logo">欢迎登录淘优网</a>
			</h1>
		</div>
	</header>

	<section class="aui-content">
		<div class="aui-content-box clearfix">
			<div class="aui-content-box-fl">
				<div class="aui-form-header">
					<div class="aui-form-header-item on">密码登录</div>
					<span class="aui-form-header-san"></span>
				</div>
				<div class="aui-form-content">
					<div class="aui-form-content-item">
						<form action="user/login" method="post">
							<div class="aui-form-list">
								<input type="text" class="aui-input" name="username" placeholder="请输入拍卖号/手机号/邮箱" data-required="required" autocomplete="off">
							</div>
							<div class="aui-form-list">
								<input type="password" class="aui-input" name="password" placeholder="请输入密码" data-required="required" autocomplete="off">
							</div>
							<div class="aui-form-btn">
								<input type="submit" class="aui-btn" value="登&nbsp;录" >
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="aui-content-box-fr">
				<div class="aui-content-box-text">
					<h3>还没有帐号:</h3>
					<a href="member-add.jsp" class="aui-ll-link">立即注册</a>
					<!-- <h3>使用第三方帐号直接登录:</h3>
					<ul class="aui-content-box-text-link clearfix">
						<li><a href="#" class="aui-icon-sina"   title="使用新浪微博帐号登录"></a></li>
						<li><a href="#" class="aui-icon-wechat" title="使用微信帐号登录"></a></li>
						<li><a href="#" class="aui-icon-qq"     title="使用腾讯QQ帐号登录"></a></li>
						<li><a href="#" class="aui-icon-baidu"  title="使用百度帐号登录"></a></li>
					</ul> -->
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript" src="statics/js/jquery.min.js"></script>
	<script type="text/javascript" src="statics/js/jquery.qrcode.js"></script>
	<script type="text/javascript">
        $(function(){

			/*tab标签切换*/
            function tabs(tabTit,on,tabCon){
                $(tabCon).each(function(){
                    $(this).children().eq(0).show();

                });
                $(tabTit).each(function(){
                    $(this).children().eq(0).addClass(on);
                });
                $(tabTit).children().click(function(){
                    $(this).addClass(on).siblings().removeClass(on);
                    var index = $(tabTit).children().index(this);
                    $(tabCon).children().eq(index).show().siblings().hide();
                });
            }
            tabs(".aui-form-header","on",".aui-form-content");

        })
	</script>
</body>
</html>
