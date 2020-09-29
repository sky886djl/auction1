<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html class="top">
<head>
<base href="<%=basePath%>" />

</head>
<body>
<div class="header">
	<c:choose>
		<c:when test="${bidder==null }">
			<a href="user/loginUI"><span class="login">亲，请登录</span></a>
			 <span class="register"><a href="member-add.jsp">免费注册</a></span>
		</c:when>
		<c:otherwise>
			
			<span class="login">
				<c:if test="${unReadMessagesNum>0 }">
					<span class="badge">${unReadMessagesNum }</span>
				</c:if>
				<img src="admin/static/img/${bidder.headpic }" width="28" height="28" style="border-radius:50%" />
				<span style="margin-top:-4px;margin-left:6px;height:20px;">
					<div id="nav" class="nav"> 
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
					  <img src="statics/images/icon/downarow1.png" width="12" height="12" /></a> 
					  <ul> 
					   <a href="bidder/index.jsp" style="text-align:center"><li><img style="margin-top:4px;float:left" src="statics/images/icon/my.png" width="16" />个人中心</li> </a>
					   <a href="user/message/0" style="text-align:center"> <li><img style="margin-top:4px;float:left" src="statics/images/icon/msg.png" width="16" />消息(<c:choose>
					   		<c:when test="${unReadMessagesNum>0}">${unReadMessagesNum }</c:when>
					   		<c:otherwise>0</c:otherwise>
					   </c:choose>)</li></a> 
						<a href="user/loginout" style="text-align:center;"> <li><img style="margin-top:4px;float:left" src="statics/images/icon/quit.png" width="16" />退出</li></a> 
						
					  </ul> 
					 </li> 
					 </ul> 
					</div> 
				</span>
			</span>
			
			
		</c:otherwise>
	</c:choose>
</div>
			


	<div class="logo">
		<img src="statics/images/icon/logo1.png" height="60px" alt="" />
	</div>
		
<div class="nav1">
	<ul class="menu1">
		<li><a href="index.jsp" target="_blank">网站首页</a></li>
		<li><a href="product/sort/0/0/0/0/0/0/0" target="_blank">拍卖中心</a></li>
		<li><a href="product/sort/0/11/0/0/0/0/0" target="_blank">今日拍卖</a></li>
		<li><a href="product/sort/0/12/0/0/0/0/0" target="_blank">拍卖预告</a></li>
		<li><a href="guildline.jsp" target="_blank">竞拍流程</a></li>
		<li><a href="index.jsp#paimaigonggao" target="_blank">拍卖公告</a></li>
		<li><a href="product/mybid/type0" target="_blank">我的拍卖</a></li>
	</ul>
	<div class="searchText" id="searchText">
	       <input type="text" id="serch" class="searchTextContent" onfocus="bc()" onblur="lk()" placeholder="请输入拍卖品的名称/描述/类型"/>
	       <input type="button" id="button3" onclick="searchPro()" value="搜索" class="button3"/>
	</div>
</div>
	
<div class="line"></div>
</body>
<link rel="stylesheet" href="statics/css/top.css" />
<script type="text/javascript" src="statics/js/jquery.min.js"></script>
<script type="text/javascript">
function showsub(li){ 
	 var submenu=li.getElementsByTagName("ul")[0]; 
	 submenu.style.display="block"; 
	 document.getElementById('searchText').style.zIndex='-1';
	} 
	function hidesub(li){ 
	 var submenu=li.getElementsByTagName("ul")[0]; 
	 submenu.style.display="none"; 
	 document.getElementById('searchText').style.zIndex='0';
	}
	function bc(){                //搜索框取得焦点时触发的事件
    	/* var serch=document.getElementById("serch");
        serch.style.width='350px';
        serch.style.marginLeft="96px"; */
        document.getElementById("button3").style.height="30px";
    }
    function lk(){               //搜索框失去焦点时触发的事件
        /* var serch=document.getElementById("serch");
        serch.style.width='250px';
        serch.style.marginLeft="194px"; */
        document.getElementById("button3").style.height="28px";
    }
    function searchPro() {
    	var t=document.getElementById('serch').value;
    	if(t.length==0){
    		return;
    	} else {
    		window.open("product/search/"+t);
    	}
    }
    var keyword="${keyword}";
    if(keyword.length>0)
	    document.getElementById('serch').value=keyword;
    $.ajax({
		async : false,
		type: 'POST',
		cache: false,
		url: 'product/subscribeJudge',
		data:{},
		dataType: 'json',
		success: function(data){
			if(data){
				//alert('ok！');
			}
			else {
				//alert('no！');
			}
		}
    });
</script>
</html>