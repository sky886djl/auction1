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
<title>商品详情</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="statics/images//icon/favicon.ico" />
<base href="<%=basePath%>" />

<c:choose>
	<c:when test="${product==null}">
		<c:redirect url="product/list"></c:redirect>
	</c:when>
</c:choose>
</head>

<body onload="onload()">
	<jsp:include page="top.jsp"></jsp:include>
	<p class="p1">【第一次拍卖】${product.description }——${product.name }</p>
	<div id="d">
		<div id="d11">
			<div class="box" id="box">
				<div id="smallBox" class="small">
					<img src="statics/images/product/${fn:split(product.pic_url,';')[0]}" id="imgshow"
						width="460px" height="300px">
				</div>
			</div>
			<div id="img2">
				<ul>
					<c:forEach var="pic" items="${fn:split(product.pic_url,';')}" step="1">
						<li><img src="statics/images/product/${pic }" width="100"
							height="80" onmouseover="showimg('statics/images/product/${pic }');" /></li>
					</c:forEach>
				</ul>
			</div>
			<div class="join_people">
				<span><em class="num">${product.join_num }</em> 次出价</span> <span><em
					class="num">${product.click_num }</em> 次围观</span>
			</div>

		</div>


		<div id="d12">
			<c:choose>
			<c:when test="${product.status==11 }">
			<div class="moneydistance">
				<span>当前价:</span>
				<span class="p5" id="nowPrice">${product.nowPriceformat  }</span>
				<m>发布者：${product.seller_id.username}</m>
			</div>
			<div class="enddistance">
				<span class="enddistancelanel">距 结 束：</span>
				<mytime> <span class="p9" id="day">00</span>天<span
					class="p9" id="hour">04</span>时<span class="p9" id="minute">12</span>分<span
					class="p9" id="second">36</span>秒</mytime>
			</div>
			</c:when>
			<c:when test="${product.status==12 }">
			<div class="moneydistance">
				<span>起拍价:</span>
				<span class="p5" id="nowPrice"> ${product.initialPriceformat }</span>
				<m>发布者：${product.seller_id.username}</m>
			</div>
			<div class="enddistance">
				<span class="enddistancelanel">开始时间：</span>
				<span><fmt:formatDate value="${product.start_time }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
			</div>
			</c:when>
			<c:when test="${product.status==4 }">
			<div class="moneydistance">
				<span>成交价:</span>
				<span class="p5" id="nowPrice"> ${product.nowPriceformat }</span>
				<m>发布者：${product.seller_id.username}</m>
			</div>
			<div class="enddistance">
				<span class="enddistancelanel">成交时间：</span>
				<mytime> <fmt:formatDate value="${product.deadline }" pattern="yyyy-MM-dd HH:mm:ss"/></mytime>
			</div>
			</c:when>
			</c:choose>
			<div id="dp1">
			<fmt:formatNumber var="deposit1" value="${product.initialPrice*0.2 }" pattern="#"></fmt:formatNumber>
			<c:choose>
				<c:when test="${product.status==11 }">
				 <span class="selectone">您的出价：</span> 
				<div class="mytip">￥</div>
				<c:set var="bidRate" value="${product.initialPrice*0.05 }"></c:set>
				<c:set var="baseMoney" value="${product.nowPrice+bidRate }"></c:set>
				<div class="moneyChange">
					<input type="text" id="money" value="${baseMoney}" onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" onfocus="setCurrentMoney()" onblur="checkCurrentMoney(${baseMoney })" class="money" />
					<div class="btn">
						<div class="btn1">
							<input type="button" value="+" class="btn font" onclick="add()"/>
						</div>
						<div class="btn2">
							<input type="button" value="-" class="btn font" onclick="sub()"/>
						</div>
					</div>
					<div class="resetA0">
						<a href="javascript:resetMoney()" >重置</a>
					</div>
				</div>
				
				<know> <a href="guildline.jsp"><img
					src="statics/images/icon/money.png" width="20px" height="20px" />报名必看</a></know>
				<div class="buttoncls">
					<input type="button" onclick="deposit()"  id="button1" value='报名交保证金${deposit1}' />
				</div>
				</c:when>
				<c:when test="${product.status==12 }">
				<div class="futuretostart">本场拍卖即将开始，敬请期待！</div>
				<div class="buttoncls">
					<input type="button" onclick="deposit()"  id="button1" value='报名交保证金(${deposit1} })' />
				</div>
				</c:when>
				<c:when test="${product.status==4 }">
					<div class="alreadyover">本场拍卖已结束！</div>
					<div style="margin-left:150px;">
						<img src="statics/images/icon/bidover.png" height="120">
					</div>
				</c:when>
			</c:choose>
			
			</div>
						
			
			<div class="probottomintro">
			<div>
				<span class="p3">起 拍 价:</span><span class="p8"><fmt:formatNumber
						value="${product.initialPrice }" type="currency" maxFractionDigits="0" /></span>
			</div>
			<div>
				<span class="p3">保 证 金:</span><span class="p8">￥${deposit1}</span>
			</div>
			<div>
				<span class="p3">加价幅度:</span><span class="p8"><fmt:formatNumber
						value="${product.initialPrice*0.05 }" type="currency" maxFractionDigits="0" /></span>
			</div>
			</div>
		</div>
		
		<c:if test="${product.status!=4}">
			<a id="subscribeA" href='javascript:setRemind(${product.id })' class="subscribeA">
				<div class="subscribe" onmouseenter="guessyoulikeIn(this)" onmouseleave="guessyoulikeOut(this)">
					<div class="pic">
						<img src="statics/images/icon/remind.png" width="56" />
					</div>
					
					<div class="discription" id="remindA">
						设置提醒
					</div>
				</div>
			</a>
		</c:if>
		
	</div>
	
	<!-- 猜你喜欢 -->
	<div class="guessyoulike">
		<div class="guesstop">
				<div class="guesslike">猜你喜欢</div>
				<div class="guessnext">
				<a id="guessnexttext" href="javascript:nextGood()">换一波</a>
				</div>
		</div>
		<c:set var="guessLength" value="${fn:length(guessYouLike) }"></c:set>
		<c:choose>
			<c:when test="${guessLength>0 }">
			<c:forEach var="pro" items="${guessYouLike }" end="${guessLength}" varStatus="status">
			<a href="product/getOne/${pro.id }" target="_blank" >
			<c:choose>
				<c:when test="${pro.status==11 }">
					<div id="guessyoulike_${status.index }" class="good" onmouseenter="guessyoulikeIn(this)" onmouseleave="guessyoulikeOut(this)">
						<div class="pic1">
							<img src="statics/images/product/${fn:split(pro.pic_url,';')[0]}" width="100" height="100" />
						</div>
						<div class="descri">
							<div class="name">${pro.name }</div>
							<div class="font2">￥${pro.nowPriceformat }</div>
							<div class="font1">(当前价)</div>
						</div>
					</div>
				</c:when>
				<c:when test="${pro.status==12 }">
					<div id="guessyoulike_${status.index }" class="good" onmouseenter="guessyoulikeIn1(this)" onmouseleave="guessyoulikeOut(this)">
						<div class="pic1">
							<img src="statics/images/product/${fn:split(pro.pic_url,';')[0]}" width="100" height="100" />
						</div>
						<div class="descri">
							<div class="name">${pro.name }</div>
							<div class="font3">￥${pro.initialPriceformat }</div>
							<div class="font1">(起拍价)</div>
						</div>
					</div>
				</c:when>
				
			</c:choose>
			
			</a>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<div style="height:400px;margin-left:1020px;color:#656565;font-size:16px;">暂无相关推荐</div>
			</c:otherwise>
		</c:choose>
	</div>
	<hr style="margin-top: 60px; color: #999999;width:1366px;margin-left:-10px;" />
	<div class="decripbidding">
		<div class="decripbiddingtop" id="ttop0">
			<a
				href="product/getOne/${product.id }#objectintro"
				onclick="select1()"><div id="ttop1" class="decripbiddingtop00">商品介绍</div></a>
			<a
				href="product/getOne/${product.id }#recordsA"
				onclick="select2()"><div id="ttop2" class="decripbiddingtop01">
					竞买记录(<font color="#D91615">${fn:length(recordBiddings)}</font>)
				</div> </a>
			<a
				href="product/getOne/${product.id }#commentsA"
				onclick="select3()"><div id="ttop3" class="decripbiddingtop02">
					评论列表(<font color="#D91615">${fn:length(comments)}</font>)
				</div> </a>
		</div>


		<div id="objectintro" style="height: 60px;"></div>
		<div class="title">
			<div class="title_text">标的物介绍</div>
			<div class="title_line"></div>
		</div>
		<div class="description0">
			<div class="description">实物图介绍</div>
		</div>
		<div style="margin-left: 120px; margin-top: 0px">
			<c:forEach var="pic" items="${fn:split(product.pic_url, ';') }" step="1">
				<div style="margin-top: 12px">
					<img src="statics/images/product/${pic }" width="836" />
				</div>
			</c:forEach>
		</div>
		<div class="description0">
			<div class="description">具体描述</div>
		</div>
		<!-- 商品属性 -->
		<table class="altrowstable" id="alternatecolor">
			<tr>
				<th>参数名</th>
				<th>参数值</th>
			</tr>
			<tr>
				<td>商品名称</td>
				<td>${product.name }</td>
			</tr>
			<tr>
				<td>起拍价</td>
				<td><fmt:formatNumber value="${product.initialPrice }" type="currency" maxFractionDigits="0" /></td>
			</tr>
			<tr>
				<td>当前价</td>
				<td><fmt:formatNumber value="${product.nowPrice }" type="currency" maxFractionDigits="0" /></td>
			</tr>
			<tr>
				<td>商品描述</td>
				<td>${product.description }</td>
			</tr>
			<tr>
				<td>拍卖开始时间</td>
				<td><fmt:formatDate value="${product.start_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
			<tr>
				<td>拍卖结束时间</td>
				<td><fmt:formatDate value="${product.deadline}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
		</table>



		<!-- 竞买记录 -->
		<div id="recordsA" style="height: 60px;"></div>
		<div class="frame">
			<div class="border">
				<div class="record">
					<div class="title">
						<div class="title_text">竞买记录</div>
						<div class="title_line"></div>
					</div>
					<c:choose>
						<c:when test="${fn:length(recordBiddings)==0 }">
							<div class="nobody">暂无人拍买</div>
						</c:when>
						<c:otherwise>
							<table class="record_table">
									<tr>
										<th>状态</th>
										<th class="number">竞买号</th>
										<th class="price">价格</th>
										<th class="time">时间</th>
									</tr>
								<tbody id="idDatas">
									<tr class="get">
										<td><span>领先</span></td>
										<td>${recordBiddings[0].buyer_id.username }</td>
										<td><fmt:formatNumber value="${recordBiddings[0].money }" type="currency" maxFractionDigits="0" /> </td>
										<td><fmt:formatDate value="${recordBiddings[0].opTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									</tr>

									<c:forEach var="bidding" begin="1" items="${recordBiddings }">
										<tr class="out">
											<td><span>出局</span></td>
											<td>${bidding.buyer_id.username }</td>
											<td><fmt:formatNumber value="${bidding.money }" type="currency" maxFractionDigits="0" /> </td>
										<td><fmt:formatDate value="${bidding.opTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<ul>
								<li>共${fn:length(recordBiddings)}条记录</li>
							</ul>
							<ul>
								<li>第  <e id="pageNo">1</e>页/共<e id="totalPages"></e>页
								</li>
							</ul>

							<ul>
								<li><a onclick="upPage(getElementById('pageNo'))" onmouseover="this.style.color='#D91615';this.style.cursor='pointer';" onmouseout="this.style.color='#666666'" >上一页</a></li>
							</ul>
							<ul>
								<li><a onclick="downPage(getElementById('pageNo'))" onmouseover="this.style.color='#D91615';this.style.cursor='pointer'" onmouseout="this.style.color='#666666'">下一页</a></li>
							</ul>
						</c:otherwise>
					</c:choose>


				</div>
			</div>
		</div>
		<div style='margin-bottom:50px'></div>
		
		<!-- 评论列表 -->
		<div id="commentsA" style="height: 60px;margin-top:30px;"></div>
		<div class="title">
				<div class="title_text">评论记录</div>
				<div class="title_line"></div>
		</div>
		<div class="article-container">
	      <div class="commentArea">
	      	<textarea placeholder="期待你的评论..." class="styled" name="styled-textarea" id="styled0"></textarea>
	      <div class="btns">
	      	<input type="button" class="button" value="发布" onclick="javascript:submitComment(0,0)"/>
	      </div>
	      </div>
	      
	      <div class="comment_list">
	        <h3 style="text-indent: 2em;">评论列表</h3>
	            <hr>
	   		<c:forEach var="comment" items="${comments }" varStatus="st">
	   		
	     	<div class="comment" id="more${st.index }">
	             <div class="imgdiv">
	                <img class="imgcss"  src="admin/static/img/${comment.user_id.headpic }"/>
	             </div>
	             <div class="conmment_details">
	                <span class="optime">
						<fmt:formatDate value="${comment.commentTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
					 </span>
	                <div style="float:left;margin-top:30px">
	                  <span class="comment_name">${comment.user_id.name }: </span>     
	                  
	                </div>
	                <div class="del">
	                <span  class="show_reply_list">
	                <c:choose>
	                	<c:when test="${fn:length(comment.replys)>0 }">
		                  	<a href="javascript:showReply(${st.index })" id="showhide${st.index }" style="text-decoration: none;color:dodgerblue">查看回复</a>
	                  </c:when>
	                </c:choose>
	                  </span>
	                </div>
	                 <div class="comment_content" >
	                 	${comment.content }
		                <span id="operation${st.index }" class="operation">
		                	<a id="replyCommentA_${st.index }" href="javascript:replyComment('_${st.index }',${st.index },'${comment.user_id.name }')" style="text-decoration: none;margin-right:20px;color:dodgerblue">回复</a> 
		                	<c:if test="${bidder!=null&&bidder.id==comment.user_id.id }"><a href="javascript:deleteComment(${comment.id })" style="text-decoration: none;margin-right:40px;color:dodgerblue">删除</a> </c:if>
		                </span>
	                </div>
	               
	                	
	            </div>
	           <div class="reply_list" id="reply${st.index }" >   <!--style="display:none;"-->
		           <c:forEach var="reply" items="${comment.replys }" varStatus="st1">
		           <hr style="width:834px;margin-left:64px">
		           		<div class="reply" >
	             		<div style="width:740px;">
		                <span class="reply_name">
			                <img src="admin/static/img/${reply.user_id.headpic }" width="40" height="40" style="border-radius:50% ;margin-top:-20px;margin-right: 8px;"/>
		                	<ul>
		                		<li><span class="optime1">
								<fmt:formatDate value="${reply.commentTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
					  		</span></li>
		                		<li>${reply.user_id.name }:<span class="reply_content">${reply.content }</span>
		                		<span style="float:right">
				                	<%-- <a id="replyCommentA_${st.index }${st1.index }" class="sub_reply" href="javascript:replyComment('_${st.index }${st1.index }',${st.index },'${reply.user_id.name }')">回复</a> --%>
				                	&nbsp;&nbsp;
				                	<c:if test="${bidder!=null&&bidder.id==reply.user_id.id }"><a href="javascript:deleteComment(${reply.id })"  class="del_reply">删除</a> </c:if>   
			                	</span></li>
		                	</ul>
		                </span>
			                </div>
			             </div>   
		           </c:forEach>
	             
	              
	          </div>
	           <div class="replyComment" id="replyComment_${st.index }">
	      				<textarea autofocus="autofocus" placeholder="你回复@${comment.user_id.name }" class="styled" name="styled-textarea" id="styled_${st.index }${st1.index }"></textarea>
							   <div class="btns">
							     <input type="button" class="button" onclick="javascript:submitComment(${comment.id},'_${st.index }${st1.index }')" value="回复"/>
							   </div>
				</div>
	           
	       <!--回复列表结束-->
	       <hr>
	       </div> 
	      </c:forEach>
	       <div class="comment_add_or_last" >
	       		<c:choose>
	       			<c:when test="${fn:length(comments)>0 }">
			            <a id="moreComment" href="javascript:moreComment()" style="text-decoration: none;">点击加载更多评论</a> 
	       			</c:when>
	       			<c:otherwise>
						暂无评论	       				
	       			</c:otherwise>
	       		</c:choose>
	       </div> 
	       <hr>
	      </div>
	 
	</div>
 
	</div>
	
	
