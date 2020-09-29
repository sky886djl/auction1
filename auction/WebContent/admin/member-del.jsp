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
<title>删除的用户</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 删除的用户<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="member_dels()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>&nbsp;<a href="javascript:;" onclick="member_backs()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe66b;</i>批量还原</a> </span> <span class="r">共有数据：<strong>88</strong> 条</span> </div>
	<div class="mt-20">
	<table id="example" class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="4%"><input type="checkbox" name="" value=""></th>
				<th width="8%">ID</th>
				<th width="10%">头像</th>
				<th width="10%">用户名</th>
				<th width="10%">手机</th>
				<th width="16%">邮箱</th>
				<th width="16%">地址</th>
				<th width="10%">状态</th>
				<th width="16%">操作</th>
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
	    	"url":'../user/list',
	    	"data":{"flag":false}
	    },
	    "columns": [
	    	{
	            "data": "name",
	            "orderable": false,
	            "class":"text-c",
	            "render": function(data,type,row,meta){
	                return '<input type="checkbox" name="col" value="'+row['id']+'">';
	            }
	    	},
	        {"data": "id",
	    	 "class":"text-c"	
	        },
	        {"data": "headpic",
		        "class":"text-c",
		        "orderable": false,
		        "render": function (data, type, row, meta) {
		        	return '<u style="cursor:pointer" class="text-primary" onClick="member_show('+row['id']+')" title="查看">'+"<img src='static/img/"+data+"' width='60px' height='60px'/></u>";
		    		}
		    },
	        {"data": "username",
	        	"class":"text-c",
	        	"render": function (data, type, row, meta) {
	        		return data='<u style="cursor:pointer" class="text-primary" onClick="member_show('+row['id']+')" title="查看">'+data+'</u>';
	        	}
	        },
	        {"data": "tel","class":"text-c"},
	        {"data": "email","class":"text-c" },
	        {"data":"address","class":"text-c",
	        	"render":function(data, type, row, meta) {
	        			if(data.length>11){
	        				data=data.substring(0,10)+'...';
	        			}
	        			return data;
	        		},
	        },
	        {"data": "status",
	        	"class":"text-c",
	        	"orderable": false,
	        	"render": function(data,type,row,meta){
	    	 	return data='<span class="label label-danger radius">已删除</span>';
	           }
	        },
	        {
	            "data": "op",
	            "class":"text-c",
	            "orderable": false, // 禁用排序
	            "render": function (data, type, row, meta) {
	            	return data='<a style="text-decoration:none" href="javascript:;" onClick="member_huanyuan(this,'+row['id']+')" title="还原"><i class="Hui-iconfont">&#xe66b;</i></a>&nbsp;'+
	            				'<a title="删除" href="javascript:;" onclick="member_del(this,'+row['id']+')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>';
	             }
	      	}
	    ],
	   	"aaSorting": [[ 1, "asc" ]],
		} );
});


/*用户-还原*/
function member_huanyuan(obj,id){
	var data={"id":id};
	execute('还原','../user/activate',data,obj);
}
/*查看*/
function member_show(id){
	show_member(id,0);
}

/*用户-删除*/
function member_del(obj,id){
	var data={"id":id,"flag":true};
	execute('删除1条记录','../user/delete',data,obj);
}

/*批量删除*/
function member_dels(){
	var dels=$("input[name='col']:checked");
	if(dels.length==0) return;
	deleteAll1("../user/deletes",dels,true);
}

/*用户-批量还原*/
function member_backs() {
	var backs=$("input[name='col']:checked");
	if(backs.length==0) return;
	execute0('../user/activates',backs,false,false,'还原');
}


</script> 
</body>
</html>