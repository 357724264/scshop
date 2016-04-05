<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>确认订单</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link rel="stylesheet" href="http://g.alicdn.com/msui/sm/0.5.6/css/sm.min.css">
<link rel="stylesheet" href="http://g.alicdn.com/msui/sm/0.5.6/css/sm-extend.min.css">
<link rel="stylesheet" href="http://g.alicdn.com/msui/sm/0.5.6/css/sm-extend.min.css">
<link rel="stylesheet" href="${base}/static/fonts/iconfont.css">
<link rel="stylesheet" href="${base}/static/css/myapp.css">
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript" src="http://mp.weixin.qq.com/debug/zh_CN/htmledition/js/jsapisign/sha121d415.js"></script>
<script>
	var jsapi_ticket = '${tick}';
	var appId = '${info.appid}'; 
	var timestamp = '1';
	var nonceStr = '5K8264ILTKCH16CQ2502SI8ZNMTM67VS';
	var theUrl = document.URL;
	var string1 = 'jsapi_ticket=' + jsapi_ticket + '&noncestr=' + nonceStr + '&timestamp=' + timestamp + '&url=' + theUrl; 
	var signature = new jsSHA(string1,"TEXT"); //签名算法
		signature = signature.getHash("SHA-1","HEX");
	var jsApiList = ['chooseWXPay'];
	//通过config接口注入权限验证配置
	wx.config({
	    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	    appId: appId, // 必填，公众号的唯一标识
	    timestamp: timestamp, // 必填，生成签名的时间戳
	    nonceStr: nonceStr, // 必填，生成签名的随机串
	    signature: signature, // 必填，签名，见附录1
	    jsApiList: jsApiList // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
	});
	
		function wxpay(preid,paySign){
			wx.chooseWXPay({
				appId: appId,
			    timestamp: '1', // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
			    nonceStr: '5K8264ILTKCH16CQ2502SI8ZNMTM67VS', // 支付签名随机串，不长于 32 位
			    package: 'prepay_id='+preid, // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
			    signType: 'MD5', // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
			    paySign: paySign, // 支付签名
			    success: function (res) {
			    		window.location.href="order.action?id=${id}";
			    },
			    fail:function(res){
			    	alert("支付失败");
			    },
			    cancel:function(res){
			    	alert("用户取消订单");
			    }
			});
			
		}
	</script>
