<#assign admins = adminScshop />
<#assign functionitems=admins.functionitems />
<tr>
	<th width="40">序号</th>
	<th width="100">企业名称</th>
	<th width="100">店铺名称</th>
	<th width="100">申请时间</th>
	<th width="100">申请人手机</th>
	<th width="75">是否通过</th>
	<th width="100">审核人</th>
	<th width="100">操作</th>
</tr>
       <#list list as item>
	<tr>
		<td>${item_index+1}</td>
		<td>${item.companyname}</td>
		<td>${item.shopName}</td>
		<td><#if item.createTime??>${item.createTime?number_to_datetime?string("yyyy-MM-dd HH:mm")}<#else>-</#if></td>
		<td>${item.phone}</td>
		<td><#if item.stat==0>未审核</#if><#if item.stat==1>通过</#if><#if item.stat==-1>不通过</#if></td>
		<td>${item.assessor}</td>
		<td>
			<#if functionitems?index_of(",shopedit,") gte 0>
				
					<a href="shop_form!detail.action?id=${item.id}"><b class="menu_do menu_edit" title="审核"></b></a>
				
			<#else>
				无权限
			</#if>
		</td>
	</tr>
</#list>