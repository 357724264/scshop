<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>评论</title>
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
	    	<h1 class="title">评论</h1>
	  	</header>

	  	<nav class="bar bar-tab" id="shdz-nav">
	  		<a href="#" class="tjdz-link">提交评价</a>
	  	</nav>

	  	<div class="content padd-content">
	  		<#list list as item>
	  		<div class="shppbox after" data-id="${item.id}">
	  			<a href="#" class="shppimage after" >
	  				<img src="${item.pic}" />
	  				<p class="shppname">${item.name}</p>
	  				<i class="iconfont icon-xiangyou1"></i>
	  			</a>
	  			<div class="shpp-pjxj">
	  				<span>商品评价</span>
	  				<div class="stars" data-val="0">
	  					<i class="iconfont icon-xingxing3"></i>
	  					<i class="iconfont icon-xingxing3"></i>
	  					<i class="iconfont icon-xingxing3"></i>
	  					<i class="iconfont icon-xingxing3"></i>
	  					<i class="iconfont icon-xingxing3"></i>
	  				</div>
	  			</div>
	  			<div class="shpp-text">
	  				<textarea class="sptext" placeholder="说说这件商品让更多人了解它吧"></textarea>
	  			</div>
	  		</div>
			</#list>
	  	</div>
	</div>

	<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>
    <script type="text/javascript" src="${base}/static/js/haoping.js"></script>
    <script type="text/javascript">
    	$(function(){
    		haoping('.stars');
    		$(".tjdz-link").bind("click",function(){
				if($(this).hasClass("clicked")){
					return false;
				}
				$(this).addClass("clicked");
				var commentjson ={};
				var items = $(".shppbox");
				for(var i=0;i<items.length;i++){
					var commentitemjson = {};
					var id = $(items[i]).attr("data-id");
					var point = $(items[i]).find(".shpp-pjxj").find(".stars").attr("data-val");
					var content = $(items[i]).find(".shpp-text").find(".sptext").val();
					commentitemjson["point"] = point;
					commentitemjson["content"] = content;
					commentjson[id] = commentitemjson;
				}
				var json = JSON.stringify(commentjson);
				$.ajax({
					url:"json/order!comment.action",
					type:"post",
					data:{commentjson:json,id:"${id!}"},
					success:function(ret){
						var dat = eval("("+ret+")");
						if(dat.success){
							$.alert("评论成功!");
							window.location.href="order.action?id=${id}";
						}
					}
				})
				
				
    		})
    	})
    </script>
</body>
</html>