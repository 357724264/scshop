<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>个人中心</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.5.6/css/sm.min.css">
<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.5.6/css/sm-extend.min.css">
<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.5.6/css/sm-extend.min.css">
<link rel="stylesheet" href="${base}/static/fonts/iconfont.css">
<link rel="stylesheet" href="${base}/static/css/myapp.css">
</head>
<body>
	<div class="page">
	  	<header class="bar bar-nav" id="second-bar">
		    <a class="button button-link button-nav pull-left" href="#" data-transition='slide-out'>
		      	<span class="icon iconfont icon-xiangzuo2"></span>
		    </a>
	    	<h1 class="title">个人中心</h1>
	  	</header>

	  	<#include "/WEB-INF/template/nav.ftl" />

	  	<div class="content padd-content">
	  		<div class="grzx-headbox">
	  			<a href='#'>
	  				<div class="grzx-avatar"><img src="<#if customer.pic??>${customer.pic}<#else>${base}/static/images/2000.jpg</#if>" alt="头像" /></div>
	  				<div class="grzx-tit">
			  			${customer.name}
			  		</div>
			  		<i class="iconfont icon-xiangyou1 grzx-jt"></i>
	  			</a>
	  		</div>

	  		<div class="bar bar-tab grzx-bar">
			  	<a class="tab-item external" href="#">
				    <span class="icon iconfont icon-daifukuan"></span>
				    <span class="tab-label">待付款</span>
				    <#if dfk  ?? && dfk gt 0>  <span class="badge">${dfk}</span>  </#if>
			  	</a>
			  	<a class="tab-item external" href="#">
				    <span class="icon iconfont icon-daifahuo01"></span>
				    <span class="tab-label">待发货</span>
				    <#if dfh ?? &&  dfh gt 0>  <span class="badge">${dfh}</span>  </#if>
			  	</a>
			  	<a class="tab-item external" href="#">
				    <span class="icon iconfont icon-daifahuo011"></span>
				    <span class="tab-label">待收货</span>
				    <#if dsh ?? &&  dsh gt 0>  <span class="badge">${dsh}</span>  </#if>
			  	</a>
			  	<a class="tab-item external active" href="#">
				    <span class="icon iconfont icon-daipingjia1"></span>
				    <span class="tab-label">待评价</span>
				    <#if dpj ?? && dpj gt 0>  <span class="badge">${dpj}</span>  </#if>
			  	</a>
			</div>

			<div class="grzx-listgroup">
<!--我的订单没写-->
				<a href="#">
					<i class='iconfont icon-dingdan grzxlbicon'></i>&nbsp;我的订单
					<span class="grzxlg-right">查看全部打单<i class='iconfont icon-xiangyou1'></i></span>
				</a>
			</div>

			<div class="grzx-listbox">
				<div class="grzx-listgroup">
<!--优惠券没写-->
					<a href="#">
						<i class='iconfont icon-youhuiquan grzxlbicon'></i>&nbsp;我的优惠卷
						<span class="grzxlg-right">查看优惠卷<i class='iconfont icon-xiangyou1'></i></span>
					</a>
				</div>
				<div class="grzx-listgroup">
<!--积分没写-->
					<a href="#">
						<i class='iconfont icon-jifen grzxlbicon'></i>&nbsp;我的积分
						<span class="grzxlg-right">您有<#if customer.point??>${customer.point}<#else>0</#if>积分<i class='iconfont icon-xiangyou1'></i></span>
					</a>
				</div>
				<div class="grzx-listgroup">
					<a href="${base}/address!list.action">
						<i class='iconfont icon-dizhi grzxlbicon'></i>&nbsp;收货地址管理
						<span class="grzxlg-right"><i class='iconfont icon-xiangyou1'></i></span>
					</a>
				</div>
				<div class="grzx-listgroup">
<!--推广没写-->				
					<a href="#">
						<i class='iconfont icon-shoudongtuiguang grzxlbicon'></i>&nbsp;我的推广
						<span class="grzxlg-right"><i class='iconfont icon-xiangyou1'></i></span>
					</a>
				</div>
			</div>
	  	</div>
	</div>

	<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>
	 <script type="text/javascript" src="${base}/static/js/list.js"></script>
</body>
</html>