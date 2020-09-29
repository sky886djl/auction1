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
<title>充值结果</title>
<base href="<%=basePath%>" />
<link rel="shortcut icon" href="statics/images//icon/favicon.ico" />
<c:if test="${chargemsg==null }">
	<c:redirect url="product/list"></c:redirect>
</c:if>
<script type="text/javascript">
	//var chargeurl='${url}';
	var secs = 3;
	for (var i = secs; i >= 0; i--) {
		window.setTimeout('changeTime(' + i + ')', (secs - i) * 1000);
	}
	function changeTime(i) {
		document.getElementById('time').innerHTML = i;
		if (i == 0) {
			jump();
		}
	}
	function jump() {
		location.href='product/list';
	}
</script>
<style type="text/css">
.d1 {
	padding-top: 200px;
	padding-left: 40%;
}

.img1 {
	width: 125px;
	height: 125px;
}

.d1 p {
	line-height: 35px;
}

.jump {
	background-color: #51C332;
	border: 1px solid #51C332;
	width: 135px;
	height: 35px;
	color: white;
}

.body{
	margin-left:0px;
	margin-top:0px;
}

</style>
</head>
<body class="body">
	<c:choose>
		<c:when test="${chargemsg=='failure' }">
			很抱歉，<a href='http://localhost:8080/auction/recharge.jsp'>充值</a>失败！
			<p>
					<small id='time'>3</small>秒后跳转到商品页面
				</p>
			<input type="button" value="立即跳转" onclick="jump()" class="jump">
		</c:when>
		
		<c:otherwise>
			<div class="d1">
				<img src="statics/images/icon/timg.png" width='125px' height='125px'><br />
				<p>
					<b>恭喜您,${name },充值￥${money }成功!</b>
				<p />
				<p>
					<small id='time'>3</small>秒后跳转到首页
				</p>
				<input type="button" value="立即跳转" onclick="jump()" class="jump">
			</div>
		</c:otherwise>
	</c:choose>
	
</body>
</html>