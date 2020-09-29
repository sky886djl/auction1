<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>详细参数</title>
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
</head>
<body>

<div class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				${param.name }
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品类别：</label>
			<div class="formControls col-xs-8 col-sm-9">${param.typeName }</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">发布者：</label>
			<div class="formControls col-xs-8 col-sm-9">
				${param.seller }
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">起拍价：</label>
			<div class="formControls col-xs-8 col-sm-9">
				${param.initialPrice }元
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">当前价：</label>
			<div class="formControls col-xs-8 col-sm-9">
				${param.nowPrice }元
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">图片：</label>
			<div>
			<c:forEach var="pic" items="${fn:split(param.pic_url,';')}" step="1">
				<img src="../statics/images/product/${pic }" width="100" height="100" />
			</c:forEach>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">上传时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<time id="uploadDate"></time>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">开始时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<time id="start_time"></time>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">结束时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<time id="deadline"></time>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品描述：</label>
			<div class="formControls col-xs-8 col-sm-9">${param.description }</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">点击量：</label>
			<div class="formControls col-xs-8 col-sm-9">${param.click_num }</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">参与人数：</label>
			<div class="formControls col-xs-8 col-sm-9">${param.join_num }</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="static/js/dateFormat.js"></script>
<script type="text/javascript">

	function setValue(id,value) {
		document.getElementById(id).innerHTML=value;
	}
	setValue('uploadDate',formatDate1('${param.uploadDate }'));
	setValue('start_time',formatDate1('${param.start_time }'));
	setValue('deadline',formatDate1('${param.deadline }'));
</script>
</body>
</html>