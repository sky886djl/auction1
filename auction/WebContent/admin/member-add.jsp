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
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>添加用户 </title>
<meta name="keywords" content="kkk">
<meta name="description" content="kkk">
</head>
<body onload="loadName()">
<article class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-member-add">
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
			<label class="form-label col-xs-4 col-sm-3">性别：</label>
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
			<label class="form-label col-xs-4 col-sm-3">年龄：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="22"  name="age" id="age">
			</div>
		</div>
		
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input id="submit1" class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				<input class="btn btn-default radius" type="reset" value="&nbsp;&nbsp;重置&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="static/js/crud.js"></script>
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
			tel:{
				required:true,
				isMobile:true,
				remote:{
					type:'POST',
					url:'../user/telUnique',
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
					url:'../user/emailUnique',
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
				"gender":$("input:radio[name='sex']:checked").val()
			};
			execute1('新增','../user/add',data);
		}
	});
	
});


</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>