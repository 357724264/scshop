<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>全部商品</title>
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

	<link rel="stylesheet" type="text/css" href="${base}/static/fonts/iconfont.css">
	<link rel="stylesheet" type="text/css" href="${base}/static/basestyle/stylesheets/shops.css">
	<script type="text/javascript" src="${base}/static/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${base}/static/js/list.js"></script>
</head>

<body class="spall-padd">
	<div class="content">
		<header class="shops-head headfixed">
			<a href="javascript:;" data-url="shop.action?id=${id}" class="head-left wdyback"><i class="iconfont icon-xiangzuo1"></i></a>
			<div class="head-tit">
				<a href="shop!category.action?id=${id}" class="head-ss">
					<#if tt??&&tt!="">
					<i class="iconfont icon-sousuo1 ssicon"></i><#if tt=="new">新品</#if><#if tt=="pro">促销商品</#if>
					<#else>
					<i class="iconfont icon-sousuo1 ssicon"></i><#if fl??||sl??>分类'${cname}'下</#if><#if keyword??>关于'${keyword}'</#if>商品
					</#if>
				</a>
			</div>
			<a href="shop!category.action?id=${id}" class="head-right"><i class="iconfont icon-fenleisousuo2"></i></a>
		</header>

		<div class="spall-nav">
			<a href="#" class="spall-tab active" attr-field="displayOrder">综合</a>
			<a href="#" class="spall-tab" attr-field="count">销量</a>
			<a href="#" class="spall-tab  sjxbtn" id="priceBtn" attr-field="bottomPrice">价格<i class="sort asc"></i></a>
		</div>
		<div class="shops-box mg-top">
			<div class="shops-area">
			</div>
		</div>
	</div>

	<a href='#' class="gotop"><i class="iconfont icon-top2"></i></a>

<script type="text/javascript">
var pn = 1;
var nowproiceOrdertype = "asc";
$(document).ready(function(){
	
	$(".spall-tab").bind("click",function(){
			pn = 1;
			$(".spall-tab").removeClass("pricesort active");
			$(this).addClass("pricesort active");
			if($(this).attr("attr-field")!="bottomPrice") {
				page();
			}
			
		})
		
	//升序降序	
	var clkcount=0
	$('#priceBtn').click(function(){
		clkcount+=1;
		if(clkcount % 2==0){
			$(".sort").removeClass("desc");
			$(".sort").addClass("asc");
			nowproiceOrdertype = "desc";
		}else{
			$(".sort").removeClass("asc");
			$(".sort").addClass("desc");
			nowproiceOrdertype = "asc";
		}
		page();
	});
		
	page();
	
	$(window).scroll(function(){
		if(uiIsPageBottom()) {
			page();
		}	
	});
});

function page(){
	var orderType = nowproiceOrdertype;
	var orderField = $(".active").attr("attr-field");
	//if($(".sort").hasClass("asc")){
	//	orderType = "asc";
	//}
	$.ajax({
		url:"json/shop!product.action",
		type:'post',
		data:{id:${id},keyword:"${keyword}",orderType:orderType,orderField:orderField,fl:"${fl!}",sl:"${sl!}",pn:pn,tt:"${tt!}"},
		success:function(html){
			if(pn == 1){
			$(".shops-area").html(html);
			}else{
			$(".shops-area").append(html);
			}
			pn++;	
		}
	
	});
}



</script>
	<script type="text/javascript">
		
		$(function () {
			$(document).on('click','.sjxbtn',function(){
				var _this=$(this);
				if(_this.find('.sort').hasClass('asc')){
					_this.find('.sort').removeClass('asc').addClass('desc');
				}else{
					_this.find('.sort').removeClass('desc').addClass('asc');
				}
			})

			//超出显示内容
			$(".gotop").hide();              
	      	$(window).on('scroll',function(){
	          	var sTop = $(window).scrollTop();  
	          	var sTop = parseInt(sTop);  
	          	if (sTop >= 300) { 
	          		$(".gotop").show();
	          	}
	          	else {
	              	$(".gotop").hide();
	          	}
	      	});
	    })
		//点击返回顶部
	   	$(document).ready(function($){
			var offset = 200,
				offset_opacity = 1200,
				scroll_top_duration = 700,
				$back_to_top = $('.gotop');

			$(window).scroll(function(){
				( $(this).scrollTop() > offset ) ? $back_to_top.addClass('cd-is-visible') : $back_to_top.removeClass('cd-is-visible cd-fade-out');
				if( $(this).scrollTop() > offset_opacity ) { 
					$back_to_top.addClass('cd-fade-out');
				}
			});
			$back_to_top.on('click', function(event){
				event.preventDefault();
				$('body,html').animate({
					scrollTop: 0 ,
				 	}, scroll_top_duration
				);
			});
		});
	</script>
</body>
</html>