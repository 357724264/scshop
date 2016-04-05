<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>我的优惠劵</title>
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

	<link rel="stylesheet" type="text/css" href="${base}/static/fonts/iconfont.css?v=1">
	<link rel="stylesheet" type="text/css" href="${base}/static/basestyle/stylesheets/mycoupon.css?v=1">
	<script type="text/javascript" src="${base}/static/js/jquery-1.10.2.min.js"></script>
</head>

<body class="paddbody">
	<div class="content">
		<header class="shops-head">
			<a href="center.action" class="head-left"><i class="iconfont icon-xiangzuo1"></i></a>
			<div class="head-tit">				
				我的优惠劵
			</div>
			<!-- <a href="#" class="head-right"></a> -->
		</header>

		<div class="fltabs">
			<a href="coupon!list.action" class="tab-link <#if tt==0>active</#if>">未使用</a>
			<a href="coupon!list.action?tt=1" class="tab-link <#if tt==1>active</#if>">已使用</a>
			<a href="coupon!list.action?tt=2" class="tab-link <#if tt==2>active</#if>">已过期</a>
		</div>

		<div class="tabs">
			<div class="tab active" id="tab1">
				<dl class="coupon-box <#if tt!=0>overdue</#if>">
				</dl>
			</div>
			<div class="lodingbox"></div>
		</div>
	</div>
<script type='text/javascript' src='${base}/static/js/list.js' charset='utf-8'></script>
	<script type='text/javascript' charset='utf-8'>
		var pn = 1;
		function page(){
			$.ajax({
				url:"json/coupon!list.action",
				type:'post',
				data:{tt:"${tt!""}",pn:pn},
				success:function(html){
					if(pn == 1){
					$(".coupon-box").html(html);
					}else{
					$(".coupon-box").append(html);
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