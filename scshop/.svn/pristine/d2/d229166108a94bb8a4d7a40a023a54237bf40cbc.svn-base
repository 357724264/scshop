<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>添加银行卡</title>
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

	
</head>

<body class="sdg-padd">
	<div class="content">
		<header class="shops-head">
			<a href="bankcard!list.action" class="head-left back"><i class="iconfont icon-xiangzuo1"></i></a>
			<div class="head-tit">				
				添加银行卡
			</div>
			<a href="#" id="saveBtn" class="head-right preserve">保存</a>
		</header>
		
		<div class="tx-group" id="wx">
			<div class="tx-g-list">
				<span class="txtit">持卡人&nbsp;:&nbsp;</span>
				<div class="tx-container">
					<input type='text' id="cardHolder" class="tx-g-ipt" placeholder="必填" value="${bankcard.cardHolder!}">
				</div>
			</div>
			<div class="tx-g-list">
				<span class="txtit">卡号&nbsp;:&nbsp;</span>
				<div class="tx-container">
					<input type='text' id="cardNumber" class="tx-g-ipt" placeholder="必填" value="${bankcard.cardNumber!}">
				</div>
			</div>
			<div class="tx-g-list">
				<span class="txtit">银行支行&nbsp;:&nbsp;</span>
				<div class="tx-container">
					<input type='text' id="bankName" class="tx-g-ipt" placeholder="例如:工商银行xx支行" value="${bankcard.bankName!}">
				</div>
			</div>
		<!-- <div class="tx-g-list">
				<span class="txtit">卡类型&nbsp;:&nbsp;</span>
				<div class="tx-container">
					<a href="#" class="yhkxz">请选择银行卡<i class="iconfont icon-xiangyou1"></i></a>
				</div>
			</div> -->
			<div class="tx-g-list">
				<span class="txtit">手机号&nbsp;:&nbsp;</span>
				<div class="tx-container">
					<input type='text' id="phone" class="tx-g-ipt" placeholder="必填" value="${bankcard.phone!}">
				</div>
			</div>
		</div>

		<div class="deftbank">
			<input id="default" name="default" type="checkbox" <#if bankcard.isDefault==1>checked="checked"</#if>>
			<i class="iconfont icon-duigou"></i>设为默认
		</div>
	</div>
</body>
</html>
<script type="text/javascript" src="${base}/static/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${base}/static/js/model.js"></script>
<script type="text/javascript">
	$(document).on('click','#saveBtn',function(){
		var cardHolder = $('#cardHolder').val();
		var cardNumber = $('#cardNumber').val();
		var phone = $('#phone').val();
		var bankName = $('#bankName').val();
		var id = '${bankcard.id}';
		var orderid = "${orderid}";
		var total = "${total}";
		var bankcardid = "${bankcardid}";
		var refundid = "${refundid}";
		var isDefault = 0;
		if($('#default').prop('checked')) {
			isDefault = 1;
		}
		
		$.ajax({
			url : 'bankcard!updateOrSave.action',
			type : 'post',
			dataType : 'json',
			data : {
				cardHolder : cardHolder,
				cardNumber : cardNumber,
				phone : phone,
				bankName : bankName,
				id : id,
				isDefault : isDefault,
				orderid : orderid,
				total : total,
				bankcardid : bankcardid,
				refundid : refundid
				
			},
			success : function(data){
				if(data.success) {
					window.location.href = data.url;
				}else {
					$.alert(data.msg);				
				}
			}
		});
	});
	
</script>