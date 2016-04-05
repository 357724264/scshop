<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title><#if pt=0>秒杀专场</#if><#if pt==1>限时购</#if></title>
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
	<style>
	.ms-padd-seckill{
		padding-top: 0.8rem;
	}
	</style>
	<!-- 危险勿动 -->
    <script type="text/javascript">
	!function(n){var e=n.document,t=e.documentElement,i=1080,d=i/150,o="orientationchange"in n?"orientationchange":"resize",a=function(){var n=t.clientWidth||320;n>1080&&(n=1080),t.style.fontSize=n/d+"px"};e.addEventListener&&(n.addEventListener(o,a,!1),e.addEventListener("DOMContentLoaded",a,!1))}(window);
	</script>

	<link rel="stylesheet" type="text/css" href="${base}/static/fonts/iconfont.css">
	<link rel="stylesheet" type="text/css" href="${base}/static/basestyle/stylesheets/mycoupon.css">
	<script type="text/javascript" src="${base}/static/js/jquery-1.8.2.min.js"></script>
</head>

<body <#if pt==1>class="ms-padd"<#else>class="ms-padd-seckill"</#if>>
	<div class="content">
		<header class="shops-head">
			<a href="index.action" class="head-left"><i class="iconfont icon-xiangzuo1"></i></a>
			<div class="head-tit">				
				<#if pt=0>秒杀专场</#if><#if pt==1>限时购</#if>
			</div>
			<!--<a href="#" class="head-right"><i class="iconfont icon-fenleisousuo"></i></a>-->
		</header>
		<#if pt==1>
		<div class="fltabs">
			<a href="<#if pt==0>${base}/seckill!list.action?pt=0&&state=0</#if><#if pt==1>${base}/seckill!list.action?pt=1&&state=0</#if>" class="tab-link <#if state==0>active</#if>">现场</a>
			<a href="<#if pt==0>${base}/seckill!list.action?pt=0&&state=1</#if><#if pt==1>${base}/seckill!list.action?pt=1&&state=1</#if>" class="tab-link <#if state==1>active</#if>">预告</a>
		</div>
		</#if>

		<dl class="msbox">
		</dl>
	</div>

	<script type="text/javascript" src='${base}/static/js/jquery.countdown.js'></script>
		<script type="text/javascript" src='${base}/static/js/list.js'></script>
	
<script type="text/javascript">
var pn = 1;
$(document).ready(function(){
	page();
	$(window).scroll(function(){
		if(uiIsPageBottom()) {
			page();
		}	
	});
});

function page(){
	$.ajax({
		url:"json/seckill!list.action",
		type:'post',
		data:{pn:pn,state:${state},pt:${pt}},
		success:function(html){
			if(pn == 1){
			$(".msbox").html(html);
			}else{
			$(".msbox").append(html);
			}
			pn++;	
			$('.countdown').countdown();
		}
	
	});
}



</script>
</body>
</html>