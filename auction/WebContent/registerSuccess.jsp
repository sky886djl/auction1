<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册成功</title>
<link rel="shortcut icon" href="statics/images//icon/favicon.ico" />
<base href="<%=basePath%>" />
<script type="text/javascript">
	var secs=3;
	for(var i=secs;i>=0;i--){
		window.setTimeout('changeTime('+i+')',(secs-i)*1000);
	}
	function changeTime(i){
		document.getElementById('time').innerHTML=i;
		if(i==0){
			location.href="product/list";
		}
	}

</script>
</head>
<body>
	恭喜您，成功注册用户名${user1.username } <a href="login.jsp">立即登录</a>
	<span id='time'>3</span>秒之后将跳转到主页面，如未跳转，<a href="product/list">点击跳转</a>
</body>
</html>