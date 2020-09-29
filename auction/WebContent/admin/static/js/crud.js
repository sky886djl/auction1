/**
*	ajax 增删改查方法
*/

/**
 * 
 * @param msg 新增 保存等  
 * 用户新增和更新
 * @param url
 * @param data
 * @returns
 */
function execute1(msg,url,data) {
	$.ajax({
		async : false,
		type: 'POST',
		cache: false,
		url: url,
		data:JSON.stringify(data),
		dataType: 'json',
		contentType : 'application/json;charset=UTF-8',
		success: function(data){
			if(data){
				layer.alert(msg+"成功！",{icon:6},function(){
					window.parent.location.reload();//刷新父页面
					var index=parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
					if(msg=='注册'){
						location.href="index.jsp";
					}
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


/**
 * 执行  删除、禁用、激活等
 * @param type 描述
 * @param url 地址
 * @param data 参数
 * @param obj 表格某行对象
 * @returns
 */
function execute(type,url,data,obj) {
	layer.confirm('确认要'+type+'吗？',function(index){
		$.ajax({
			async : false,
			type: 'POST',
			cache: false,
			url: url,
			data: data,
			dataType: 'json',
			success: function(data){
				if(data){
					if(type=='删除')
						$(obj).parents("tr").remove();
					layer.msg('已'+type+'!',{icon:6,time:1000});
				} else{
					layer.msg(type+'失败!',{icon:2,time:1000});
				}
			}
		});	
		table.ajax.reload(null,false);
	});
	
}

/**
 * 批量删除
 * @returns
 */
function deleteAll(url,dels) {
	execute0(url,dels,false,false,'删除');
}

/**
 * 批量删除 flag
 * @param flag =true为真删除  =false为假删除
 * @returns
 */
function deleteAll1(url,dels,flag) {
	execute0(url,dels,flag,true,'删除');
}

/**
 * 
 * @param url
 * @param dels
 * @param flag =true为真删除  =false为假删除
 * @param type =true时有参数flag,=false时无参数flag 
 * @returns
 */
function execute0(url,dels,flag,type,msg) {
	layer.confirm('确认要'+msg+dels.length+'条记录吗？',function(index){
		var ids=new Array();
		dels.each(function(){
			ids.push($(this).val());
			$(this).parents("tr").remove();
		});
		var params={"ids":ids};
		if(type){
			params={"ids":ids,"flag":flag};
		} 
		//console.log(JSON.stringify(params));
		$.ajax({
			async : false,
			cache: false,
			traditional:true,//防止深度序列化
			type: 'POST',
			data: params,
			url: url,
			dataType: 'json',
			success: function(data){
				if(data){
					layer.msg('已'+msg+dels.length+'条记录!',{icon:1,time:1000});
				} else{
					layer.msg(msg+'失败!',{icon:2,time:1000});
				}
			}
		});
		table.ajax.reload(null,false);
	});  
}

/**
 * 显示用户
 * type=0查看用户
 * type=1编辑用户
 * @returns
 */
function show_member(id,type){
	$.ajax({
		async : false,
		type: 'GET',
		cache: false,
		url: '../user/show',
		data:{"id":id},
		dataType: 'json',
		success: function(data){
			var result='username='+data['username']+'&name='+data['name']+
			'&gender='+data['gender']+'&age='+data['age']+'&tel='+data['tel']+
			'&email='+data['email'];
			if(type==0){
				result=result+'&headpic='+data['headpic']+'&account='+data['account']+
				'&declaration='+data['declaration']+'&address='+data['address']
				layer_show('查看用户','member-show.jsp?'+result,'360','420');
			}
			else{
				result=result+'&password='+data['password']+'&id='+data['id'];
				layer_show('编辑用户','member-edit.jsp?'+result,'','510');
			}
		}
	});	
}

function changePwd(type,pwd){
	var url;
	if(type==0){//管理员修改密码
		url='pwdChange';
	} else if(type==1){//用户修改密码
		url='../user/pwdChange';
	} 
	$.ajax({
		async : false,
		type: 'POST',
		cache: false,
		url: url,
		data:{"password":pwd},
		dataType: 'json',
		success: function(data){
			if(data){
				layer.alert('修改密码成功!',{icon:1},function(){
					window.parent.location.reload();//刷新父页面
					var index=parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
				});
				
			} else {
				layer.alert('修改密码失败!',{icon:2},function(){
					window.parent.location.reload();//刷新父页面
					var index=parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
				});
			}
		}
	});	
}


/**
 * 显示产品
 * type=0查看产品
 * type=1编辑产品
 * @returns
 */
function show_product(id,type){
	$.ajax({
		async : false,
		type: 'GET',
		cache: false,
		url: '../product/show',
		data:{"id":id},
		dataType: 'json',
		success: function(data){
			var result='username='+data['username']+'&name='+data['name']+
			'&gender='+data['gender']+'&age='+data['age']+'&tel='+data['tel']+
			'&email='+data['email'];
			if(type==0){
				result=result+'&headpic='+data['headpic']+'&account='+data['account']+
				'&declaration='+data['declaration']+'&address='+data['address']
				layer_show('查看用户','member-show.jsp?'+result,'360','420');
			}
			else{
				result=result+'&password='+data['password']+'&id='+data['id'];
				layer_show('编辑用户','member-edit.jsp?'+result,'','510');
			}
		}
	});	
}



