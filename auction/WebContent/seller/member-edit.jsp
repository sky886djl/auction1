<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!--_meta 作为公共模版分离出去-->
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
<!--/meta 作为公共模版分离出去-->

<title>修改信息 </title>
<meta name="keywords" content="kkk">
<meta name="description" content="kkk">
<style type="text/css">
.input5 {
	border-top-color:#ccc;
	    border-right-color:#ccc;
	    border-bottom-color:#ccc;
	    border-left-color:#ccc;
	    border-top-width:1px;
	    border-right-width:1px;
	    border-bottom-width:1px;
	    border-left-width:1px;
	    border-top-style:solid;
	    border-right-style:solid;
	    border-bottom-style:solid;
	    border-left-style:solid;
  	color: #666464;
	height: 114px;
	width:378px;
	font:16px "微软雅黑"
}
</style>
</head>
<body >
<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
<article class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-member-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">拍卖号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<label>${seller.username }</label>
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${seller.tel }" placeholder="" id="tel" name="tel" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${seller.email }" placeholder="@" name="email" id="email" />
			</div>
		</div>
		
        <div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>昵称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${seller.name }" placeholder="zhangsan" name="name" id="name">
				<div>
					<a onclick="javascript:loadName()" style="cursor:pointer ">换一个</a>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<input name="sex" type="radio" id="sex-1" value="男">
					<label for="sex-1">男</label>
				</div>
				<div class="radio-box">
					<input name="sex" type="radio" id="sex-2" value="女" >
					<label for="sex-2">女</label>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>年龄：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${seller.age }"  name="age" id="age">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select id="prov" name="prov" class="select2" onchange="showCity(this)">
	                	<option>-请选择省份-</option>
	           		</select>
	 
		            <!--城市选择-->
		            <select id="city" name="city" class="select2" onchange="showCountry(this)">
		                <option>-请选择城市-</option>
		            </select>
		 
		            <!--县区选择-->
		            <select id="country" name="country" class="select2" onchange="selecCountry(this)">
		                <option>-请选择县区-</option>
		            </select>
		             <input id="address" name="address" type="hidden" value="${seller.address }" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>简介：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea class="input5" id="declaration" name="declaration">${seller.declaration }</textarea>
			</div>
		</div>
		
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input id="submit1" class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
				<input class="btn btn-default radius" type="button" onclick="javascript:location.replace(location.href);" value="&nbsp;&nbsp;重置&nbsp;&nbsp;">
			</div>
		</div>
		
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="static/js/crud.js"></script>
<script type="text/javascript" src="../bidder/js/chinaProCity.js" ></script>
<script type="text/javascript">
function getById(str) {
    return document.getElementById(str);
}
 
var prov = getById('prov');
var city = getById('city');
var country = getById('country'); 
/*用于保存当前所选的省市区*/
var current = {
    prov: '',
    city: '',
    country: ''
};
var address=document.getElementById('address');
if(address.value.split(' ').length==3){
	var ads=address.value.split(' ');
	 var provOpt = document.createElement('option');
     provOpt.innerText = ads[0];
     provOpt.value = -1;
     prov.appendChild(provOpt);
     prov.options[1].selected=true;
     
     provOpt = document.createElement('option');
     provOpt.innerText = ads[1];
     provOpt.value = -1;
     city.appendChild(provOpt);
     city.options[1].selected=true;
     
     provOpt = document.createElement('option');
     provOpt.innerText = ads[2];
     provOpt.value = -1;
     country.appendChild(provOpt);
     country.options[1].selected=true;
}
/*自动加载省份列表*/
(function showProv() {
    var len = provice.length;
    for (var i = 0; i < len; i++) {
        var provOpt = document.createElement('option');
        provOpt.innerText = provice[i]['name'];
        provOpt.value = i;
        prov.appendChild(provOpt);
    }
})();
 
