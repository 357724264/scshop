<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>我的订单</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link rel="stylesheet" href="http://g.alicdn.com/msui/sm/0.5.6/css/sm.min.css">
<link rel="stylesheet" href="http://g.alicdn.com/msui/sm/0.5.6/css/sm-extend.min.css">
<link rel="stylesheet" href="http://g.alicdn.com/msui/sm/0.5.6/css/sm-extend.min.css">
<link rel="stylesheet" href="${base}/static/fonts/iconfont.css">
<link rel="stylesheet" href="${base}/static/css/myapp.css">


</head>
<body>
	<div class="page">
	  	<header class="bar bar-nav" id="second-bar">
		    <a class="button button-link button-nav pull-left external" href="center.action" data-transition='slide-out'>
		      	<span class="icon iconfont icon-xiangzuo2"></span>
		    </a>
	    	<h1 class="title">订单详情</h1>
	  	</header>

	  	<div class="content paddcont">
	  		<div class="mo-category">
	  			<a href="order!list.action" class="mo-c-list button <#if !tt??>active</#if>">全部</a>
	  			<a href="order!list.action?tt=0" class="mo-c-list button <#if tt??&&tt==0>active</#if>">待付款</a>
	  			<a href="order!list.action?tt=1" class="mo-c-list button <#if tt??&&tt==1>active</#if>">待发货</a>
	  			<a href="order!list.action?tt=2" class="mo-c-list button <#if tt??&&tt==2>active</#if>">已发货</a>
	  			<a href="order!list.action?tt=3" class="mo-c-list button <#if tt??&&tt==3>active</#if>">待评论</a>
	  			<a href="order!list.action?tt=4" class="mo-c-list button <#if tt??&&tt==4>active</#if>">已评论</a>
	  			
	  			
	  		</div>
	  		
	  		<div class="mo-scroll">
	  			<div class="mo-c-cont">
	  				<dl class="ord-box infinite-scroll">
	  				</dl>
	  				<div class="lodingbox"></div>
	  			</div>
	  		</div>
	  	</div>
	 <div>  	
	
	<script type='text/javascript' src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>  
    <script type='text/javascript' src='${base}/static/js/list.js' charset='utf-8'></script>
     <script type='text/javascript' src='${base}/static/js/countdown.js' charset='utf-8'></script>
    <script type='text/javascript' charset='utf-8'>
		var pn = 1;
		function page(){
			$.ajax({
				url:"json/order!list.action",
				type:'post',
				data:{tt:"${tt!""}",pn:pn},
				success:function(html){
					if(pn == 1){
					$(".ord-box").html(html);
					}else{
					$(".ord-box").append(html);
					}
					pn++;
					$(".countdown").countdown();	
				}
			
			});
		}
		$(document).ready(function(){
			
			page();
			window.onscroll = function(){ 
				if(uiIsPageBottom()){
					if($(".lodingbox").length >0){
						if(!$(".lodingbox").hasClass("ling")){
							page();
						}
					}
				}
			}
		
		});
		function cancel(id){
			$.confirm('确定取消订单吗？', function () {
				$.ajax({
				url:"json/order!cancel.action?id="+id,
				success:function(ret){
					var dat = eval("("+ret+")");
					if(dat.success){
						$.alert("订单取消成功");
						location.reload();
					}
				}
			})
		  });
		}
		function sure(id){
			$.confirm('确定已经收到商品了吗？', function () {
				$.ajax({
				url:"json/order!sure.action?id="+id,
				success:function(ret){
					var dat = eval("("+ret+")");
					if(dat.success){
						$.alert("确定收到货了");
						window.location.href="order!list.action?tt=3";
					}
				}
			})
		  });
		}
	
    </script>   
</body>
</html>