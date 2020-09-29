<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>确认支付</title>
<base href="<%=basePath%>" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="statics/images//icon/favicon.ico" />

<link rel="stylesheet" type="text/css"
	href="statics/charge/css/amazeui.min.css" />
<link rel="stylesheet" type="text/css"
	href="statics/charge/css/password.css" />
<body>
	<c:if test="${bidder==null }">
		<c:redirect url="product/list"></c:redirect>
	</c:if>
	<div class="pay">
		<!--主内容开始编辑-->
		<div class="tr_recharge">
			<div class="tr_rechtext">
				<p class="te_retit">
					<img src="statics/charge/images/coin.png" alt="" />充值中心
				</p>
				<p>1.拍卖币是拍卖网推出的虚拟货币，你可以使用拍卖币拍买本网站的商品。</p>
				<p>2.拍卖币与人民币换算为1：1，即1元=1拍卖币，你可以选择支付宝或者是微信的付款方式来进行充值，拍卖币每次100个起充。</p>
			</div>
			<div class="tr_rechbox">
				<div class="tr_rechhead">
					<img src="statics/charge/images/ys_head2.jpg" />
					<p>
						充值帐号：<a>${bidder.username }</a>
					</p>
					<div class="tr_rechheadcion">
						<img src="statics/charge/images/coin.png" alt="" /> <span>当前余额：<span>${bidder.account }拍卖币</span></span>
					</div>
				</div>
			</div>
			<!--  </form> -->
			<div class="tr_rechheadcion1">
				<img src="statics/charge/images/coin.png" alt="" width="100px" /> <span>充值金额：<span>${docVlGender }</span>拍卖币
				</span>
			</div>

			<div class="check">
				<img src="statics/charge/images/check.png">安全设置检测成功！无需短信校验。
			</div>
			<div class="payPassword">
				<label class="label">支付密码：</label><br /> <input type="password"
					class="password" onpaste="return false" placeholder="密码" />
				<div class="explain">请输入6位数字支付密码</div>
			</div>
			<div class="checkPay">
				<input type="button" value="确认付款" onclick="javascript:location.href='user/rechargeConfirm/${docVlGender }'" class="checkPay1">
			</div>
		</div>
	</div>

</body>
</html>