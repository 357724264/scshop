<#if list??&&(list?size gt 0)>
<#list list as product>
<dd class="spsch-group">
	<a class="external" href="javascript:;" data-id="${product.id}">
		<div class="s-img">
			<img src="${product.cover}" />
		</div>
		<h5 class="s-tit">${product.name}</h5>
		
		<div class='s-pricebox'>
			&yen;&nbsp;${product.bottomPrice}&nbsp;<s>&yen;${product.indicativePrice}</s><!-- <span class="s-price-dis">5.0折</span> -->
		</div>
		<#if product.hotSale==1>
		<span class="s-temai">特卖</span>
		</#if>
		<div class='s-nationality'>
			<div class='guoqi'>
				<img src="${product.countryIcon}" />
			</div>
			<div class="guoji-name">${product.country}</div>
		</div>
	</a>
</dd>
</#list>
</#if>