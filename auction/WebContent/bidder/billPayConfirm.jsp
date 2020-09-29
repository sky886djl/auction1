<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/bidder/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>确认页面</title>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="shortcut icon" href="statics/images//icon/favicon.ico" />
<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/margin_pay.css" />



<body class="deposit">
	<c:choose>
	<c:when test="${product==null }">
		<c:redirect url="http://localhost:8080/auction/bidder/index.jsp"></c:redirect>
	</c:when>
	<c:when test="${bidder==null }">
		<c:redirect url="http://localhost:8080/auction/product/getOne/${product.id }"></c:redirect>
	</c:when>
	
	</c:choose>
	<jsp:include page="top.jsp"></jsp:include>
	<div class="main" id="main">
	<div class="mainTitle">支付余款</div>
	<hr class="mainTitleLine"/>
	<!-- 交保证金 -->
	<div class="content">
		<div class="bail_info">
			<div class="bail_section">
				<div class="bail_count">
					<p>
						<span class="title">商品名称：</span> <a class="link"
							href="product/getOne/${product.id }" target="_blank">${product.name }</a>
					</p>
					<p>
						<span class="title">商品起拍价：</span> <span class="price"><i
							class="yuan">¥&nbsp;</i><fmt:formatNumber value="${product.initialPrice }" pattern="#" /></span>
					</p>
					<p>
						<span class="title">当前价：</span> <span class="price"><i
							class="yuan">¥&nbsp;</i><fmt:formatNumber value="${product.nowPrice }" pattern="#" /></span>
					</p>
					<p>
						<span class="title">需付尾款：</span> <span class="price"><i
							class="yuan">¥&nbsp;</i><fmt:formatNumber value="${product.nowPrice-product.initialPrice*0.2 }" pattern="#" />
							</span>
							(保证金已抵<span class="price">￥<fmt:formatNumber value="${product.initialPrice*0.2 }" pattern="#" /></span>)
					</p>
				</div>
				<div bail_desc>
					<p>说明： 若支付成功：
						则可进一步与委托者完成发货、收货等操作</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;若超过3-5天未支付尾款：
						则保证金将不会退还。</p>
				</div>
			</div>
		</div>
		<div class="bidder_info">
			<div class="bidder_section">
				<h4>1.竞买人请确认以下事项并勾选</h4>
				<div class="fields">
					<input type="checkbox" id="checkbox1"
						onchange="checkboxChange1(this)"> 竞买人知晓拍下不买的后果: 保证金不予退还。
				<span id='checkinfo1' class="f1"></span>
				</div>
				<div class="fields">
					<input type="checkbox" id="checkbox2"
						onchange="checkboxChange2(this)"> 竞买人已阅读并同意 <a style="cursor: pointer;color:#197AC4">《竞拍服务协议》</a>
					，如未实地看样，视为接受标的所有瑕疵等细则
				<span id='checkinfo2' class="f1"></span>
				</div>
			</div>

			<div class="bidder_section">
				<h4>2. 竞买人身份确认</h4>
				<div class="bd">
					<table>
						<tr>
							<td><span class="font1">竞买人姓名：</span></td>
							<td class="font2">${bidder.name }</td>
						</tr>
						<tr>
							<td><span class="font1">手机号码:</span></td>
							<td class="font2">${bidder.tel }
						</tr>
						<tr>
							<td><span class="font1">email:</span></td>
							<td class="font2">${bidder.email }
						</tr>
						<tr>
							<td><span class="font1">地址:</span></td>
							<td class="font2">${bidder.address }
						</tr>
						<tr>
							<td><span class="font1">支付密码:</span></td>
							<td class="f1"><input type="password" class="input" value=""
								placeholder="请输入支付密码" id="pwd" onpaste="return false" /> <span id='pwdspan'></span>
						</tr>
					</table>
					<div>
						<input type="submit" value="确认支付尾款" class="submit" onclick="checkAll(${product.id})" />
					</div>

				</div>
			</div>
		</div>
	</div>
	</div>
	<script type="text/javascript" src="js/biddingPayConfirm.js"></script>
	<script type="text/javascript">
		var pwd1 = '${bidder.password}';
		var msg="${msg}";
		if(msg.length>0){
			if(msg=='success'){
				alert("支付成功！请在我的订单中查看相关信息！");
			} else if(msg='failure'){
				alert("余额不足！");
				if(confirm('是否去充值？')==true){
					location.href="../recharge.jsp";
				}
			} else if(msg=='alreadyPayed'){
				alert("余款已经支付！");
			}
		}
	</script>
</body>
</html>
</body>
</html>
