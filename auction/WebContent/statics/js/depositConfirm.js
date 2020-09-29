function checkAll(id){
	var c1=document.getElementById('checkbox1');
	var c2=document.getElementById('checkbox2');
	if(!c1.checked){
		document.getElementById('checkinfo1').innerHTML='*请确认符合条件';
	}
	if(!c2.checked){
		document.getElementById('checkinfo2').innerHTML='*请确认符合条件';
	}
	var pwdok=checkPwd();
	if(c1.checked&&c2.checked&&pwdok){
		location.href='product/depositConfirm/'+id;
	}
}
function checkboxChange1(ob){
	if(ob.checked){
		document.getElementById('checkinfo1').innerHTML='';
	} else {
		document.getElementById('checkinfo1').innerHTML='*请确认符合条件';
	}
	
}


function checkboxChange2(ob){
	if(ob.checked){
		document.getElementById('checkinfo2').innerHTML='';
	} else {
		document.getElementById('checkinfo2').innerHTML='*请确认符合条件';
	}
	
}
function checkPwd() {
	var pwd = document.getElementById('pwd').value;
	if(pwd.length==0){
		document.getElementById('pwdspan').innerHTML='密码不能为空';
		return false;
	}
	else if (pwd == pwd1) {
		return true;
	} else {
		document.getElementById('pwdspan').innerHTML='密码错误';
		document.getElementById('pwd').value = '';
		return false
	}
}
