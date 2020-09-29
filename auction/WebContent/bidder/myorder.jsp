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
		<link rel="stylesheet" href="css/myorder.css" />
	</head>

	<body>
		<c:choose>
			<c:when test="${bidder==null }">
				<c:redirect url="http://localhost:8080/auction/product/list"></c:redirect>
			</c:when>
		</c:choose>
		<jsp:include page="top.jsp"></jsp:include>
		<div class="main" id="main">
			<div class="mainTitle">我的订单</div>
		<hr class="mainTitleLine"/>
			<div class="messageBody">
			<div class="head">
				<ul>
					<li class="headtitle0" id="title0" onclick="choose('title0')">
						全部订单
					</li>
					<li class="headtitle1" id="title1" onclick="choose('title1')">
						待发货
					</li>
					<li class="headtitle2" id="title2" onclick="choose('title2')">
						待收货
					</li>
					<li class="headtitle3" id="title3" onclick="choose('title3')">
						订单完成
					</li>
				</ul>
			</div>
			
			<div class="body">
				<div style="height:2px;"></div>
				<c:set var="msglen" value="${fn:length(orders) }"></c:set>
				<c:choose>
					<c:when test="${msgLen==0 }">
						暂无订单
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${orders }" varStatus="st">
						<c:choose>
							<c:when test="${o.status==1 }">
								<div class="item01" id="more${st.index }">
								<div class="line1">
									<span class="messageTitle">【待发货】</span>
									<span class="orderId">订单编号：${o.id }</span>
									<span class="datetime"><fmt:formatDate value="${o.lastOpTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
								</div>
								<div class="line2">
									<div class="product">
										<img src="../statics/images/product/${fn:split(o.pro_id.pic_url,';')[0]}" width="60" height="60" />
										<div class="name">${o.pro_id.name }</div>
										<div class="price">${o.pro_id.nowPrice }元</div>
									</div>
									<div class="msgBody">
										您已支付尾款，等待委托者发货~<br/>
										<span class="username">发货人:&nbsp;${o.pro_id.seller_id.username }</span>
										<span class="assoTel">联系电话:&nbsp;${o.pro_id.seller_id.tel }</span>
									</div>
									<div class="address">
											<span class="adr1">发货地址:&nbsp;${o.address1 }</span>
											<span class="adr2">收货地址:&nbsp;${o.address2}</span>
									</div>
									
									<div class="op">
									</div>
								</div>
								</div>
							</c:when>
							<c:when test="${o.status==2 }">
							<div class="item01" id="more${st.index }">
							<div class="line1">
								<span class="messageTitle">【待收货】</span>
								<span class="orderId">订单编号：${o.id }</span>
								<span class="datetime"><fmt:formatDate value="${o.lastOpTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
							</div>
							<div class="line2">
								<div class="product">
									<img src="../statics/images/product/${fn:split(o.pro_id.pic_url,';')[0]}" width="60" height="60" />
									<div class="name">${o.pro_id.name }</div>
									<div class="price">${o.pro_id.nowPrice }元</div>
								</div>
								<div class="msgBody">
									拍卖品已经发货，请注意查收~<br/>
									<span class="username">发货人:&nbsp;${o.pro_id.seller_id.username }</span>
									<span class="assoTel">联系电话:&nbsp;${o.pro_id.seller_id.tel }</span>
								</div>
								<div class="address">
										<span class="adr1">发货地址:&nbsp;${o.address1 }</span>
										<span class="adr2">收货地址:&nbsp;${o.address2}</span>
								</div>
								<div class="op">
									<a href="javascript:receive('${o.id }')">确认收货</a><br />
								</div>
							</div>
							</div>
							</c:when>
							<c:when test="${o.status==3 }">
								<!--订单完成-->
								<div class="item01" id="more${st.index }">
									<div class="line1">
										<span class="messageTitle">【订单完成】</span>
										<span class="orderId">订单编号：${o.id }</span>
										<span class="datetime"><fmt:formatDate value="${o.lastOpTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
									</div>
									<div class="line2">
										<div class="product">
											<img src="../statics/images/product/${fn:split(o.pro_id.pic_url,';')[0]}" width="60" height="60" />
											<div class="name">${o.pro_id.name }</div>
											<div class="price">${o.pro_id.nowPrice }元</div>
										</div>
										<div class="msgBody">
											您已确认收货，恭喜你以1600元的价格成功拍到'和田玉'<br/>
											<span class="username">发货人:&nbsp;${o.pro_id.seller_id.username }</span>
											<span class="assoTel">联系电话:&nbsp;${o.pro_id.seller_id.tel }</span>
										</div>
										<div class="address">
												<span class="adr1">发货地址:&nbsp;${o.address1 }</span>
												<span class="adr2">收货地址:&nbsp;${o.address2}</span>
										</div>
										<div class="op">
											<a href="javascript:deleteOrder">删除订单</a>
										</div>
									</div>
								</div>
							</c:when>
							
						</c:choose>
						
					</c:forEach>
				
					</c:otherwise>
				</c:choose>
				
			</div>
			<div class="moreMsg">
				 <a id="moreMsg" href="javascript:moreMsg(5)" style="text-decoration: none;">点击加载更多订单</a> 
			</div>
		</div>
		</div>
		<script type="text/javascript" src="js/common.js" ></script>
		<script type="text/javascript" src="../statics/js/jquery.min.js" ></script>
		<script type="text/javascript">
		var newItem=document.getElementById('myorder');
		newItem.style.background='#FF4401';
		newItem.style.color='white';
		var cur=0;
		var total='${msglen}';
		moreMsg(5);
		function moreMsg(num){
			var end=cur+num;
			if(end>=total){
				end=total;
				var morecomment=document.getElementById('moreMsg');
				morecomment.innerHTML='没有更多订单了';
				morecomment.href='javascript:void(0)';
			}
			for(var i=cur;i<end;i++){
				console.log(i);
				document.getElementById('more'+i).style.display='block';
			}
			
			cur=end;
		}
					
		function reset1() {
			for(var i=0;i<total;i++){
				document.getElementById('more'+i).style.display='none';
			}
		}
		function choose(title){
			location.href="../order/myorderList/"+title.split('title')[1];
		}
		unchooseAllTitle();
		document.getElementById('title'+location.href.split('myorderList/')[1]).style.background="white";	
		function unchooseAllTitle(){
			for(var i=0;i<4;i++){
				document.getElementById('title'+i).style.background="#F5F8FA";
			}
		}
		
		function receive(id){
			if(confirm("确认收货吗？")==true){
				$.ajax({
					async : false,
					type: 'POST',
					cache: false,
					url: '../order/receive',
					data: {"id":id},
					dataType: 'json',
					success: function(data){
						if(data){
							alert('收货成功！');
						}
						else {
							alert('收货失败！');
						}
					}
				});	
			} else {
				return;
			}
			location.href="../order/myorderList/"+location.href.split('myorderList/')[1];
		}
		
		function deleteOrder(id) {
			if(confirm("确认删除一个订单吗？")==true){
				$.ajax({
					async : false,
					type: 'POST',
					cache: false,
					url: '../order/delete',
					data: {"id":id},
					dataType: 'json',
					success: function(data){
						if(data){
							alert('删除成功！');
						}
						else {
							alert('删除失败！');
						}
					}
				});	
			} else {
				return;
			}
			location.href="../order/myorderList/"+location.href.split('myorderList/')[1];
		}
		
		
		</script>
	</body>
</html>