/*根据所选的省份来显示城市列表*/
function showCity(obj) {
    var val = obj.options[obj.selectedIndex].value;
    if (val != current.prov) {
        current.prov = val;
    }
    //console.log(val);
    if (val != null) {
        city.length = 1;
        var cityLen = provice[val]["city"].length;
        for (var j = 0; j < cityLen; j++) {
            var cityOpt = document.createElement('option');
            cityOpt.innerText = provice[val]["city"][j].name;
            cityOpt.value = j;
            city.appendChild(cityOpt);
        }
    }
}
 
/*根据所选的城市来显示县区列表*/
function showCountry(obj) {
    var val = obj.options[obj.selectedIndex].value;
    current.city = val;
    if (val != null) {
        country.length = 1; //清空之前的内容只留第一个默认选项
        var countryLen = provice[current.prov]["city"][val].districtAndCounty.length;
        if (countryLen == 0) {
            return;
        }
        for (var n = 0; n < countryLen; n++) {
            var countryOpt = document.createElement('option');
            countryOpt.innerText = provice[current.prov]["city"][val].districtAndCounty[n];
            countryOpt.value = n;
            country.appendChild(countryOpt);
        }
    }
}
 
/*选择县区之后的处理函数*/
function selecCountry(obj) {
    current.country = obj.options[obj.selectedIndex].value;
	address.value=provice[current.prov]['name']+' '+provice[current.prov]['city'][current.city].name+
			' '+provice[current.prov]["city"][current.city].districtAndCounty[current.country];
}
 

