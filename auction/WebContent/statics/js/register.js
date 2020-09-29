function load(){
	var sel = $('sel');
	for(var i=0;i<100;i++){
		var opt=document.createElement('option');
		opt.value=i;
		opt.innerHTML=i;
		sel.appendChild(opt);
	}
	sel.options[22].selected=true;
	if(age!=null)
		sel.options[age].selected=true;
}
function $(id){
	return document.getElementById(id)
}

function checkTel(tel){
	var vartel=tel.value;
	var vartelreg = /^1[3|4|5|8][0-9]\d{8}$/;
	// 判断
	if (vartel.length <= 0) {
		$('telspan').innerHTML = "<font	class='font1'>手机号不能为空</font>";
		return false;
	} else if (vartelreg.test(vartel)) {
		$('telspan').innerHTML = "<font class='font2'>√</font>";
		return true;
	} else {
		$('telspan').innerHTML = "<font	class='font1'>手机号由11位数字组成</font>";
		return false;
	}
}

function checkEmail(email){
	var varemail=email.value;
	var varemailreg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+[\.][a-zA-Z0-9_-]+$/;
	// 判断
	if (varemail.length <= 0) {
		$('emailspan').innerHTML = "<font class='font1'>邮箱不能为空</font>";
		return false;
	} else if (varemailreg.test(varemail)) {
		$('emailspan').innerHTML = "<font class='font2'>√</font>";
		return checkTel($('tel'));
	} else {
		$('emailspan').innerHTML = "<font class='font1'>请输入正确格式的邮箱</font>";
		return false;
	}
}

function checkPwd1(pwd) {
	// 获取密码输入框对象的值
	var varpwd = pwd.value;
	// 声明正则表达式
	var varpwdreg = /^\w{6,12}$/ig;
	// 判断
	if (varpwd.length <= 0) {
		$('pwd1span').innerHTML = "<font class='font1'>密码不能为空</font>";
		return false;
	} else if (varpwdreg.test(varpwd)) {
		$('pwd1span').innerHTML = "<font class='font2'>√</font>";
		return checkEmail($('email'));
	} else {
		$('pwd1span').innerHTML = "<font class='font1'>密码长度6~12</font>";
		return false;
	}
}
function checkPwd2(pwd) {
	// 获取密码输入框对象的值
	var varpwd = pwd.value;
	// 判断
	if(varpwd.length==0){
		$('pwd2span').innerHTML = "<font class='font1'>密码不能为空</font>";
		return false;
	}else if (varpwd==$('pwd1').value) {
		$('pwd2span').innerHTML = "<font class='font2'>√</font>";
		return checkPwd1($('pwd1'))&&checkEmail($('email'));
	} else  {
		$('pwd2span').innerHTML = "<font class='font1'>两次密码输入不一致</font>";
		return false;
	}
}

function checkName(name){
	var varname=name.value;
	var varnamereg = /[\u4e00-\u9fa5]{2,15}/;
	// 判断
	if (varname.length <= 0) {
		$('namespan').innerHTML = "<font class='font1'>姓名不能为空</font>";
		return false;
	} else if (varnamereg.test(varname)) {
		$('namespan').innerHTML = "<font class='font2'>√</font>";
		return checkPwd2($('pwd2'));
	} else {
		$('namespan').innerHTML = "<font class='font1'>姓名由2~15个汉字组成</font>";
		return false;
	}
}


function checkAddress(address) {
	var varaddress = address.value;
	if (varaddress.length == 0) {
		$('addressspan').innerHTML = "<font class='font1'>地址不能为空 </font>";
		return false;
	} else {
		$('addressspan').innerHTML =  "<font class='font2'>√</font>";
		return checkName($('name'));
	}

}

// 添加用户
function checkAll() {
	 return checkAddress($('address'))
}

function checkBox(checkBox){
	if(checkBox.checked==false){
		$('submit').style.background ="gray";
		$('submit').disabled=true;
	} else{
		$('submit').style.background ="#C81F26"
		$('submit').disabled=false;
	}
}
