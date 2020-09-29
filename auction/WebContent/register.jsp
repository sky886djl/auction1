<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>拍卖网注册中心</title>
<base href="<%=basePath%>" />
<link rel="stylesheet" href="statics/css/register.css" />
<link rel="shortcut icon" href="statics/images//icon/favicon.ico" />
<script type="text/javascript" src="statics/js/register.js" ></script>
</head>
<body onload="load()">
	<form onsubmit="return checkAll()" class="form1" action="user/register" method="post">
		<div>注册账号</div>
		<table width="700px">
			<tr>
				<td><span>手机号码</span></td>
				<td width="500px"><input type="text" id='tel' name="tel" onblur="checkTel(this)" />
					<span1 id='telspan'>
					<c:if test="${tel!=null }">${tel }已经绑定其他账户</c:if>
					</span1>
				</td>
			</tr>
			<tr>
				<td><span>email</span></td>
				<td><input type="text" id='email' name="email" onblur="checkEmail(this)" />
					<span1 id='emailspan'>
					<c:if test="${email!=null }">${email }已经绑定其他账户</c:if></span1>
				</td>
			</tr>
			<tr>
				<td><span>密码</span></td>
				<td><input type="password" id='pwd1' name="password" onblur="checkPwd1(this)" />
					<span1 id='pwd1span'></span1>
				</td>
			</tr>
			<tr>
				<td><span>确认密码</span></td>
				<td><input type="password" id='pwd2' name="password1" onblur="checkPwd2(this)"  />
					<span1 id='pwd2span'></span1>
				</td>
			</tr>
			<tr>
				<td><span>姓名</span></td>
				<td><input type="text" id='name' name="name" onblur="checkName(this)" value="${user1.name }" />
					<span1 id='namespan'></span1>
				</td>
			</tr>
			<tr>
				<td><span>性别</span></td>
				<td><input type="radio" id="male" name="gender" value="男" checked />男
				<input type="radio" id="female" value="女" name="gender" />女</td>
			</tr>
			<tr>
				<td><span>年龄</span></td>
				<td><select id='sel' class="sel" name="age">
					
				</select>&nbsp;岁</td>
			</tr>
			
			<tr>
				<td><span>地址</span></td>
				<td><input type="text" id='address' name="address" onblur="checkAddress(this)" value="${user1.address }" />
					<span1 id='addressspan'></span1>
				</td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2"><input type="checkbox" checked="checked" onchange="checkBox(this)" />我已阅读并接受<a style="color:#197AC4;cursor: pointer;">《用户协议》</a></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2"><input id="submit" type="submit" name="submit" value="立即注册" /></td>
			</tr>
		</table>
	</form>


</body>
</html>