</head>
<body>
	<div class="page">
	  	<header class="bar bar-nav" id="second-bar">
		    <a class="button button-link button-nav pull-left external" href="cart.action" data-transition='slide-out'>
		      	<span class="icon iconfont icon-xiangzuo2"></span>
		    </a>
	    	<h1 class="title">确认订单</h1>
	  	</header>

	  	<nav class="bar bar-tab" id="shop-cartnav">
			<div class="shop-jiesuanobox p-o-js">
				<div class="shop-price-total">
					实付款&nbsp;:&nbsp;<span>&yen;&nbsp;<font id="allcount">${order.realmoney}</font>(含${order.postage}邮费)</span>
				</div>
				<a href="#" class="shop-settleaccounts">去支付</a>
			</div>
		</nav>

	  	<div class="content padd-content">
	  		<div class="qrdd-addrbox">
	  			<a href="address!list.action?oid=${order.id}" class="external">
	  				<div class="qrdd-addrcont">
	  					<#if order.address??><span class="qrdd-addr-mr" data-aid="${order.addressid}"></span>${order.address}<br/>${order.name} ${order.phone}<#else>去添加一个地址</#if>
	  				</div>
	  				
	  				<div class="qrdd-jt"><i class="iconfont icon-xiangyou1"></i></div>
	  			</a>
	  		</div>

	  		<div class="qrdd-odrbox">
	  			<div class="qrdd-dpame">${order.shopname}</div>
	  			<dl class="qrdd-pro-box">
	  				<#list list as item>
	  				<dd class='qrdd-prolist'>
	  					<div class="qrdd-proimg">
	  						<img src="${item.pic}" />
	  					</div>
	  					<div class="qrdd-procont">
	  						<h5 class="qrdd-proname">${item.name}</h5>
	  						<div class="qrdd-proprice">&yen;&nbsp;${item.price}</div>
	  						<div>x${item.num}</div>
	  					</div>
	  				</dd>
	  				</#list>
	  			</dl>
	  		</div>

	  		<div class="po-mjlybox">
	  			<a href="#" class="open-about">
		  			<span class="pm-tit">买家留言</span>
		  			<div class="pm-cont" id="lcontent">${order.leavemessage}</div>
		  			<div class='pm-jt'>
		  				<i class="iconfont icon-xiangyou1"></i>
		  			</div>
		  		</a>
	  		</div>
	  		<div class="po-mjlybox">
	  			<a href="#">
		  			<span class="pm-tit">订单号</span>
		  			<div class="pm-cont">${order.orderSn}</div>
		  			<div class='pm-jt'>
		  				
		  			</div>
		  		</a>
	  		</div>
	  		<div class="p-yhbox">
	  			<input type="hidden" id="couponid" value=""/>
	  			<#if order.promotions??&&order.promotions==1>
	  			<#else>
	  			<div class='p-yh-list'>
	  				<label><!-- class="clicked" -->
		  				<div class="p-yh-icon">
		  					<i class="iconfont icon-wodeqiajuan"></i>
		  				</div>
		  				<div class="p-yh-cont">
		  					<h5 class="p-yh-c-tit">使用优惠券</h5>
		  					<span class="p-yh-c-smal" id="yhinfo">可用优惠券<#if !coupons??>0<#else>${coupons?size}</#if>张</span>
		  				</div>
		  				<p>
		  					<input type="checkbox" class="p-yh-ipt yhjipt" id="useyh" />
		  					<i class="iconfont icon-duigou yhicon"></i>
	  					</p>
		  			</label>
	  			</div>
	  			
	  			
	  			<div class='p-yh-list'>
	  				<label>
		  				<div class="p-yh-icon p-yh-jficon">
		  					<i class="iconfont icon-jifen5"></i>
		  				</div>
		  				<div class="p-yh-cont">
		  					<h5 class="p-yh-c-tit">使用积分</h5>
		  					<#assign canuser = true />
		  					<#if info.pointperyuan lt 1>
		  					<#assign canuser = false />
		  					<span class="p-yh-c-smal">积分不可用</span>
		  					<#else>
		  						<#if user.point lt 1>
		  						<#assign canuser = false />
		  						</#if>
		  					<span class="p-yh-c-smal">可用积分${user.point},抵扣&yen;&nbsp;${user.point/info.pointperyuan}</span>
		  					</#if>
		  				</div>
		  				<p>
			  				<input type="checkbox" class="p-yh-ipt" id="usepoint" <#if !canuser>disabled="disabled"</#if>  />
		  					<i class="iconfont icon-duigou yhicon"></i>
		  				</p>
		  				<!--<div class="p-yh-check">
		  					<input type="checkbox" id="usepoint" <#if !canuser>disabled="disabled"</#if>  class="p-yh-ipt"/>
		  					<i class="iconfont icon-duigou"></i>
		  				</div>-->
		  			</label>
	  			</div>
	  			</#if>
	  		</div>

	  		<div class="p-zfwaybox">
	  			<h5 class="p-zfw-tit">选择支付方式</h5>
	  			<div class="p-zfwlist">
	  				<#if weixinid??>
	  				<label>
	  					<i class="iconfont icon-weixin"></i>&nbsp;&nbsp;&nbsp;微信支付
	  					<div class="p-zfwcheck">
	  						<input name="zffs" type="radio" checked="checked" class="pt" data-type="wx" />
	  						<i class="iconfont icon-duigou"></i>
	  					</div>
	  				</label>
	  				</#if>
	  				
	  				<label>
	  					<i class="p-zfyl"></i>&nbsp;&nbsp;&nbsp;银联支付
	  					<div class="p-zfwcheck">
	  						<input name="zffs" type="radio"  class="pt" data-type="unionpay" <#if !weixinid??>checked="checked"</#if> />
	  						<i class="iconfont icon-duigou"></i>
	  					</div>
	  				</label>
	  			</div>
	  		</div>
	  	</div>	  	
	</div>
	<div class="yhj-xzbox">
		<div class="yhj-xzarea">
			<h3 class="box-tit">选择优惠劵</h3>
			<#list coupons as coupon>
			<label class="yhj-xz-lb" data-id="${coupon.id}">
				<strong>&yen;<font id="money${coupon.id}">${coupon.money}</font></strong>
				<div class="yhj-xz-sysm">
					<span id="title${coupon.id}">${coupon.title}</span>
					<span>有效期:<#if coupon.endDate==stack.findValue("@com.wudianyi.wb.scshop.entity.Coupon@getValue('FOREVERY_TIME')")>无限期<#else>${coupon.endDate?number_to_datetime?string("yyyy/MM/dd HH:mm:ss")}</#if></span>
				</div>
				<input type="radio" name="yhjxz" class="yhjxzinpt">
				<i class="iconfont icon-duigou xzicon"></i>
			</label>
			</#list>
			<div class="xzbtnbox">
				<a href="#" class="cancelbtn">取消</a>
				<a href="#" class="surebtn">确定</a>
			</div>
		</div>
	</div>

	<div class="popup popup-about popupbox" data-toggle="scroller">
	  	<div class="sp-d-popuparea">
	  		<div class="p-o-sjlr">
	  			<textarea id="mjly-text">${order.leavemessage}</textarea>
	  		</div>

	  		<a class="close-popup sp-d-p-close" href="#"><i class="iconfont icon-duigou1"></i></a>
	  	</div>
	</div>
	
	<script type='text/javascript' src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>
    <script type="text/javascript">
    	var defaultyhjinfo = $("#yhinfo").html();
    	var point = ${user.point};
    	var hl = ${info.pointperyuan};
    	var paymoney = ${order.realmoney};
    	function themoney(){
    		var aftermoney = paymoney;
			if($("#usepoint").is(":checked")){
				aftermoney = aftermoney * 1 - point/hl;
			}
			if($("#useyh").is(":checked")){
				var yhjxzinpts = $(".yhjxzinpt");
				for(var i=0;i<yhjxzinpts.length;i++){
					if($(yhjxzinpts[i]).is(":checked")){
						var yhid = $(yhjxzinpts[i]).parent().attr("data-id");
						var yhmoney = $("#money"+yhid).html();
						aftermoney = aftermoney * 1 - yhmoney*1;
						$("#couponid").val(yhid);
					}
				}
			}
			if(aftermoney < 0){
				aftermoney = 0;
			}
			$("#allcount").html(aftermoney.toFixed(2));
    	}
    	
    	$(function(){
    		$("#usepoint").bind("change",function(){
	    		if(point<1){
						return false;
				}
				themoney();
	    	})
		});
    	//弹出条件选择
            $(document).on('click','.open-about', function () {
			  	$.popup('.popup-about');
			  	$('.popup-overlay').addClass('close-popup');//点击透明层关闭,不是必须
			});

			$(document).on('change','#mjly-text',function(){
				var text=$('#mjly-text').val();
				$('#lcontent').html(text);
			});
			
			$(document).on('click','.shop-settleaccounts',function(){
				if($(this).hasClass("clicked")){
					return false;
				}
				if($(".qrdd-addr-mr").length<1){
					$.alert("请选择一个地址");
					return false;
				}
				$(this).addClass("clicked");
				var aid = $(".qrdd-addr-mr").attr("data-aid");
				var message = $("#lcontent").html();
				var usepoint = 0;
				if($("#usepoint").is(":checked")){
					usepoint = 1;
				}
				var pts = $("input[name='zffs']");
				
				for(var i=0;i<pts.length;i++){
					if($(pts[i]).is(":checked")){
						pt = $(pts[i]).attr("data-type");
					}
				} 
				var couponid = $("#couponid").val();
				$.ajax({
					url:"json/pay.action",
					data:{aid:aid,message:message,usepoint:usepoint,id:"${id}",pt:pt,couponid:couponid},
					type:"post",
					success:function(ret){
						var dat = eval("("+ret+")");
							if(dat.success){
								if(dat.ok==1){
									window.location.href="order.action?id="+dat.oid;	
								}else{//如果不是全部积分
									if(pt=="wx"){
										wxpay(dat.preid,dat.paySign);
									}else{
										window.location.href=dat.url;
									}
									
								}
							}else{
								alert(dat.msg)
							}
						}
				})
			});
			window.setTimeout(function(){
				window.setInterval(checkchange, 30000); 
			},15000); 
			
			var modifytime=${order.edittime!0};
			var nowmoney = ${order.realmoney!0.00};
			function checkchange() 
			{ 
				$.ajax({
					url:"json/order!checkchange.action",
					data:{id:"${order.id}"},
					type:"post",
					success:function(html){
						var dat = eval("("+html+")");
						if(dat.edittime!=null){
							if(dat.edittime >modifytime){
								modifytime = dat.edittime;
								$.alert("价格已经被管理员修改过，请按照新的价格付款");
								$("#allcount").html(dat.money+"&nbsp;&nbsp;<del>"+nowmoney+"</del>");
							}
						}
					}
				})
			} 	
			$(document).on('click','.yhjipt',function(){
				var _this=$(this);
				if(_this.is(':checked')){
					$('.yhj-xzbox').css({display:'block'});
					$('.popup-overlay').addClass('modal-overlay-visible');
				}else{
					$("#couponid").val("");
					$('.yhj-xzbox').css({display:'none'});
					$("#yhinfo").html(defaultyhjinfo);
					$('.popup-overlay').removeClass('modal-overlay-visible');
				}
				themoney();
			});
			$(document).on('click','.cancelbtn',function(){
				$('.yhjipt').prop('checked',false);
				$('.yhj-xzbox').css({display:'none'});
				$('.popup-overlay').removeClass('modal-overlay-visible');
			});
			$(document).on('click','.surebtn',function(){
				$('.yhjipt').prop('checked',true);
				$('.yhj-xzbox').css({display:'none'});
				$('.popup-overlay').removeClass('modal-overlay-visible');
				themoney();
			});
			$(document).on('click','.cancelbtn',function(){
				$('.yhjipt').prop('checked',false);
				$('.yhj-xzbox').css({display:'none'});
				$('.popup-overlay').removeClass('modal-overlay-visible');
				themoney();
			});
			
			$(document).on('click','.yhj-xz-lb',function(){
				var id = $(this).attr("data-id");
				var money = $("#money"+id).html();
				var title = $("#title"+id).html();
				$("#couponid").val(id);
				$(".yhjxzinpt").prop('checked',false);
				$('.yhjipt').prop('checked',true);
				$(this).find(".yhjxzinpt").prop('checked',true);
				$("#yhinfo").html(title+"[抵"+money+"元]");
				$('.yhj-xzbox').css({display:'none'});
				$('.popup-overlay').removeClass('modal-overlay-visible');
				themoney();
			});
			if($(".yhj-xz-lb").eq(0).length>0){
				$(".yhj-xz-lb").eq(0).trigger("click");
			}
			
    </script>  
</body>
</html>