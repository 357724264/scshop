<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>商城分类</title>
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
	<style type="text/css">
		img{display:inline;}
	</style>
	<link rel="stylesheet" type="text/css" href="${base}/static/fonts/iconfont.css">
	<link rel="stylesheet" type="text/css" href="${base}/static/basestyle/stylesheets/screen.css">

	<script type="text/javascript" src="${base}/static/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src='${base}/static/js/basis.js'></script>
	<script type="text/javascript" src='${base}/static/js/jquery.lazyload.min.js?v=1.8.2'></script>
</head>
  	
<body class="bdypadd">
	<div class="content">
		<header>
			<a href="#" class="logo"><img src="${base}/static/images/logo.png" /></a>
			<a class="flss-box external" href="index!search.action">
				<i class="iconfont icon-sousuo1"></i>
			</a>
			<a href="#" class="ssbtn"><i class="iconfont icon-iconsousuo"></i></a>
		</header>

		<div class="fltabs">
			<a href="#tab1" class="tab-link active">分类</a>
			<a href="#tab2" class="tab-link">品牌</a>
			<a href="#tab3" class="tab-link">国家</a>
		</div>
		<div class="tabs">
			<div class="flbox tab active" id="tab1">
				<div class="yscroll1" id="yscroll1">
					<div class='flscroll'>
						<ul class="lbbox">
							<#if list??&&(list?size gt 0)>
		  					<#list list as cat>
		  					<li <#if cat_index==index>class="active"</#if>>${cat.name}</li>
		  					<#if cat_index==index><#assign selectedCat=cat></#if>
		  					</#list>
		  					</#if>
						</ul>
					</div>
				</div>
				<div class="flcont" id="flcont">
					<dl class="lbshopbox">
						<dt><span>${selectedCat.name}</span></dt>
						<dd>
							<#if selectedCat.downList??&&(selectedCat.downList?size gt 0)>
	  						<#list selectedCat.downList as subCat>
	  						<a href="product!list.action?categoryid=${subCat.id}">
	  							<div class="cover">
	  								<img src="${subCat.logo}" class="lazy" alt="产品" />
	  							</div>
	  							<p>
	  								${subCat.name}
	  							</p>
	  						</a>
	  						</#list>
	  						</#if>
						</dd>
					</dl>
				</div>
			</div>
			<div class="flbox tab" id='tab2'>
				<div class='flppbox'>
					<dl class="pparea">
						<dt>全部品牌</dt>
						<dd>
							<#if brandList??&&(brandList?size gt 0)>
	      					<#list brandList as brand>
	      					<a href="product!list.action?brandid=${brand.id}">
	      						<img data-original="${brand.logo}" class="lazy" />
	      					</a>
	      					</#list>
	      					</#if>
						</dd>
					</dl>
				</div>
			</div>
			<div class="flbox tab" id='tab3'>
				<div class='flppbox'>
					<dl class="pparea">
						<dt>全部国家</dt>
						<dd>
							<#if countrylist??&&(countrylist?size gt 0)>
	      					<#list countrylist as country>
	      					<a href="product!list.action?countryid=${country.id}" style="height:1.625rem;">
	  								<img data-original="${country.flagIcon}" class="" src="${country.flagIcon}"/>
	      					</a>
	      					</#list>
	      					</#if>
						</dd>
					</dl>
				</div>
			</div>
		</div>

		
		<nav class="navbar">
			<a href="index.action" class="nav-list">
				<i class="iconfont icon-icon40"></i>
				<span class="tab-label">首页</span>
			</a>
			<a href="category.action" class="nav-list">
				<i class="iconfont icon-fenleisousuo"></i>
				<span class="tab-label">商城分类</span>
			</a>
			<a href="cart.action" class="nav-list" id="shopcart">
				<i class="iconfont icon-gouwuche9"></i>
				<span class="tab-label">购物车</span>
				<span class="badge">0</span>
			</a>
			<a href="center.action" class="nav-list">
				<i class="iconfont icon-wo"></i>
				<span class="tab-label">我</span>
			</a>
		</nav>
	</div>

	<script type="text/javascript" src="${base}/static/js/jquery.tabs.js"></script>
	<script type="text/javascript" src="${base}/static/js/jquery.nicescroll.min.js"></script>
	 <script type="text/javascript" src="${base}/static/js/list.js" charset="utf-8"></script>
	<script type="text/javascript">
		$(function(){
			$('.yscroll1').niceScroll({cursorborder:"",cursorcolor:"#424242",boxzoom:true});
			var popid=document.getElementById('yscroll1');
	    	eventuti.addHandler(popid,'touchstart',function(event){
	    		eventuti.stopPropagation(event);
			})

	    	$("img.lazy").lazyload({effect: "fadeIn",threshold:180,failurelimit:100});

	    	$(document).on('click','.tab-link',function(){
	    		$("img.lazy").lazyload({effect: "fadeIn",threshold:180,failurelimit:100});
	    	})
	    	
	    	$(".nav-list").eq(1).addClass("active");
			$(".lbbox li").bind("click",function(){
				var index = $(this).index();
				location.href = "category.action?index=" + index;	
			});
		})
	</script>
</body>
</html>