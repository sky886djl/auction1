<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/bidder/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<base href="<%=basePath%>" />
		<link rel="stylesheet" href="css/index.css" />
	</head>
	<body>
		<div class="header0">
		<a href="../product/list"><span class="home">返回首页</span></a>
			<span class="login">
				<img src="../admin/static/img/${bidder.headpic }" width="28" height="28" style="border-radius:50%"/>
				<span style="margin-top:-4px;margin-left:6px;">
					<div id="nav" class="nav2"> 
					 <ul> 
					  <li onmouseover="showsub(this)" onmouseout="hidesub(this)">
					  <a href="#">
					  <c:choose>
					  	<c:when test="${fn:length(bidder.name)<=4 }">
					  		${bidder.name}
					  	</c:when>
					  	<c:otherwise>
					  		${fn:substring(bidder.name,0,4) }..
					  	</c:otherwise>
					  </c:choose>
					  <img src="../statics/images/icon/downarow1.png" width="12" height="12" /></a> 
					  <ul> 
					   <li><a href="../user/loginout" style="text-align:center"><img style="margin-top:4px;float:left" src="../statics/images/icon/quit.png" width="16" />退出</a></li> 
					  </ul> 
					 </li> 
					 </ul> 
					</div> 
				</span>
			</span>
</div>
	
		<div class="header2">
			<div class="header2 logo1"><img src="img/logo.png" height="50"/></div>
			<div class="header2 title1"><a href="#" onclick="select(320)">首页</a></div>
			<div class="header2 title2"><a href="javascript:message()" >消息</a></div>
			<div class="header2 select" id="titlePic"><img src="img/select.png" /></div>
			<div class="header2 search" id="searchId"><input id="searchArea1" placeholder="请输入拍卖品名称/描述/类型" type="text" class="input1" /><input type="button" class="button1" onclick="indivSearch()" value="搜索"/></div>
		</div>
		
		<div class="left">
			<ul>
				<li class="left header2">
					基本资料
				</li>
				<li>	
					<ul>
						<li><a id="myelementInfo" href="javascript:jump('index.jsp')">基本信息</a></li>
						<li><a id="changemyInfo" href="javascript:jump('changemyInfo.jsp')">修改资料</a></li>
						<li><a id="changePwd" href="javascript:jump('changePwd.jsp')">修改密码</a></li>
					</ul>
				</li>
				
				<li class="left header2">
					我参与的拍卖
				</li>
				<li>
					<ul>
						<li><a id="mybidding" href="javascript:jump('../product/mybid/type0')">我的拍卖</a></li>
					</ul>
				</li>
				
				<li class="left header2">
					我的订单
				</li>
				<li>
					<ul>
						<li><a id="myorder" href="javascript:jump('../order/myorderList/0')">我的订单</a></li>
					</ul>
				</li>
				
				<li class="left header2">
					个性服务
				</li>
				<li>
					<ul>
						<li><a id="mysubscribe" href="javascript:jump('../product/subscribeList')">我的提醒</a></li>
						<li><a id="mycomment" href="javascript:jump('../comment/commentList')">我的评论</a></li>
						<!-- <li><a id="guessmylike" href="javascript:jump('../product/guessmylike')">猜我喜欢</a></li> -->
					</ul>
				</li>
				
			</ul>
		</div>
		<script type="text/javascript" src="js/common.js" ></script>
		<script type="text/javascript">
function showsub(li){ 
	 var submenu=li.getElementsByTagName("ul")[0]; 
	 submenu.style.display="block"; 
	} 
	function hidesub(li){ 
	 var submenu=li.getElementsByTagName("ul")[0]; 
	 submenu.style.display="none"; 
	}
	
	function indivSearch(){
		var text=document.getElementById('searchArea1').value;
		if(text.length>0){
			window.open("../product/search/"+text);
		} else {
			return;
		}
	}
	function select(param){
		document.getElementById('titlePic').style.marginLeft=param+'px';
	}
	function message() {
		location.href='../user/message/0';
	}
</script>
	</body>
</html>
