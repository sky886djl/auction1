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
<title>资讯列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 资讯管理 <span class="c-gray en">&gt;</span> 资讯列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="javascript:;" onclick="article_dels()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
			<a class="btn btn-primary radius" data-title="添加资讯" onclick="article_show('添加资讯','article-add.jsp','1050','550')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加资讯</a>
		</span> 
		<span class="r">共有数据：<strong id="totalCount">18</strong> 条
		</span> 
	</div>
	<div class="mt-20">
		<table id="example" class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">
					<th width="5%"><input type="checkbox" name="" value=""></th>
					<th width="5%">ID</th>
					<th width="25%">标题</th>
					<th width="15%">发布时间</th>
					<th width="10%">文章类别</th>
					<th width="10%">浏览次数</th>
					<th width="10%">状态</th>
					<th width="15%">操作</th>
					
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
	    	"url":'../article/list1'
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
	        {"data": "title",
	        "class":"text-c",
	        "render": function (data, type, row, meta) {
	        		if(data.length>24){
	        			data=data.substring(0,22)+'...';
	        		}
	    			return data='<u style="cursor:pointer" class="text-primary" onClick="show('+row['id']+')" title="查看">'+data+'</u>';
	    		}
	        },
	        {"data": "releaseTime",
	        	"type":"date",
	        	"class":"text-c",
	        	"render": function (data, type, row, meta) {
	        		var d1=formatDate(data);
	        		return d1;
	        	}
	        },
	        {"data": "category",
	         "class":"text-c",
	         "render": function(data,type,row,meta){
	        	 	var result='系统消息';
	        	 	if(data==0)
	                	result='新闻公告';
	        	 	else if(data==1)
	        	 		result='拍卖结果';
	        	 	return data=result;
	             }
	        },
	        {"data": "browseTimes","class":"text-c" },
	        {"data": "status",
	        	"class":"text-c",
	        	"render": function(data,type,row,meta){
	    	 	var result='<span class="label radius">草稿</span>';
	    	 	if(data==1)
	            	result='<span class="label label-success radius">已发布</span>';
	    	 	return data=result;
	           }
	        },
	        {
	            "data": "op",
	            "orderable": false, // 禁用排序
	            "class":"text-c",
	            "render": function (data, type, row, meta) {
	                return data = '<button onClick="article_edit('+row['id']+')" class="btn btn-primary btn-sm radius"><i class="Hui-iconfont">&#xe6df;</i>编辑</button>&nbsp;&nbsp;'
	                + '<button onClick="article_del(this,'+row['id']+')" class="btn btn-danger btn-sm radius"><i class="Hui-iconfont">&#xe6e2;</i>删除</button>';
	             }
	      	}
	    ],
	   	"aaSorting": [[ 1, "asc" ]],
		} );
});

/* function count(){
	$("#totalCount").html(table.page.info().recordsTotal);
} */

/*资讯-编辑 添加 查看*/
function article_show(title,url,w,h){
	layer_show(title,url,w,h);
}

/*查看与编辑共有方法  flag=true为查看  flag=false为编辑 */
function show_edit_common(id,flag){
	$.ajax({
		async : false,
		type: 'GET',
		cache: false,
		url: '../article/show',
		data:{"id":id},
		dataType: 'json',
		success: function(data){
			var releaseTime=formatFullDate(data['releaseTime']);
			if(flag){
				var type='新闻公告';
				if(data['category']==1)
					type='拍卖结果';
				else if(data['category']==2)
					type='系统消息';
				var result='title='+data['title']+'&category='+type
							+'&browseTimes='+data['browseTimes']+'&releaseTime='
							+releaseTime+'&content='+data['content']+'&admin_id='+data['admin_id'];
				article_show('查看','article-show.jsp?'+result,'1050','550');
			}
			else {
				var result='title='+data['title']+'&content='+data['content']+'&category='
				+data['category']+'&id='+data['id']+'&releaseTime='+releaseTime;
				article_show('编辑','article-edit.jsp?'+result,'1050','550');
			}
		}
	});	
	table.ajax.reload(null,false);
}

/**查看 */
function show(id){
	show_edit_common(id,true);
}

/**资讯-编辑 */
function article_edit(id){
	show_edit_common(id,false);
}

/*资讯-删除*/
function article_del(obj,id){
	var data={"id":id};
	execute('删除1条记录','../article/delete',data,obj);
}


/*资讯-批量删除*/
function article_dels(){
	var dels=$("input[name='col']:checked");
	if(dels.length==0) return;
	deleteAll("../article/deletes",dels);
}





</script>
</body>
</html>