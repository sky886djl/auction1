<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->
<style type="text/css">
.mainTitle {
	font:20px/1.5 "微软雅黑";
	font-weight: 700;
	margin-top:20px;
	padding-top:16px;
	margin-left:20px;
}
	.mainTitleLine {
	margin-top:20px;
	margin-left:20px;
	width:1300px;
	color:#666666;
}
.rebody{
margin-top:20px;
height:500px;
width:1000px;
padding:30px;
padding-left:0px;
margin-left:200px;
	background:url(statics/images/icon/registerbg.jpg) no-repeat;
}
</style>
<title>注册账号 </title>
<meta name="keywords" content="kkk">
<meta name="description" content="kkk">
</head>
<body onload="loadName()">


<div class="mainTitle">
		<img src="statics/images/icon/bidover.png" height="80">
		注册账号
</div>
<hr class="mainTitleLine"/>

<div class="rebody">
	<form action="" method="post" class="form form-horizontal" id="form-member-add">
	<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<input name="identity" id="identity" type="radio" id="id-1" value="1" checked>
					<label for="sex-1">我是竞买者</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="id-2" value="0" name="identity" id="identity">
					<label for="sex-2">我是委托者</label>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="tel" name="tel" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="@" name="email" id="email" />
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" autocomplete="off" placeholder="请输入密码" name="newpassword" id="newpassword">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" autocomplete="off" placeholder="请确认密码" name="newpassword2" id="new-password2">
			</div>
		</div>
		
        <div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>昵称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="zhangsan" name="name" id="name" />
				<div>
					<a onclick="javascript:loadName()" style="cursor:pointer ">换一个</a>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<input name="sex" type="radio" id="sex-1" value="男" checked>
					<label for="sex-1">男</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="sex-2" value="女" name="sex">
					<label for="sex-2">女</label>
				</div>
			</div>
		</div>
		
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>年龄：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  name="age" id="age">
			</div>
		</div>
		
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input id="submit1" class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				<input class="btn btn-default radius" type="reset" value="&nbsp;&nbsp;重置&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="admin/static/js/crud.js"></script>
<script type="text/javascript">

function loadName() {
	var names=[  '清梦小轩 ぺ灬',
	       		'☆会飞的鱼☆',
	      '咜不々爱ωǎ',
	       '╰→消失嘚美俪',
	       '为?爱?变乖 ♂',
	       'じ☆天使☆じ ㄞ',
	       '☆尛宀贝ㄣ',
	      '☆星雨悠悠℃',
	       '→＼咘懂の爱',
	       '六瓣═→ 丁香',
	       'ㄗs 绝恋 oО',
	      'ヅ坏気⑽哫\'',
	       '柠檬草精铃',
	       '墨尔本°晴の',
	       '___尛羙°猫',
	       '__汏馒头',
	       '∨_______尜尜',
	       '___Rubby丶',
	       '∨___猫°'
	       ];
	$('#name').val(names[Math.floor(Math.random()*19)]);
}

$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-member-add").validate({
		rules:{
			identity:{
				required:true
			},
			tel:{
				required:true,
				isMobile:true,
				remote:{
					type:'POST',
					url:'user/telUnique',
					data:{
						tel:function(){return $('#tel').val();},
						tel2:function(){return 'add';}
					}
				}
			},
			email:{
				required:true,
				email:true,
				remote:{
					type:'POST',
					url:'user/emailUnique',
					data:{
						email:function(){return $('#email').val();},
						email2:function(){return 'add';}
					}
				}
			},
			newpassword:{
				required:true,
				minlength:6,
				maxlength:16
			},
			newpassword2:{
				required:true,
				equalTo:newpassword
			},
			age:{
				required:true,
				number:true,
				digits:true,
				min:0,
				max:100
			},
			name:{
				required:true
			}
		},
		messages:{
			tel:{
				remote:'该手机号已绑定其他账户'
			},
			email:{
				remote:'该邮箱已绑定其他用户'
			},
			age:{
				digits:'只能输入整数'
			}
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			var data={
				"password":$('#newpassword').val(),
				"tel":$('#tel').val(),
				"email":$('#email').val(),
				"name":$('#name').val(),
				"age":$('#age').val(),
				"gender":$("input:radio[name='sex']:checked").val(),
				"type":$("input:radio[name='identity']:checked").val()
			};
			console.log(data);
			execute1('注册','user/add',data);
		}
	});
	
});


</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>