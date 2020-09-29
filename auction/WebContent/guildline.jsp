<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/guildline.jsp";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>拍卖网</title>
<base href="<%=basePath%>" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="statics/images/icon/favicon.ico" />
<link href="statics/guild/css/bootstrap.css" rel="stylesheet">
<link href="statics/guild/css/blog.css" rel="stylesheet">
<link rel="stylesheet" href="statics/css/top.css" />
<style type="text/css">

.menu1 a:hover {
	color: #D91615;
	padding: 4px;
}
.navtopstyle .nav1 {
width:1500px;
}
.navtopstyle {
margin-top:0px;border-top:1px #FFFFFF solid;width:1300px}
.line1{
	border: 1.5px solid #e8e8e8;
	margin-top: 28px;
	margin-left: -20px;
	width: 1666px;
}
</style>
<script type="text/javascript">

window.onscroll=function() {
	var height=document.documentElement.scrollTop||document.body.scrollTop;
	var navtop=document.getElementById('navtop');
	if(height>140){
		navtop.style.position='fixed';
		navtop.style.marginTop="-140px";
	} else {
		navtop.style.position='relative';
		navtop.style.marginTop="0px";
	}
}
window.onload=function() {
	var navtop=document.getElementById('navtop');
	navtop.style.background="white";
	navtop.style.height="40px";
	navtop.style.zIndex="999";
	navtop.style.paddingTop="10px";
}
</script>
</head>
<body>
	<div class="header">
	<c:choose>
		<c:when test="${bidder==null }">
			<a href="user/loginUI"><span class="login">亲，请登录</span></a>
			 <span class="register"><a href="register.jsp">免费注册</a></span>
		</c:when>
		<c:otherwise>
			<span class="login">欢迎你，${bidder.username}</span>
			<a href="user/loginout"><span class="register">退出登录</span></a>
		</c:otherwise>
	</c:choose>
	<!-- <a href="#"><span class="icon"><img src="statics/images/icon/icon1.png" height="30" /></span> -->
	<!-- <span class="myauction">个人中心</span></a> -->
</div>
<div class="logo">
	<img src="statics/images/icon/logo1.png" height="100px" alt="" />
</div>
<div class="navtopstyle">
<div id="navtop" class="nav1">
	<ul class="menu1">
		<li><a href="#">拍卖公告</a></li>
		<li><a href="#part1">交保证金</a></li>
		<li><a href="#part2">出价竞拍</a></li>
		<li> <a href="#part3">竞拍成功</a></li>
		<li><a href="#part4">办理交割</a></li>
	</ul>
<div class="line1"></div>
</div>

<div style="height:80px">
</div>
</div>
    <div class="title">拍卖公告 ：最近拍卖</div>
    <div class="content">
    	<div class="pic pic1">
    		<img src="statics/guild/image/h1.jpg" alt="">
    		<p>古风住宅</p>
    	</div>
    	<div class="pic pic2">
    		<img src="statics/guild/image/h2.jpg" alt="">
    		<p> 纯种 波斯猫</p>
    	</div>
    	<div class="pic pic3">
    		<img src="statics/guild/image/h3.jpg" alt="">
    		<p>江南秀桥边二居室</p>
    	</div>
        
        
    </div>
	<div style="margin-bottom:80px;" id="part1"></div>
    <div class="title" >交保证金</div>
       <div class="content">
    	  <p class="text">  (1) 缴纳次数：您每参加一个标的物竞拍，均需要缴纳一次保证金。 </p>
        <p class="text">  (2) 缴纳方式：支付宝余额或者余额宝中有足够的钱款，可直接用于缴纳保证金，也可使用银行卡交保，超 过5万的金额建议在电脑端使用银行卡网银交保。  </p>
        <p class="text">  (3) 锁定期限：司法拍卖保证金缴纳后，如竞拍成功，保证金直接转到处置单位账户，如竞拍失败，保证金在72小时内解冻，如果是银行卡直接缴纳，会在3-5个工作日内退回到银行卡，如退回银行卡失败可直接到您的支付宝账户中查看。</p> 
        <p class="text">  (4) 交保截止时间：开拍后（拍卖结束前）也可以交保，建议您可在开拍前1-2天缴纳保证金，以免交保出现问题导致错过拍卖哦。</p>
        <p class="text">  (5) 交保成功即是报名成功，交保后如果不出价，保证金会退回。</p>
    		
    	<p></p>
    	</div>
    		
    	
    	
    	
    	
		<div style="margin-bottom:80px;" id="part2"></div>
    <div class="title">出价竞拍</div>
       <div class="content">
       	
       	
    	  <p class="text">  参拍流程                        </p>
        <p class="text">  （1）确保实地看样并仔细阅读竞买公告；  </p>
        <p class="text">  （2）报名交保证金，拍卖开始以后也可以交保证金；</p> 
        <p class="text">  （3）出价参与竞拍，手机、电脑上均可出价；</p>
        <p class="text">  （4）如您竞拍失败，保证金会退还给您，如您竞拍成功，请按照法院在竞买公告中的要求打款给法院，打款后联系法院或等法院联系您签署《拍卖成交确认书》，签署后领取《民事裁定书》及《协助执行通知书》
  等资料，然后您即可自行办理过户。</p>
    		
    		<p class="text">   出价规则</p>
        <p class="text">    1）全场首次出价只能为起拍价          </p>
    	  <p class="text">    2）加价幅度：只能按照加价幅度的N倍加价（N>=1且是整数）  </p>
        <p class="text">    3）首次出价者不可在自己首次出价领先的状态下再次出价，需有第二人应价后可再应价，之后可连续出价     </p>
        <p class="text">    4）出价次数无限制，竞拍周期内均可出价，出价时账户里不需要有钱      </p>
        <p class="text">    5）在竞拍周期内，出价后如果长时间没有其他人出价，拍卖也不会提前结束，除非法院中止或撤回拍卖     </p>
         
        
       </div>
    		
    	
    	
	<div style="margin-bottom:80px;" id="part3"></div>
    <div class="title">竞拍成功</div>
    <div class="content">
    	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
              <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
              </ol>
              <div class="carousel-inner" role="listbox">
                <div class="item active">
                  <img src="statics/guild/image/s2.jpg" alt="...">
                </div>
                <div class="item">
                  <img src="statics/guild/image/s1.jpg" alt="...">
                </div>
				<div class="item">
                  <img src="statics/guild/image/s3.jpg" alt="...">
                </div>
              </div>
              <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
            
    </div>
	<div style="margin-bottom:80px;" id="part4"></div>
	<div class="title">办理交割</div>
    <div class="content">
        <ul class="nav nav-tabs" role="tablist">
          <li class="active"><a href="#home" role="tab" data-toggle="tab">保证金支付</a></li>
          <li><a href="#profile" role="tab" data-toggle="tab"> 方式1支付尾款</a></li>
          <li><a href="#messages" role="tab" data-toggle="tab">方式2支付尾款</a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="home">
          	<p class="text">  方式1: 根据法院汇款说明，直接通过银行卡汇款给法院</p>
            <p class="text">  方式2： 根据网上生成订单，通过第三方付款</p>
            <p class="text"></p>
          </div>
          <div class="tab-pane" id="profile">
          	<p class="text">方式1支付尾款</p>
            <p class="text">  银行卡汇款方式：银行汇款到法定账户：</p>
            <p class="text">  开户人姓名: xxx 开户银行：xxx 开户账号：xxx</p>
          </div>
          <div class="tab-pane" id="messages">
          	<p class="text">方式2支付尾款</p>
            <p class="text">1：如果选择方式2（根据拍卖网生成的司法拍卖订单支付尾款）的，用户最长应在竞拍成功后7日内完成操作（且应符合拍卖公告约定的尾款支付期限）。</p>
            <p class="text">2：超过7天的该笔订单将关闭，无法通过方式2支付尾款</p>
          </div>
          
        </div>
    </div>
    <a href="" class="btt">顶部</a>
    <!-- Js-->
    <script src="statics/guild/js/jquery-1.9.1.min.js"></script>
    <script src="statics/guild/js/bootstrap.min.js"></script>
    <script src="statics/guild/js/plugin.js"></script>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>