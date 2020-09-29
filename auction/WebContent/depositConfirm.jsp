<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<link rel="stylesheet" href="statics/css/margin_pay.css" />

<script type="text/javascript">
	var pwd1 = '${bidder.password}';
	
</script>

<body class="deposit">
	<c:choose>
	<c:when test="${product==null }">
		<c:redirect url="http://localhost:8080/auction/product/list"></c:redirect>
	</c:when>
	<c:when test="${bidder==null }">
		<c:redirect url="http://localhost:8080/auction/product/getOne/${product.id }"></c:redirect>
	</c:when>
	
	</c:choose>
	<jsp:include page="top.jsp"></jsp:include>
	
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
							class="yuan">¥&nbsp;</i><fmt:formatNumber value="${product.initialPrice }" pattern="#.##" /></span>
					</p>
					<p>
						<span class="title">需缴纳保证金：</span> <span class="price"><i
							class="yuan">¥&nbsp;</i><fmt:formatNumber value="${product.initialPrice*0.2 }" pattern="#.##" /></span>
					</p>
				</div>
				<div bail_desc>
					<p>说明： 此保证金仅使用于该标的物。</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;若竞拍不成功：
						保证金将在竞买结束后3-5个工作日自动退回</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;若竞拍成功：保证金直接抵扣货款至资产处置机构账户，请在规定时间内按机构指定方式完成尾款支付。</p>
				</div>
			</div>
		</div>
		<div class="bidder_info">
			<div class="bidder_section">
				<h4>1.竞买人请确认以下事项并勾选</h4>
				<div class="fields">
					<input type="checkbox" id="checkbox1"
						onchange="checkboxChange1(this)"> 竞买人知晓拍下不买的后果: 保证金不予退还。
				</div>
				<div id='checkinfo1' class="f1"></div>
				<div class="fields">
					<input type="checkbox" id="checkbox2"
						onchange="checkboxChange2(this)"> 竞买人已阅读并同意 <a style="cursor: pointer;color:#197AC4">《竞拍服务协议》</a>
					，如未实地看样，视为接受标的所有瑕疵等细则
				</div>
				<div id='checkinfo2' class="f1"></div>
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
						<input type="submit" value="确认并缴纳保证金" class="submit" onclick="checkAll(${product.id})" />
					</div>

				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript" src="statics/js/depositConfirm.js"></script>
</body>
</html>
</body>
</html>
