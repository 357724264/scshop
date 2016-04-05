<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>店铺分类</title>
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
	<link rel="stylesheet" type="text/css" href="${base}/static/basestyle/stylesheets/shops.css">
	<script type="text/javascript" src="${base}/static/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#searchproduct").bind("click",function(){
			//var keyword = $("#keyword").val();
			$("#myform").submit();
			//window.location.href="shop!product.action?id=${id}&keyword="+keyword;
		});
	})	
	</script>
	
	
	
</head>

<body class="fl-padd">
	<div class="content">
		<form id="myform" method="post" action="shop!product.action">
		<header class="shops-head headfixed">
			<a href="shop.action?id=${id}" class="head-left"><i class="iconfont icon-xiangzuo1"></i></a>
			<input name="id" value="${id}" type="hidden"/>
			<div class="head-tit">
				<label class="flssbox">
					<i class="iconfont icon-sousuo1 ssicon"></i>
					<input id="keyword" name="keyword" type="search" class="head-ss" placeholder="宝贝关键字" maxlength="60">
				</label>
			</div>
			<a href="#" class="head-right" id="searchproduct">搜索</a>
		</header>
		</form>
		<dl class="fenleibox">
			<dt class="alldt">
				<a href='shop!product.action?id=${id}'>全部商品 <i class="iconfont icon-xiangyou1 dtright"></i></a>
			</dt>
			<#list list as category>
			<dt class="itemdt">
				<a href='shop!product.action?id=${id}&fl=${category.id}'>${category.name}<span class="dtright">查看全部</span></a>
			</dt>
			<#if category.downList??>
			<dd>
				<#list category.downList as down>
				<a href="shop!product.action?id=${id}&sl=${down.id}" class="itema">${down.name}</a>
				</#list>
			</dd>
			</#if>
			</#list>
		</dl>
	</div>
</body>
</html>