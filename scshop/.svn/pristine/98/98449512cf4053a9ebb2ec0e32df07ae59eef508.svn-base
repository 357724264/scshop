<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>购物车</title>
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
		    <a class="button button-link button-nav pull-left external" href="index.action" data-transition='slide-out'>
		      	<span class="icon iconfont icon-xiangzuo2"></span>
		    </a>
	    	<h1 class="title">购物车(<font id="cartnum">0</font>)</h1>
	    	<a class="button button-link button-nav pull-right sc-bj" href="#" data-transition='slide-out'>
		      	编辑
		    </a>
	  	</header>

	  	<div class="content padd-content">
	  		<dl class="cart-commoditybox">
	  		<#if list??&&(list?size gt 0)>
	  			<#list list as cart>
	  			<#assign money=0.00 />
	  			<#if cart.itemlist??>
	  			<dd class="cart-individualitem" id="shop${cart.shopid}">
	  				<div class="sp-dpname">
	  					<label class="sp-xuanze"><input type='checkbox' name="subbox" class="spcart-checkbox dpmenu" checked="checked" data-shopid="${cart.shopid}"/><i class="iconfont icon-duigou"></i></label>
	  					<div class="sp-shangpuname">${cart.shopname}</div>
	  				</div>
	  				<#list cart.itemlist as item>
	  				<#assign money = money + item.price*item.num />
	  				<div class="sp-infogroup">
	  					<label class="sp-xuanze sp-i-xuanze"><input type='checkbox' name="subbox" class="spcart-checkbox dplist checkbox${item.id}" checked="checked" data-shopid="${cart.shopid}" data-pid="${item.id}"  data-model="${item.model}"/><i class="iconfont icon-duigou"></i></label>
	  					<div class="sp-i-cont">
	  						<div class="sp-i-c-box">
	  							<div class="sp-i-c-img">
	  								<a href="#">
	  									<img src="${item.pic}" />
	  								</a>
	  							</div>
	  							<div class="sp-i-c-lr">
	  								<a class="sp-i-c-lr-tit">${item.name}<#if item.model??&&item.model!="">${item.model}</#if></a>
	  								<div class="sp-i-c-lr-price">&yen;&nbsp;${item.price}</div>
	  								<div class="sp-i-c-lr-amount" data-price="${item.price}">
	  									<div id="d1" class="Spinner Spinner${cart.shopid}" data-num="${item.num}" data-pid="${item.id}" data-model="${item.model}" data-max="${item.max}" data-min="${item.min}"></div>
	  								</div>
	  							</div>
	  						</div>
	  					</div>
	  				</div>
	  				</#list>
	  				<div class="s-c-o-zfbox">
	  					<div class="s-c-o-left">
	  						已选商品<font id="left${cart.shopid}">${cart.itemlist?size}</font>件
	  					</div>
	  					<div class="s-c-o-right">
	  						<table class="s-c-o-pricetotal">
	  							<tr>
	  								<td>商品总额:</td><td>&yen;&nbsp;<font class="money${cart.shopid}">${money?string('0.00')}</font></td>
	  							</tr>
	  							<tr>
	  								<td>运费:</td><td>&yen;&nbsp;0.00</td>
	  							</tr>
	  							<tr>
	  								<td>总计(含运费):</td><td class="sco-total">&yen;&nbsp;<font class="money${cart.shopid}">${money?string("0.00")}</font></td>
	  							</tr>
	  						</table>

	  						<div class="s-c-o-btn" id="topay${cart.shopid}"  onclick="javascript:topay(${cart.shopid},this);">
	  							<a href="#" class="external">去结算</a>
	  						</div>
	  					</div>
	  				</div>
	  			</dd>

	  			</#if>
	  			</#list>
	  			<#else>
	  			<div class="kgwcbox">
		  			<p>
		  				<i class="iconfont icon-cart"></i>
		  				<span>您的购物车还没有商品哦</span>
		  			</p>
		  			<a href='index.action' class="gosplb external">去商城看看</a>
		  		</div>
	  			</#if>
	  		</dl>
	  	</div>  	
	</div>
	
	<script type='text/javascript' src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>   
 <script type="text/javascript" src="${base}/static/js/list.js"></script>
    <script type="text/javascript" src="${base}/static/js/jquery.Spinner.js"></script><!-- 加减事件 -->
    <script type="text/javascript">
    	function topay(shopid,that){
    		if($(that).find("a").hasClass("clicked")){
    			return false;
    		}
    		<#if !useridobj??>
    			window.location.href="login.action?redirecturl=cart.action";
    			return false;
    		</#if>
    		
    		$(that).find("a").addClass("clicked");
    		var items = [];
    		var itemsindex = 0;
    		var spinners = $(".Spinner"+shopid);
    		for(var i=0;i<spinners.length;i++){
    			var spinner = $(spinners[i]);
    			var item = {};
    			var pid = $(spinner).attr("data-pid");
    			var model = $(spinner).attr("data-model");
    			var checkboxclass = $(".checkbox"+pid);
    			if(model!=null&&model!=""){
					checkboxclass = $(".checkbox"+pid+"[data-model='"+model+"']");
					model = null;
				}
    			if(!$(checkboxclass).is(":checked")){
    				continue;
    			}
    			var num = $(spinner).find(".Amount").val();
    			item["productid"] = pid;
    			if(model!=null){
    				item["model"] = model;
    			}
    			item["num"] = num;
    			items[itemsindex++]=item;
    		}
    		var json = JSON.stringify(items);
    		$.ajax({
    			url:"json/order!create.action",
    			data:{items:json,shopid:shopid},
    			type:"post",
    			success:function(ret){
    				var dat = eval("("+ret+")");
    				if(dat.success){
						var cnum =getCookie("cookiec");
						if(cnum!=null){
							setCookie("cookiec",cnum-dat.js);
						}
    					window.location.href="pay!sure.action?id="+dat.orderid;
    				}	
    			}
    		})
    		
    	}
    	function countShopCartMoney(shopid){
    		var spinners = $(".Spinner"+shopid);
			var money = 0.00;
			var count=0;
			for(var i=0;i<spinners.length;i++){
				var pid = $(spinners[i]).attr("data-pid");
				var checkboxclass = $(".checkbox"+pid);
				var model = $(spinners[i]).attr("data-model");
				if(model!=null&&model!=""){
					checkboxclass = $(".checkbox"+pid+"[data-model='"+model+"']");
				}
				if($(checkboxclass).is(":checked")){
					count ++;
					var price = $(spinners[i]).parent().attr("data-price") * 1;
					var nn = $(spinners[i]).find(".Amount").val() * 1;
					money = money+(price * nn);
				}
			}
			if(count<=0){
				$("#topay"+shopid).find("a").addClass("clicked");
			}else{
				$("#topay"+shopid).find("a").removeClass("clicked");	
			}
			$("#left"+shopid).html(count);
			return money.toFixed(2);
    	}
    
    	$(function(){
    		var cnum=$(".dplist").length;
    		$("#cartnum").html(cnum);
    		setCookie("cookiec",cnum);
    		var spinners = $(".Spinner");
    		for(var i=0;i<spinners.length;i++){
    			var spinner = $(spinners[i]);
    			var num = $(spinner).attr("data-num");
    			var min = $(spinner).attr("data-min");
    			var max = $(spinner).attr("data-max");
    			$(spinner).Spinner(num,min,max);    
    		}	
			
    		
    		//编辑
    		$(document).on('click','.sc-bj', function () {
    			var htm = '<a class="button button-link button-nav pull-right shop-bjwc" href="#" data-transition="slide-out">完成</a>'; 
    			$(this).remove();
    			$('#second-bar').append(htm);
    			var html = '<nav class="bar bar-tab" id="shop-cartnav">'+
								'<div class="shop-allselect">'+
									'<label class="shop-as-lb">'+
										'<input type="checkbox" id="checkall" class="shop-as-checkbtn" />'+
										'<span><i class="iconfont icon-duigou"></i>&nbsp;全选</span>'+
									'</label>'+
								'</div>'+
								'<div class="shop-jiesuanobox">'+
									'<a href="#" class="shop-settleaccounts shop-delt">删除</a>'+
								'</div>'+
							'</nav>';
    			
			  	$('#second-bar').after(html);//点击透明层关闭,不是必须
			  	$(".s-c-o-btn").hide();
			  	$(".s-c-o-zfbox").hide();
			  	$("input[type='checkbox']").removeAttr("checked");
			});

    		//完成
			$(document).on('click','.shop-bjwc', function () {
				var htm = '<a class="button button-link button-nav pull-right sc-bj" href="#" data-transition="slide-out">编辑</a>'; 
    			$(this).remove();
    			$('#second-bar').append(htm);
			  	$('#shop-cartnav').remove();
			  	$(".s-c-o-btn").show();
			  	$(".s-c-o-zfbox").show();
			  	$("input[type='checkbox']").attr("checked","checked");
			});
			//增加商品
			$(document).on('click','.Increase', function () {
				var num = $(this).siblings(".Amount").val();
				var pid = $(this).parent().attr("data-pid");
				var model = $(this).parent().attr("data-model");
				var data = {};
				if(model==null||model==""){
					data = {num:num,id:pid};
				}else{
					data = {num:num,id:pid,model:model};
				}
				$.ajax({
					url:"json/cart!edit.action",
					data:data,
					success:function(ret){
						var dat = eval("("+ret+")");
						if(dat.success){
							var shopid = dat.shopid;
							var money = countShopCartMoney(shopid);
							$(".money"+shopid).html(money);
						}
					}
				})
			});
			//减掉商品
			$(document).on('click','.Decrease', function () {
				var num = $(this).siblings(".Amount").val();
				var pid = $(this).parent().attr("data-pid");
				var model = $(this).parent().attr("data-model");
				var data = {};
				if(model==null||model==""){
					data = {num:num,id:pid};
				}else{
					data = {num:num,id:pid,model:model};
				}
				$.ajax({
					url:"json/cart!edit.action",
					data:data,
					success:function(ret){
						var dat = eval("("+ret+")");
						if(dat.success){
							var shopid = dat.shopid;
							var money = countShopCartMoney(shopid);
							$(".money"+shopid).html(money);
						}
					}
				})
			});
			//减到剩下1的时候
			$(document).on('click','.DisDe', function () {
				var num = $(this).siblings(".Amount").val();
				var pid = $(this).parent().attr("data-pid");
				var min = $(this).parent().attr("data-min");
				var data = {};
				data = {num:num,id:pid};
				$.ajax({
					url:"json/cart!edit.action",
					data:data,
					type:"post",
					success:function(ret){
						var dat = eval("("+ret+")");
						if(dat.success){
							var shopid = dat.shopid;
							var money = countShopCartMoney(shopid);
							$(".money"+shopid).html(money);
						}
					}
				})
			});

			//全选
     		$(document).on('click','#checkall',function (e) {
			    if ($('#checkall').is(":checked")){
			      	$('input[name="subbox"]').prop('checked',true);
			    } else {
			      	$('input[name="subbox"]').prop('checked',false);
			    }
		  	})

		  	function yncheck(shopid){
		  		
		  		var leng=$('input[name="subbox"]').length;
     			var leng2=$('input[name="subbox"]:checked').length;
     			$("#checkall").prop("checked",leng == leng2 ? true : false);
     			var money = countShopCartMoney(shopid);
     			$(".money"+shopid).html(money);
		  	}

     		//判断如果是否全部选中
     		$(document).on('click','input[name="subbox"]',function (e) {
     			var shopid = $(this).attr("data-shopid");
     			yncheck(shopid);
     		})

		  	$(document).on('click','.dpmenu',function (e) {
		  		var shopid = $(this).attr("data-shopid");
			    if ($(this).is(":checked")){
			      	$(this).parent().parent().nextAll('.sp-infogroup').find('input[name="subbox"]').prop('checked',true);
			      	yncheck(shopid);
			    } else {
			      	$(this).parent().parent().nextAll('.sp-infogroup').find('input[name="subbox"]').prop('checked',false);
					yncheck(shopid);
			    }
		  	})

		  	$(document).on('click','.dplist',function (e) {
		  		var groupparent=$(this).parent().parent().parent();
		  		var groupckeckboxlist=groupparent.find('.dplist').length;
		  		var ckeckedlist=groupparent.find('.dplist:checked').length;

		  		var par=groupparent.find('.dpmenu');
			    par.prop("checked",groupckeckboxlist == ckeckedlist ? true : false);
			    yncheck();
		  	})
		  	
		  	//编辑删除
		  	$(document).on('click','.shop-delt',function (e) {
		  		var plistbox = $(".dplist");
		  		var items = [];
		  		var j =0;
		  		for(var i=0;i<plistbox.length;i++){
		  			var item ={};
			  			if($(plistbox[i]).is(":checked")){
			  			var pid = $(plistbox[i]).attr("data-pid");
			  			var model = $(plistbox[i]).attr("data-model"); 
			  			item["productid"] = pid;
			  			if(model!=null&&model!=""){
			  				item["model"] = model;
			  			}
			  			items[j++] = item;
		  			}
		  		}
		  		var json = JSON.stringify(items);
		  		$.ajax({
		  			url:"json/cart!batchedit.action",
		  			data:{batchitem:json},
		  			type:"post",
		  			success:function(ret){
		  				var dat = eval("("+ret+")");
		  				if(dat.success){
		  					var dpmenulist = $(".dpmenu");
		  					for(var i=0;i<dpmenulist.length;i++){
		  						var shopid = $(dpmenulist[i]).attr("data-shopid");
		  						countShopCartMoney(shopid);
		  						
		  					}
		  					var dplists = $(".dplist");
		  					var num = dplists.length;
		  					for(var i=0;i<dplists.length;i++){
		  						if($(dplists[i]).is(":checked")){
		  							$(dplists[i]).parent().parent().remove();
		  							num--;
		  						}
		  					}
		  					if($(".dplist[data-shopid='"+shopid+"']").length<1){
		  						$("#shop"+shopid).remove();	
		  					}
		  					setCookie("cookiec",num);
		  					$("#cartnum").html(num);
		  					
		  				}
		  			}
		  		})
		  	})
		  	

        })
    </script>
</body>
</html>