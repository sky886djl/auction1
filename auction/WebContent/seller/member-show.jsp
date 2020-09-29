<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<style type="text/css">
.input7 {
	  width: 80px;  
        padding:8px;  
        background-color: #FF4400;  
        border-color: #357ebd;  
        color: #fff;  
        -moz-border-radius: 4px;  
        -webkit-border-radius: 4px;  
        border-radius: 4px; /* future proofing */  
        -khtml-border-radius: 4px; /* for old Konqueror browsers */  
        text-align: center;  
        vertical-align: middle;  
        border: 1px solid transparent;  
        font-weight: 900;  
        margin-left:20px;
}
.msg{
margin-left:56px;
margin-top:-30px;
display:none;
}
</style>
<title>用户查看</title>
</head>
<body>
<div class="cl pd-20" style=" background-color:#5bacb6">
	<img id="headpicarea" class="avatar size-XL l" src="../admin/static/img/${seller.headpic }">
	<dl style="margin-left:80px; color:#fff">
		<dt>
			<span class="f-18">${seller.username }</span>
			<span class="pl-10 f-12">余额：
			<fmt:formatNumber value="${seller.account }" pattern="#" />拍卖币 </span>
		</dt>
		<dd class="pt-10 f-12" style="margin-left:0">${seller.declaration }</dd>
	</dl>
	<br/>
	<form action="" method="post" class="form form-horizontal" id="form-picChange" enctype="multipart/form-data">
		<div>
			<a href="javascript:document.getElementById('headPicfile').click()" style="text-decoration:none;color:white;">修改头像</a>
			<input id="headPicfile" name="headpic" accept="image/x-png,image/jpeg" type="file" style="display: none;" onchange="headPicConfirm()" />
		</div>
		<div id="msg1"></div>
		<div id="msg" class="msg">
			<input type="button" onclick="uploadPic()" class='input7' value='确定并上传' />
		</div>
	</form>
</div>

<div class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">昵称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				${seller.name }
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">性别：</label>
			<div class="formControls col-xs-8 col-sm-9">
				${seller.gender }
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">年龄：</label>
			<div class="formControls col-xs-8 col-sm-9">
				${seller.age }
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">手机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				${seller.tel }
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				${seller.email }
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				${seller.address }
			</div>
		</div>
	</form>

</div>
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript">
function headPicConfirm(){
	 var MyTest = document.getElementById("headPicfile").files[0];
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
       url: '../user/changeHeadPic/1',
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