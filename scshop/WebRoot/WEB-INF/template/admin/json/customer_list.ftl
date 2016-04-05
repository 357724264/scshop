<#assign admins = adminScshop />
<#assign functionitems=admins.functionitems />
    <tr>
        <th width="100">用户ID</th>
        <th width="120">用户名字</th>
        <th width="120">注册时间</th>
        <th width="120">用户电话</th>
        <th width="120">积分余额</th>
		<th width="150">备注</th>
		<th width="130">操作</th>
	</tr>
	<#if list??>
		<#list list as item>
			<tr>
				<td>${item.id}</td>
				<td>${item.name}</td>
				<td><#if item.createDate??>${item.createDate?string("yyyy-MM-dd")}<#else>-</#if></td>
				<td>${item.phone}</td>
				<td id="point_${item.id}">${item.point}</td>
				<td>${item.usernote}</td>
				<#if functionitems?index_of(",useredit,") gte 0>
					<td>
						<a href="customer.action?id=${item.id}" target="_blank"><b class="menu_do menu_edit edit menu_chakan" title="查看"></b></a>&nbsp
						<b data-id="${item.id}"  class="menu_do menu_jf reply_btn" title="加减积分"></b>
						<b data-id="${item.id}"  class="menu_do menu_xiaoxituisong push_btn" title="推送"></b>
					</td>
				<#else>
					<td>无权限</td>
				</#if>
			</tr>
		</#list>
	</#if>