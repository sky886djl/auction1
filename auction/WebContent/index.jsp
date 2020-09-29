<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>淘优网上拍卖</title>
<base href="<%=basePath%>" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="statics/css/index.css" />
<link rel="shortcut icon" href="statics/images//icon/favicon.ico" />

</head>
<body>
	<!-- 页头 -->
	<jsp:include page="top.jsp"></jsp:include>
	<!-- 防止访问空列表 -->
	<c:choose>
		<c:when test="${todayList==null&&futureList==null }">
			<c:redirect url="/product/list"></c:redirect>
		</c:when>
	</c:choose>
	<br />
	<!-- 图片滚动 -->
	<div id="list"
        style="overflow: hidden; height: 200px; width: 1176px; margin-left:60px;">
        <table cellspacing="0" cellpadding="0"
            style="width: 680px; border: 0px;">
            <tr>
                <td id="list1">
                    <table style="border: 0px;" cellpadding="0" cellspacing="0">
                        <tr id="pic">
                            <td><img style="border: 0px;" alt="" src="statics/images/flow/pic1.jpg" width="334px" height="200px" /></td>
                            <td><img style="border: 0px;" alt="" src="statics/images/flow/pic2.jpg" width="334px" height="200px" /></td>
                            <td><img style="border: 0px;" alt="" src="statics/images/flow/pic3.jpg" width="334px" height="200px" /></td>
                        </tr>
                    </table>
                </td>
                <td id="list2"></td>
            </tr>
        </table>
    </div>
	<!-- 指南 -->
	<div class="guide">
		<div class="process">
			<div class="processfont">
				<a href='guildline.jsp' target="_blank">竞拍流程</a>
			</div>
		</div>
		<div class="first" onmouseenter="processIn('instruction')"
			onmouseleave="processOut('instruction')">
			<a href='guildline.jsp' target="_blank">
				<div class="instruction">
					<img id='instruction' src="statics/images/icon/instruction1.png" width="40px"
						height="40px" />
				</div>
				<div class="step">第一步</div>
				<div class="text">阅读公告</div>
			</a>
		</div>


		<div class="pic1">
			<img src="statics/images/icon/next.png" width="20px" />
		</div>
		<div class="second" onmouseenter="processIn('deposit')"
			onmouseleave="processOut('deposit')">
			<a href='guildline.jsp#part1' target="_blank">
				<div class="icon1">
					<img id="deposit" src="statics/images/icon/deposit1.png" width="40px"
						height="40px" />
				</div>
				<div class="step">第二步</div>
				<div class="text">交保证金</div>
			</a>
		</div>
		<div class="pic2">
			<img src="statics/images/icon/next.png" width="20px" />
		</div>
		<div class="third" onmouseenter="processIn('bid')"
			onmouseleave="processOut('bid')">
			<a href='guildline.jsp#part2' target="_blank">
				<div class="icon2">
					<img id="bid" src="statics/images/icon/bid1.png" width="40px" height="40px" />
				</div>
				<div class="step">第三步</div>
				<div class="text">出价竞拍</div>
			</a>
		</div>
		<div class="pic3">
			<img src="statics/images/icon/next.png" width="20px" />
		</div>
		<div class="forth" onmouseenter="processIn('bidsucc')"
			onmouseleave="processOut('bidsucc')">
			<a href='guildline.jsp#part3' target="_blank">
				<div class="icon3">
					<img id="bidsucc" src="statics/images/icon/bidsucc1.png" width="40px"
						height="40px" />
				</div>
				<div class="step">第四步</div>
				<div class="text">竞拍成功</div>
			</a>
		</div>
		<div class="pic4">
			<img src="statics/images/icon/next.png" width="20px" />
		</div>
		<div class="fifth" onmouseenter="processIn('deal')"
			onmouseleave="processOut('deal')">
			<a href='guildline.jsp#part4' target="_blank">
				<div class="icon4">
					<img id="deal" src="statics/images/icon/deal1.png" width="40px" height="40px" />
				</div>
				<div class="step">第五步</div>
				<div class="text">办理交割</div>
			</a>
		</div>
	</div>
	<!-- 拍卖品显示 -->
	<div class="p0">
		<div class="today">
			今日<font color="#595959">拍卖</font>
		</div>
		<div class="onlooks">
			${todayClick }<font color="#333333">次围观</font>
		</div>

		<div>
			<hr color="#D91615" />
		</div>
		<div class="more">
			<a href="product/sort/0/11/0/0/0/0/0">更多<moretol>${proTodayNum }</moretol>件
				&gt;
			</a>
		</div>

		<c:forEach var="u" items="${todayList }" step="1" varStatus="status"
			end="5">
			<div class="p1">
				<c:if test="${status.count%3==1 }">
					<a href="product/getOne/${u.id}">
						<div class="column1" onmouseenter="bordercolorIn(this)"
							onmouseleave="bordercolorOut(this)">
							<img src="statics/images/product/${fn:split(u.pic_url,';')[0]}" width="280px"
								height="185px" />
							<div>
								${u.name }
								<e class="end">预计 <date><fmt:formatDate value="${u.deadline }" pattern="MM月dd日 HH:mm"/></date>
								结束</e>
							</div>
							<div>
								当前价
								<e class="price">￥${u.nowPriceformat }</e>
								<img style="margin-left: 218px; margin-top: -26px"
									src="statics/images/icon/ongoing.png" />
							</div>
							<div class="num">
								<times class="time1"> <nums>${u.click_num }</nums>次围观</times>
								<times class="time2"> <nums>${u.join_num }</nums>次出价</times>
							</div>
						</div>
					</a>
				</c:if>

				<c:if test="${status.count%3==2 }">
					<a href="product/getOne/${u.id}">
						<div class="column2" onmouseenter="bordercolorIn(this)"
							onmouseleave="bordercolorOut(this)">
							<img src="statics/images/product/${fn:split(u.pic_url,';')[0]}" width="280px"
								height="185px" />
							<div>
								${u.name }
								<e class="end">预计 <date><fmt:formatDate value="${u.deadline }" pattern="MM月dd日 HH:mm"/></date>
								结束</e>
							</div>
							<div>
								当前价
								<e class="price">￥${u.nowPriceformat }</e>
								<img style="margin-left: 218px; margin-top: -26px;"
									src="statics/images/icon/ongoing.png" />
							</div>
							<div class="num">
								<times class="time1"> <nums>${u.click_num }</nums>次围观</times>
								<times class="time2"> <nums>${u.join_num }</nums>次出价</times>
							</div>
						</div>
					</a>
				</c:if>
				<c:if test="${status.count%3==0 }">
					<a href="product/getOne/${u.id}">
						<div class="column3" onmouseenter="bordercolorIn(this)"
							onmouseleave="bordercolorOut(this)">
							<img src="statics/images/product/${fn:split(u.pic_url,';')[0]}" width="280px"
								height="185px" />
							<div>
								${u.name }
								<e class="end">预计 <date><fmt:formatDate value="${u.deadline }" pattern="MM月dd日 HH:mm"/></date>
								结束</e>
							</div>
							<div>
								当前价
								<e class="price">￥${u.nowPriceformat }</e>
								<img style="margin-left: 212px; margin-top: -26px;"
									src="statics/images/icon/ongoing.png" />
							</div>
							<div class="num">
								<times class="time1"> <nums>${u.click_num }</nums>次围观</times>
								<times class="time2"> <nums>${u.join_num }</nums>次出价</times>
							</div>
						</div>
					</a>
				</c:if>
			</div>
		</c:forEach>

		<div class="more">
			<a href="product/sort/0/11/0/0/0/0/0">更多<moretol>${proTodayNum }</moretol>件&gt;
			</a>
		</div>

		<div class="todaybottom">
			<hr color="#D91615" />
		</div>

		<!-- 近期预告 -->
		<div class="p11">
			<div class="future">
				近期<font color="#595959">预告</font>
			</div>
			<div class="onlooks2">
				${futureClick }<font color="#333333">次围观</font>
			</div>
			<div>
				<hr color="#19AA6B" />
			</div>
			<div class="more">
				<a href="product/sort/0/12/0/0/0/0/0">更多<font color="#19AA6B" size="4">${proFutureNum } </font>件
					&gt;
				</a>
			</div>
			<c:forEach var="u" items="${futureList }" step="1" varStatus="status"
				end="5">
				<div class="p1">
					<c:if test="${status.count%3==1 }">
						<a href="product/getOne/${u.id}">
							<div class="column1" onmouseenter="bordercolorIn1(this)"
								onmouseleave="bordercolorOut1(this)">
								<img src="statics/images/product/${fn:split(u.pic_url,';')[0]}" width="280px"
								height="185px" />
								<div>
									${u.name }
									<e class="end">开始时间 <date><fmt:formatDate value="${u.start_time }" pattern="MM月dd日 HH:mm"/></date>
									</e>
								</div>
								<div>
									起拍价
									<e class="price1">￥${u.initialPriceformat }</e>
									<img style="margin-left: 208px; margin-top: -26px;"
										src="statics/images/icon/wouldgo.jpg" />
								</div>
								<div class="num">
									<times class="time1"> <nums>${u.click_num }</nums>次围观</times>
									<times class="time2"> <nums>${u.join_num }</nums>人报名</times>
								</div>
							</div>
						</a>
					</c:if>

					<c:if test="${status.count%3==2 }">
						<a href="product/getOne/${u.id}">
							<div class="column2" onmouseenter="bordercolorIn1(this)"
								onmouseleave="bordercolorOut1(this)">
								<img src="statics/images/product/${fn:split(u.pic_url,';')[0]}" width="280px"
								height="185px" />
								<div>
									${u.name }
									<e class="end">开始时间 <date><fmt:formatDate value="${u.start_time }" pattern="MM月dd日 HH:mm"/></date>
									</e>
								</div>
								<div>
									起拍价
									<e class="price1">￥${u.initialPriceformat }</e>
									<img style="margin-left: 208px; margin-top: -26px;"
										src="statics/images/icon/wouldgo.jpg" />
								</div>
								<div class="num">
									<times class="time1"> <nums>${u.click_num }</nums>次围观</times>
									<times class="time2"> <nums>${u.join_num }</nums>人报名</times>
								</div>
							</div>
						</a>
					</c:if>
					<c:if test="${status.count%3==0 }">
						<a href="product/getOne/${u.id}">
							<div class="column3" onmouseenter="bordercolorIn1(this)"
								onmouseleave="bordercolorOut1(this)">
								<img src="statics/images/product/${fn:split(u.pic_url,';')[0]}" width="280px"
								height="185px" />
								<div>
									${u.name }
									<e class="end">开始时间 <date><fmt:formatDate value="${u.start_time }" pattern="MM月dd日 HH:mm"/></date>
									</e>
								</div>
								<div>
									起拍价  
									<e class="price1">￥${u.initialPriceformat }</e>
									<img style="margin-left: 208px; margin-top: -26px;"
										src="statics/images/icon/wouldgo.jpg" />
								</div>
								<div class="num">
									<times class="time1"> <nums>${u.click_num }</nums>次围观</times>
									<times class="time2"> <nums>${u.join_num }</nums>人报名</times>
								</div>
							</div>
						</a>
					</c:if>
				</div>
			</c:forEach>
			<div class="more">
				<a href="product/sort/0/12/0/0/0/0/0">更多<font color="#19AA6B">${proFutureNum } </font>件
					&gt;
				</a>
			</div>
			<div class="todaybottom">
				<hr color="#19AA6B" />
			</div>
		</div>

	</div>
	<div style="margin-bottom:100px;"></div>
	<!-- 拍卖公告 -->
	<div class="p3" id="paimaigonggao">
		<div class="p31">
			拍卖公告
		</div>
		
		<br />
		<ul>
		<c:forEach var="u" items="${announcementList }" step="1" >
			<li><a style="cursor:pointer" title="${u.title }">
			<c:choose>
				<c:when test="${fn:length(u.title)>16 }">
					${u.title.substring(0,17)}...
				</c:when>
				<c:otherwise>
				${u.title}
				</c:otherwise>
			</c:choose>
			</a></li>
		</c:forEach>
		</ul>

		<div class="p31">新闻资讯</div>
		<ul>
		<c:forEach var="u" items="${newsList }" step="1" >
			<li><a style="cursor:pointer" title="${u.title }">
			<c:choose>
				<c:when test="${fn:length(u.title)>16 }">
					${u.title.substring(0,17)}...
				</c:when>
				<c:otherwise>
				${u.title}
				</c:otherwise>
			</c:choose>
			
			</a></li>
		</c:forEach>
		</ul>
	</div>
	<!-- 新品推荐 -->
	<div class="p3">
		<div class="guesstop">
				<div class="guesslike">新品推荐</div>
				<div class="guessnext">
				</div>
		</div>
		<hr class="style-one"/>
		
		<c:set var="guessLength" value="${fn:length(todayList) }"></c:set>
		
		<c:choose>
			<c:when test="${guessLength>6 }">
			<c:forEach var="pro" items="${todayList }" begin="6" end="${guessLength}" varStatus="status">
			<a href="product/getOne/${pro.id }" target="_blank" >
			<div id="guessyoulike_${status.index }" class="guessyoulike good1" onmouseenter="guessyoulikeIn(this)" onmouseleave="guessyoulikeOut(this)">
				<div class="pic5">
					<img src="statics/images/product/${fn:split(pro.pic_url,';')[0]}" width="150" height="150" />
				</div>
				<div class="descri">
					<div class="name">${pro.name }</div>
					<div class="font2">￥${pro.nowPriceformat }</div>
					<div class="font1">(当前价)</div>
				</div>
				<div class="good1 records">
					<times class="time6"> <nums>${pro.click_num }</nums>次围观</times>
					<times class="time7"> <nums>${pro.join_num }</nums>次出价</times>
				</div>
			</div>
			<hr class="style-two"/>
			
			</a>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<div style="height:400px;margin-left:1020px;color:#656565;font-size:16px;">暂无相关推荐</div>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- 页脚 -->
	<jsp:include page="footer.jsp"></jsp:include>
	 
<script type="text/javascript" src="statics/js/index.js"></script>

</body>
</html>