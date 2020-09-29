<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/bidder/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>zone</title>
		<base href="<%=basePath%>" />
		<link rel="stylesheet" href="css/common.css" />
		<link rel="stylesheet" href="css/changemyInfo.css" />
	</head>

	<body>
	<c:choose>
		<c:when test="${bidder==null }">
			<c:redirect url="../product/list"></c:redirect>
		</c:when>
	</c:choose>
	<jsp:include page="top.jsp"></jsp:include>
		<div class="main" id="main">
			<div class="mainTitle">修改资料</div>
		<hr class="mainTitleLine"/>
		<form id="info-edit" action="" method="post">
			<div class="elements">
				<div class="userId">拍卖号：${bidder.username }
				</div>
				<div class="elem">昵称：
					<input type="text" id="name" name="name" class="input4" value="${bidder.name }"/>
					<a onclick="javascript:loadName()" style="cursor:pointer;color:dodgerblue" >换一个</a>
				</div>
				<div class="elem" >性别：
					<label><input name="gender" type="radio" value="男" />男 </label> 
					<label><input name="gender" type="radio" value="女" />女 </label> 
				</div>
				<div class="elem">年龄：<input type="text" id="age" name="age" value="22" class="input4"/></div>
				<div class="elem">手机：<input type="text" id="tel" name="tel" value="${bidder.tel }"  class="input4"/></div>
				<div class="elem">邮箱：<input type="text" id="email" name="email" value="${bidder.email }"   class="input4"/></div>
				<div class="elem">地址：
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
		            <input id="address" name="address" type="hidden" value="${bidder.address }" />
				</div>
				<div class="elem">
					简介：
					<div class="intro">
						<textarea class="input5" id="declaration" name="declaration">${bidder.declaration }</textarea>
					</div>
				</div>
			</div>
			<div class="btnpo">
				<input type="submit" value="保存" class="button" />
				<input type="reset" value="取消"  class="button2"  />
			</div>
		</form>
	
		</div>
		<script type="text/javascript" src="js/chinaProCity.js" ></script>
		<script type="text/javascript" src="js/changmyInfo.js" ></script>
		<script type="text/javascript" src="js/common.js" ></script>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.validate.js"></script> 
<script type="text/javascript" src="js/validate-methods.js"></script> 
<script type="text/javascript" src="js/messages_zh.js"></script> 
		<script>
			var newItem=document.getElementById('changemyInfo');
			newItem.style.background='#FF4401';
			newItem.style.color='white';
			$("input:radio[value='${bidder.gender}']").attr('checked','true');
			
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
				$('#name').val(names[Math.floor(Math.random()*names.length)]);
			}
			
			
			$(function(){
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
				
				$("#info-edit").validate({
					rules:{
						name:{
							required:true,
							minlength:2,
							maxlength:16
						},
						age:{
							required:true,
							number:true,
							digits:true,
							min:0,
							max:120
						},
						gender:{
							required:true
						},
						tel:{
							required:true,
							isMobile:true,
							remote:{
								type:'POST',
								url:'../user/telUnique',
								data:{
									tel:function(){return $('#tel').val();},
									tel2:function(){return '${bidder.tel}'}
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
									email2:function(){return '${bidder.email}'}
								}
							}
						},
						prov:{
							provTest:true
						},
						city:{
							cityTest:true
						},
						country:{
							countryTest:true
						},
						declaration:{
							required:true,
							minlength:5,
							maxlength:100
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
								"name":$('#name').val(),
								"gender":$('input[name="gender"]').filter(':checked').val(),
								"age":$('#age').val(),
								"tel":$('#tel').val(),
								"email":$('#email').val(),
								"address":$('#address').val(),
								"declaration":$('#declaration').val(),
								"id":"${bidder.id}"
							};
							 $.ajax({
								async : false,
								type: 'POST',
								cache: false,
								url: '../user/update1/1',
								data:JSON.stringify(data),
								dataType: 'json',
								contentType : 'application/json;charset=UTF-8',
								success: function(data){
									if(data){
										alert('更新成功！');
									}
									else {
										alert('更新失败！');
									}
									location.href="index.jsp";
									
								}
							}); 
					}
				});
			});
		</script>
	</body>


</html>
