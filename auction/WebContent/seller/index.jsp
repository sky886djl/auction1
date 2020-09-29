<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<c:if test="${seller==null}">
	<c:redirect url="../user/loginUI1"></c:redirect>
</c:if>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/seller/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>拍卖网委托者个人中心</title>
<base href="<%=basePath%>" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />

</head>
<body>
	<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl">
			<a class="logo navbar-logo f-l mr-10 hidden-xs"
				href="javascript:void(0)">拍卖网委托者个人中心</a> <span
				class="logo navbar-slogan f-l mr-10 hidden-xs">v1.0</span> <a
				aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
				href="javascript:;">&#xe667;</a>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li class="dropDown dropDown_hover"><a href="#"
					class="dropDown_A"><img src="../admin/static/img/${seller.headpic }" width="28" height="28" style="border-radius:50%"/> ${seller.name } <i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a
							href="javascript:pwdChange('修改密码','admin-change-password.jsp','','400')">
							<i class="Hui-iconfont">&#xe63f;</i>&nbsp;&nbsp;修改密码</a></li>
						<li><a href="../user/loginout"><i class="Hui-iconfont">&#xe726;</i>&nbsp;&nbsp;退出登录</a></li>
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
		<dl id="menu-info">
			<dt>
				<i class="Hui-iconfont">&#xe66a;</i> 个人信息管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a data-href="member-edit.jsp" data-title="修改个人信息"
						href="javascript:void(0)">修改个人信息</a></li>
				</ul>
			</dd>
		</dl>
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
		<dl id="menu-category">
			<dt>
				<i class="Hui-iconfont">&#xe681;</i> 拍卖品类型管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a data-href="product-category-list.jsp"
						data-title="分类列表" href="javascript:void(0)">分类列表</a></li>
				</ul>
			</dd>
		</dl>
		
		<dl id="menu-product">
			<dt>
				<i class="Hui-iconfont">&#xe620;</i> 拍卖品管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a data-href="product-list.jsp" data-title="产品列表"
						href="javascript:void(0)">产品列表</a></li>
					<li><a data-href="product-del.jsp" data-title="产品回收箱"
						href="javascript:void(0)">产品回收箱</a></li>

				</ul>
			</dd>
		</dl>
		
		<dl id="menu-bid">
			<dt>
				<i class="Hui-iconfont">&#xe6c1;</i> 拍卖交易<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a data-href="bid-list.jsp" data-title="竞拍记录"
						href="javascript:void(0)">竞拍记录</a></li>
					<li><a data-href="order-list.jsp" data-title="订单管理"
						href="javascript:void(0)">订单管理</a></li>
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
			<iframe scrolling="yes" frameborder="0" src="member-show.jsp"></iframe>
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
	</script>
</body>
</html>