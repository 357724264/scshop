<#if list??>
    <tr>
        <th width="120">商品编号</th>
        <th width="80">商品名称</th>
        <th width="80">类型</th>
        <th width="80">出入库数量</th>
		<th width="80">当前库存</th>
		<th width="80">操作员</th>
		<th width="80">创建时间</th>
		<th width="80">备注</th>
		<th width="80">操作</th>
    </tr>
<#list list as item>
    <tr>
		<td>${item.sku}</td>
		<td>${item.productName}</td>
		<td><#if item.storageType==1>出库<#else>入库</#if></td>
		<#if item.storageType==1>
		<td style="color:red">-${item.decrement}</td>
		<#else>
		<td style="color:green">${item.increment}</td>
		</#if>
		<td>${item.surplus}</td>
		<td>${item.adminName}</td>
		<td><#if item.createDate??>${item.createDate?number_to_datetime?string("yyyy/MM/dd HH:mm")}<#else>-</#if></td>
		<td>${item.remark}</td>
		<td><a href="inventory!list.action?pid=${item.upproductid}" target="_blank">产品所有库存</a></td>
	<!--	
	<td>
			<b id="product_in" data-productid="${item.productid}" data-productName="${item.productName}" data-surplus="${item.surplus}" data-sku="${item.sku}" class="menu_do menu_edit" title="入库"></b>
			<b id="product_out" data-productid="${item.productid}" data-productName="${item.productName}" data-surplus="${item.surplus}" data-sku="${item.sku}" class="menu_do menu_edit" title="出库"></b>
		</td> -->
	</#list>
</#if>