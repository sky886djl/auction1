<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<meta charset="utf-8" />
		<title>zone</title>
		<base href="<%=basePath%>" />
		<link rel="stylesheet" href="css/common.css" />
		<link rel="stylesheet" href="css/subscribe.css" />
	</head>

	<body>
		<jsp:include page="top.jsp"></jsp:include>
		<div class="main" id="main">
			<div class="mainTitle">我的提醒</div>
		<hr class="mainTitleLine"/>
		<c:choose>
			<c:when test="${bidder==null }">
				<c:redirect url="http://localhost:8080/auction/product/list"></c:redirect>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${Empty=='true' }">
				<span style="margin-left:20px;color:#777777">您还没有设置任何提醒！</span>
			</c:when>
			
			<c:otherwise>
				<div class="subscribe">
					<c:forEach var="p" items="${products}" step="1" varStatus="st">
					
					<div class="item1">
						<a href="../product/getOne/${p.id }" class="subscribeA"> 
						<div  onmouseenter="bordercolorIn(this)" onmouseleave="bordercolorOut(this)">
						<div><img src="../statics/images/product/${fn:split(p.pic_url,';')[0]}" width="500" height="220" /></div>
						<div class="detail">
							<div class="name">${p.name }</div>
							<div class="uploadUser"><span class="font1">发布者：</span>${p.seller_id.username }</div>
							<div class="time">
								<c:choose>
									<c:when test="${p.status==11 }">
										<span class="font3">
										<div>结束时间：</div>
										<div class="time2 font2">
											<fmt:formatDate value="${p.deadline }" pattern="MM月dd日 HH:mm:ss"/></date>
										</div>
										</span>
									</c:when>
									
									<c:when test="${p.status==12 }">
										<span class="font3">
										<div>开始时间：</div>
										<div class="time2 font2">
											<fmt:formatDate value="${p.start_time }" pattern="MM月dd日 HH:mm:ss"/></date>
										</div>
										</span>
									</c:when>
									
									<c:when test="${p.status==4 }">
										已结束！
									</c:when>
								</c:choose>
								
							</div>
						</div>
						</div>
						</a>
						<div class="remind">
							<div class="inform"><img src="img/subscribe.png" width="64"/><div>已提醒</div></div>
							<div class="disInform">
								<a href="javascript:cancelSubscribe(${p.id })">取消提醒</a>
							</div>
						</div>
						
					</div>
					</c:forEach>
					
					
				</div>
			</c:otherwise>
		</c:choose>
		
		
		</div>
<script type="text/javascript" src="js/common.js" ></script>
<script type="text/javascript" src="js/guessmylike.js" ></script>
<script type="text/javascript" src="js/jquery.min.js" ></script>
<script>
	var newItem=document.getElementById('mysubscribe');
	newItem.style.background='#FF4401';
	newItem.style.color='white';
	
	function cancelSubscribe(pro_id) {
		if(confirm("取消后不再接受该拍卖品的提醒，确认取消提醒？")==true){
			$.ajax({
				async : false,
				type: 'POST',
				cache: false,
				url: '../product/cancelSubscribe',
				data: {"pro_id":pro_id},
				dataType: 'json',
				success: function(data){
					if(data){
						alert('取消成功！');
					}
					else {
						alert('取消失败！');
					}
					location.href="../product/subscribeList";
				}
			});	

		}
		
	}
</script>
</body>