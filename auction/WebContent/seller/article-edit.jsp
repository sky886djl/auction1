<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
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
<link rel="stylesheet" href="static/css/article.css" />



<title>编辑文章 - 资讯管理</title>
<meta name="keywords" content="kkk">
<meta name="description" content="kkk">
</head>
<body onload="load1()">
<article class="page-container">
	<form class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${param.title }" placeholder="" id="articletitle" name="articletitle" onblur="checkTitle()" />
			</div>
		</div>
		<div class="message">
			<span id="titlespan"></span>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章类型：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="articletype" id="articletype" class="select" onblur="checkArticleType()">
					<option value="3" selected="selected">请选择文章类型</option>
					<option value="0">新闻公告</option>
					<option value="1">拍卖结果</option>
					<option value="2">系统消息</option>
				</select>
				</span> </div>
		</div>
		<div class="message">
			<span id="articletypespan"></span>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章内容：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="abstract" id="articleContent" cols="" rows="" class="textarea"  placeholder="说点什么吧..." datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" maxlength="1000"  onkeyup="contentChange(this)"  onpaste="contentChange(this)" onblur="checkContent()" >${param.content }</textarea>
				<p class="textarea-numberbar"><em class="textarea-length" id="textarea-length">0</em>/1000</p>
			</div>
		</div>
		<div class="message">
			<span id="contentspan"></span>
		</div>

		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="article_submit();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 提交发布</button>
				<button onClick="article_save();" class="btn btn-secondary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存草稿</button>
			</div>
		</div>
	</form>
</article>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="static/js/article.js" ></script>
<script type="text/javascript" src="static/js/crud.js" ></script>
<!--/请在上方写此页面业务相关的脚本-->
<script type="text/javascript">
	function load1(){
		var sel = document.getElementById('articletype');
		var type='${param.category}';
		for(var i=0;i<sel.options.length;i++){
			var s = sel.options[i]; 
			if(type===s.value.trim()){
				s.selected=true;
				break;
			}
		}
		find('textarea-length').innerText='${param.content}'.length;
	}
	
	//flag=true发布 flag=false保存
	function article_submit_save(flag){
		if(checkAll()){
			var url,msg;
			if(flag){
				msg='发布';
				url='../article/edit_submit';
			} else {
				msg='保存';
				url='../article/edit_save';
			}
			
			var id="${param.id }";
			var releaseTime="${param.releaseTime}";
			var title=document.getElementById('articletitle').value;
			var category=document.getElementById('articletype').value;
			var content=document.getElementById('articleContent').value;
			var data={"id":id,
					"title":title,
					"category":category,
					"content":content,
					"releaseTime":releaseTime
				};
			execute1(msg,url,data);
		}
	}
	
	
	//编辑-发布
	function article_submit(){
		article_submit_save(true);
	}
	
	//编辑-保存
	function article_save(){
		
		article_submit_save(false);
	}
</script>
</body>
</html>