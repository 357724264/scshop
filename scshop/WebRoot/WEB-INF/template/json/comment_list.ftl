<#list list as comment>
<dd class="yhpj-group">
	<div class="yhpj-avatar">
		<img src="${(comment.userPic)!}" />
	</div>
	<div class="yhpj-cont">
		<h5 class="yhpj-yhname">${(comment.userName)!}</h5>
		<p class="yhpj-lr">${comment.content}</p>
		<div class="yhpj-oth">
			<div class="yhpj-xingji" data-val='${comment.point*20}'></div>
			<span class="yhpj-time">${comment.createDate?number_to_datetime?string("yyyy/MM/dd HH:mm")}</span>
		</div>
	</div>
	<#if comment.reply??><p class="sjhf"><span class="sjhf-jt"></span>商家回复:${(comment.reply)!}</p></#if>
</dd>
</#list>