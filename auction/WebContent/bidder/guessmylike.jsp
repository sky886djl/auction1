<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<link rel="stylesheet" href="css/guessmylike.css" />
	</head>

	<body>
		<jsp:include page="top.jsp"></jsp:include>
		
		<c:choose>
			<c:when test="${bidder==null }">
				<c:redirect url="http://localhost:8080/auction/product/list"></c:redirect>
			</c:when>
		</c:choose>
		<div class="main1" id="main">
			<div class="mainTitle">猜我喜欢</div>
		<hr class="mainTitleLine"/>
		
		<div class="p0" id="p0">
		<c:forEach var="p" items="${guessmylike }" step="1" varStatus="status">
		<div class="p1">
		<c:choose>
			<c:when test="${status.count%3==1 }">
					<a href="../product/getOne/${p.id }">
				     	<div  class="column1" onmouseenter="bordercolorIn(this)" onmouseleave="bordercolorOut(this)">
				     		<img src="../statics/images/product/${fn:split(p.pic_url,';')[0]}" width="280px" height="185px"/>
				     		<div>
				     			${p.name }&nbsp;&nbsp;&nbsp;
				     			<span class="timeA">
					     			<e class="end">预计</e>&nbsp;
					     			<date><fmt:formatDate value="${p.start_time }" pattern="MM月dd日 HH:mm"/></date>&nbsp;<e class="end">开始</e>
				     			</span>
				     		</div>
				     		<div>
				     			起拍价 <e class="price">￥${p.nowPriceformat }</e>
				     			<img style="float:right;" src="img/ongoing.png" />
				     		</div>
				     		<div class="num">
				     			<times class="time1"><nums>${p.click_num }</nums>次围观</times> 
				     			<times class="time2"><nums>${p.join_num }</nums>次出价</times>
				     		</div>
				     	</div>
				     	</a>
			</c:when>
			
			<c:when test="${status.count%3==2 }">
					<a href="../product/getOne/${p.id }">
			     	<div  class="column2" onmouseenter="bordercolorIn(this)" onmouseleave="bordercolorOut(this)">
			     		<img src="../statics/images/product/${fn:split(p.pic_url,';')[0]}" width="280px" height="185px"/>
			     		<div>
			     			${p.name }&nbsp;&nbsp;&nbsp;
			     			<span class="timeA">
				     			<e class="end">预计</e>&nbsp;
				     			<date><fmt:formatDate value="${p.start_time }" pattern="MM月dd日 HH:mm"/></date>&nbsp;<e class="end">开始</e>
			     			</span>
			     		</div>
			     		<div>
			     			起拍价 <e class="price">￥${p.nowPriceformat }</e>
			     			<img style="float:right;" src="img/ongoing.png" />
			     		</div>
			     		<div class="num">
			     			<times class="time1"><nums>${p.click_num }</nums>次围观</times> 
				     			<times class="time2"><nums>${p.join_num }</nums>次出价</times>
			     		</div>
			     	</div>
			     	</a>
			</c:when>
			
			<c:when test="${status.count%3==0 }">
				<a href="../product/getOne/${p.id }">
		     	<div  class="column3" onmouseenter="bordercolorIn(this)" onmouseleave="bordercolorOut(this)">
		     		<img src="../statics/images/product/${fn:split(p.pic_url,';')[0]}" width="280px" height="185px"/>
		     		<div>
		     			${p.name }&nbsp;&nbsp;&nbsp;
		     			<span class="timeA">
			     			<e class="end">预计</e>&nbsp;
			     			<date><fmt:formatDate value="${p.start_time }" pattern="MM月dd日 HH:mm"/></date>
			     			&nbsp;<e class="end">开始</e>
		     			</span>
		     		</div>
		     		<div>
		     			起拍价 <e class="price">￥${p.nowPriceformat }</e>
		     			<img style="float:right;" src="img/ongoing.png" />
		     		</div>
		     		<div class="num">
		     			<times class="time1"><nums>${p.click_num }</nums>次围观</times> 
				     	<times class="time2"><nums>${p.join_num }</nums>次出价</times>
		     		</div>
		     	</div>
		     	</a>
			</c:when>
		</c:choose>
     	</div>
     	</c:forEach>
     
     </div>
     </div>
     <script>
			var newItem=document.getElementById('guessmylike');
		newItem.style.background='#FF4401';
		newItem.style.color='white';
		</script>
     <script type="text/javascript" src="js/guessmylike.js" ></script>
	<script type="text/javascript" src="js/common.js" ></script>
</body>


</html>
