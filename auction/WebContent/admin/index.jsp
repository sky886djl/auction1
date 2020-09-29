<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<c:if test="${admin==null}">
	<c:redirect url="login.jsp"></c:redirect>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>拍卖网后台管理系统</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
</head>
<body>
	<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl">
			<a class="logo navbar-logo f-l mr-10 hidden-xs"
				href="/aboutHui.shtml">拍卖网后台管理中心</a> <span
				class="logo navbar-slogan f-l mr-10 hidden-xs">v1.0</span> <a
				aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
				href="javascript:;">&#xe667;</a>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li id="authority1"><i class="Hui-iconfont">&#xe62d;</i>&nbsp;<t id='authority'></t></li>
				<li class="dropDown dropDown_hover"><a href="#"
					class="dropDown_A">${admin.username } <i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="#"><i class="Hui-iconfont">&#xe68f;</i>&nbsp;&nbsp;切换账户</a></li>
						<li><a
							href="javascript:pwdChange('修改密码','admin-change-password.jsp','','400')">
							<i class="Hui-iconfont">&#xe63f;</i>&nbsp;&nbsp;修改密码</a></li>
						<li><a href="loginout"><i class="Hui-iconfont">&#xe726;</i>&nbsp;&nbsp;退出登录</a></li>
					</ul></li>
				<li id="Hui-skin" class="dropDown right dropDown_hover"><a
					href="javascript:;" class="dropDown_A" title="换肤"><i
						class="Hui-iconfont" style="font-size: 18px">&#xe62a;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
						<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
						<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
						<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
						<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
					</ul></li>
			</ul>
			</nav>
		</div>
	</div>
	</header>
	<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<dl id="menu-article">
			<dt>
				<i class="Hui-iconfont">&#xe616;</i> 资讯管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a data-href="article-list.jsp" data-title="资讯列表"
						href="javascript:void(0)">资讯列表</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-product">
			<dt>
				<i class="Hui-iconfont">&#xe620;</i> 产品管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a data-href="product-category-list.jsp"
						data-title="分类列表" href="javascript:void(0)">分类列表</a></li>
					<li><a data-href="product-list.jsp" data-title="产品列表"
						href="javascript:void(0)">产品列表</a></li>
					<li><a data-href="product-del.jsp" data-title="产品回收箱"
						href="javascript:void(0)">产品回收箱</a></li>

				</ul>
			</dd>
		</dl>
		<dl id="menu-bid">
			<dt>
				<i class="Hui-iconfont">&#xe6c1;</i> 拍卖管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a data-href="bid-list.jsp" data-title="竞拍记录"
						href="javascript:void(0)">竞拍记录</a></li>
					<li><a data-href="bid-list.html" data-title="竞拍交易"
						href="javascript:void(0)">竞拍交易</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-member">
			<dt>
				<i class="Hui-iconfont">&#xe60d;</i> 会员管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a data-href="member-list.jsp" data-title="会员列表"
						href="javascript:;">会员列表</a></li>
					<li><a data-href="member-del.jsp" data-title="删除的会员"
						href="javascript:;">删除的会员</a></li>
				</ul>
			</dd>
		</dl>

		<dl id="menu-admin">
			<dt>
				<i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a data-href="admin-list.jsp" data-title="管理员列表"
						href="javascript:void(0)">管理员列表</a></li>
				</ul>
			</dd>
		</dl>
	</div>

	</aside>
	<div class="dislpayArrow hidden-xs">
		<a class="pngfix" href="javascript:void(0);"
			onClick="displaynavbar(this)"></a>
	</div>
	<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active"><span title="我的桌面" data-href="welcome.html">我的桌面</span>
					<em></em></li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group">
			<a id="js-tabNav-prev" class="btn radius btn-default size-S"
				href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a
				id="js-tabNav-next" class="btn radius btn-default size-S"
				href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a>
		</div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display: none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="welcome.html"></iframe>
		</div>
	</div>
	</section>

	<div class="contextMenu" id="Huiadminmenu">
		<ul>
			<li id="closethis">关闭当前</li>
			<li id="closeall">关闭全部</li>
		</ul>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
	<script type="text/javascript">
		/*个人信息*/
		function myselfinfo(title, url, w, h) {
			show(title, url, w, h);
		}

		function show(title, url, w, h) {
			layer_show(title, url, w, h);
		}

		function pwdChange(title, url, w, h) {
			show(title, url, w, h);
		}
		
		$(function(){
			var authority='${admin.authority}';
			var identity=document.getElementById('authority');
			var article=$('#menu-article');
			var product=$('#menu-product');
			var bid=$('#menu-bid');
			var member=$('#menu-member');
			var admin=$('#menu-admin');
			if(authority!=0){
				article.hide();
				product.hide();
				bid.hide();
				member.hide();
				admin.hide();
				if(authority==1){
					article.show();
					identity.innerHTML='资讯管理员';
				} else if(authority==2){
					product.show();
					identity.innerHTML='产品管理员';
				} else if(authority==3){
					bid.show();
					identity.innerHTML='拍卖管理员';
				} else if(authority==4){
					member.show();
					identity.innerHTML='会员管理员';
				}
			} else {
				identity.innerHTML='超级管理员';
			}
		});
	</script>
</body>
</html>