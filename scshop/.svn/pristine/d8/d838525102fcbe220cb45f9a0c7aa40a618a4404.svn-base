<#list list as item>
<dd class='wdjf-mxlist' <#if item.thein==0>style="color:red"<#else>style="color:green"</#if>>
	<div class="wdjf-cont">
		<h5>
			<#if item.ptype==-1>
				消费支出
			</#if>
			<#if item.ptype==1>
				评论收入
			</#if>
			<#if item.ptype==2>
				   连续登陆${item.linkid!}天奖励
			</#if>
			<#if item.ptype==3>
				   系统赠送
			</#if>
			<#if item.ptype==-3>
				   系统扣减
			</#if>
		</h5>
		<p class="wdjf-jftime">${item.createdate?number_to_datetime?string("yyyy/MM/dd HH:mm")}</p>
	</div>
	<div class="wdjf-addjf"><#if item.thein lt 0>-</#if>${item.point}</div>
</dd>
</#list>