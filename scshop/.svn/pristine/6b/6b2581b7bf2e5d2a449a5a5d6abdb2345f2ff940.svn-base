<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>
卖疯乐（123mfl.com）正品保障，海外直购，优质国货，综合网购平台。
</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.5.6/css/sm.min.css">
<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.5.6/css/sm-extend.min.css">
<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.5.6/css/sm-extend.min.css">
<link rel="stylesheet" href="${base}/static/fonts/iconfont.css">
<link rel="stylesheet" href="${base}/static/css/myapp.css?v=1">
<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">
<link rel="apple-touch-icon-precomposed" href="${base}/static/images/touch-icon.png">
</head>
<body>
	<div class="page">
	  	<header class="bar bar-nav scshop-index">
		    <a class="button button-link button-nav pull-left" href="#" id='scshop-logo' data-transition='slide-out'>
		      	<img src="${base}/static/images/logo.png" width="auto" height="34px" />
		    </a>
	    	<a class="search-index external" href='index!search.action'>
	    		<div class='sousuo-box'>
		    		<label class="sousuo-icon iconfont icon-sousuo"></label>
		    		<div type="search" class='search'></div>
	    		</div>
	    	</a>
	    	<a class="button button-link button-nav pull-right external" href="category.action" data-transition='slide-out'>
		      	<span class="icon iconfont icon-iconsousuo"></span>
		    </a>
	  	</header>

	  	<#include "/WEB-INF/template/nav.ftl" />

	  	<div class="content padd-content">
	  		<ul class="classification">
	  			<li class="ciic-list button"><a href="#" class='active'>首页</a></li>
	  			<#if navigation??>
	  				<#list navigation as nav>
	  					<li class="ciic-list button"><a class="external" href="${nav.url}">${nav.name}</a></li>
	  				</#list>
	  			</#if>
	  		</ul>

	  		<div class="swiper-container" id="swiperindex" data-space-between='0'>
			    <div class="swiper-wrapper"><!--轮询广告-->
			    	<#list topAd as ad>			    	
			      		<div class="swiper-slide"><a href="${ad.url}" class="cover external"><img src="${ad.images}" alt=""></a></div>
			    	</#list>
			    </div>
			    <div class="swiper-pagination"></div>
		  	</div>

		  	<dl class="tecang">
		  		<#list midAd as ad>
		  			<dd>
		  				<a href="${ad.url}" class="cover external"><img src="${ad.images}" /></a>
		  			</dd>
		  		</#list>
		  	</dl>

		  	<ul class="idx-flbox">
		  		<#list undAd as ad>
		  		<li>
		  			<a href="${ad.url}" class='cover external'>
		  				<img src="${ad.images}" />
		  			</a>
		  		</li>
		  		</#list>
		  	</ul>

		  	<div class="jingxuan-box">
		  		<h4 class="jx-tit">海外精选</h4>
		  		<dl class='jx-shoparea'>
		  			<#if hotSaleProducts??>
		  			<#list hotSaleProducts as product>
		  			<dd class='jx-group'>
		  				<a class="external" href='product!details.action?id=${product.id}'>
			  				<div class='jx-proimg'>
			  					<img  <#if product.cover??> src="${product.cover}" <#else> src="${base}/static/images/2000.png" </#if> />
			  				</div>
			  				<div class="jx-proinfo">
			  					<div class='nationality'>
			  						<div class='guoqi'>
			  							<img src="${product.countryIcon}" />
			  						</div>
			  						<div class="guoji-name">${product.country}</div>
			  					</div>
			  					<h5 class='jx-proname'>${product.name}</h5>
			  					<p class='jx-price'>
			  					<span>&yen;&nbsp;</span>${product.bottomPrice}
			  					</p>
			  					<p class='jx-ckj'>国内参考价<span>&nbsp;&yen;&nbsp;</span>${product.indicativePrice}</p>
			  				</div>
		  				</a>
		  			<!--	<a href='#2' class='jx-addcart'>
		  					<i class='iconfont icon-cart'></i>
		  				</a>
		  				
		  				-->
		  			</dd>
		  			</#list>
		  			</#if>
		  		</dl>
		  	</div>

		  	<a href='product!list.action' class='index-more external'>更多商品</a>
	  	</div>
	</div>

	<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>

    <!-- 轮播 -->
    <script type="text/javascript" src="${base}/static/js/swiper.min.js"></script>
         <script type="text/javascript" src="${base}/static/js/list.js" charset="utf-8"></script>
    <script type="text/javascript">
    	$(function() {
    		$(".tab-item").eq(0).addClass("active");
		  	var swiper = new Swiper('.swiper-container', {
	            pagination: '.swiper-pagination',
	            paginationClickable: true,
	            spaceBetween:0,
	            centeredSlides: true,
	            loop:true,
	            autoplay:9000,
	            speed:1000,
	            autoplayDisableOnInteraction: false
	        });
	        
	     
	       
		});
    </script>
    <!-- 轮播 -->
</body>
</html>