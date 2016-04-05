<#list list as item>
<li <#if item.thein==0>style="color:red"<#else>style="color:green"</#if>>
	<h3 class="tit">
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
	</h3>
	<p class="time">${item.createdate?number_to_datetime?string("yyyy/MM/dd HH:mm")}</p>
	<span class="jfnumb"><#if item.thein lt 0>-</#if>${item.point}</span>
</li>
</#list>