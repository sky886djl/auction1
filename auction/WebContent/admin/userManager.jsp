<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%
//判断管理员是否登录
%>

<html>
<head>
<title>拍卖网后台管理</title>
</head>
<body>
	${msg }
	${userManager }
	<c:choose>
		<c:when test="${userList==null }">
			<c:redirect url="../user/list"></c:redirect>
		</c:when>
	</c:choose>
	<table border="1" id="tab">
		<tr style="background: #00BFFF">
			<th>用户编号</th>
			<th>用户名</th>
			<th>姓名</th>
			<th>性别</th>
			<th>年龄</th>
			<th>手机号</th>
			<th>电子邮箱</th>
			<th>地址</th>
			<th>操作</th>
		</tr>
	<c:forEach var="u" items="${userList }">
		<tr>
			<td>${u.id }</td>
			<td>${u.username }</td>
			<td>${u.name }</td>
			<td>${u.gender }</td>
			<td>${u.age }</td>
			<td>${u.tel }</td>
			<td>${u.email }</td>
			<td>${u.address }</td>
			<td>
				<c:choose>
					<c:when test="${u.status==1 }">
						<a href="forbidden/${u.id }">禁用</a> 
					</c:when>
					<c:otherwise>
						<a href="activate/${u.id }">启用</a> 
					</c:otherwise>
				</c:choose>
				<a href="userview/${u.id }">详情</a>
			</td>
		</tr>
	</c:forEach>
	</table>

</body>
</html>
