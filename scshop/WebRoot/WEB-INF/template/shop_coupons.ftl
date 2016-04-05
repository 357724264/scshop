
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>优惠劵</title>
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
		<script type="text/javascript" src="${base}/static/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${base}/static/js/list.js"></script>
	<script type="text/javascript">
var pn = 1;
$(document).ready(function(){
	page();
	$(window).scroll(function(){
		if(uiIsPageBottom()) {
			page();
		}	
	});
});

function page(){
	$.ajax({
		url:"json/shop!coupons.action",
		type:'post',
		data:{id:${id},pn:pn},
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

$(document).on('click','.yhjlqbtn',function(){
	if($(this).hasClass("clicked")){
		return false;
	}
	<#if useridobj??>
	$(this).addClass("clicked");
	var id = $(this).attr("data-id");
	$.ajax({
		url:"json/coupon!receive.action?id="+id,
		success:function(html){
			var dat = eval("("+html+")");
			if(dat.success){
				alert("领取成功");
			}else{
				alert(dat.message);
			}
		}
	})
	<#else>
	alert("请登录后领取。");
	window.location.href="login.action?redirecturl=shop!coupons.action?id=${id}";
	</#if>
})



</script>

	<link rel="stylesheet" type="text/css" href="${base}/static/fonts/iconfont.css">
	<link rel="stylesheet" type="text/css" href="${base}/static/basestyle/stylesheets/mycoupon.css">
	<script type="text/javascript" src="${base}/static/js/jquery-1.10.2.min.js"></script>
</head>

<body class="yhjlq-padd">
	<div class="content">
		<header class="shops-head">
			<a href="javascript:;" data-url="shop.action?id=${id}" class="head-left wdyback"><i class="iconfont icon-xiangzuo1"></i></a>
			<div class="head-tit">				
				优惠劵
			</div>
			<!-- <a href="#" class="head-right"></a> -->
		</header>

		<dl class="coupon-box">
		</dl>
	</div>
</body>
</html>