<script>
	
	//查看回复
	function showReply(id){
		document.getElementById('reply'+id).style.display='block';
		var showhide=document.getElementById('showhide'+id);
		showhide.innerHTML='收起回复';
		showhide.href='javascript:hideReply('+id+')';
		
	}
	//隐藏回复
	function hideReply(id){
		document.getElementById('reply'+id).style.display='none';
		var showhide=document.getElementById('showhide'+id);
		showhide.innerHTML='查看回复';
		showhide.href='javascript:showReply('+id+')';
	}
	
	var cur=0;
	var total="${fn:length(comments)}";
	function moreComment(){
			var end=cur+5;
			if(end>=total){
				end=total;
				var morecomment=document.getElementById('moreComment');
				morecomment.innerHTML='收起回复';
				morecomment.href='javascript:reset1()';
				cur=0;
				for(var i=cur;i<end;i++){
					document.getElementById('more'+i).style.display='block';
				}
			} else {
				for(var i=cur;i<end;i++){
					document.getElementById('more'+i).style.display='block';
				}
				cur=end;
			}
	}
	moreComment();
	function reset1() {
		for(var i=0;i<total;i++){
			document.getElementById('more'+i).style.display='none';
		}
		var morecomment=document.getElementById('moreComment');
		morecomment.innerHTML='点击加载更多评论';
		morecomment.href='javascript:moreComment()';
	}
	
	//回复
	function replyComment(idA,id,username){
		var comment=document.getElementById('replyComment_'+id);
		comment.style.display='block';
		var commentA=document.getElementById('replyCommentA'+idA);
		commentA.innerHTML='收起';
		commentA.href='javascript:hideReplyComment("'+idA+'",'+id+',"'+username+'")';
	}
	//收起
	function hideReplyComment(idA,id,username){
		var comment=document.getElementById('replyComment_'+id);
		comment.style.display='none';
		var commentA=document.getElementById('replyCommentA'+idA);
		commentA.innerHTML='回复';
		commentA.href='javascript:replyComment("'+idA+'",'+id+',"'+username+'")';
	}
