<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title> 卖疯了 - 订单打印</title>
<meta name="author" content="SHOP++ Team">
<meta name="copyright" content="SHOP++">

<script type="text/javascript" src="${base}/static/js/jquery-1.8.2.min.js"></script>

<style type="text/css">
.bar {
	height: 30px;
	line-height: 30px;
	border-bottom: 1px solid #d7e8f8;
	background-color: #eff7ff;
}
.dylogo{height:45px; width:auto;}
table {
	width: 100%;
}

table th {
	font-weight: bold;
	text-align: left;
}

table td, table th {
	line-height: 30px;
	padding: 0px 4px;
	font-size: 10pt;
	color: #000000;
}

.separated th, .separated td {
	border-top: 1px solid #000000;
	border-bottom: 1px solid #000000;
}
a.button{
    height: 26px;
    line-height: 26px;
    display: inline-block;
    padding: 0px 16px;
    margin-right: 6px;
    color: #666666;
    vertical-align: middle;
    text-shadow: 1px 1px #ffffff;
    -webkit-box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075);
    -moz-box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075);
    box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075);
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    -o-user-select: none;
    user-select: none;
    white-space: nowrap;
    outline: none;
    blr: expression(this.hideFocus = true);
    border: 1px solid #b7c8d9;
    background: url(${base}/static/images/common.gif) 0px 0px repeat-x;
    text-decoration:none;
}
</style>
<style type="text/css" media="print">
.bar {
	display: none;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $print = $("#print");
	
	$print.click(function() {
		window.print();
		return false;
	});

});
</script>
</head>
<body>
	<div class="bar">
		<a href="javascript:;" id="print" class="button">打 印</a>
	</div>
	<div class="content">
		<table cellspacing="0" cellpadding="0">
			<tbody><tr>
				<td colspan="2" rowspan="2">
					<img src="${shop.logo}" class="dylogo"  alt="卖疯乐商城">
				</td>
				<td>
					店铺名称：<#if order.shopname??>${order.shopname}</#if>
				</td>
				<td>
					&nbsp;
				</td>
				<td colspan="2">
					收货人: ${order.name}
				</td>
			</tr>
			<tr>
				<td>
					http://m.123mfl.com/
				</td>
				<td>
					&nbsp;
				</td>
				<td colspan="2">
					会员: <#if order.name??>${order.name}</#if>
				</td>
			</tr>
			<tr class="separated">
				<th colspan="2">
					订单编号: <#if order.orderSn??>${order.orderSn}</#if>
				</th>
				<th colspan="2">
					创建日期: <#if order.createDate??>${order.createDate?number_to_datetime?string("yyyy/MM/dd")}<#else>-</#if>
				</th>
				<th colspan="2">
					打印日期: <#if date??>${date?number_to_datetime?string("yyyy/MM/dd")}<#else>-</#if>
				</th>
			</tr>
			<tr class="separated">
				<th>
					序号
				</th>
				<th>
					商品编号
				</th>
				<th>
					商品名称
				</th>
				<th>
					商品价格
				</th>
				<th>
					商品数量
				</th>
				<th>
					小计
				</th>
			</tr>
			<#if items??>
			<#list items as item>
				<tr>
					<td>
						${item_index+1}
					</td>
					<td>
						<#if item.sku??>${item.sku}</#if>
					</td>
					<td>
						<#if item.name??>${item.name}</#if>
							<span class="silver"><#if item.model??>${item.model}</#if></span>
					</td>
					<td>
							￥<#if item.price??>${item.price}<#else>0</#if>
					</td>
					<td>
							<#if item.num??>${item.num}</#if>
					</td>
					<td>
							￥<#if item.price??>${item.price}<#else>0</#if>
					</td>
				</tr>
			</#list>
			</#if>
			<tr class="separated">
				<td colspan="3">
					附言: ${order.leavemessage}
				</td>
				<td colspan="3">
						支付方式: 
									<#if order.paytype==0>微信支付</#if>
									<#if order.paytype==1>支付宝支付</#if>
									<#if order.paytype==2>银联支付</#if><br>
						配送方式: ${order.postCompany}<br>
						商品价格: ￥${order.money}<br>
						订单金额: ￥${order.realmoney}
				</td>
			</tr>
				<tr class="separated">
					<td colspan="3">
						&nbsp;
					</td>
					<td colspan="3">
						收货人: ${order.name}<br>
						地址: ${order.address}<br>
						电话: ${order.phone}
					</td>
				</tr>
			<tr>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
				<td colspan="2">
				
				</td>
			</tr>
		</tbody>
		</table>
	</div>
	<script type="text/javascript">		
		$().ready(function() {

			var $print = $("#print");
			
			$print.click(function() {
				window.print();
				return false;
			});

		});

	</script>

</body>
</html>