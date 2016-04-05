<#if ablist?? >

    <tr>
        <th width="100">申请编号</th>
        <th width="100">用户姓名</th>
        <th width="100">用户手机</th>
        <th width="120">申请时间</th>
		<th width="130">审核时间</th>
		<th width="120">申请状态</th>
		<th width="80">操作</th>
    </tr>

	<#list ablist as item>
    	<tr>
			<td>${item.id}</td>
			<td>${item.name}</td>
			<td>${item.phone}</td>
			<td><#if item.createDate??>${item.createDate?number_to_datetime?string("yyyy/MM/dd HH:mm")}<#else>-</#if></td>
			<td><#if item.modifyDate??>${item.modifyDate?number_to_datetime?string("yyyy/MM/dd HH:mm")}<#else>-</#if></td>
			<td>
				<#if item.applystate==1>
					[审核通过]<br/> <#if item.agentname??>[${item.agentname}]</#if>
				</#if>
				<#if item.applystate==-1>
					[审核不通过]
				</#if>
				<#if item.applystate==0>
					[待审核]
				</#if>
				<#if item.applystate==null>
					[待审核]
				</#if>
			</td>
			<td>

					<a href="agentbill.action?id=${item.id}"><b class="menu_do menu_edit" title="编辑"></b></a>

			</td>
		</tr>

	</#list>

<#else>
<tr><p>暂无信息</p></tr>
</#if>
