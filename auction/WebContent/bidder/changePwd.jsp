<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/bidder/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>zone</title>
		<base href="<%=basePath%>" />
		<link rel="stylesheet" href="css/common.css" />
		<link rel="stylesheet" href="css/changePwd.css" />
	</head>

	<body>
	<c:choose>
		<c:when test="${bidder==null }">
			<c:redirect url="../product/list"></c:redirect>
		</c:when>
	</c:choose>
		<jsp:include page="top.jsp"></jsp:include>
		<div class="main" id="main">
			<div class="mainTitle">修改密码</div>
			<hr class="mainTitleLine"/>
			<form id="info-edit" action="" method="post">
				<div class="elements1">
					<div class="userId1">拍卖号：${bidder.username }
					</div>
					<div class="elem1">请输入原密码：
						<input type="password" id="oldPwd" class="input5" onfocus="clear1()" onblur="checkPwd0(this)" />
						<span id="pwdId0"></span>
					</div>
					<div class="elem1">请输入新密码：
						<input type="password" id="newPwd" class="input5"  onfocus="clear2()" onblur="checkPwd1(this)"/>
						<span id="pwdId1"></span>
					</div>
					<div class="elem1">请确认新密码：
						<input type="password" id="newPwd1" class="input5" onfocus="clear3()"  onblur="checkPwd2(this)"/>
						<span id="pwdId2"></span>
					</div>
					
				</div>
				<div class="btnpo1">
					<input type="button" value="保存" onclick="changePwd1()" class="btn" />
					<input type="reset" value="取消" onclick="clearInfo()"  class="btn2"  />
				</div>
			</form>
		</div>
		<script type="text/javascript" src="js/common.js" ></script>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script>
			var newItem=document.getElementById('changePwd');
			newItem.style.background='#FF4401';
			newItem.style.color='white';
			
			function checkPwd0(obj) {
				var str=obj.value;
				if(str.length==0){
					document.getElementById('pwdId0').innerHTML="<font color='red'>原密码不能为空</font>";
					return false;
				} else if(str!="${bidder.password}"){
					document.getElementById('pwdId0').innerHTML="<font color='red'>密码输入错误</font>";
					return false;
				}
				else {
					document.getElementById('pwdId0').innerHTML="<font color='green'>√</font>";
					return true;
				}
			}
			
			function checkPwd1(obj) {
				var str=obj.value;
				if(str.length==0){
					document.getElementById('pwdId1').innerHTML="<font color='red'>新密码不能为空</font>";
					return false;
				} else if(str.length<6){
					document.getElementById('pwdId1').innerHTML="<font color='red'>新密码长度至少6位！</font>";
					return false;
				} else if(str.length>16){
					document.getElementById('pwdId1').innerHTML="<font color='red'>新密码长度至多16位！</font>";
					return false;
				}
				else {
					document.getElementById('pwdId1').innerHTML="<font color='green'>√</font>";
					return true;
				}
			}
			
			function checkPwd2(obj) {
				var str=obj.value;
				if(str.length==0){
					document.getElementById('pwdId2').innerHTML="<font color='red'>新密码不能为空</font>";
					return false;
				} else if(str!=document.getElementById('newPwd').value){
					document.getElementById('pwdId2').innerHTML="<font color='red'>两次密码输入不一致！</font>";
					return false;
				}
				else {
					document.getElementById('pwdId2').innerHTML="<font color='green'>√</font>";
					return true;
				}
			}
			
			function clearInfo() {
				document.getElementById('pwdId0').innerHTML='';
				document.getElementById('pwdId1').innerHTML='';
				document.getElementById('pwdId2').innerHTML='';
			}
			
			function clear1(){
				document.getElementById('pwdId0').innerHTML='';
			}
			
			function clear2(){
				document.getElementById('pwdId1').innerHTML='';
			}
			function clear3(){
				document.getElementById('pwdId2').innerHTML='';
			}
			
			function changePwd1() {
				var newpwd=document.getElementById('newPwd');
				if(checkPwd0(document.getElementById('oldPwd'))&&checkPwd1(newpwd)&&
						checkPwd2(document.getElementById('newPwd1'))){
					$.ajax({
						type: 'POST',
						url: '../user/pwdChange',
						data:{"pwd":newpwd.value},
						dataType: 'json',
						success: function(data){
							if(data){
								alert('修改成功！');
								location.href="index.jsp";
							}
						}
					});		
				}
			}
			
		</script>
</body>


</html>
