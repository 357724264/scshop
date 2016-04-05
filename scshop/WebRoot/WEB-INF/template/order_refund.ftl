<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>退款/售后</title>
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
	    	<h1 class="title">退款/售后</h1>
	  	</header>

	  	<div class="content paddcont">
	  		<div class="mo-category">
	  			<a href="order!refund.action" class="mo-c-list button <#if !tt>active</#if>">全部</a>
	  			<a href="order!refund.action?tt=6" class="mo-c-list button <#if tt??&&tt==6>active</#if>">退款中</a>
	  			<a href="order!refund.action?tt=7" class="mo-c-list button <#if tt??&&tt==7>active</#if>">已退款</a>
	  			
	  			
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
				url:"json/order!refund.action",
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
		
		
	
    </script>   
</body>
</html>