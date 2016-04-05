<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>选择银行卡</title>
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

<body class="add-bankpadd">
	<div class="content">
		<header class="shops-head">
			<a href="center.action" class="head-left"><i class="iconfont icon-xiangzuo1"></i></a>
			<div class="head-tit">				
				选择银行卡
			</div>
			<!-- <a href="#" class="head-right"><i class="iconfont icon-fenleisousuo"></i></a> -->
		</header>

		<dl class="bankbox">
			<#if list??&&list?size gt 0>
			<#list list as bankcard>
			<dd id="dd_${bankcard_index}">
				<div class="xzbank-head">
					<div class="xzb-lb">
					<#if (total?? && orderid??) || refundid??>
						<label>
							<input data-id="${bankcard.id}" data-refund="${refundid}" class="choiceBtn" <#if bankcardid??&&(bankcard.id==bankcardid)>checked="checked"</#if> type="radio" />
							<i class="iconfont icon-duigou"></i>选择
						</label>
					<#else>
						<label>
							<input data-id="${bankcard.id}"  class="def_box" type="radio" name="bank"   <#if bankcard.isDefault==1>checked="checked"</#if> value="${bankcard.isDefault}"/>
							<i class="iconfont icon-duigou"></i>默认银行卡
						</label>
					</#if>
					</div>
							
					<div class="xzb-btnbox">
						<a href="bankcard!edit.action?id=${bankcard.id}&bankcardid=${bankcardid}&total=${total}&orderid=${orderid}&refundid=${refundid}" class="edit"><i class="iconfont icon-bianji3"></i>编辑</a>
						<a href="#" data-index="dd_${bankcard_index}" data-id="${bankcard.id}" class="delt"><i class="iconfont icon-shanchu1"></i>删除</a>
					</div>
				</div>
				<div class="xzb-cont">
					<p>
						<span class="tit">持卡人&nbsp;:&nbsp;</span>
						<span class="cont">${bankcard.cardHolder}</span>
					</p>
					<p>
						<span class="tit">卡号&nbsp;:&nbsp;</span>
						<span class="cont">${bankcard.cardNumber}</span>
					</p>
					<p>
						<span class="tit">卡类型&nbsp;:&nbsp;</span>
						<span class="cont">${bankcard.bankName}</span>
					</p>
					<p>
						<span class="tit">手机号&nbsp;:&nbsp;</span>
						<span class="cont">${bankcard.phone}</span>
					</p>
				</div>
			</dd>
			</#list>	
			</#if>
		</dl>
	</div>
	
	<div class="add-bankbox">
		<a href='bankcard!edit.action?bankcardid=${bankcardid}&total=${total}&orderid=${orderid}&refundid=${refundid}'>+&nbsp;添加银行卡</a>
	</div>
	
	<script type="text/javascript" src="${base}/static/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="${base}/static/js/model.js"></script>
	<script type="text/javascript">
			$(document).on('click','.delt',function(){
				var dd_id = $(this).attr('data-index');
				var id = $(this).attr('data-id');
				$.confirm('您要删除此银行卡吗？',
				function(){
				
					$.ajax({
						url : 'json/bankcard!delete.action',
						type : 'post',
						dataType : 'json',
						data : {id:id},
						success : function(data){
							if(data.success) {
								var selector = 'dd#' + dd_id;
								$('.bankbox').find(selector).remove();
							}
						}
					});
				
					
				},
				function(){
					return;
				})
				
				
			});
			
			$(document).on('click','.def_box',function(){
				
				if($(this).val()==0) {
					var id = $(this).attr('data-id');
					$.ajax({
						url : 'json/bankcard!setDefault.action',
						type : 'post',
						dataType : 'json',
						data : {id:id},
						success : function(data){
							if(data.success) {
								$.alert("设置成功!");
							}
						}
					
					});
				}
			});
			
			$(document).on('click','.choiceBtn',function(){
				
				var bankcardid = $(this).attr('data-id');
				var refundid = $(this).attr('data-refund');
				if(refundid && refundid!=0) {
					location.href = 'refund!edit.action?bankcardid=' + bankcardid + '&refundid=' + refundid + "&total=${total}" ;				
				}else {
					location.href = 'refund!apply.action?bankcardid=' + bankcardid + '&orderid=${orderid}&total=${total}';
				}
			});
			
	</script>
</body>
</html>