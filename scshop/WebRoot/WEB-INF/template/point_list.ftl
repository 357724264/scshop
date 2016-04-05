<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>我的积分</title>
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
		    <a class="button button-link button-nav pull-left external" href="center.action" data-transition='slide-out'>
		      	<span class="icon iconfont icon-xiangzuo2"></span>
		    </a>
	    	<h1 class="title">我的积分</h1>
	  	</header>

	  	<div class="content padd-content">
	  		<div class="wdjf-total">我的积分&nbsp;:&nbsp;<span class="integral">${customer.point}</span></div>
	  		
	  		<!--<div class="buttons-tab wdjf-mingxi">
			    <a href="#tab1" class="tab-link active button">全部</a>
			    <a href="#tab2" class="tab-link button">收入</a>
			    <a href="#tab3" class="tab-link button">支出</a>
		  	</div>-->
	  		<div class="tabs">
		      	<div id="tab1" class="tab active">
			        <dl class="wdjf-mxbox">
			  		</dl>
			  		<div class="lodingbox"></div>
		     	</div>
		    </div>
	  	</div>
	</div>

	<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>
	<script type='text/javascript' src='${base}/static/js/list.js' charset='utf-8'></script>
    <script type='text/javascript' charset='utf-8'>
      var pn = 1;
		function page(){
			$.ajax({
				url:"json/point!list.action",
				type:'post',
				data:{pn:pn},
				success:function(html){
					if(pn == 1){
					$(".wdjf-mxbox").html(html);
					}else{
					$(".wdjf-mxbox").append(html);
					}
					pn++;	
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