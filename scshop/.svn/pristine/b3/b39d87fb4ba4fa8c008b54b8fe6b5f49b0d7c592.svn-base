<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>商品评价</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">


<link rel="stylesheet" href="${base}/static/fonts/iconfont.css">
<link rel="stylesheet" href="${base}/static/css/head.css">
<link rel="stylesheet" href="${base}/static/css/myapp.css">
</head>
<body>
	  	<header class="header">
		    <a href="javascript:history.go(-1);" class="headback"><i class="iconfont icon-xiangzuo2"></i></a>
	    	<h1 class="title">商品评价</h1>
	    	<a href="#" class="headmore"></a>
	  	</header>

	  	<div class="content paddcont jg-content">
	  		<!-- <div class="buttons-tab scfl-tab">
			    <a href="#tab1" class="tab-link active button">全部(${product.goodnum+product.middlenum+product.badnum})</a>
			    <a href="#tab2" class="tab-link button">好评(${product.goodnum})</a>
			    <a href="#tab3" class="tab-link button">中评(${product.middlenum})</a>
			    <a href="#tab4" class="tab-link button">差评(${product.badnum})</a>
		  	</div> -->

		  	<div class="mo-category buttons-tab" id="judgeofnav">
	  			<a href="#tab0" class="mo-c-list tab-link active button commentlevel" data-level="0" data-nowpn="0">全部(${product.goodnum+product.middlenum+product.badnum})</a>
			    <a href="#tab3" class="mo-c-list tab-link button commentlevel" data-level="3" data-nowpn="0">好评(${product.goodnum})</a>
			    <a href="#tab2" class="mo-c-list tab-link button commentlevel" data-level="2" data-nowpn="0">中评(${product.middlenum})</a>
			    <a href="#tab1" class="mo-c-list tab-link button commentlevel" data-level="1" data-nowpn="0">差评(${product.badnum})</a>
	  		</div>

		  	<div class="tabs" id="jugeiftabs">
		      	<div id="tab0" class="tab active">
			  		<div class="jgbox">
			  			<dl class="yhpj-box" id="box0">
				  		</dl>
				  	</div>
				</div>
				<div id="tab3" class="tab">
					<div class="jgbox">
			  			<dl class="yhpj-box" id="box3">
				  		</dl>
				  	</div>
				</div>
				<div id="tab2" class="tab">
					<div class="jgbox">
			  			<dl class="yhpj-box" id="box2">
				  		</dl>
				  	</div>
				</div>
				<div id="tab1" class="tab">
					<div class="jgbox">
			  			<dl class="yhpj-box" id="box1">
				  		</dl>
				  	</div>
				</div>
			</div>
	  	</div>

	  	<a href="javascript:;" class="backtop"><i class="iconfont icon-iconfontcolor84"></i></a>

	<script type='text/javascript' src='${base}/static/js/zepto.min.js' charset='utf-8'></script>
	<script type='text/javascript' src='${base}/static/js/tabs.js' charset='utf-8'></script>
    <script type='text/javascript' src='${base}/static/js/jquery-1.8.2.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='${base}/static/js/list.js' charset='utf-8'></script>
    <script type="text/javascript" src="${base}/static/js/xingji.js"></script><!-- 星级事件 -->
    <script type="text/javascript">
var pn1 = 1;
var pn2 = 1;
var pn3 = 1;
var pn4 = 1;
$(document).ready(function(){
		
	page();
	
	$(window).scroll(function(){
		if(uiIsPageBottom()) {
			page();
		}	
	});
	
	$(".tab-link").bind("click",function(){
	var nowpn =  $(this).attr("data-nowpn");
	var level = $(this).attr("data-level");
	$(this).addClass("active").siblings().removeClass("active");
	$(".tab").hide();
	$("#tab"+level).show();
		if(nowpn == 0){
			page();
		}
	})
});

function page(){
	var level = $(".commentlevel.active").attr("data-level");
	var nowpn =  $(".commentlevel.active").attr("data-nowpn");
	if(nowpn<0){
		return false;
	}
	pn = nowpn*1 + 1;
	$.ajax({
		url:"json/comment!list.action",
		type:'post',
		data:{level:level,pn:pn,id:${id}},
		success:function(html){
			if(pn<2&&html==""){
				$("#tab"+level).find(".jgbox").html('<p class="nojg">暂无评价，欢迎您购买之后留下您的宝贵评价&#9786;</p>')	
				$(".commentlevel.active").attr("data-nowpn",-1);
			}else{
			if(pn == 1){
				$("#box"+level).html(html);
				}else{
				$("#box"+level).append(html);
				}
				$(".commentlevel.active").attr("data-nowpn",pn);
				xingji('.yhpj-xingji');
			}
		}
	
	});
}

//超出显示内容
	$(function () {
		$(".backtop").hide();              
      	$(window).bind("scroll", function () {  
          var sTop = $(window).scrollTop();  
          var sTop = parseInt(sTop);  
          if (sTop >= 300) { 
          	$(".backtop").show();
          }
          else {
              $(".backtop").hide();
          }
      	});
    })
	//点击返回顶部
   	$(document).ready(function($){
		var offset = 200,
			offset_opacity = 1200,
			scroll_top_duration = 700,
			$back_to_top = $('.backtop');

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