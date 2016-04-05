<tr>
						<th width="40">序号</th>
			        	<th width="140">商品名称</th>
			        	<th width="100">促销类型</th>
			       		<th width="100">申请时间</th>
			        	<th width="100">审核时间</th>
			        	<th width="75">状态</th>
						<th width="100">操作</th>
    				</tr>

<#if list??>
<#list list as item>
		<tr>
			<td>${item_index+1}</td>
			<td>${item.productName}</td>
			<td><#if item.productType==1>秒杀</#if><#if item.productType==2>限时购</#if></td>
			<td><#if item.createTime??>${item.createTime?number_to_datetime?string("yyyy/MM/dd HH:mm")}<#else>-</#if></td>
			<td><#if item.auditTime??>${item.auditTime?number_to_datetime?string("yyyy/MM/dd HH:mm")}<#else>-</#if></td>
			<td><#if item.stat==-1>不通过</#if><#if item.stat==0>未审核</#if><#if item.stat==1>通过</#if><#if item.stat==2>已取消</#if></td>
			<td>
				<a href="seckill!detail.action?id=${item.id}"><b class="menu_do menu_edit" title="查看"></b></a>
			</td>
		</tr>
</#list>	
</#if>