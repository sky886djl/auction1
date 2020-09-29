<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="../update" method="post">
    <input type="hidden" name="id" value="${user.id }" />
    <table id="tab">
        <tr><td><span>拍卖号</span></td><td>${user.username }</td></tr>
        <tr><td><span>姓名</span></td><td>${user.name }</td></tr>
        <tr><td><span>性别</span></td><td>${user.gender }</td></tr>
        <tr><td><span>年龄</span></td><td>${user.age }</td></tr>
        <tr><td><span>手机号码</span></td><td>${user.tel }</td></tr>
        <tr><td><span>email</span></td><td>${user.email }</td></tr>
        <tr><td><span>地址</span></td><td>${user.address }</td></tr>
        <tr><td><span>当前状态</span></td><td>${user.status==1?"启用":"禁用" }</td></tr>
    </table>
</form>
</body>
</html>