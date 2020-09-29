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
		<link rel="stylesheet" href="css/mybidding.css" />
		<link rel="stylesheet" href="css/common.css" />
	</head>

	<body>
	<c:choose>
		<c:when test="${bidder==null }">
			<c:redirect url="../product/list"></c:redirect>
		</c:when>
	</c:choose>
		<jsp:include page="top.jsp"></jsp:include>
		<div class="main" id="main">
			<div class="mainTitle">我的参与的拍卖</div>
		<hr class="mainTitleLine"/>
		<div class="title">
			<div class="all" id="type0"><a id="type01" href="javascript:select('type0')">所有拍卖</a></div>
			<div class="ongoing" id="type1"><a id="type11" href="javascript:select('type1')">正在进行</a></div>
			<div class="future" id="type2"><a id="type21" href="javascript:select('type2')">即将开始</a></div>
			<div class="over" id="type3"><a id="type31" href="javascript:select('type3')">已经结束</a></div>
			<div class="titleLine"></div>
			<div class="search">
				<input id="searchContent" type="text" placeholder="请输入拍卖品名称/描述/类型" class="input3" /><a href="javascript:search()" class="a3">搜索</a>
			</div>
		</div>
		
		<div class="table">
			<div class="head">
				<div class="column1"><!-- <input type="checkbox" />全选 -->缩略图</div>
				<div class="column2">拍卖品信息</div>
				<div class="column4">当前价</div>
				<div class="column5">最新出价/您的出价</div>
				<div class="column6">起拍时间</div>
				<div class="column7">结束时间</div>
				<div class="column8">操作</div>
			</div>
			<c:set var="userid" value="${bidder.id }"></c:set>
			<div class="body">
				<c:choose>
					<c:when test="${mybid==null||fn:length(mybid)==0 }">
						<span>没有搜索到拍卖信息，换个条件试试吧！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;或者去<a href="javascript:window.open('../product/sort/0/0/0/0/0/0/0')">拍卖中心</a>逛逛吧~</span>
					</c:when>
				</c:choose>
				<c:forEach var="p" items="${mybid }" step="1" varStatus="status">
				<div id="good${status.index }" class="bidGood">
					<div class="column11">
					</div>
					<a href="javascript:gotoProduct(${p.id })" style="text-decoration:none">
					<div class="column22">
						<div class="pic">
							<img src="../statics/images/product/${fn:split(p.pic_url,';')[0]}" width="100" height="100" />
						</div>
						<div class="descri">
							${p.name }<br/><br/><br/>
							${p.description }
						</div>
						<div class="type"><i>类型:${p.type_id.typeName }</i></div>
					</div>
					</a>
					<div class="column44">
						<span class="price">${p.nowPrice }</span>元
						<span class="font3">[当前价]</span>
					<br />
					<span class="price1">${p.initialPrice }</span>元
					<span class="font3">[初始价]</span>
					<br/>
					<span class="price1">
						<fmt:formatNumber value="${p.initialPrice*0.2 }" pattern="#"></fmt:formatNumber>
						</span>元<span class="font3">[保证金]</span>
					</div>
					<div class="column55">
					<c:set var="pid" value="id_${p.id }"></c:set>
					<c:set var="bidsucc" value="null"></c:set>
					<c:choose>
						<c:when test="${fn:length(biddings[pid])==0||biddings[pid]==null }">
							暂无人拍卖
						</c:when>
						<c:otherwise>
							<c:forEach var="b" items="${biddings[pid] }" step="1" end="4" varStatus="st">
								<span class="price1">
								<fmt:formatNumber value="${b.money }" pattern="#"></fmt:formatNumber>
								</span>元
								<span class="font5" title="<fmt:formatDate value="${b.opTime }" pattern="yyyy-MM-dd HH:mm:ss"/>">
									[<fmt:formatDate value="${b.opTime }" pattern="yyyy-MM-dd"/>]
									
										<c:choose>
											<c:when test="${b.buyer_id.id==userid&&st.index==0 }">
												<span style="color:green" id="first_${pid }">
												[您]<br/>
												<c:choose>
													<c:when test="${p.status==11 }">
														<span style="color:red">
															恭喜你，暂时领先！
														</span>
													</c:when>
													
													<c:when test="${p.status==4 }">
														<span style="color:red">
															恭喜你，竞拍成功！
															<c:set var="bidsucc" value="true"></c:set>
														</span>
													</c:when>
												</c:choose>
												
												</span>
											</c:when>
											<c:when test="${b.buyer_id.id==userid}">
												<span style="color:green">[您]</span>
											</c:when>
										</c:choose>
								</span>
								<br/>
							</c:forEach>
							<c:choose>
								<c:when test="${fn:length(biddings)-4>0 }">
									已省略<span class="price1">${fn:length(biddings)-4 }</span>次出价
								</c:when>
							</c:choose>
							</c:otherwise>
					</c:choose>
						
					</div>
					<div class="column66">
						<span class="font2">
						<fmt:formatDate value="${p.start_time }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</span><br/>
						<c:choose>
							<c:when test="${p.status==11 }">
							【正在进行】
							</c:when>
							<c:when test="${p.status==12 }">
							【即将开始】
							</c:when>
							<c:when test="${p.status==4 }">
							【已结束】
							</c:when>
						</c:choose>
						
					</div>
					<div class="column77">
					<span class="font2">
					<fmt:formatDate value="${p.deadline }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</span><br/>
						<c:choose>
							<c:when test="${p.status==4 }">
							【已结束】
							</c:when>
							<c:otherwise>
							【尚未结束】
							</c:otherwise>
						</c:choose>
					</div>
					<c:set var="bidRate" value="${p.initialPrice*0.05 }"></c:set>
					<c:set var="baseMoney" value="${p.nowPrice+bidRate }"></c:set>
					
					<div class="column88">
						<c:choose>
							<c:when test="${p.status==11 }">
										<div class="moneyChange" id="moneyChangeDiv_${pid }">
											<input type="text" id="money_${p.id }" value="${baseMoney }" class="money"  onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" onfocus="setCurrentMoney(${p.id})" onblur="checkCurrentMoney(${p.id},${baseMoney })" />
											<div class="btn">
			 								<div>
													<input type="button" value="+" class="btn font" onclick="add('${p.id }',${bidRate })"/>
												</div>
												<div class="btn2">
													<input type="button" value="-" class="btn font" onclick="sub('${p.id }',${bidRate },${p.nowPrice})"/>
												</div>
											</div>
											<div class="resetA">
												<a href="javascript:resetMoney(${p.id },${baseMoney })">重置</a>
											</div>
											
											<div class="confirm">
												<input type="button" class="input6" value="确认出价" onclick="bidPrice(${p.id })" />
											</div>
											<div class="resetA">
												<a href="javascript:gotoProduct(${p.id })">详情</a>
											</div>
										</div>
										<script>
										if(document.getElementById('first_${pid}')!=null){
											document.getElementById('moneyChangeDiv_${pid}').innerHTML='您的出价已经最高~';
										}
										</script>
								
							</c:when>
							<c:when test="${p.status==12 }">
								<span title="当前不能操作">暂无操作</span>
							</c:when>
							<c:when test="${p.status==4 }">
								<c:choose>
									<c:when test="${bidsucc==true }">
									<t title="[注]若在3-5日内仍未支付余款，则视为放弃该拍卖品，您的保证金不予退还哦！">
									<span class="price"><fmt:formatNumber value="${p.nowPrice-p.initialPrice*0.2 }" pattern="#"></fmt:formatNumber>
												</span>元<br/><br/>
										<c:choose>
											<c:when test="${p.isPayed==0 }">
												<a href="javascript:payTheBill(${p.id })" >
													交齐余款
												</a><br />
											</c:when>
											
											<c:when test="${p.isPayed==1 }">
													<span style="font-size:14px;color:#666666">已交齐余款</span>
												<br />
											</c:when>
										</c:choose>
									</t>
									</c:when>
									<c:otherwise>
										<a href="../product/deleteBidding/${p.id }">删除</a>
									</c:otherwise>
								</c:choose>
								
							</c:when>
						</c:choose>
					</div>
					<c:set var="bidsucc" value="null"></c:set>
				</div>
				</c:forEach>
			</div>
			
			
		</div>
		
			<ul class="gcs-pagination" >
			    <li><a href="javascript:goPage(1)" class="a1">首页</a></li>
			    <li><a href="javascript:upPage()" class="a1">上一页</a></li>
			    <li>当前第<span class="font4" id="currentPage">1</span>页/共<span id="totalPage" class="font4">1</span>页</li>
			    <li><a href="javascript:downPage()" class="a1">下一页</a></li>
			    <li><a href="javascript:lastPage()" class="a1">尾页</a></li>
			    <li>跳转至<input id="jumpto" type="text" class="input2" onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" value="1" />页<a href="javascript:jump1()" class="a2">跳转</a></li>
		  	</ul>
	
		</div>
	<script type="text/javascript" src="js/common.js" ></script>
	<script type="text/javascript">
		var newItem=document.getElementById('mybidding');
		newItem.style.background='#FF4401';
		newItem.style.color='white';
		document.getElementById('searchContent').value="${str}";
		var pageSize=4;// 每页显示行数
	    var currentPage=1;// 当前页
	    var totalNum="${fn:length(mybid)}";//总记录数
	    var totalPage=parseInt(totalNum/pageSize);// 总页数
	    totalPage=totalPage*pageSize!=totalNum?(totalPage+1):totalPage;
	    document.getElementById('totalPage').innerHTML=totalPage;
	    goPage(1);
	    function goPage(pno){
	        if(pno>totalPage||pno<1){
	        	return;
	        } else {
	        	document.getElementById('jumpto').value=pno;
	        	currentPage = pno;// 当前页数
	        }
	        var startRow = (currentPage - 1) * pageSize+1;// 开始显示的行 31
	        var endRow = currentPage * pageSize;// 结束显示的行 40
	        endRow = (endRow > totalNum)? totalNum : endRow;
	        // 遍历显示数据实现分页
	        for(var i=1;i<=totalNum;i++){    
	            var irow = document.getElementById('good'+(i-1));
	            if(i>=startRow && i<=endRow){
	                irow.style.display = "block";    
	            }else{
	                irow.style.display = "none";
	            }
	        }
	    }
    
	    function upPage() {
	    	var cur=document.getElementById('currentPage');
	    	var currentPage=parseInt(cur.innerHTML);
	    	if(currentPage==1){// 第一页没有上一页
	    		return;
	    	} 
	    	cur.innerHTML=currentPage-1;
	    	goPage(cur.innerHTML);
	    }
	    
	    function downPage() {
	    	var cur=document.getElementById('currentPage');
	    	var currentPage=parseInt(cur.innerHTML);
	    	if(currentPage==totalPage){// 最后一页没有下一页
	    		return;
	    	} 
	    	cur.innerHTML=currentPage+1;
	    	goPage(cur.innerHTML);
	    }
		
		function lastPage() {
			goPage(totalPage);
		}
		
		function jump1() {
			var str=document.getElementById('jumpto');
			var num=str.value
			if (!(/(^[1-9]\d*$)/.test(num))||num>totalPage||num<1) { 
				str.value=currentPage;
		   }else { 
				goPage(num);
			} 
		}
		var type1="${type}";
		if(type1==null||type1.length==0){
			type1='type0';
		}
		setColor(type1);
		function select(type){
			type1=type;
			location.href="../product/mybid/"+type;
			setColor(type);
		}
		
		function setColor(str){
			var elem=document.getElementById(str);
			document.getElementById(str+'1').style.color="#FF4401";
			elem.style.borderBottom="2px #FF4401 solid";
		}
		
		function add(id,addRate){
			var moneyValue=document.getElementById('moneyValue_'+id);
			var money=document.getElementById('money_'+id);
			money.value=eval(money.value+'+'+addRate);
			moneyValue.innerHTML=money.value;
		}
		function sub(id,addRate,nowPrice) {
			var moneyValue=document.getElementById('moneyValue_'+id);
			var money=document.getElementById('money_'+id);
			if(eval(money.value-addRate)>nowPrice)
				money.value=eval(money.value-addRate);
			moneyValue.innerHTML=money.value;
		}
		
		var current;
		function setCurrentMoney(id) {
			current=document.getElementById('money_'+id).value;
		}
		
		function checkCurrentMoney(id,baseMoney){
			var cur=document.getElementById('money_'+id).value;
			if(/^[0-9]+.?[0-9]*$/.test(cur)){
				if(parseInt(cur)<baseMoney){
					alert("出价金额至少为："+baseMoney);
					document.getElementById('money_'+id).value=current;
				}
			} else {
				alert('请输入数字');
				document.getElementById('money_'+id).value="${baseMoney}";
				return
			}
			
		}
		
		function resetMoney(id,base) {
			document.getElementById('money_'+id).value=base;
		}
		
		function bidPrice(id){
			var money=document.getElementById('money_'+id).value;
			if(confirm('确认出价：'+money+"吗？")==true){
				location.href="../product/bidding1/"+id+"/"+money+"/"+type1;
			} 
		}
		
		function gotoProduct(id) {
			location.href="../product/getOne/"+id;
		}
		
		function search() {
			var str=document.getElementById('searchContent').value;
			if(str.length>0){
				location.href="../product/find/"+str;
			}
		}
		function payTheBill(id){
			//支付余款
			if(confirm("确认要支付余款吗？")==true){
				location.href="../product/payBill0/"+id;
			}
		}
	</script>
	
</body>
</html>
		