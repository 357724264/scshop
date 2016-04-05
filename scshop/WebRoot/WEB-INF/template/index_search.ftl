<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>搜索</title>
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
		    <form id="searchForm" action="product!list.action" method="post">
	    	<div class='search-box'>
	    		<div class='search-area'>
	    			<label class="iconfont icon-sousuo" for="search"></label>
	    			<input type="search" id='search' name="keyword" placeholder='输入关键字...' autocomplete="off"/>
	    		</div>
	    	</div>

	    	<a id="searchBtn" class="button button-link button-nav pull-right" href='#'>
			    搜索
		  	</a>
		  	</form>
	  	</header>

	  	<div class="content padd-content">
	  		<!-- 没有内容 -->
	  	</div>
	</div>

	<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>
</body>
</html>
<script type="text/javascript">
$(document).ready(function(){
	$("#searchBtn").bind("click",function(){
		$("#searchForm").submit();
	});
});

</script>