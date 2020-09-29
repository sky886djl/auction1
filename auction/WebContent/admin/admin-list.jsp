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
<title>管理员列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span> 管理员列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="admin_add()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe607;</i> 添加管理员</a></span> <span class="r">共有数据：<strong>54</strong> 条</span> </div>
	<div class="mt-20">
	<table id="example" class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="9">员工列表</th>
			</tr>
			<tr class="text-c">
				<th width="50"><input type="checkbox" name="" value=""></th>
				<th width="100">ID</th>
				<th width="120">登录名</th>
				<th width="120">角色</th>
				<th width="120">状态</th>
				<th width="120">操作</th>
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
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
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
	    	"url":'list',
	    },
	    "columns": [
	    	{
	            "data": "name",
	            "orderable": false,
	            "class":"text-c",
	            "render": function(data,type,row,meta){
	            	var result='<input type="checkbox" name="col" value="'+row['id']+'">';
	            	if(row['authority']==0)
	            		result='<t title="不能删除超级管理员">-</t>';
	                return result
	            }
	    	},
	        {"data": "id",
	    	 "class":"text-c"	
	        },
	        {"data": "username",
	        "class":"text-c",
	        "render":function(data, type, row, meta) {
	        	return data='<t class="text-primary">'+data+'</t>';
	        	}
	        },
	        {"data": "authority",
	        	"class":"text-c",
	        	"render": function (data, type, row, meta) {
	        		var authority='超级管理员';
	        		var title='具有至高无上的权力';
	        		switch(data){
	        		case 1:authority='资讯管理员';title='仅对资讯有操作权';break;
	        		case 2:authority='产品管理员';title='仅对产品有操作权';break;
	        		case 3:authority='拍卖管理员';title='仅对拍卖有操作权';break;
	        		case 4:authority='会员管理员';title='仅对会员有操作权';break;
	        		}
	        		
	        		return '<t class="text-primary" title="'+title+'">'+authority+'</t>';
	        	}
	        },
	        {"data": "status",
	        	"class":"text-c",
	        	"render": function(data,type,row,meta){
	    	 	var result='<span class="label radius">已禁用</span>';
	    	 	if(data==1)
	            	result='<span class="label label-success radius">已启用</span>';
	    	 	return data=result;
	           }
	        },
	        {
	            "data": "op",
	            "class":"text-c",
	            "orderable": false, // 禁用排序
	            "render": function (data, type, row, meta) {
	            	var result='<a style="text-decoration:none" onClick="admin_stop(this,'+row['id']+')" href="javascript:;" title="禁用"><i class="Hui-iconfont">&#xe631;</i></a>';
	            	if(row['status']==0){
	            		result='<a style="text-decoration:none" onClick="admin_start(this,'+row['id']+')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe615;</i></a>';
	            	}
	            	if(row['authority']!=0)
	            		result=result+'&nbsp;<a title="删除" href="javascript:;" onclick="admin_del(this,'+row['id']+')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>';
	            	else
	            		result='<t title="不能操作超级管理员">——</t>';
	            	return result;	
	             }
	      	}
	    ],
	   	"aaSorting": [[ 1, "asc" ]],
		} );
});
/*添加管理员*/
function admin_add(){
	layer_show('添加管理员','admin-add.jsp','','400');
}

/*禁用管理员*/
function admin_stop(obj,id) {
	var data={"id":id};
	execute('禁用','forbid',data,obj);
}
/*启用管理员*/
function admin_start(obj,id){
	var data={"id":id};
	execute('启用','activate',data,obj);
}

/*管理员-删除*/
function admin_del(obj,id){
	var data={"id":id};
	execute('删除1条记录','del',data,obj);
}

/*管理员-批量删除*/
function admin_dels(){
	var dels=$("input[name='col']:checked");
	if(dels.length==0) return;
	deleteAll("dels",dels,false);
}


</script>
</body>
</html>