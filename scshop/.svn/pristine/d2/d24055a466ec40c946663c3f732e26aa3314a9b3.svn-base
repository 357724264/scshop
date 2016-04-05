<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>退款申请</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<!-- 避免IE使用兼容模式，IE 运行最新的渲染模式,用 Chrome 框架的页面用webkit 内核-->
	<meta name="renderer" content="webkit">
	<!-- 启用360浏览器的极速模式(webkit) -->
	<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" id="viewport" name="viewport">
	<!-- 初始化移动浏览显示,移动端必须使用 -->
	<meta name="format-detection" content="telephone=no" />
	<meta name="imagemode" content="force">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">

	<!-- 危险勿动 -->
    <script type="text/javascript">
	!function(n){var e=n.document,t=e.documentElement,i=1080,d=i/150,o="orientationchange"in n?"orientationchange":"resize",a=function(){var n=t.clientWidth||320;n>1080&&(n=1080),t.style.fontSize=n/d+"px"};e.addEventListener&&(n.addEventListener(o,a,!1),e.addEventListener("DOMContentLoaded",a,!1))}(window);
	</script>

	<link rel="stylesheet" type="text/css" href="${base}/static/fonts/iconfont.css">
	<link rel="stylesheet" type="text/css" href="${base}/static/basestyle/stylesheets/mycoupon.css">
	<script type="text/javascript" src="${base}/static/js/jquery-1.10.2.min.js"></script>
</head>

<body class="add-bankpadd">
	<header class="shops-head">
		<a href="center.action" class="head-left"><i class="iconfont icon-xiangzuo1"></i></a>
		<div class="head-tit">				
			申请退款
		</div>
		<!-- <a href="#" class="head-right"><i class="iconfont icon-fenleisousuo"></i></a> -->
	</header>
		
		<div class="tx-box">
			
			<div class="tx-list tx-marg">
				<span class="txtit">退款方式&nbsp;:&nbsp;</span>
				<div class="tx-cont">
					<label class="txfs-lab">
						<input type="radio" name="refundWay" checked="checked" value="0" class="txfsipt" id="wxipt"><i class="iconfont icon-duigou"></i>微信钱包
					</label>
					<label class="txfs-lab">
						<input id="cardRadio" type="radio" name="refundWay" value="1" class="txfsipt"><i class="iconfont icon-duigou" id="bankipt"></i>银行卡
					</label>
				</div>
			</div>
			<div class="tx-group" id="wx">
				<div class="tx-g-list">
					<span class="txtit">联系电话&nbsp;:&nbsp;</span>
					<div class="tx-container">
						<input type='text' class="tx-g-ipt" name="phone" id="phone" placeholder="请填写联系电话">
					</div>
				</div>
				<div class="tx-g-list wx">
					<span class="txtit">真实姓名&nbsp;:&nbsp;</span>
					<div class="tx-container">
						<input type='text' class="tx-g-ipt" name="realName" id="realName" placeholder="请填写真实姓名">
					</div>
				</div>
				<div class="tx-g-list wx ">
					<span class="txtit">微信帐号&nbsp;:&nbsp;</span>
					<div class="tx-container">
						<input type='text' class="tx-g-ipt" name="wxAccount" id="wxAccount" placeholder="请填写微信帐号">
					</div>
				</div>
				<div class="tx-g-list bank">
					<span class="txtit">银行卡&nbsp;:&nbsp;</span>
					<div class="tx-container">
						<a href="#" id="bankcard" data-cardid="<#if bankcard??>${bankcard.id!}</#if>" class="yhkxz"><#if bankcard??>${bankcard.displayName}<#else>请选择银行卡</#if><i class="iconfont icon-xiangyou1"></i></a>
					</div>
				</div>
				
			</div>
			
		</div>
	
	</div>
	
	<div class="content">
		<div class="af-box">
			<h3 class="af-tit"><span class="bx">*</span>退款类型<span class="mark">（选择）</span></h3>
			<ul class="af-type">
				<li>我要退款<input type="radio" name="refundType" value="0"><i class="iconfont icon-dui3"></i></li>
				<li>我要退货<input type="radio" name="refundType" value="1"><i class="iconfont icon-dui3"></i></li>
			</ul>
			<h3 class="af-tit"><span class="bx">*</span>退款金额<span class="mark">（最高可退金额&nbsp;:&nbsp;<span>&yen;${total}</span>）</span></h3>
			<input type="number" name="total" data-total="${total}" id="total" class="af-money" placeholder="请输入退款金额">
			
			<h3 class="af-tit"><span class="bx">*</span>退款原因<span class="mark"></span></h3>
			<textarea id="reason" class="af-detail"></textarea>
			
			
		

		
			
			

			
			<!--<div class="af-upload">
				<ul>
					<li><img src="../images/2000.jpg"></li>
					<li><img src="../images/2000.jpg"></li>
					<li class="af-u-btnli"><input type="file" id="upload"><i class="iconfont icon-xiangji1"></i><br>上传凭证,最多三张</li>
				</ul> -->
			</div>			
		</div>
	</div>
	<div class="af-btnbox">
		<a href="#" id="applyBtn">申请退款</a>
	</div>
	
	<script type="text/javascript">
		
		$(function(){
			
			
			//提现方式切换
			$(document).on('click','.txfsipt',function(){
				if($('#wxipt').is(':checked')){
					$('.bank').css({display:'none'});
					$('.wx').css({display:'block'});
				}else{
					$('.wx').css({display:'none'});
					$('.bank').css({display:'block'});
				}
			});
	
	
			if("${bankcardid}") {
				$('#cardRadio').trigger('click');
				$('.wx').css({display:'none'});
				$('.bank').css({display:'block'});
			}else {
				$('.wx').css({display:'block'});
				$('.bank').css({display:'none'});
			}
			
	
			$(document).on('click','#bankcard',function(){
				var bankcardid = $(this).attr('data-cardid');
				location.href = 'bankcard!list.action?orderid=${orderid}&total=${total}&bankcardid=' + bankcardid;								
			});
			
			$(document).on('blur','#total',function(){
				var total = $(this).val();
				var limit = $(this).attr('data-total')
				
				var reg = /^(([1-9]\d{0,9})|0)(\.\d{1,2})?$/;
				if(!reg.test(total)) {
					$(this).val("");
				}
				if(parseFloat(total) > parseFloat(limit)) {
					$(this).val(limit);
				}
				
			});
			
			$(document).on('click','#applyBtn',function(){
				var refundWay = $('input[name="refundWay"]:checked').val();
				var realName = $("#realName").val();
				var wxAccount = $("#wxAccount").val();
				var cardInfo = "";
				if(refundWay==1) {
					var cardInfo = "${bankcard.displayName}";
				}
				var refundType = $('input[name="refundType"]:checked').val();
				var total = $("#total").val();
				var reason = $("#reason").val();
				var phone = $("#phone").val();
				
				$.ajax({
					url : 'json/refund!updateOrSave.action',
					type : 'post',
					dataType : 'json',
					data : {
						refundWay : refundWay,
						realName : realName,
						wxAccount : wxAccount,
						cardInfo :  cardInfo,
						refundType : refundType,
						total : total,
						reason : reason,
						orderid : "${orderid}",
						phone : phone
					
					},
					success : function(data){
						if(data.success) {
							window.location.href = data.url;
						}else {
							alert(data.msg);
						}
					}
				
				});
				
			});
		})
	</script>
</body>
</html>