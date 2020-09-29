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
<title>拍卖管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 拍卖管理 <span class="c-gray en">&gt;</span> 竞拍记录 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datasdel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a></span>  </div>
	<div class="mt-20">
		<table id="example" class="table table-border table-bordered table-bg table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="70">ID</th>
					<th width="70">产品名称</th>
					<th width="80">竞拍者</th>
					<th width="120">出价/交保（单位：元）</th>
					<th width="140">竞拍时间</th>
					<th width="120">类型</th>
					<th width="100">操作</th>
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
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="static/js/crud.js"></script>
<script type="text/javascript" src="static/js/dateFormat.js"></script>
<script type="text/javascript">
var table;
$(document).ready(function() {
	table=$('#example').DataTable( {
		"lengthMenu":[5,10,15,20],
		 "bPaginate" : true,
		 "bStateSave" : true,
	    "ajax":{
	    	"type": "GET", 
	    	"url":'../bidding/list'
	    },
	    "columns": [
	    	{
	            "data": "name",
	            "orderable": false,
	            "class":"text-c",
	            "render": function(data,type,row,meta){
	            	var result="<t title='未完成数据，不可删除'>-</t>";
	            	if(row['status']>2)
	            		result='<input type="checkbox" name="col" value="'+row['id']+'">';
	                return result;
	            }
	    	},
	        {"data": "id",
	    	 "class":"text-c"	
	        },
	        { "data": "pro_id.name",
		      "class":"text-c"
		      
	        },
	        {"data": "buyer_id.username",
	        "class":"text-c"
	        },
	        {"data": "money",
	        	"class":"text-c"
	        },
	        {"data": "opTime",
	        	"type":"date",
	        	"class":"text-c",
	        	"render": function (data, type, row, meta) {
	        		var d2=formatFullDate(data);
	        		return d2;
	        	}
	        },
	        {"data": "status",
	        	"class":"text-c",
	        	"render": function(data,type,row,meta){
		    	 	var result='<span class="label label-danger radius">保证金</span>';
		    	 	if(data==1){
		            	result='<span class="label label-primary radius">竞拍</span>';
		    	 	} else if(data==10){
		            	result='<span class="label label-success radius">竞拍成功</span>';
		            } else if(data==11){
		            	result='<span class="label radius">竞拍失败</span>';
		            } else if(data==20){
		            	result='<span class="label label-secondary radius">已退保证金</span>';
		            } else if(data==21){
		            	result='<span class="label label-warning radius">已抵拍卖价</span>';
		            } 
		            return data=result;
	           }
	        },
	        {
	            "data": "op",
	            "orderable": false, // 禁用排序
	            "class":"text-c",
	            "render": function (data, type, row, meta) {
	            	var result='<t title="未完成数据，不可删除">&nbsp;—</t>';
	            	if(row['status']>2)
	            		result='<a style="text-decoration:none" class="ml-5" onClick="bid_del(this,'+row['id']+')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>';
	                return result;
	            }
	      	}
	    ],
	   	"aaSorting": [[ 1, "asc" ]],
		} );
});

function bid_del(obj,id){
	var data={"id":id};
	execute('删除1条记录','../bidding/delete',data,obj);
}

function datasdel(){
	var dels=$("input[name='col']:checked");
	if(dels.length==0) return;
	deleteAll('../bidding/deletes',dels);
} 

</script>
</body>
</html>