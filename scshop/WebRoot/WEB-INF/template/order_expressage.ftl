<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>物流信息</title>
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
		    <a class="button button-link button-nav pull-left back" href="#" data-transition='slide-out'>
		      	<span class="icon iconfont icon-xiangzuo2"></span>
		    </a>
	    	<h1 class="title">物流信息</h1>
	  	</header>

	  	<div class="content">
	  		<div class="wlxx-gs">
	  			<table>
	  				<tbody>
	  					<tr>
	  						<td rowspan="2" class="wlgs-icon"><i class="iconfont icon-daifahuo2"></i></td>
	  						<td width="65px">物流公司:</td>
	  						<td>${companyName}</td>
	  					</tr>
	  					<tr>
	  						<td>运货号:</td>
	  						<td>${expressageNum}</td>
	  					</tr>
	  				</tbody>
	  			</table>
	  		</div>

	  		<h5 class="wltit">订单跟踪</h5>
	  		<div class="wlgzbox">
	  			<ul class="storey">
	  				<#if resultList??&&(resultList?size gt 0)>
	  				<#list resultList as item>
	  				<li <#if item_index==0>class="on"</#if>>
	  					<i class="iconfont icon-yuandian2"></i>
	  					<div class="wlinfo">${item.context}</div>
	  					<span class="wltime">${item.time}</span>
	  				</li>
	  				</#list>
	  				</#if>
	  			</ul>
	  		</div>
	  	</div>	  	
	</div>
	
	<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>

</body>
</html>