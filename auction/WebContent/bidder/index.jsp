<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<link rel="stylesheet" href="css/myelementInfo.css" />
	</head>

	<body>
		<c:choose>
			<c:when test="${bidder==null }">
				<c:redirect url="../user/loginUI"></c:redirect>
			</c:when>
		</c:choose>
		<jsp:include page="top.jsp"></jsp:include>
		<div class="main" id="main">
			<div class="mainTitle">个人资料</div>
		<hr class="mainTitleLine"/>
		<div class="detailInfo">
			<form action="" method="post" class="form form-horizontal" id="form-picChange" enctype="multipart/form-data">
				<div class="headpicdiv">
					<img id="headpicarea" src="../admin/static/img/${bidder.headpic }" class="headpic" />
					<div class="changeheadPic">
						<a href="javascript:document.getElementById('upload').click()">
						<input id="upload" name="headpic" accept="image/x-png,image/jpeg" type="file" style="display: none;" onchange="headPicConfirm()" />
						修改头像
						</a>
					</div>
					<div id="msg1">
					</div>
					<div id="msg" class="msg">
						<input type='button' onclick="uploadPic()" class='input7' value='确定并上传' />
					</div>
				</div>
			</form>
			
			<div class="detailInfoMain">
				<div class="userId">
					拍卖号：${bidder.username }
					<span class="mybidCenter"><a href="javascript:jump('../product/mybid/type0')">我的竞拍<t style="font-size: 20px;">&gt;</t></a></span>
				</div>
				<div class="font1">
					账户余额:&nbsp;&nbsp;<fmt:formatNumber value="${bidder.account }" pattern="#拍卖币"></fmt:formatNumber> 
					<a href="javascript:window.open('../recharge.jsp')" >立即充值</a>
				</div>
				<hr class="line2" />
				<div class="moredetailInfo">
					<div class="detail">昵称：${bidder.name }<span class="changeInfo"><a href="javascript:jump('changemyInfo.jsp')">修改资料</a></span></div>
					<div class="detail">性别：${bidder.gender }</div>
					<div class="detail">年龄：${bidder.age }</div>
					<div class="detail">手机：${bidder.telCode }</div>
					<div class="detail">邮箱：${bidder.emailCode }</div>
					<div class="detail">地址：${bidder.address }</div>
					<div class="detail">身份：竞买者</div>
					<div class="detail">简介：${bidder.declaration }</div>
				</div>
				
			</div>
			
		</div>
		</div>
		<script type="text/javascript" src="js/common.js" ></script>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script>
		var newItem=document.getElementById('myelementInfo');
		newItem.style.background='#FF4401';
		newItem.style.color='white';
		function headPicConfirm(){
			 var MyTest = document.getElementById("upload").files[0];
			  var reader = new FileReader();
			  reader.readAsDataURL(MyTest);
			  reader.onload = function(theFile) {
			  var image = new Image();
			  image.src = theFile.target.result;
			 document.getElementById('headpicarea').src=image.src;				 
			 };
			console.log(MyTest.size);
			var msg=document.getElementById('msg');
			var msg1=document.getElementById('msg1');
			if(MyTest.size>2048000){
				msg.style.display='none';
				msg1.innerHTML='<span style="color:red">图片大小不能超过2MB</span>';
			} else {
				msg.style.display='block';
				msg1.innerHTML='';
			}
		}
		
		function uploadPic(){
			var formData = new FormData($("#form-picChange")[0]);
			$.ajax({
				async : false,
				type: 'POST',
				cache: false,
				processData:false,
				contentType : false,
				dataType: 'json',
	            url: '../user/changeHeadPic/0',
	            data:formData,
	            success: function(data) {
	            	if(data)
	            		alert('修改成功！');
	            	else
	            		alert('修改失败！');
	            	 window.location.reload();
	            }
			}); 
		}
		
		
	</script>
	</body>


</html>
