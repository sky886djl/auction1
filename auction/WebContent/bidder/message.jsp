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
		<link rel="stylesheet" href="css/message.css" />
	</head>

	<body>
		<c:choose>
			<c:when test="${bidder==null }">
				<c:redirect url="http://localhost:8080/auction/product/list"></c:redirect>
			</c:when>
		</c:choose>
		<jsp:include page="top.jsp"></jsp:include>
		<div class="main" id="main">
			<div class="mainTitle">我的消息</div>
		<hr class="mainTitleLine"/>
			<div class="messageBody">
			<div class="head">
				<ul>
					<li class="headtitle0" id="title0" onclick="choose('title0')">
						全部消息
					</li>
					<li class="headtitle1" id="title1" onclick="choose('title1')">
						提醒消息
					</li>
					<li class="headtitle2" id="title2" onclick="choose('title2')">
						回复我的消息
					</li>
					<li class="headtitle3" id="title3" onclick="choose('title3')">
						拍卖消息
					</li>
				</ul>
			</div>
			
			<div class="body">
				<div style="height:2px;"></div>
				<!-- 提醒消息 -->
				<c:set var="msglen" value="${fn:length(messages) }"></c:set>
				<c:choose>
					<c:when test="${msgLen==0 }">
						暂无消息
					</c:when>
					<c:otherwise>
						<c:forEach var="message" items="${messages }" varStatus="st">
						<c:choose>
							<c:when test="${message.msgType==1 }">
								<div class="item01" id="more${st.index }">
									<div class="line1">
										<span class="messageTitle">【提醒消息】
										<c:if test="${message.isRead==0 }">
											【新消息】
										</c:if>
										</span>
										<span class="datetime">
											<fmt:formatDate value="${message.releaseTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
										</span>
									</div>
									<div class="line2">
										<a href="javascript:jumpToProduct(${message.pro_id.id })" target="_blank">
											<div class="product">
												<img src="../statics/images/product/${fn:split(message.pro_id.pic_url,';')[0]}" width="60" height="60" />
												<div class="name">${message.pro_id.name }</div>
												<div class="price">${message.pro_id.nowPrice }元</div>
											</div>
										</a>
										<div class="msgBody">
											${message.content}
										</div>
										<div class="op">
											<a href="javascript:deleteMsg(${message.id })">删除消息</a>
										</div>
									</div>
								</div>
							</c:when>
							<c:when test="${message.msgType==2 }">
								<!-- 描述：评论回复信息 -->
								<div class="item01" id="more${st.index }">
									<div class="line1">
										<span class="messageTitle">【评论回复消息】
										<c:if test="${message.isRead==0 }">
											【新消息】
										</c:if></span>
										<span class="datetime"><fmt:formatDate value="${message.releaseTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
									</div>
									<div class="line2">
										<a href="javascript:jumpToProduct(${message.pro_id.id })" target="_blank">
										<div class="product">
											<img src="../statics/images/product/${fn:split(message.pro_id.pic_url,';')[0]}" width="60" height="60" />
											<div class="name">${message.pro_id.name }</div>
											<div class="price">${message.pro_id.nowPrice }元</div>
										</div>
										</a>
										<div class="msgBody">
											${message.content }
										</div>
										<div class="op">
											<a href="javascript:window.open('../product/getOne/${message.pro_id.id }#commentsA')">回复TA</a><br />
											<a href="javascript:deleteMsg(${message.id })">删除消息</a>
										</div>
									</div>
								</div>
							</c:when>
							<c:when test="${message.msgType==3 }">
								<div class="item01" id="more${st.index }">
								<div class="line1">
									<span class="messageTitle">【拍卖消息】</span>
									<span class="datetime"><fmt:formatDate value="${message.releaseTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
								</div>
								<div class="line2">
									<a href="javascript:jumpToProduct(${message.pro_id.id })" target="_blank">
										<div class="product">
											<img src="../statics/images/product/${fn:split(message.pro_id.pic_url,';')[0]}" width="60" height="60" />
											<div class="name">${message.pro_id.name }</div>
											<div class="price">${message.pro_id.nowPrice }元</div>
										</div>
										</a>
									<div class="msgBody">
										${message.content }
									</div>
									<div class="op">
										<c:choose>
											<c:when test="${fn:contains(message.content,'恭喜你') }">
												<span class="price">
													<fmt:formatNumber value="${message.pro_id.nowPrice-message.pro_id.initialPrice*0.2 }" pattern="#"></fmt:formatNumber>
													元
												</span><br/>
												<c:choose>
													<c:when test="${message.pro_id.isPayed==0 }">
													<a href="javascript:payTheBill(${message.pro_id.id })">
														交齐余款
													</a><br />
													</c:when>
													<c:when test="${message.pro_id.isPayed==1 }">
														<span style="font-size:14px;color:#666666">已交齐余款</span>
													<br />
													</c:when>
												</c:choose>
												
											</c:when>
											<c:when test="${fn:contains(message.content,'火热进行') }">
												<a href="javascript:jumpToProduct(${message.pro_id.id })">我要出价</a><br />
											</c:when>
										</c:choose>
										<a href="javascript:deleteMsg(${message.id })">删除消息</a>
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
				 <a id="moreMsg" href="javascript:moreMsg(5)" style="text-decoration: none;">点击加载更多消息</a> 
			</div>
		</div>
		</div>
		<script type="text/javascript" src="js/common.js" ></script>
		<script type="text/javascript" src="../statics/js/jquery.min.js" ></script>
		<script type="text/javascript">
		select(400);
		var cur=0;
		var total='${msglen}';
		moreMsg(5);
		function moreMsg(num){
			var end=cur+num;
			if(end>=total){
				end=total;
				var morecomment=document.getElementById('moreMsg');
				morecomment.innerHTML='没有更多消息了';
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
			location.href="../user/message/"+title.split('title')[1];
		}
		unchooseAllTitle();
		document.getElementById('title'+location.href.split('message/')[1]).style.background="white";	
		function unchooseAllTitle(){
			for(var i=0;i<4;i++){
				document.getElementById('title'+i).style.background="#F5F8FA";
			}
		}
		
		function deleteMsg(id) {
			if(confirm("确认删除一条消息吗？")==true){
				$.ajax({
					async : false,
					type: 'POST',
					cache: false,
					url: '../user/deleteMsg',
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
			location.href="../user/message/"+location.href.split('message/')[1];
		}
		
		function payTheBill(id){
			//支付余款
			if(confirm("确认要支付余款吗？")==true){
				location.href="../product/payBill0/"+id;
			}
		}
		
		function jumpToProduct(id){
			window.open("../product/getOne/"+id);
		}
		</script>
	</body>
</html>
