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
<title>出价结果</title>
<link rel="shortcut icon" href="statics/images//icon/favicon.ico" />
<base href="<%=basePath%>" />
<c:if test="${pid==null }">
	<c:redirect url="product/list"></c:redirect>
</c:if>
<script type="text/javascript">
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
		location.href = "product/getOne/${product.id }";
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

.body {
	margin-left: 0px;
	margin-top: 0px;
}
</style>
</head>
<body class="body">

	<div class="d1">
		<img src="statics/images/icon/timg.png" width='125px' height='125px'><br />
		商品名：${product.name }<br /> 您的出价：${bidPrice }元<br />
		商品起拍价：${product.initialPrice }元<br />
		<div>
			<c:choose>
				<c:when test="${bidding=='biddingsuccess' }">
					恭喜您，出价成功!
				</c:when>
				<c:otherwise>
					很抱歉，出价失败！
					</c:otherwise>
			</c:choose>
		</div>
		<input type="button" value="立即跳转" onclick="jump()" class="jump">
		<br/><span id='time'>3</span>秒之后将跳转到商品页面

	</div>
</body>
</html>