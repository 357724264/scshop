<tr>
						<th width="40">序号</th>
			        	<th width="140">用户ID</th>
			        	<th width="100">手机号码</th>
			        	<th width="100">退款金额</th>
		        	 	<th width="100">实付金额</th>
	        	 	 	<th width="100">消费积分</th>
			        	<th width="100">退款理由</th>
			        	<th width="100">操作人</th>
			        	<th width="100">退款途径</th>
			        	<th width="75">状态</th>
			        	<th width="100">申请时间</th>
						<th width="100">操作</th>
    				</tr>

<#if list??>
<#list list as item>
		<tr>
			<td>${item_index+1}</td>
			<td>${item.userid}</td>
			<td>${item.phone}</td>
			<td>${item.total}</td>
			<td>${item.realMoney}</td>
			<td>${item.point}</td>
			<td>${item.reason!}</td>
			<td>${item.operator!}</td>
			<td>
                 <#if item.refundWay== 0>
			              微信钱包
			     <#elseif item.refundWay== 1>
			             银行卡
			     </#if>
			     </td>
			<td>  <#if item.refundStatus== "apply">
			              申请中
			     <#elseif item.refundStatus== "returning">
			             退款中
			     <#elseif item.refundStatus== "refuse">
			              拒绝
			     <#elseif item.refundStatus== "success">
			              成功
			     </#if>
		    </td>
	    	<td>${item.createDate?number_to_datetime?string("yyyy/MM/dd HH:mm")}</td>
			<td>
				<a href="refund!detail.action?id=${item.id}"><b class="menu_do menu_edit" title="查看"></b></a>
			</td>
		</tr>
</#list>	
</#if>