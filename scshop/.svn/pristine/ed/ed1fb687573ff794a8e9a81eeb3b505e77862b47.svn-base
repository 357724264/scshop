<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>商品搜索</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">


<link rel="stylesheet" href="${base}/static/fonts/iconfont.css">
<link rel="stylesheet" href="${base}/static/css/head.css">
<link rel="stylesheet" href="${base}/static/css/myapp.css?v=1">

</head>
<body>
	  	<header class="header">
		    <a href="javascript:history.go(-1);" class="headback"><i class="iconfont icon-xiangzuo2"></i></a>
	    	<h1 class="title"><#if countryid??>${countryName}</#if><#if keyword??&&(keyword!="")>${keyword}<#else><#if categoryid??>${categoryName}<#else><#if brandid??>${brandName}<#else>商品列表</#if></#if></#if></h1>
	    	<a href="category.action" class="headmore external"><i class="iconfont icon-fenleisousuo2"></i></a>
	  	</header>

	  	<div class="content paddcont padd-content infinite-scroll infinite-scroll-bottom" data-distance="100">
	  		<ul class="spsch-paixubox">
	  			<li class="spsch-list"><a attr-field="displayOrder" href="#" class="pricesort active">默认</a></li>
	  			<li class="spsch-list"><a id="priceBtn" attr-field="bottomPrice" href="#">价格<i class="sort asc"></i></a></li>
	  			<li class="spsch-list"><a attr-field="count" href="#">销量</a></li>
	  		</ul>

	  		<dl class="spsch-box">
	
	  		
	  			
	  		</dl>
	  	</div>
	  	
	<script type='text/javascript' src='${base}/static/js/jquery-1.8.2.min.js' charset='utf-8'></script>
	<script type='text/javascript' src='${base}/static/js/list.js' charset='utf-8'></script>
</body>
</html>

<script type="text/javascript">
$(document).on('click','.spsch-group a', function () {
	var id = $(this).attr("data-id");
	window.location.href="product!details.action?id="+id;
})

var pn = 1;
//升序降序	
var clkcount=0
$(document).ready(function(){



	$(".spsch-list a").bind("click",function(){
			pn = 1;
			$(".spsch-list a").removeClass("pricesort active");
			$(this).addClass("pricesort active");
			if($(this).attr("attr-field")!="bottomPrice") {
				page();
			}
		})
		

	$('#priceBtn').click(function(){
		clkcount+=1;
		if(clkcount % 2==0){
			$(".sort").removeClass("desc");
			$(".sort").addClass("asc");
		}else{
			$(".sort").removeClass("asc");
			$(".sort").addClass("desc");
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
	var orderType = "desc";
	var orderField = $(".active").attr("attr-field");
	if($(".sort").hasClass("asc")){
		orderType = "asc";
	}
	$.ajax({
		url:"json/product!list.action",
		type:'post',
		data:{keyword:"${keyword}",orderType:orderType,orderField:orderField,brandid:"${brandid}",countryid:"${countryid!""}",categoryid:"${categoryid}",pn:pn},
		success:function(html){
		
			if(pn == 1){
			$(".spsch-box").html(html);
			}else{
			$(".spsch-box").append(html);
			}
			pn++;	
		}
	
	});
}



</script>