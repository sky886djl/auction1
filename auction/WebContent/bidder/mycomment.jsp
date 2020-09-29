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
	<link rel="stylesheet" href="css/mycomment.css" />
	</head>

	<body>
		<jsp:include page="top.jsp"></jsp:include>
		<div class="main" id="main">
				<div class="mainTitle">我的评论</div>
		<hr class="mainTitleLine"/>
		<div class="comment">
			<c:choose>
				<c:when test="${bidder==null }">
					<c:redirect url="http://localhost:8080/auction/product/list"></c:redirect>
				</c:when>
				<c:when test="${fn:length(mycomments)==0 }">
					你还未发表任何评论
				</c:when>
				<c:otherwise>
				<c:forEach var="comment" items="${mycomments }">
				<script type="text/javascript">
					console.log("${mycomments}");
				</script>
					<div class="item0" >
					<div class="commentContent" >
						<div>${bidder.name }：${comment.content }
							<span class="datetime1" title="<fmt:formatDate value="${comment.commentTime }" pattern="yyyy-MM-dd HH:mm:ss"/>">
								<fmt:formatDate value="${comment.commentTime }" pattern="yyyy-MM-dd"/>
							</span>
						</div>
					</div>
					<a style="text-decoration:none" href="../product/getOne/${comment.pro_id }#commentsA">
					<div  class="item1" onmouseenter="bordercolorIn(this)" onmouseleave="bordercolorOut(this)">
						<span><img src="../statics/images/product/${fn:split(comment.product.pic_url,';')[0]}" class="commentPic"/> </span>
						<div class="detail">
							<div class="descri">
										${comment.product.name }|
										${comment.product.description }
							</div>
							<div class="type"><i>类型:${comment.product.type_id.typeName }</i></div>
						</div>
						<div class="column44">
							<div>当前价:<span class="price">${comment.product.nowPrice }</span>元</div>
							<div class="initialPrice">初始价:<span class="price1">${comment.product.initialPrice }</span>元</div>
							<div class="initialPrice">保证金:<span class="price1">${comment.product.initialPrice*0.2 }</span>元</div>
						</div>
					</div>
					</a>
					<div class="operation">
						<a href="javascript:deleteComment(${comment.id })">删除</a>
					</div>
					</div>
			
				</c:forEach>
				</c:otherwise>
			</c:choose>
			
		</div>
		</div>
		<script>
			var newItem=document.getElementById('mycomment');
		newItem.style.background='#FF4401';
		newItem.style.color='white';
		</script>
		<script type="text/javascript" src="js/common.js" ></script>
		<script type="text/javascript" src="js/guessmylike.js" ></script>
		<script type="text/javascript" src="../statics/js/jquery.min.js"></script>
		<script type="text/javascript">
		function deleteComment(id){
			if(confirm("确认删除评论及其子评论吗？")==true){
				$.ajax({
					async : false,
					type: 'POST',
					cache: false,
					url: '../comment/delete',
					data: {"id":id},
					dataType: 'json',
					success: function(data){
						if(data){
							alert('删除评论成功！');
						}
						else {
							alert('删除评论失败！');
						}
					}
				});	
			} else {
				return;
			}
			location.href="../comment/commentList"
		}
		</script>
</body>


</html>
