<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>充值中心</title>
<base href="<%=basePath%>" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="statics/images//icon/favicon.ico" />

<link rel="stylesheet" type="text/css"  href="statics/charge/css/amazeui.min.css" />
<link rel="stylesheet" type="text/css" href="statics/charge/css/main.css" />
<body>
	<c:if test="${bidder==null }">
		<c:redirect url="product/list"></c:redirect>
	</c:if>
	<div class="pay">
		<!--主内容开始编辑-->
		<div class="tr_recharge">
			<div class="tr_rechtext">
				<p class="te_retit">
					<img src="statics/charge/images/coin.png" alt="" />充值中心
				</p>
				<p>1.拍卖币是拍卖网推出的虚拟货币，你可以使用拍卖币拍买本网站的商品。</p>
				<p>2.拍卖币与人民币换算为1：1，即1元=1拍卖币，你可以选择支付宝或者是微信的付款方式来进行充值，拍卖币每次100个起充。</p>
			</div>
			<form  class="am-form" id="doc-vld-msg">
				<div class="tr_rechbox">
					<div class="tr_rechhead">
						<img src="statics/charge//images/ys_head2.jpg" />
						<p>
							充值帐号： ${bidder.username }
						</p>
						<div class="tr_rechheadcion">
							<img src="statics/charge/images/coin.png" alt="" /> <span>当前余额：<span>${bidder.account }拍卖币</span></span>
						</div>
					</div>
					<input type="hidden" id="docVlGender" value="0" />
					<div class="tr_rechli am-form-group">
						<ul class="ui-choose am-form-group" id="uc_01">
							<li><label class="am-radio-inline"> <input
									type="radio" value="100" name="docVlGender"
									data-validation-message="请选择一项充值额度" onclick="changeMoney(100)"> 100￥
							</label></li>
							<li><label class="am-radio-inline"> <input
									type="radio" value="200" name="docVlGender"
									data-validation-message="请选择一项充值额度" onclick="changeMoney(200)"> 200￥ 
							</label></li>

							<li><label class="am-radio-inline"> <input
									type="radio" value="500" name="docVlGender" 
									data-validation-message="请选择一项充值额度" onclick="changeMoney(500)"> 500￥
							</label></li>
							<li><label class="am-radio-inline"> <input
									type="radio" value="100" name="docVlGender"
									data-validation-message="请选择一项充值额度"> 其他金额
							</label></li>
						</ul>
						<!--<span>1拍卖币=1元 10元起充</span>-->
					</div>
					<div class="tr_rechoth am-form-group">
						<span>其他金额：</span> <input onchange="changeMoney(this.value)" type="number" min="100" max="100000"
							value="100.00元" class="othbox"
							data-validation-message="充值金额范围：100-100000元" />
						<!--<p>充值金额范围：100-100000元</p>-->
					</div>
					<div class="tr_rechcho am-form-group" id="payMethod">
						<span>充值方式：</span> <label class="am-radio"> <input
							type="radio" name="radio1" value="wechat" data-am-ucheck
							data-validation-message="请选择一种充值方式"><img
							src="statics/charge/images/wechatpay.png" />
						</label> <label class="am-radio" style="margin-right: 30px;"> <input
							type="radio" name="radio1" value="zfb" data-am-ucheck
							data-validation-message="请选择一种充值方式"><img
							src="statics/charge/images/zfbpay.png" />
						</label>
					</div>
					<div class="tr_rechnum">
						<span>应付金额：</span>
						<p class="rechnum">0.00元</p>
					</div>
				</div>
				<div class="tr_paybox">
					<input type="button" onclick="submitCharge()" value="确认支付" class="tr_pay am-btn"
						 /> <span>温馨提示：拍卖币只限于在拍卖网站竞拍，遇到问题请拨打客服电话888-8542457。</span>
				</div>
				
		</div>
		</form>
	</div>

	<script type="text/javascript" src="statics/charge/js/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="statics/charge/js/amazeui.min.js"></script>
	<script type="text/javascript" src="statics/charge/js/ui-choose.js"></script>

	<script type="text/javascript">
		// 将所有.ui-choose实例化
		$('.ui-choose').ui_choose();
		// uc_01 ul 单选
		var uc_01 = $('#uc_01').data('ui-choose'); // 取回已实例化的对象
		uc_01.click = function(index, item) {
			console.log('click', index, item.text())
		}
		uc_01.change = function(index, item) {
			console.log('change', index, item.text())
		}
		$(function() {
			$('#uc_01 li:eq(3)').click(function() {
				$('.tr_rechoth').show();
				$('.tr_rechoth').find("input").attr('required', 'true')
				$('.rechnum').text('100.00元');
			})
			$('#uc_01 li:eq(0)').click(function() {
				$('.tr_rechoth').hide();
				$('.rechnum').text('100.00元');
				$('.othbox').val('');
			})
			$('#uc_01 li:eq(1)').click(function() {
				$('.tr_rechoth').hide();
				$('.rechnum').text('200.00元');
				$('.othbox').val('');
			})
			$('#uc_01 li:eq(2)').click(function() {
				$('.tr_rechoth').hide();
				$('.rechnum').text('500.00元');
				$('.othbox').val('');
			})
			$(document).ready(function() {
				$('.othbox').on('input propertychange', function() {
					var num = $(this).val();
					$('.rechnum').html(num + ".00元");
					$(':radio[name=docVlGender]').val(num);
				});
			});
		})

		$(function() {
			$('#doc-vld-msg')
					.validator(
							{
								onValid : function(validity) {
									$(validity.field).closest('.am-form-group')
											.find('.am-alert').hide();
								},
								onInValid : function(validity) {
									var $field = $(validity.field);
									var $group = $field
											.closest('.am-form-group');
									var $alert = $group.find('.am-alert');
									// 使用自定义的提示信息 或 插件内置的提示信息
									var msg = $field.data('validationMessage')
											|| this
													.getValidationMessage(validity);

									if (!$alert.length) {
										$alert = $(
												'<div class="am-alert am-alert-danger"></div>')
												.hide().appendTo($group);
									}
									$alert.html(msg).show();
								}
							});
		});
		
		function myonsubmit() {
			var docVlGender = document.getElementsByName('docVlGender');
			var flag=false;
			var form=document.getElementById('doc-vld-msg');
			for(var i=0;i<docVlGender.length;i++){
				if(docVlGender[i].checked){
					flag=true;
					form.action='user/recharge/'+docVlGender[i].value;
					break;
				}
			}
			var flag1=false;
			var radio1 = document.getElementsByName('radio1');
			for(var i=0;i<radio1.length;i++){
				if(radio1[i].checked){
					flag1=true;
					break;
				}
			}
			return flag&&flag1;
		}
		
		function changeMoney(money) {
			document.getElementById('docVlGender').value=money;
		}
		
		function submitCharge() {
			var money=document.getElementById('docVlGender').value;
			var test=/^[0-9]*[1-9][0-9]*$/;
			if(test.test(money)&&confirm("确认充值"+money+"拍卖币？")){
				location.href="user/recharge/"+money;
			}
		}
	</script>
</body>
</html>