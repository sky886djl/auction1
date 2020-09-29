<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<title>产品分类</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 分类管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
		<a href="javascript:;" onclick="type_dels()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
		<a href="javascript:;" onclick="type_add()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加分类</a></span>
		<span class="r">共有数据：<strong>54</strong> 条</span> 
	</div>
	<div class="mt-20">
		<table id="example" class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">
					<th width="4%"><input type="checkbox" name="" value=""></th>
				<th width="10%">ID</th>
				<th width="24%">分类名</th>
				<th width="20%">该分类的产品数</th>
				<th width="26%">描述</th>
				<th width="20%">操作</th>
				</tr>
			</thead>
			<tbody>
				
			</tbody>
		</table>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js" ></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="static/js/crud.js"></script>
<script type="text/javascript">
var table;
$(document).ready(function() {
	table=$('#example').DataTable( {
		"lengthMenu":[5,10,15,20],
		 "bPaginate" : true,
		 "bStateSave" : true,
	    "ajax":{
	    	"type": "GET", 
	    	"url":'../type/list'
	    },
	    "columns": [
	    	{
	            "data": "sel",
	            "orderable": false,
	            "class":"text-c",
	            "render": function(data,type,row,meta){
	                return '<input type="checkbox" name="col" value="'+row['id']+'">';
	            }
	    	},
	        {"data": "id",
	    	 "class":"text-c"	
	        },
	        {	"data": "typeName",
	        	"class":"text-c",
	        	"render": function(data,type,row,meta){
                	return data+'&nbsp;&nbsp;&nbsp;(<u style="cursor:pointer" onclick="showProducts('+row['id']+')">点击查看该分类产品</u>)'
           	 	}
	        },
	        {	"data": "count",
	        	"class":"text-c"
	        },
	        {"data": "specification",
	        	"class":"text-c",
	        },
	        {
	            "data": "op",
	            "orderable": false, // 禁用排序
	            "class":"text-c",
	            "render": function (data, type, row, meta) {
	                return data = '<button onClick="type_edit('+row['id']+')" class="btn btn-primary btn-sm radius"><i class="Hui-iconfont">&#xe6df;</i>编辑</button>&nbsp;&nbsp;'
	                + '<button onClick="type_del(this,'+row['id']+')" class="btn btn-danger btn-sm radius"><i class="Hui-iconfont">&#xe6e2;</i>删除</button>';
	             }
	      	}
	    ],
	   	"aaSorting": [[ 1, "asc" ]],
		} );
});

function showProducts(id){
	//待续
	layer_show('查看某类型产品','product-list.jsp?type_id1='+id,'1000','500');
}

/*分类删除前核对  
 * 若分类下无产品返回true 
 * 否则false*/
function typeDelCheck(id) {
	var flag;
	$.ajax({
		async : false,
		type: 'POST',
		cache: false,
		url: '../product/typeDeleteCheck',
		data:{"type_id":id},
		dataType: 'json',
		success: function(data){
			flag=data;
		}
	});
	return flag;
}

/*分类-删除*/
function type_del(obj,id){
	if(typeDelCheck(id)){
		var data={"id":id};
		execute('删除1条记录','../type/delete',data,obj);
	} else {
		layer.alert("该分类下尚有产品，不可删除！",{icon:2});
	}
}

function type_dels() {
	var dels=$("input[name='col']:checked");
	if(dels.length==0) return;
	var flag=true;
	dels.each(function(){
		if(!typeDelCheck($(this).val())){
			layer.alert("id为"+$(this).val()+"的分类下尚有产品，不可删除！",{icon:2});
			flag=false;
			return;
		}
	});
	if(flag)
		deleteAll("../type/deletes",dels,false);
}


/*分类-新增*/
function type_add() {
	layer_show('添加分类','product-category-add.jsp','','400');
}

/*分类-编辑*/
function type_edit(id){
	$.ajax({
		async : false,
		type: 'GET',
		cache: false,
		url: '../type/edit',
		data:{"id":id},
		dataType: 'json',
		success: function(data){
			var result='id='+data['id']+'&typeName='+data['typeName']+'&specification='+data['specification'];
			layer_show('编辑分类','product-category-edit.jsp?'+result,'','400');
		}
	});	
		
}

</script>
</body>
</html>