function loadName() {
	var names=[  '清梦小轩 ぺ灬',
   		'☆会飞的鱼☆',
	      '咜不々爱ωǎ',
	       '╰→消失嘚美俪',
	       '为?爱?变乖 ♂',
	       'じ☆天使☆じ ㄞ',
	       '☆尛宀贝ㄣ',
	      '☆星雨悠悠℃',
	       '→＼咘懂の爱',
	       '六瓣═→ 丁香',
	       'ㄗs 绝恋 oО',
	      'ヅ坏気⑽哫\'',
	       '柠檬草精铃',
	       '墨尔本°晴の',
	       '___尛羙°猫',
	       '__汏馒头',
	       '∨_______尜尜',
	       '___Rubby丶',
	       '∨___猫°',
	       '雪花拥抱阳光',
	     　　'看海听风',
	     　　'阳光触碰嘴角的弧度 |▍',
	     　　'┆靜侯メ輪徊',
	     　　'〃温暖了心ぐ',
	     　　'每①天都是↗开始',
	     　　'该梦归何处',
	     　　'唯愿时光清浅',
	     　　'记忆中丶谁把流年搁浅',
	     　　'繁华散零、落散为止',
	     　　'Teas are loneliness',
	     　　'梦已非',
	     　　'最好的结果是如果',
	     　　'光影散落的流年',
	     　　'、惜你如梦|丶',
	     　　'梦念人.',
	     　　'光年与夏的初遇。',
	     　　'▲夢與遠方△',
	     　　'迷失的高跟鞋ゞ',
	     　　'▁▁X灬奶茶',
	     　　'╄→星空物语の',
	     　　'花花世界╄→︶ㄣ',
	     　　'青涩の年华',
	     　　'【 过去很美 】',
	     　　'几世轮回§',
	     　　'蓝调调',
	     　　'坚强的坚强ゝ',
	     　　'以最美的姿势、与烟花共舞',
	     　　'━End。 思念',
	     　　'爱怜你的美〆',
	     　　'剪不斷的情誼',
	     　　'| ㄒ乜 | ㄝ乜',
	     　　'末班车',
	     　　'小七情',
	     　　'黑蓮花',
	     　　'脱单季',
	     　　'夏天的风i',
	     　　'微如塵埃',
	     　　'‖相伴流年*',
	     　　'①嚸嚸',
	     　　'专业剪刀手20年!',
	     　　'酒醉人爱销魂',
	     　　'花未眠',
	     　　'雨熏柠檬树香烟',
	     　　'苦瓜汁',
	     　　'荒岛初冬',
	     　　'上帝↘掉给硪一个大帅锅！',
	     　　'微微一笑︶°',
	     　　'╰看淡ㄋy所有',
	     　　'╰つ没心没肺活着多累ら',
	     　　'そ毁忆い',
	     　　'夏季死去的花 丶',
	     　　'灰色地域',
	     　　'倾城月光淡如水﹏',
	     　　'以云为纸',
	     　　'葬泪花末雨纷霏',
	     　　'-日光驱逐丶我为谁停留',
	     　　'一枕清风梦绿萝',
	     　　'嗜梦少年的空城写歌。',
	     　　'-逆徒°',
	     　　'佐手、',
	     　　'ζ 缠绵',
	     　　'溺渁∝',
	     　　'九渊',
	     　　'┛ωǒメ坚强',
	     　　'淡陌丶 幽瑟玉琼情殇',
	     　　'枯叶蝶的伤。',
	     　　'妾本良人i',
	     　　'_、岁月负缠绵 ╮',
	     　　'踏青',
	     　　'没有梦想何必远方',
	     　　'孤独的造梦者',
	     　　'一切从零开始',
	     　　'要一直坚持呀！',
	     　　'耐性与骨气',
	     　　'在孤单中奋斗',
	     　　'衍夏成歌',
	     　　'每一寸你',
	     　　'旋转的摩天轮，巴黎的印象',
	     　　'客串情人。',
	     　　'海沫深@',
	     　　'天长地久、也不久ゝ',
	     　　'℡漠染丶颜色√',
	     　　'♀回忆的美好ＬХＥ',
	     　　'人不风流枉少年',
	     　　'梦开始不甜。',
	     　　'Laugh away',
	     　　'ぉ被判兂萋ゞ',
	     　　'徊憶說、讓涐莣ㄋ伱',
	     　　'┽→謌的咾嘙很酷﹏',
	     　　'妳就我唯壹',
	     　　'┉西海情謌┈',
	     　　'蕞惢痛菂秂',
	     　　'侑點尐悲伤︷',
	     　　'╬温柔ㄡネ申ωυ',
	     　　'傲性小仙女',
	     　　'﹎殘月卐殺手',
	     　　'你被写在我的心里',
	     　　'晴鸢',
	     　　'浅夏﹌雨中弥漫着花香',
	       ];
	$('#name').val(names[Math.floor(Math.random()*19)]);
}
$(function(){
	$("input[name='sex'][value='${seller.gender}']").prop("checked",'checked'); 
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	$.validator.addMethod("provTest",function(value,element){  
	    if(value=='-请选择省份-')
	    	return false;
	    return true;
	},"请选择省份");
	
	$.validator.addMethod("cityTest",function(value,element){  
	    if(value=='-请选择城市-')
	    	return false;
	    return true;
	},"请选择城市");
	
	$.validator.addMethod("countryTest",function(value,element){  
	    if(value=='-请选择县区-')
	    	return false;
	    return true;
	},"请选择县区");
	$("#form-member-add").validate({
		rules:{
			tel:{
				required:true,
				isMobile:true,
				remote:{
					type:'POST',
					url:'../user/telUnique',
					data:{
						tel:function(){return $('#tel').val();},
						tel2:function(){return '${seller.tel}'}
					}
				}
			},
			email:{
				required:true,
				email:true,
				remote:{
					type:'POST',
					url:'../user/emailUnique',
					data:{
						email:function(){return $('#email').val();},
						email2:function(){return '${seller.email}'}
					}
				}
			},
			name:{
				required:true
			},
			age:{
				required:true,
				number:true,
				digits:true,
				min:0,
				max:100
			},
			prov:{
				provTest:true
			},
			city:{
				cityTest:true
			},
			country:{
				countryTest:true
			}
		},
		messages:{
			tel:{
				remote:'该手机号已绑定其他账户'
			},
			email:{
				remote:'该邮箱已绑定其他用户'
			},
			age:{
				digits:'只能输入整数'
			}
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			var data={
				"id":'${seller.id}',
				"tel":$('#tel').val(),
				"email":$('#email').val(),
				"name":$('#name').val(),
				"age":$('#age').val(),
				"gender":$("input:radio[name='sex']:checked").val(),
				"address":$("#address").val(),
				"declaration":$("#declaration").val()
			};
			execute1('更新','../user/update1/0',data);
		}
	});
	
});


</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>