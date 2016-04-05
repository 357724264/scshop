<#if list??>
    <tr>
        <th width="120">订单编号</th>
        <th width="80">订单金额</th>
        <th width="120">创建时间</th>
        <th width="80">订单类型</th>
        <th width="80">收货人</th>
		<th width="80">电话</th>
		<th width="80">支付方式</th>
		<th width="80">配送方式</th>
		<th width="80">订单状态</th>
		<th width="80">打印</th>
		<th width="80">操作</th>
    </tr>
<#list list as item>
    <tr>
		<td>${item.orderSn}</td>
		<td>${item.realmoney}</td>
		<td><#if item.createDate??>${item.createDate?number_to_datetime?string("yyyy/MM/dd HH:mm")}<#else>-</#if></td>
		<td><#if item.promotions==1>促销产品<#else>普通产品</#if></td>
		<td>${item.name}</td>
		<td>${item.phone}</td>
		<td>
			<#if item.paytype==0>
				微信支付
			</#if>
			<#if item.paytype==1>
				支付宝支付
			</#if>
			<#if item.paytype==2>
				银联支付
			</#if>		
		</td>
		<td><#if item.postCompany??>${item.postCompany}<#else>普通快递</#if></td>
		<td>
			<#if item.payStat == 0>
				未支付
			</#if>
			<#if item.payStat == 1>
				已支付
			</#if>
			<#if item.payStat == 2>
				已发货
			</#if>
			<#if item.payStat == 3>
				已确认
			</#if>
			<#if item.payStat == 4>
				交易完成
			</#if>
			<#if item.payStat == 5>
				取消
			</#if>
		</td>
		<td>
			<#if item.payStat != 0><a href="order!print.action?id=${item.id}"">打印订单</a></#if>
		</td>
		<td>
			<a href="order.action?id=${item.id}"><b class="menu_do menu_edit" title="编辑"></b></a>
			<#if permission==0><b data-id="${item.id}"  class="menu_do menu_del cancel_btn" title="取消订单"></b></#if>
		</td>
	</#list>
</#if>