</script>
	
	<a href="product/getOne/${product.id }#"
		class="btt">顶部</a>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<link rel="stylesheet" href="statics/css/comment.css" />
<link rel="stylesheet" href="statics/css/product_view.css" />
<script type="text/javascript" src="statics/js/jquery.min.js"></script>
<script type="text/javascript">
	var deadline = '<fmt:formatDate value="${product.deadline}" pattern="yyyy-MM-dd HH:mm:ss"/>';
	var username = "${bidder.username}";
	var deposit = '${deposit}';
	var bidding = '${bidding}';
	var id = '${product.id}';
	var status = '${product.status}';
	var guessLength='${guessLength}';
	var nowPrice="${product.nowPrice}";
	var initialPrice="${product.initialPrice}";
	var addRate="${bidRate}";
	var pwd="${bidder.password}";
	var btn = document.getElementById('button1');
	var subscribe="${subscribe}";
	if(!(subscribe==null||subscribe.length==0)) {
		document.getElementById('remindA').innerHTML='已经提醒';
		document.getElementById('subscribeA').href='javascript:cancelSubscribe(${product.id})';
	}
	
	if (bidding == 'prior') {
		btn.value = '您的出价位居榜首,无需竞价';
		btn.disabled = true;
		btn.style = "background-color: #999999;";
	} else if (deposit == 'yes') {
		if(status==11)
			btn.value = '出价竞拍';
		else if(status==12) {
			btn.value = '您已交保，敬请期待';
			btn.disabled=true;
			btn.style.background='#999999';
		}
	} else {
		btn.value = '报名交保证金(${deposit1}元)';
	}
	var money=document.getElementById('money');
	var moneyVal=money.value;
	if(status==11)
		money.value=eval(nowPrice +'+'+addRate);
	function add(){
		money.value=eval(money.value+'+'+addRate);
		moneyVal=money.value;
	}
	
	function sub() {
		if(eval(money.value-addRate)>nowPrice){
			money.value=eval(money.value-addRate);
			moneyVal=money.value;	
		}
	}
	
	var current;
	function setCurrentMoney() {
		current=document.getElementById('money').value;
		moneyVal=money.value;
	}
	
	function checkCurrentMoney(baseMoney){
		var cur=document.getElementById('money').value;
		moneyVal=money.value;
		if(/^[0-9]+.?[0-9]*$/.test(moneyVal)){
			if(parseInt(cur)<parseInt(baseMoney)){
				alert("出价金额至少为："+baseMoney);
				document.getElementById('money').value=current;
				moneyVal=money.value;
			}
		} else {
			alert('请输入数字');
			document.getElementById('money').value="${baseMoney}";
			moneyVal=money.value;
			return
		}
	}
	
	function resetMoney() {
		document.getElementById('money').value="${baseMoney}";
	}
	
	function ajaxSubmit(type,url,data,msg){
		$.ajax({
			async : false,
			type: type,
			cache: false,
			url: url,
			data: data,
			dataType: 'json',
			success: function(data){
				if(data){
					alert(msg+'成功！');
				}
				else {
					alert(msg+'失败！');
				}
				location.href="product/getOne/"+id;
			}
		});	
	}
	
	function setRemind(pro_id) {
		if(username==null||username.length==0){
			if(confirm('您还未登录，是否登录？')==true)
    			location.href="user/loginUI";
		} else {
			if(confirm("设置拍卖品提醒后，该拍卖品的开始结束信息会及时通知设置提醒者，确认设置提醒？")==true){
				ajaxSubmit('POST','product/setSubscribe',{"pro_id":pro_id},'设置提醒');
			}
		}
	}
	
	function cancelSubscribe(pro_id) {
		if(username==null||username.length==0){
			if(confirm('您还未登录，是否登录？')==true)
    			location.href="user/loginUI";
		} else {
			if(confirm("取消后不再接受该拍卖品的提醒，确认取消提醒？")==true){
				ajaxSubmit('POST','product/cancelSubscribe',{"pro_id":pro_id},'取消提醒');
			}
		}
		
	}
	
	function deleteComment(id){
		if(confirm("确认删除评论及其子评论吗？")==true){
			ajaxSubmit('POST','comment/delete',{"id":id},"删除评论");
		}
	}
	/*
	originalPost_id--0-原贴评论 1回复贴评论
	
	*/
	function submitComment(originalPost_id,textAreaId) {
		if(username==null||username.length==0){
			if(confirm('您还未登录，是否登录？')==true)
    			location.href="user/loginUI";
			return;
		}
		var content=document.getElementById('styled'+textAreaId).value;
		if(content.length==0){
			alert('评论内容不能为空！');
			return;
		}
		console.log(content);
		var data={
				"pro_id":id,
				"content":content,
				"originalPost_id":originalPost_id
		};
		console.log(data);
		$.ajax({
			async : false,
			type: 'POST',
			cache: false,
			url: 'comment/submitComment',
			data:JSON.stringify(data),
			dataType: 'json',
			contentType : 'application/json;charset=UTF-8',
			success: function(data){
				if(data){
					alert('评论成功！');
				}
				else {
					alert('评论失败！');
				}
				location.href="http://localhost:8080/auction/product/getOne/"+id;
			}
		});
	}
	
	

</script>
<script type="text/javascript" src="statics/js/product_view.js"></script>

</html>