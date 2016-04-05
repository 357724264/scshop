<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>商品详情</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.5.6/css/sm.min.css">
<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.5.6/css/sm-extend.min.css">
<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.5.6/css/sm-extend.min.css">
<link rel="stylesheet" href="${base}/static/fonts/iconfont.css">
<link rel="stylesheet" href="${base}/static/css/myapp.css?v=1.011">
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript" src="http://mp.weixin.qq.com/debug/zh_CN/htmledition/js/jsapisign/sha121d415.js"></script>
<script>
	function is_weixn(){  
	    var ua = navigator.userAgent.toLowerCase();  
	    if(ua.match(/MicroMessenger/i)=="micromessenger") {  
	        return true;  
	    } else {  
	        return false;  
	    }  
	}
		var jsapi_ticket = '${tick}';
		var appId = '${info.appid}'; 
		var timestamp = '1';
		var nonceStr = '5K8264ILTKCH16CQ2502SI8ZNMTM67VS';
		var theUrl = document.URL;
		var string1 = 'jsapi_ticket=' + jsapi_ticket + '&noncestr=' + nonceStr + '&timestamp=' + timestamp + '&url=' + theUrl; 
		var signature = new jsSHA(string1,"TEXT"); //签名算法
			signature = signature.getHash("SHA-1","HEX");
		var jsApiList = ['closeWindow'];
		//通过config接口注入权限验证配置
		wx.config({
		    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    appId: appId, // 必填，公众号的唯一标识
		    timestamp: timestamp, // 必填，生成签名的时间戳
		    nonceStr: nonceStr, // 必填，生成签名的随机串
		    signature: signature, // 必填，签名，见附录1
		    jsApiList: jsApiList // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});
		
	function sureview(){
		if(is_weixn()){
			wx.closeWindow();
		}else{
			$('.popup-overlay').removeClass('modal-overlay-visible');
			$('.kf-popup').removeClass('popblock');
		}
	}
	
	</script>
</head>
<body>
	<div class="page">
	  	<header class="bar bar-nav" id="second-bar">
		    <a class="button button-link button-nav pull-left external wdyback" href="javascript:;" data-transition='slide-out' data-url="/">
		      	<span class="icon iconfont icon-xiangzuo2"></span>
		    </a>
	    	<h1 class="title">商品详情</h1>
	    	<a class="button button-link button-nav pull-right" href="#" id="indexBtn" data-transition='slide-out'>
		      	<span class="icon iconfont icon-shouye5"></span>
		    </a>
	  	</header>

		<nav class="bar bar-tab" id="sp-d-car">
			<div class="sp-d-menu">
			  	<a class="tab-item external" id="kfout" href="#">
				    <span class="icon iconfont icon-kefu1"></span>
				    <span class="tab-label">客服</span>
			  	</a>
			  	<a class="tab-item external" href="shop.action?id=${product.shopid}">
				    <span class="icon iconfont icon-xiaodian"></span>
				    <span class="tab-label">店铺</span>
			  	</a>
			  	<a class="tab-item external" href="cart.action">
				    <span class="icon iconfont icon-gouwuche9"></span>
				    <span class="tab-label">购物车</span>
				    <span class="badge" id="cartcount">0</span>
			  	</a>
		  	</div>
		  	<div class="sp-d-addcar">
		  		<a href="#" class="open-about">加入购物车</a>
		  	</div>
		</nav>

	  	<div class="content padd-content">
	  		<div class="sp-d-box1">
		  		<div class="sp-d-img">
		  			<div class="spxqimg">
		  				<img src="${product.cover}" />
		  			</div>
		  		</div>
		  		<div class="sp-d-cdcjbox">
		  			<div class='nationality'>
						<div class='guoqi'>
							<img src="${product.countryIcon}" />
						</div>
						<div class="guoji-name">${product.country}</div>
					</div>
					<span class="sp-d-sj">由商家${product.shopName}提供</span>
		  		</div>
		  		<h5 class="sp-d-tit">${product.name}</h5>
		  		<div class="sp-d-price">&yen;&nbsp;<span><#if !product.productType??||product.productType==0||(product.product!=0&&product.beginTime gt .now?long)>${product.bottomPrice}<#else>${product.seckillBottomPrice}</#if></span></div>
		  		<div class="sp-d-ckj">国内参考价&nbsp;&yen;&nbsp;${product.indicativePrice}</div>
		  	</div>

		  	<div class="sp-d-box2">
		  		<div class="sp-d-yhpjtit">
		  			用户评价(${tn})<span class="hpl">平均分:&nbsp;<#if (product.score)??>${product.score?string("0.00")}<#else>4</#if></span>
		  		</div>
		  		<#if commentList??&&(commentList?size gt 0)>
		  		<dl class="yhpj-box">
		  			<#list commentList as comment>
		  			<dd class="yhpj-group">
		  				<div class="yhpj-avatar">
		  					<img src="${comment.userPic}" />
		  				</div>
		  				<div class="yhpj-cont">
		  					<h5 class="yhpj-yhname">${comment.userName}</h5>
		  					<p class="yhpj-lr">${comment.content}</p>
		  					<div class="yhpj-oth">
		  						<div class="yhpj-xingji" data-val='${comment.point*20}'></div>
		  						<span class="yhpj-time">${comment.createDate?number_to_datetime?string("yyyy/MM/dd HH:mm:ss")}</span>
		  					</div>
		  				</div>
		  			</dd>
		  			</#list>
		  			
		  		</dl>
		  		<a href="comment!list.action?id=${product.id}" class="more-yhpj external">查看更多评论</a>
		  		<#else>
		  		<dl class="yhpj-box">
		  			<dd class="yhpj-group">
		  				
		  				<div class="yhpj-cont">
		  					暂无评论
		  				</div>
		  			</dd>
		  		</dl>
		  		</#if>
		  	</div>

		  	<div class="sp-d-box3">
		  		<div class="buttons-tab wdjf-mingxi">
				    <a href="#tab1" class="tab-link button">图文详情</a>
				    <a href="#tab2" class="tab-link active button">基本参数</a>
			  	</div>
		  		<div class="tabs">
			      	<div id="tab1" class="tab spxq-twxq-img">
				    	${product.htmlDesc}
			     	</div>
			      	<div id="tab2" class="tab active cpcs">
				        <table class="yhpj-cpcs">
				        	<tbody>
				        		<tr>
				        			<td width="90px">国家:</td>
				        			<td>${product.country}</td>
				        		</tr>
				        		<tr>
				        			<td width="90px">品牌:</td>
				        			<td>${product.brandName}</td>
				        		</tr>
				        		<tr>
				        			<td width="90px">计量单位:</td>
				        			<td>${product.unit}</td>
				        		</tr>
				        		<tr>
				        			<td width="90px">重量:</td>
				        			<td>${product.weight}</td>
				        		</tr>
				        		<tr>
				        			<td width="90px">体积:</td>
				        			<td>${product.volumn}</td>
				        		</tr>
				        	</tbody>
				        </table>
			      	</div>
			    </div>
		  	</div>
	  	</div>	  	
	</div>

	<div class="popup popup-about popupbox" data-toggle="scroller">
	  	<div class="sp-d-popuparea">
	  		<div class="sp-d-sninfo">
	  			<div class="sp-d-sn-img">
	  				<img id="display_pic" src="${product.cover}" /> 
	  			</div>
	  			<div class="sp-d-sn-cont">
	  				<p class="sp-d-sn-tit">${product.name}</p>
	  				<p class="sp-d-sn-kc">库存<font id="nowinventory">9999</font>件</p>
	  				<div class="sp-d-sn-price">&yen;&nbsp;<span id="display_price">${product.bottomPrice} ~ ${product.topPrice}</span></div>
	  			</div>
	  		</div>
	  		<div class="sp-d-p-group">
	  			<h5 class="sp-d-p-class">${product.firstSpecName}</h5>
	  			<dl class="sp-d-p-condition" id="firstSpec">
	  				
	  			</dl>
	  		</div>
	  		<div class="sp-d-p-group" id="sp-d-p-group2" style="display:none">
	  			<h5 class="sp-d-p-class">${product.secondSpecName}</h5>
	  			<dl class="sp-d-p-condition" id="secondSpec">
	  			</dl>
	  		</div>
	  		<div class="sp-d-p-group">
	  			<h5 class="sp-d-p-class">数量</h5>
	  			<div class="sp-d-spinner">
	  				<div id="d1" class="Spinner"></div>
	  			</div>
	  		</div>
	  		<div class="sp-d-p-addbtn">
	  			<a  href="#">加入购物车</a>
	  		</div>

	  		<a class="close-popup sp-d-p-close" href="#"><i class="iconfont icon-close"></i></a>
	  	</div>
	</div>

	<div class="kf-popup">
		<img src="${base}/static/images/kf.png" />

		<div class="kfbtnbox">
			<a href="javascript:sureview()" class="confirm external">确定</a>
			<a href="#" class="cancel">取消</a>
		</div>
	</div>


	<div class="popup-overlay"></div>
	
	<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>   
    <script type="text/javascript" src="${base}/static/js/xingji.js"></script><!-- 星级事件 -->
    <script type="text/javascript" src="${base}/static/js/jquery.Spinner.js"></script><!-- 加减事件 -->
    <script type="text/javascript" src="${base}/static/js/list.js?v=1" charset="utf-8"></script>
    <script type="text/javascript">
    	$(function(){
    		var cnum =getCookie("cookiec");
    		if(cnum!= null){
    			$("#cartcount").html(cnum);
    		}
    		$("#indexBtn").bind("click",function(){
				location.href = "index.action";    		
    		});
    		
    		$(document).on('click','.condition-list', function () {
    			var price = $(this).attr("attr-price");
    			$("#display_price").html(price);
    			var min = 0;
    			var max = 0;
    			if($(this).hasClass("nodown")) {
    			
	    			 min =  $(this).attr("attr-min");
	    			 max =  $(this).attr("attr-max");
	    			if(!max) {
	    				max =9999;
	    			}
	    			var inventory = $(this).attr("attr-inventory"); 
	    			$("#d1").html("");
	    			$("#d1").Spinner(min,min,inventory*1>max*1?max:inventory);
	    		}
				if($(this).hasClass("first-list")) {
					var pic = $(this).attr("attr-pic");
    				$("#display_pic").attr("src",pic);
				}
	    		var nownum = $(this).attr("attr-inventory");
	    		$("#nowinventory").html(nownum);
    			$(this).addClass("active").siblings().removeClass("active");
				if($(this).attr("attr-activity")!=0){
					if($(this).attr("attr-activity")==1){
						$(".sp-d-p-addbtn").find("a").html("一键秒杀商品");
					}else{
						$(".sp-d-p-addbtn").find("a").html("限时购买商品");
					}
				}else{
					if(nownum*1>0){
						$(".sp-d-p-addbtn").find("a").html("加入购物车");
						$(".sp-d-p-addbtn").removeClass("clicked");
					}else{
						$(".sp-d-p-addbtn").addClass("clicked");
						$(".sp-d-p-addbtn").find("a").html("没有库存了");
					}
				}
    			
    			if($(this).hasClass("second-list")) {
    				return;
    			}
    			var id = $(this).attr("attr-id");
    			var _pic = $(this).attr("attr-pic");
    			var _this = $(this);
    			$.ajax({
    				url:"json/product!choice.action",
    				type:"post",
    				async: false,
    				data:{id:id},
    				success:function(data){
    					var dat = eval("("+data+")");
    					$("#secondSpec").html('');
    					var length = dat.length;
    					if(length >0){
    					for(var i=0;i<dat.length;i++){
    						$("#sp-d-p-group2").show();
    						var html = '<dd class="condition-list second-list nodown" attr-inventory="'+dat[i].inventory+'" attr-id="'+dat[i].id+'" attr-activity="'+dat[i].active+'"  attr-pic="'+dat[i].pic+'" attr-min="'+dat[i].min+'" attr-max="'+dat[i].max+'" attr-pic="'+dat[i].pic+'" attr-price="'+dat[i].price+'" ><span class="num">'+dat[i].name+'</span>';
    						if(dat[i].active>0){
	  							if(dat[i].active==1){
	  								html+='<span class="tag">秒杀中</span>';
	  							}else{
	  								html+='<span class="tag">限时购</span>';
	  							}
	  						}
	  						html+='</dd>';
	  						$("#secondSpec").append(html);
	  						
	  						
    					}
    					}else{
    						$(_this).addClass("nodown");
    						var min =  $(_this).attr("attr-min");
	    			var max =  $(_this).attr("attr-max");
	    			if(max*1<=0){
	    				if($(_this).attr("attr-activity")==2){
	    					$(".sp-d-p-addbtn").addClass("clicked");
							$(".sp-d-p-addbtn").find("a").html("您已抢购完毕");	
	    				}		
	    			
	    			}
	    			if(!max) {
	    				max =9999;
	    			}
	    			var inventory = $(_this).attr("attr-inventory"); 
	    			$("#d1").html("");
	    			$("#d1").Spinner(min<1?1:min,min<1?1:min,inventory*1>max*1?max:inventory);
    					}
    					
    				}
    			});
    			
    			
    		});
    		
    		$(document).on('click',".sp-d-p-addbtn",function(){
    			
    			var model = $(".condition-list.active span").text();
    			var num = $(".Amount").val();
    			var length = $(".active.nodown").length;
    			var _this = $(this);
    			if(length < 1) {
    				$.alert("请选择商品规格");
    				return;
    			}
    			
    			if($(this).hasClass("clicked")){
    				return false;
    			}
    			$(this).addClass("clicked");
    			
    			var id = $(".active.nodown").attr("attr-id");
    			var activity =  $(".active.nodown").attr("attr-activity");
    			var num = $(".Amount").val();
    			if(activity!=0){
    			<#if !userid??>
    				$.alert("请先登录");
    				window.location.href="login.action?redirecturl=product!details.action?id=${id}";
    				return false;
    			</#if>
    				$.ajax({
    					url : "json/seckill!order.action",
    					data:{"id":id,"num":num},
    					success : function(data){
    						var dat = eval("("+data+")");
    						if(dat.success){
    							window.location.href="pay!sure.action?id="+dat.url;
    						}else{
    							$.alert("商品促销活动已经结束");
    							window.location.href="product!details.action?id=${id}";
    						}
    					}
    				})
    				return false;
    			}
    			$.ajax({
    				
    				url : "json/cart!edit.action",
    				type : "post",
    				data : {id:id,num:num},
    				success : function(data){
    				var dat = eval("("+data+")");
    					if(dat.success){
    						if(dat.add==1) {
    							var cartCount = getCookie("cookiec");
    							var aftercount = 0;
    							if(cartCount !=null){
    							 aftercount= cartCount*1+1;
    							}else{
    								 aftercount= 1;
    							}
    							setCookie("cookiec",aftercount);
    							
								$(".badge").text(aftercount);
    						}
						$.closeModal('.popup-about');				
    					}else {
    						alert("添加失败");
    					}	
    					$(_this).removeClass("clicked");
    				}
    			});
    			
    		});
    		
    		//星级方法
            xingji('.yhpj-xingji');

            //弹出条件选择
            $(document).on('click','.open-about', function () {
			  	$.popup('.popup-about');
			  	$('.popup-overlay').addClass('close-popup');//点击透明层关闭,不是必须
			});

            //客服弹出层
			$(document).on('click','#kfout',function(){
				$('.popup-overlay').addClass('modal-overlay-visible');
				$('.kf-popup').addClass('popblock');
			})
			$(document).on('click','.cancel',function(){
				$('.popup-overlay').removeClass('modal-overlay-visible');
				$('.kf-popup').removeClass('popblock');
			})
			
            //数量加减方法
			$("#d1").Spinner(1,1,999);
			initSubProduct();	
			
    	
        })
        
        
        function initSubProduct(){
        	var productid = "${id}";
        		$.ajax({
    				url:"json/product!choice.action",
    				type:"post",
    				data:{productid:productid},
    				success:function(data){
    					var dat = eval("("+data+")");
    					$("#firstSpec").html('');
    					for(var i=0;i<dat.length;i++){
    						var html = '<dd class="condition-list first-list" attr-inventory="'+dat[i].inventory+'" attr-id="'+dat[i].id+'" attr-activity="'+dat[i].active+'"  attr-pic="'+dat[i].pic+'" attr-min="'+dat[i].min+'" attr-max="'+dat[i].max+'" attr-pic="'+dat[i].pic+'" attr-price="'+dat[i].price+'" ><span class="num">'+dat[i].name+'</span>';
    						$("#nowinventory").html(dat[i].inventory);
    						if(dat[i].active>0){
	  							if(dat[i].active==1){
	  								html+='<span class="tag">秒杀中</span>';
	  							}else{
	  								html+='<span class="tag">限时购</span>';
	  							}
	  						}
	  						html+='</dd>';
	  						$("#firstSpec").append(html);
    					}
    					$(".condition-list").eq(0).trigger("click");
    				}
    			});
        }
    </script>
</body>
</html>