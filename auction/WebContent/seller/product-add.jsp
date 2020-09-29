<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="Content-Type" content="multipart/form-data;charset=utf-8" />
    <title>添加产品</title>
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />

	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

</head>
<body>

<div class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-product-add" enctype="multipart/form-data">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>产品名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="proName" name="proName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>产品类别：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select id="category" name="category" class="select">
					
				</select>
				</span> </div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>起拍价：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="initialPrice" id="initialPrice" placeholder="" value="" class="input-text" style="width:90%">
				元</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>上传图片：</label>
		</div>
		<div class="pics">
 			<div id="picDiv1" class="pic1">
 				<span id="clear1" class="clear" onclick="remove(1)">X</span>
 				<img id="picShow1" onclick="addPic()" src="temp/more.png" width="100" height="100" />
 				<input id="pic1" name="pics" type="file" style="display: none;" accept="image/x-png,image/jpeg" onchange="picConfirm(1)" />
 				
 			</div>
 			<div id="picDiv2" class="pic2">
 				<span id="clear2" class="clear" onclick="remove(2)">X</span>
 				<img id="picShow2" onclick="addPic()" src="temp/more.png" width="100" height="100" />
 				<input id="pic2" name="pics" type="file" style="display: none;" accept="image/x-png,image/jpeg" onchange="picConfirm(2)" />
 			</div>
 			<div id="picDiv3" class="pic3">
 				<span id="clear3" class="clear" onclick="remove(3)">X</span>
 				<img id="picShow3" onclick="addPic()" src="temp/more.png" width="100" height="100" />
 				<input id="pic3" name="pics" type="file" style="display: none;" accept="image/x-png,image/jpeg" onchange="picConfirm(3)" />
 			</div>
 			<span id="picmsg" style="color:red;display:none;">请至少选择一张图片</span> 				
 		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>开始时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" id="startDate" name="startDate" class="input-text Wdatetime" style="width:200px;">
				<i class="Hui-iconfont">&#xe690;</i>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>结束时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" id="endDate" name="endDate" class="input-text Wdatetime" style="width:200px;">
				<i class="Hui-iconfont">&#xe690;</i>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>产品描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="description" id="description" placeholder="" value="" class="input-text" style="width:90%" />
				</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button id="btn" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe603;</i> 发布商品</button>
				<input class="btn btn-default radius" type="reset" value="重置"/>
			</div>
		</div>
	</form>
</div>

<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>

<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script>
function picConfirm(id){
	 var MyTest = document.getElementById('pic'+id).files[0];
	 console.log(MyTest);
	  var reader = new FileReader();
	  reader.readAsDataURL(MyTest);
	  reader.onload = function(theFile) {
	  	
	  	var picDiv=document.getElementById('picDiv'+id);
		if(MyTest.size>1024000){
			alert("图片大小不能超过1MB");
			return;
		} else {
			picDiv.style.display='block';
			picDiv.style.border='block';
			array1[cur-1]=1;
			document.getElementById('picmsg').style.display='none';
		} 
		var image = new Image();
	  	image.src = theFile.target.result;
	  	var picshow=document.getElementById('picShow'+id);
	  	picshow.src=image.src;	
	  	document.getElementById('clear'+cur).style.display="block";
	  	for(var i=1;i<=3;i++){
			if(array1[i-1]==0){
				document.getElementById('picDiv'+i).style.display="block";
				cur=i;
				break;
			}
		}
	 };
	
}
var cur=0;
var array1=[0,0,0];
function addPic(){
	for(var i=1;i<=3;i++){
		if(array1[i-1]==0){
			cur=i;
			break;
		}
	}
	document.getElementById('pic'+cur).click();
	
}

function remove(id){
	var img=document.getElementById('pic'+id);
	document.getElementById('pic'+id).src='temp/more.png';
	document.getElementById('picShow'+id).src='temp/more.png';
	document.getElementById('clear'+id).style.display="none";
	cur=id;
	array1[id-1]=0;
}
$(function(){
	
	$.ajax({
		async : false,
		type: 'GET',
		cache: false,
		url: '../type/list',
		dataType: 'json',
		contentType : 'application/json;charset=UTF-8',
		success: function(data){
			var category=$("#category");
			category.append("<option value='0'>请选择产品分类</option>");
			var datas=data.aaData;
			var data=null;
			for(var i=0;i<datas.length;i++){
				data=datas[i];
				category.append("<option value='"+data.id+"'>"+data.typeName+"</option>");
			}
		}
	});
	
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	
	$.validator.addMethod("categoryCheck",function(value,element){  
		if(value==0)
			return false;
		return true;
	},"产品类型不能为空");

	$.validator.addMethod("priceCheck",function(value,element){
		if(value.indexOf('.')==-1)
			return true;
        if(value.split('.')[1].length>2)
        	return false;
         return true;
     },"小数点后最多为两位");  
	
	$.validator.addMethod("greaterThantNow",function(value,element){  
        if(parseInt(new Date(value).getTime())<parseInt(new Date().getTime()))
        	return false;
        return true;
     },"必须大于现在时间");
	
	$.validator.addMethod("startDateCheck",function(value,element){  
		var endDate=$('#endDate').val();
        if(endDate==null)
        	return true;
        if(parseInt(new Date(value).getTime())>parseInt(new Date(endDate).getTime()))
        	return false;
        return true;
     },"开始日期必须小于结束时间！");
	
	$.validator.addMethod("endDateCheck",function(value,element){  
		var startDate=$('#startDate').val();
		if(startDate==null)
			return true;
		if(parseInt(new Date(value).getTime())<parseInt(new Date(startDate).getTime()))
	     	return false;
	    return true;
	 },"结束日期必须大于开始时间！");  
	
	$("#form-product-add").validate({
		rules:{
			proName:{
				required:true,
				maxlength:100,
				minlength:2
			},
			category:{
				categoryCheck:true
			},
			pics:{
				picCheck:true
			},
			initialPrice: {
				required:true,
				number:true,
				min:0,
				priceCheck:true
			},
			startDate:{
				greaterThantNow:true,
				required:true,
				date:true,
				startDateCheck:true
			},
			endDate:{
				greaterThantNow:true,
				required:true,
				date:true,
				endDateCheck:true
			},
			description:{
				required:true
			}
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			var flag=false;
			for(var i=0;i<3;i++){
				if(array1[i]==1){
					flag=true;
				}
			}
			if(!flag){
				document.getElementById('picmsg').style.display='block';
				return;
			}
			for(var i=0;i<3;i++){
				if(array1[i]==0){
					document.getElementById("picDiv"+(i+1)).innerHTML='';
				}
			}
			var formData = new FormData($("#form-product-add")[0]);
			$.ajax({
				async : false,
				type: 'POST',
				cache: false,
				processData:false,
				contentType : false,
				dataType: 'json',
	            url: '../product/add',
	            data:formData,
	            success: function(data) {
	            	var msg="新增";
	            	if(data){
	    				layer.alert(msg+"成功！",{icon:6},function(){
	    					window.parent.location.reload();//刷新父页面
	    					var index=parent.layer.getFrameIndex(window.name);
	    					parent.layer.close(index);
	    				});
	    			}
	    			else
	    				layer.alert(msg+"失败！",{icon:2},function(){
	    					window.parent.location.reload();//刷新父页面
	    					var index=parent.layer.getFrameIndex(window.name);
	    					parent.layer.close(index);
	    				});
	            }
			});
		} 
	});
});



</script>
</body>
</html>