<#if list??&&(list?size gt 0)>
	<#list list as product>
		<dd>
			<a href="#" onclick="openWin('product_details','${product.id}')">
				<div class="ms-img">
					<img src="${product.cover}"> <!-- 260*170 -->
				</div>
				<div class="ms-cont">
					<div class="ms-gj">
						<img src="${product.countryIcon}" />
						<span>${product.country}</span>
					</div>
					<h3 class="ms-sp-tit">${product.name}</h3>
					<p class="ms-price">&yen;&nbsp;<strong>${product.seckillBottomPrice}</strong><span>国内参考价:&yen;${product.indicativePrice}</span></p>
					<p><span>活动邮费：&yen;${product.postage}&nbsp;&nbsp;</span><span>活动数量：${product.seckillnum}</span></p>
					<#if pt==0 && (product.beginTime lt .now?long)>
						<div class="ms-djs countdown">秒杀正在进行中!</div>					
					<#else>
						<div class="ms-djs countdown" data-start='${product.beginTime?number_to_datetime?string("yyyy/MM/dd HH:mm:ss")}' data-end='<#if product.productType==2>${product.endTime?number_to_datetime?string("yyyy/MM/dd HH:mm:ss")}</#if>'></div>
					</#if>
				</div>
			</a>
		</dd>
	</#list>
<#else>
	<#if pn lte 1>
	<#if pt=0><!--若无秒杀产品-->
		<#if state==0>
			<div class="emptybox">
				<i class="iconfont icon-emptyshoppingbag"></i>
				<span>暂无秒杀进行中，请等待预告</span>
				<a href="#" onclick="openWin('product_list','')">去商场看看</a>
			</div>
		</#if>
		<#if state==1>
			<div class="emptybox">
				<i class="iconfont icon-emptyshoppingbag"></i>
				<span>商家将不定期举行活动，敬请期待</span>
				<a href="#" onclick="openWin('product_list','')">去商场看看</a>
			</div>
		</#if>
	</#if>
	<#if pt=1><!--若无限时购产品-->
		<#if state==0>
			<div class="emptybox">
				<i class="iconfont icon-emptyshoppingbag"></i>
				<span>暂无限时购进行中，请等待预告</span>
				<a href="#" onclick="openWin('product_list','');">去商场看看</a>
			</div>
		</#if>
		<#if state==1>
			<div class="emptybox">
				<i class="iconfont icon-emptyshoppingbag"></i>
				<span>商家将不定期举行活动，敬请期待</span>
				<a href="#" onclick="openWin('product_list','')">去商场看看</a>
			</div>
		</#if>
	</#if>
	</#if>	
</#if>