<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>商家店铺</title>
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
	<link rel="stylesheet" type="text/css" href="${base}/static/css/head.css">
	<link rel="stylesheet" type="text/css" href="${base}/static/basestyle/stylesheets/shops.css">
	<style type="text/css">
		.bt-name i{font-size:.28rem}
	</style>
	<script type="text/javascript" src="${base}/static/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${base}/static/js/basis.js"></script>
		<script type="text/javascript" src="${base}/static/js/list.js"></script>
</head>

<body class="paddbody">
	<div class="content">
		<header class="shops-head headfixed">
			<a href="javascript:;" data-url="/" class="head-left wdyback"><i class="iconfont icon-xiangzuo1"></i></a>
			<div class="head-tit">				
				<a href="shop!category.action?id=${id}" class="head-ss">
					<i class="iconfont icon-sousuo1 ssicon"></i>搜索商铺内商品
				</a>
			</div>
			<a href="shop!category.action?id=${id}" class="head-right"><i class="iconfont icon-fenleisousuo2"></i></a>
		</header>

		<div class="shops-mess">
			<div class="dp-mpbox" style="background:url(${shop.bground}) no-repeat; background-size:100% 100%; ">
				<span class="dp-logo">
					<img src="${shop.logo}" />
				</span>
				<h3 class="dp-name">${shop.name}</h3>
			</div>
			<div class="dp-nav">
				<a href="shop!product.action?id=${id}" class="dp-item">
					<span>${pcount}</span>
					<span class="dpnav-tit">全部商品</span>
				</a>
				<a href="shop!product.action?id=${id}&tt=new" class="dp-item">
					<span>${newcount}</span>
					<span class="dpnav-tit">上新</span>
				</a>
				<a href="shop!product.action?id=${id}&tt=pro" class="dp-item">
					<span>${promotionalcount}</span>
					<span class="dpnav-tit">促销</span>
				</a>
			</div>
		</div>

		<div class="shops-box mg-top">
			<h3 class="sp-b-tit">新品推荐</h3>
			<div class="shops-area">
				<#list newProducts as newp>
				<a href="product!details.action?id=${newp.id}">
					<div class="shops-img">
						<img src="${newp.cover}"> <!-- 315*250 -->
					</div>
					<p class="spgj">
						<img src="${newp.countryIcon}"><span>${newp.country}</span>
					</p>
					<h3 class="shops-name">${newp.name}</h3>
					<p class="shops-price">&yen;${newp.bottomPrice}</p>
					<p class="shops-cdj">国内参考价&nbsp;&yen;&nbsp;${newp.indicativePrice}</p>
				</a>
				</#list>
			</div>
		</div>

		<div class="shops-box mg-top">
			<h3 class="sp-b-tit">热卖商品</h3>
			<div class="shops-area">
				<#list hots as hotp>
				<a href="product!details.action?id=${hotp.id}">
					<div class="shops-img">
						<img src="${hotp.cover}"> <!-- 315*250 -->
					</div>
					<p class="spgj">
						<img src="${hotp.countryIcon}"><span>${hotp.country}</span>
					</p>
					<h3 class="shops-name">${hotp.name}</h3>
					<p class="shops-price">&yen;${hotp.bottomPrice} </p>
					<p class="shops-cdj">国内参考价&nbsp;&yen;&nbsp;${hotp.indicativePrice}</p>
				</a>
				</#list>
			</div>
		</div>
	</div>

	<dl class="shops-nav">
		<dd class="sp-menu">
	        <a class="bt-name" href="shop!product.action?id=${id}"><i class="iconfont icon-quanbu"></i>全部商品</a>
	    </dd>
	    <dd class="sp-menu">
	        <a class="bt-name" href="javascript:;" id="categorylist"><i class="iconfont icon-fenlei3"></i>商品分类</a>
	        <div class="new-sub">
	            <ul class="subbox">
	            	<#list categorylist as category>
	                <li>
	                	<a href="<#if category.downList??>javascript:;<#else>shop!product.action?id=${id}&fl=${category.id}</#if>" class="third-btn">${category.name}<i class="iconfont icon-xiangright"></i></a>
	                	<#if category.downList??>
	                	<div class="third-sub" id="third-sub${category_index+1}">
	                		<ul>
	                			<#list category.downList as down>
		                		<li><a href="shop!product.action?id=${id}&sl=${down.id}">${down.name}</a></li>
		                		</#list>
		                	</ul>
	                	</div>
	                	</#if>
	                </li>
	                </#list>
	            </ul>
	            <div class="tiggle"></div>
	            <div class="innertiggle"></div>
	        </div>               
	    </dd>
	    <dd class="sp-menu">
	        <a class="bt-name" href="shop!coupons.action?id=${id}"><i class="iconfont icon-wodeqiajuan"></i>优惠券</a>
	    </dd>
	</dl>

	<script type="text/javascript" src="${base}/static/js/jquery.nicescroll.min.js"></script>
	<script type="text/javascript">
		$(function(){
			//二级菜单up & down
			$(document).on('click','#categorylist',function(){
			    var _this=$(this);
			    _this.parent().find('.third-sub').removeClass('cura').slideUp("fast");
			    $(".third-btn").removeClass('active');

		    	if(_this.parent().find('.new-sub').hasClass('cura')){
		    		_this.parent().find('.new-sub').removeClass('cura').slideUp("fast");
				}else{
					$(".sp-menu").parent().find('.new-sub').removeClass('cura').slideUp("fast");
					_this.parent().find('.new-sub').addClass('cura').slideDown("fast");
				}			
			});
			
			//三级菜单 阻止事件冒泡
			$('.third-sub').niceScroll({cursorborder:"",cursorcolor:"#333",boxzoom:false});
			var popid=document.getElementById('third-sub1');
	    	eventuti.addHandler(popid,'touchstart',function(event){
	    		eventuti.stopPropagation(event);
			})
			var popid=document.getElementById('third-sub2');
	    	eventuti.addHandler(popid,'touchstart',function(event){
	    		eventuti.stopPropagation(event);
			})
			//三级菜单up & down
			$(document).on('touchend','.third-btn',function(){
				var _this=$(this);
				if(_this.parent().find('.third-sub').hasClass('cura')){
		    		_this.parent().find('.third-sub').removeClass('cura').slideUp("fast");
		    		_this.removeClass('active');	
				}else{
					$(".third-btn").parent().find('.third-sub').removeClass('cura').slideUp("fast");
					$(".third-btn").removeClass('active');
					_this.parent().find('.third-sub').addClass('cura').slideDown("fast");
					_this.addClass('active');
				}
			})

			
		})
	</script>
</body>
</html>