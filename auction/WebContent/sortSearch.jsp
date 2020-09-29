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
<title>淘优拍卖中心</title>
<base href="<%=basePath%>" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="statics/css/index.css" />
<link rel="stylesheet" href="statics/css/classify.css">
<link rel="shortcut icon" href="statics/images//icon/favicon.ico" />
<link rel="stylesheet" type="text/css" href="statics/css/easyui.css">

</head>

<body>
	<c:choose>
		<c:when test="${sortProducts==null }">
		<!-- /sort/{type}/{state}/{timeArea}/{price}/{bidNum}/{pricelow_pricehigh}/{startTime_endTime} -->
			<c:redirect url="product/sort/0/0/0/0/0/0/0"></c:redirect>
		</c:when>
	</c:choose>
	<jsp:include page="top.jsp"></jsp:include>
	<!-- 分类查询 -->
	<div class="sf-wrap">
		<div class="sf-filter">
			<img alt="" src="statics/images/icon/sorttop.png">

			<ul class="sf-filter-row" style="margin-bottom: -5px">
				<li>
					<div class="sf-filter-key">标的物类型</div>
					<div class="sf-filter-value">
						<div class="unlimited">
							<a id="type0" href="javascript:choose1('type0')">不限</a>
						</div>
						<ul class="condition">
							<li><em><a id="type1"
									href="javascript:choose1('type1')">车品配件</a></em></li>
							<li><em><a id="type2"
									href="javascript:choose1('type2')">图书影音</a></em></li>
							<li><em><a id="type3"
									href="javascript:choose1('type3')">珠宝首饰</a></em></li>
							<li><em><a id="type4"
									href="javascript:choose1('type4')">电子产品</a></em></li>
							<li><em><a id="type5"
									href="javascript:choose1('type5')">服装配饰</a></em></li>
							<li><em><a id="type6"
									href="javascript:choose1('type6')">精品家具</a></em></li>
							<li><em><a id="type7"
									href="javascript:choose1('type7')">数码家电</a></em></li>
							<li><em><a id="type8"
									href="javascript:choose1('type8')">美妆生活</a></em></li>
						</ul>
					</div>
				</li>
			</ul>
			<hr class="dotted">


			<ul class="sf-filter-row"
				style="margin-top: -6px; margin-bottom: -5px">
				<li>
					<div class="sf-filter-key">拍卖状态</div>
					<div class="sf-filter-value">
						<div class="unlimited">
							<a id="state0" href="javascript:choose2('state0')">不限</a>
						</div>
						<ul class="condition">
							<li><em><a id="state11"
									href="javascript:choose2('state11')">正在进行</a></em></li>
							<li><em><a id="state12"
									href="javascript:choose2('state12')">即将开始</a></em></li>
							<li><em><a id="state4"
									href="javascript:choose2('state4')">已结束</a></em></li>
						</ul>
					</div>
				</li>
			</ul>
			<hr class="dotted">

			<ul class="sf-filter-row"
				style="margin-top: -6px; margin-bottom: -5px">
				<li>
					<div class="sf-filter-key">开拍时间</div>
					<div class="sf-filter-value">
						<div class="unlimited">
							<a id="time0" href="javascript:choose3('time0')">不限</a>
						</div>
						<ul class="condition">
							<li><em><a id="time3"
									href="javascript:choose3('time3')">最近3天</a></em></li>
							<li><em><a id="time7"
									href="javascript:choose3('time7')">最近7天</a></em></li>
							<li><em><a id="time30"
									href="javascript:choose3('time30')">最近30天</a></em></li>
							<li>
								<div></div>
								<table>
									<tr>
										<td><input id="timebox1" class="easyui-datebox"
											data-options="sharedCalendar:'#cc'" editable="false">&nbsp-
										</td>

										<td><input id="timebox2" class="easyui-datebox"
											data-options="validType:'equaldDate[\'#timebox1\']'"
											editable="false"></td>
										<td><input class="button1" type="button" value="确定"
											onclick="start_end()" /></td>
									</tr>
								</table>
								<div id="cc" class="easyui-calendar"></div>
							</li>


						</ul>
					</div>
				</li>
			</ul>
			<hr class="shadowx">

		</div>
	</div>
	<div class="priceguild" id="priceguild">
		<div class="sf-filter-value1">
			<div class="unlimited">
				<a id="a4" href="javascript:choose4('a4')">默认</a>
			</div>
			<div class="totalnums">
				共<font style="color: #D9162A; font-weight: bolder; font-size: 14px">${fn:length(sortProducts)}</font>件
			</div>
			<ul class="condition">
				<li><span>价格</span> <input id="price1" type="text"
					placeholder="￥" class="price"
					oninput="this.value=this.value.replace(/\D/g,'')">&nbsp;- <input
					id="price2" type="text" placeholder="￥" class="price"
					oninput="this.value=this.value.replace(/\D/g,'')"
					title="请确保输入的价格大于前者"> <input class="button1" type="button"
					value="确定" onclick="checkPrice()" /></li>
				<li><a id="price" href="javascript:priceSortChange()">价格↔</a> <a
					id="bidnum" href="javascript:bidNumSortChange()">出价次数↔</a></li>
			</ul>
		</div>
	</div>

	<div class="q0">
		<c:choose>
			<c:when test="${fn:length(sortProducts)==0 }">
				很抱歉，没有您要找的标的物，不如换个筛选条件试试吧~
			</c:when>
			<c:otherwise>

				<c:forEach var="u" items="${sortProducts }" step="1"
					varStatus="status">
					<div class="p1">
						<c:choose>
							<c:when test="${status.count%4==1 }">
								<a href="product/getOne/${u.id}"> <c:choose>
										<c:when test="${u.status==11 }">
											<div id="element_${status.index }" class="column1"
												onmouseenter="bordercolorIn(this)"
												onmouseleave="bordercolorOut(this)">
												<img
													src="statics/images/product/${fn:split(u.pic_url,';')[0]}"
													width="280px" height="185px" />
												<div>
													${u.name }
													<e class="end"> <date> <fmt:formatDate
														value="${u.deadline }" pattern="MM月dd日 HH:mm" /></date> 结束</e>
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
										</c:when>
										<c:when test="${u.status==12 }">
											<div id="element_${status.index }" class="column1"
												onmouseenter="bordercolorIn1(this)"
												onmouseleave="bordercolorOut1(this)">
												<img
													src="statics/images/product/${fn:split(u.pic_url,';')[0]}"
													width="280px" height="185px" />
												<div>
													${u.name }
													<e class="end"> <date>开始时间<fmt:formatDate
														value="${u.start_time }" pattern="MM月dd日 HH:mm" /></date> </e>
												</div>
												<div>
													当前价
													<e class="price1">￥${u.nowPriceformat }</e>
													<img style="margin-left: 208px; margin-top: -26px"
														src="statics/images/icon/wouldgo.jpg" />
												</div>
												<div class="num">
													<times class="time1"> <nums>${u.click_num }</nums>次围观</times>
													<times class="time2"> <nums>${u.join_num }</nums>人报名</times>
												</div>
											</div>
										</c:when>
										<c:when test="${u.status==4 }">
											<div id="element_${status.index }" class="column1"
												onmouseenter="bordercolorIn2(this)"
												onmouseleave="bordercolorOut2(this)">
												<img
													src="statics/images/product/${fn:split(u.pic_url,';')[0]}"
													width="280px" height="185px" />
												<div>
													${u.name }
													<e class="end"> 结束<date> <fmt:formatDate
														value="${u.start_time }" pattern="MM月dd日 HH:mm" /></date> </e>
												</div>
												<div>
													成交价
													<e class="price2">￥${u.nowPriceformat }</e>
													<img
														style="margin-left: 148px; margin-top: -126px; width: 130px; height: 70px"
														src="statics/images/icon/over.png" />
												</div>
												<div class="num">
													<times class="time1"> <nums>${u.click_num }</nums>次围观</times>
													<times class="time2"> <nums>${u.join_num }</nums>次出价</times>
												</div>
											</div>
										</c:when>
									</c:choose>
								</a>
							</c:when>
							<c:when test="${status.count%4==2 }">
								<a href="product/getOne/${u.id}"> <c:choose>
										<c:when test="${u.status==11 }">
											<div id="element_${status.index }" class="column2"
												onmouseenter="bordercolorIn(this)"
												onmouseleave="bordercolorOut(this)">
												<img
													src="statics/images/product/${fn:split(u.pic_url,';')[0]}"
													width="280px" height="185px" />
												<div>
													${u.name }
													<e class="end"> <date> <fmt:formatDate
														value="${u.deadline }" pattern="MM月dd日 HH:mm" /></date> 结束</e>
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
										</c:when>
										<c:when test="${u.status==12 }">
											<div id="element_${status.index }" class="column2"
												onmouseenter="bordercolorIn1(this)"
												onmouseleave="bordercolorOut1(this)">
												<img
													src="statics/images/product/${fn:split(u.pic_url,';')[0]}"
													width="280px" height="185px" />
												<div>
													${u.name }
													<e class="end"> <date>开始时间<fmt:formatDate
														value="${u.start_time }" pattern="MM月dd日 HH:mm" /></date> </e>
												</div>
												<div>
													当前价
													<e class="price1">￥${u.nowPriceformat }</e>
													<img style="margin-left: 208px; margin-top: -26px"
														src="statics/images/icon/wouldgo.jpg" />
												</div>
												<div class="num">
													<times class="time1"> <nums>${u.click_num }</nums>次围观</times>
													<times class="time2"> <nums>${u.join_num }</nums>人报名</times>
												</div>
											</div>
										</c:when>
										<c:when test="${u.status==4 }">
											<div id="element_${status.index }" class="column2"
												onmouseenter="bordercolorIn2(this)"
												onmouseleave="bordercolorOut2(this)">
												<img
													src="statics/images/product/${fn:split(u.pic_url,';')[0]}"
													width="280px" height="185px" />
												<div>
													${u.name }
													<e class="end"> 结束<date> <fmt:formatDate
														value="${u.start_time }" pattern="MM月dd日 HH:mm" /></date> </e>
												</div>
												<div>
													成交价
													<e class="price2">￥${u.nowPriceformat }</e>
													<img
														style="margin-left: 148px; margin-top: -126px; width: 130px; height: 70px"
														src="statics/images/icon/over.png" />
												</div>
												<div class="num">
													<times class="time1"> <nums>${u.click_num }</nums>次围观</times>
													<times class="time2"> <nums>${u.join_num }</nums>次出价</times>
												</div>
											</div>
										</c:when>
									</c:choose>
								</a>
							</c:when>
							<c:when test="${status.count%4==3 }">
								<a href="product/getOne/${u.id}"> <c:choose>
										<c:when test="${u.status==11 }">
											<div id="element_${status.index }" class="column3"
												onmouseenter="bordercolorIn(this)"
												onmouseleave="bordercolorOut(this)">
												<img
													src="statics/images/product/${fn:split(u.pic_url,';')[0]}"
													width="280px" height="185px" />
												<div>
													${u.name }
													<e class="end"> <date> <fmt:formatDate
														value="${u.deadline }" pattern="MM月dd日 HH:mm" /></date> 结束</e>
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
										</c:when>
										<c:when test="${u.status==12 }">
											<div id="element_${status.index }" class="column3"
												onmouseenter="bordercolorIn1(this)"
												onmouseleave="bordercolorOut1(this)">
												<img
													src="statics/images/product/${fn:split(u.pic_url,';')[0]}"
													width="280px" height="185px" />
												<div>
													${u.name }
													<e class="end"> <date>开始时间<fmt:formatDate
														value="${u.start_time }" pattern="MM月dd日 HH:mm" /></date> </e>
												</div>
												<div>
													当前价
													<e class="price1">￥${u.nowPriceformat }</e>
													<img style="margin-left: 208px; margin-top: -26px"
														src="statics/images/icon/wouldgo.jpg" />
												</div>
												<div class="num">
													<times class="time1"> <nums>${u.click_num }</nums>次围观</times>
													<times class="time2"> <nums>${u.join_num }</nums>人报名</times>
												</div>
											</div>
										</c:when>
										<c:when test="${u.status==4 }">
											<div id="element_${status.index }" class="column3"
												onmouseenter="bordercolorIn2(this)"
												onmouseleave="bordercolorOut2(this)">
												<img
													src="statics/images/product/${fn:split(u.pic_url,';')[0]}"
													width="280px" height="185px" />
												<div>
													${u.name }
													<e class="end"> 结束<date> <fmt:formatDate
														value="${u.start_time }" pattern="MM月dd日 HH:mm" /></date> </e>
												</div>
												<div>
													成交价
													<e class="price2">￥${u.nowPriceformat }</e>
													<img
														style="margin-left: 148px; margin-top: -126px; width: 130px; height: 70px"
														src="statics/images/icon/over.png" />
												</div>
												<div class="num">
													<times class="time1"> <nums>${u.click_num }</nums>次围观</times>
													<times class="time2"> <nums>${u.join_num }</nums>次出价</times>
												</div>
											</div>
										</c:when>
									</c:choose>
								</a>
							</c:when>
							<c:when test="${status.count%4==0 }">
								<a href="product/getOne/${u.id}"> <c:choose>
										<c:when test="${u.status==11 }">
											<div id="element_${status.index }" class="column4"
												onmouseenter="bordercolorIn(this)"
												onmouseleave="bordercolorOut(this)">
												<img
													src="statics/images/product/${fn:split(u.pic_url,';')[0]}"
													width="280px" height="185px" />
												<div>
													${u.name }
													<e class="end"> <date> <fmt:formatDate
														value="${u.deadline }" pattern="MM月dd日 HH:mm" /></date> 结束</e>
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
										</c:when>
										<c:when test="${u.status==12 }">
											<div id="element_${status.index }" class="column4"
												onmouseenter="bordercolorIn1(this)"
												onmouseleave="bordercolorOut1(this)">
												<img
													src="statics/images/product/${fn:split(u.pic_url,';')[0]}"
													width="280px" height="185px" />
												<div>
													${u.name }
													<e class="end"> <date>开始时间<fmt:formatDate
														value="${u.start_time }" pattern="MM月dd日 HH:mm" /></date> </e>
												</div>
												<div>
													当前价
													<e class="price1">￥${u.nowPriceformat }</e>
													<img style="margin-left: 208px; margin-top: -26px"
														src="statics/images/icon/wouldgo.jpg" />
												</div>
												<div class="num">
													<times class="time1"> <nums>${u.click_num }</nums>次围观</times>
													<times class="time2"> <nums>${u.join_num }</nums>人报名</times>
												</div>
											</div>
										</c:when>
										<c:when test="${u.status==4 }">
											<div id="element_${status.index }" class="column4"
												onmouseenter="bordercolorIn2(this)"
												onmouseleave="bordercolorOut2(this)">
												<img
													src="statics/images/product/${fn:split(u.pic_url,';')[0]}"
													width="280px" height="185px" />
												<div>
													${u.name }
													<e class="end"> 结束<date> <fmt:formatDate
														value="${u.start_time }" pattern="MM月dd日 HH:mm" /></date> </e>
												</div>
												<div>
													成交价
													<e class="price2">￥${u.nowPriceformat }</e>
													<img
														style="margin-left: 148px; margin-top: -126px; width: 130px; height: 70px"
														src="statics/images/icon/over.png" />
												</div>
												<div class="num">
													<times class="time1"> <nums>${u.click_num }</nums>次围观</times>
													<times class="time2"> <nums>${u.join_num }</nums>次出价</times>
												</div>
											</div>
										</c:when>
									</c:choose>
								</a>
							</c:when>
						</c:choose>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</div>
	<!-- 分页 -->
	<div class="pagediv">
		<input type="button" class="button3" value="&lt;&lt;" onclick="first()" title="首页" />
		<input type="button" class="button3" value="&lt;" onclick="upPage(findElementById('pageNo'))" title="上一页" />
		<span class="countpage">第<e id="pageNo">1</e>页</span>
		<input type="button" class="button3" value="&gt;" onclick="downPage(findElementById('pageNo'))" title="下一页" />
		<input type="button" class="button3" value="&gt;&gt;" onclick="last()" title="尾页" />
		共<e id="totalPages"></e>页
		到第<input id="jumpToPage" style="width:40px;height:36px;font-size:18x" type="text" oninput="this.value=this.value.replace(/\D/g,'')" />
		页<input type="button" class="button2" value="确定" onclick="jumpToPage()" />
	</div>
	<!--页脚  -->
	<div style="margin-bottom: 100px">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">
	var type = "${type}";
	var state = "${state}";
	var timeArea = "${timeArea}";
	var bidNum = "${bidNum}";
	var price = "${price}";
	var pricelow_pricehigh = "${pricelow_pricehigh}";
	var startTime_endTime = "${startTime_endTime}";
	var totalRecords="${fn:length(sortProducts)}";
</script>
<script type="text/javascript" src="statics/js/jquery.min.js"></script>
<script type="text/javascript" src="statics/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="statics/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="statics/js/sortSearch.js"></script>
</html>