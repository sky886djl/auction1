<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

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
<title>产品列表</title>
<link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body class="pos-r">

<div>
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 产品列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="product_dels()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
			<a class="btn btn-primary radius" onclick="product_add('添加产品','product-add.jsp', '1000', '500')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加产品</a></span> <span class="r">共有数据：<strong>54</strong> 条</span> </div>
		<div class="mt-20">
			<table id="example" class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="40"><input name="" type="checkbox" value=""></th>
						<th width="40">ID</th>
						<th width="60">缩略图</th>
						<th width="100">产品名称</th>
						<th width="60">发布人</th>
						<th width="60">起拍价（元）</th>
						<th width="60">当前价（元）</th>
						<th width="110">起拍时间</th>
						<th width="110">结束时间</th>
						<th width="100">产品类型</th>
						<th width="80">状态</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="static/js/dateFormat.js"></script>
<script type="text/javascript" src="static/js/crud.js"></script>
<script type="text/javascript">
var table;
$(document).ready(function() {
	var url;
	var data;
	var param='${param.type_id1}';
	if(typeof param == "undefined" || param == null || param == ""){
		url='../product/list1';
	}
	else {
		data={"type_id":param};
		url='../product/getProductsByType';
	}
	table=$('#example').DataTable( {
		"lengthMenu":[5,10,15,20],
		 "bPaginate" : true,
		 "bStateSave" : true,
	    "ajax":{
	    	"type": "GET", 
		 	"data":data,
	    	"url":url
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
	        {"data": "pic_url",
	        "class":"text-c",
	        "orderable": false,
	        "render": function (data, type, row, meta) {
	    			return data='<u style="cursor:pointer" class="text-primary" onClick="product_show('+row['id']+')" title="查看产品"><img src="../statics/images/product/'+data.split(";")[0]+'" width="60px" height="60px" /></u>';
	    		}
	        },
	        {"data": "name",
	        	"class":"text-c",
	        	"render": function (data, type, row, meta) {
	        		return data='<u style="cursor:pointer" class="text-primary" onClick="product_show('+row['id']+')" title="查看产品">'+data+'</u>';
	        	}
	        },
	        {"data": "seller_id.username","class":"text-c",
	        "render": function (data, type, row, meta) {
	        		return data='<u style="cursor:pointer" class="text-primary" onClick="member_show('+data+')" title="查看用户">'+data+'</u>';
	        	}
	        },
	        {"data": "initialPrice","class":"text-c" 
	        },
	        {"data":"nowPrice","class":"text-c"
	        },
	        {"data":"start_time",
	        	"type":"date",
	        	"class":"text-c",
	        	"render": function (data, type, row, meta) {
	        		var d1=formatDate(data);
	        		return d1;
	        	}
	        },
	        {"data":"deadline",
	        	"type":"date",
	        	"class":"text-c",
	        	"render": function (data, type, row, meta) {
	        		var d1=formatDate(data);
	        		return d1;
	        	}
	        },
	        {"data": "type_id.typeName",
	        	"class":"text-c"
	        },
	        {"data": "status",
	        	"class":"text-c",
	        	"render": function(data,type,row,meta){
	        	//0-已下架 1-已发布 11-今日拍卖 12即将开始 2-待审核 3-假删除 4-已结束
	    	 	var result=null;
	        	if(data==0){
	        		result='<span class="label radius">已下架</span>';
	        	} else if(data==11||data==12){
	            	result='<span class="label label-success radius">已发布</span>';
	        	} else if(data==2){
	        		result='<span class="label label-secondary radius">待审核</span>';
	        	} else if(data==4){
	        		result='<span class="label radius">已结束</span>';
	        	}
	    	 	return result;
	           }
	        },
	        {
	            "data": "op",
	            "class":"text-c",
	            "orderable": false, // 禁用排序
	            "render": function (data, type, row, meta) {
	            	//-- 0-已下架 已发布(11-今日拍卖 12即将开始) 2-待审核 3-假删除 4-已结束
	            	var result=null;
	            	if(row['status']==11||row['status']==12){
	            		result='<a style="text-decoration:none" onClick="product_stop(this,'+row['id']+')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>';
	            	} else if(row['status']==0){
	            		result='<a style="text-decoration:none" onClick="product_start(this,'+row['id']+')" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>';
	            	} else if(row['status']==2){
	            		result='<a style="text-decoration:none" onClick="product_shenhe(this,'+row['id']+')" href="javascript:;" title="审核"><i class="Hui-iconfont">&#xe615;</i></a>';
	            	} else if(row['status']==4){
	            		result='';
	            	}
	                return data = result+
	                '&nbsp;<a title="编辑" href="javascript:;" onclick="product_edit(this,'+row['id']+')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>'+
	                '&nbsp;<a title="删除" href="javascript:;" onclick="product_del(this,'+row['id']+')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>'
	             }
	      	}
	    ],
	   	"aaSorting": [[ 1, "asc" ]],
		} );
});

/*产品-添加*/
function product_add(title,url,w,h){
	layer_show(title,url,w,h);
}

/*产品-申请上线*/
function product_shenqing(obj,id){
	
}

/*产品-审核*/
function product_shenhe(obj,id){
	
}
/*产品-下架*/
function product_stop(obj,id){
	var data={"id":id};
	execute('下架','../product/downShelf',data,obj);
}

/*产品-发布*/
function product_start(obj,id){
	var data={"id":id};
	execute('发布','../product/release',data,obj);
}

/*产品-编辑*/
function product_edit(title,url,w,h){
	layer_show(title,url,w,h);
}

/*产品-删除*/
function product_del(obj,id){
	var data={"id":id,"flag":false};
	execute('删除','../product/delete',data,obj);
}

/*产品-批量删除*/
function product_dels(obj,id){
	var dels=$("input[name='col']:checked");
	if(dels.length==0) return;
	deleteAll1("../product/deletes",dels,false);
}


function product_show(id){
	
}

/*通过用户名查看用户*/
 function member_show(username){
	 $.ajax({
			type: 'GET',
			url: '../user/getIdByUsername',
			data:{"username":username},
			dataType: 'json',
			success: function(data){
				show_member(data,0);
			}
	});		
	
}
 
</script>
</body>
</html>