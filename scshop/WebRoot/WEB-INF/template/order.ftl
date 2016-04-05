<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>订单详情</title>
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
		    <a class="button button-link button-nav pull-left external" href="order!list.action" data-transition='slide-out'>
		      	<span class="icon iconfont icon-xiangzuo2"></span>
		    </a>
	    	<h1 class="title">订单详情</h1>
	  	</header>

	  	<div class="content padd-content">
	  		<div class="odr-d-shr">
	  			<table>
	  				<tbody>
	  					<tr>
	  						<td rowspan="2" width="30px" class="dricon"><i class='iconfont icon-site'></i></td>
	  						<td width="62px">收件人:</td>
	  						<td>${order.name}&nbsp;&nbsp;&nbsp;&nbsp;${order.phone}</td>
	  					</tr>
	  					<tr>
	  						<td>收货地址:</td>
	  						<td>${order.address}</td>
	  					</tr>
	  				</tbody>
	  			</table>
	  		</div>

	  		<div class="ord-d-xx">
	  			<table>
	  				<tbody>
	  					<tr>
	  						<td width="62px">订单状态:</td>
	  						
	  						<td class="td2">
	  						<#if order.payStat==0>
	  						未支付
	  						</#if>
	  						<#if order.payStat==1>
	  						待发货
	  						</#if>
	  						<#if order.payStat==2>
	  						已发货
	  						</#if>
	  						<#if order.payStat==3>
	  						未评论
	  						</#if>
	  						<#if order.payStat==4>
	  						已评论
	  						</#if>
	  						</td>
	  					</tr>
	  					<tr>
	  						<td width="62px">订单编号:</td>
	  						<td class="td2">${order.orderSn}</td>
	  					</tr>
	  					<tr>
	  						<td width="62px">订单金额:</td>
	  						<td class="td2">${order.money}</td>
	  					</tr>
	  					<tr>
	  						<td width="62px">物流信息:</td>
	  						<td class="td2">
	  							<a href="order!checkExpressage.action?id=${order.id}" class="tdwlxx external">物流信息</a>
	  							<i class="iconfont icon-xiangyou1 wlxxright"></i>
	  						</td>
	  					</tr>
	  				</tbody>
	  			</table>
	  		</div>

	  		<div class="ord-d-cp">
		  		<div class="qrdd-odrbox">
		  			<div class="qrdd-pro-box">
		  				<#list list as item>
		  				<a class='qrdd-prolist external' href='product!details.action?id=${item.productid}'>
		  					<div class="qrdd-proimg">
		  						<img src="${item.pic}" />
		  					</div>
		  					<div class="qrdd-procont">
		  						<h5 class="qrdd-proname">${item.name}<#if item.model??>[${item.model}]</#if></h5>
		  						<div class="qrdd-proprice">&yen;&nbsp;${item.price}</div>
		  						<div>x${item.num}</div>
		  					</div>
		  				</a>
		  				</#list>
		  			</div>
		  		</div>
		  		<div class="ord-m-prc after">
			  		<table>
			  			<tbody>
			  				<tr>
			  					<td>商品合计</td>
			  					<td class="o-m-p-r">&yen;${order.money}</td>
			  				</tr>
			  				<tr>
			  					<td>物流运费</td>
			  					<td class="o-m-p-r">&yen;0.00</td>
			  				</tr>
			  				<tr>
			  					<td>积分抵扣</td>
			  					<td class="o-m-p-r">&yen;${order.pointMoney}</td>
			  				</tr>
			  			</tbody>
			  		</table>
			  	</div>
			  	<div class="ord-m-tol">
			  		<div class="o-d-m-total">应付总额<span>&nbsp;&yen;&nbsp;${order.realmoney}</span></div>
			  		<div class="o-d-m-btn">
			  			<#if order.payStat==0>
			  			<a href="#" onclick="cancel('${order.id}')">取消订单</a>
			  			</#if>
			  			<#if order.payStat==2>
			  			<a href="#"  onclick="sure('${order.id}')">确认收货</a>
			  			</#if>
			  			<#if order.payStat==3>
			  			<a class="external" href="order!comment.action?id=${order.id}">评论订单</a>
			  			</#if>
			  		</div>
			  	</div>
		  	</div>


	  	</div>	  	
	</div>
	
	<script type='text/javascript' src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>   
	<script type='text/javascript'>
	function cancel(id){
	$.confirm('确定取消订单吗？', function () {
		$.ajax({
		url:"json/order!cancel.action?id="+id,
		success:function(ret){
			var dat = eval("("+ret+")");
			if(dat.success){
				$.alert("订单取消成功");
				window.location.href="order!list.action";
			}
		}
	})
  });
}
function sure(id){
	$.confirm('确定已经收到商品了吗？', function () {
		$.ajax({
		url:"json/order!sure.action?id="+id,
		success:function(ret){
			var dat = eval("("+ret+")");
			if(dat.success){
				$.alert("确定收到货了");
				location.reload();
			}
		}
	})
  });
}
	</script>
</body>
</html>