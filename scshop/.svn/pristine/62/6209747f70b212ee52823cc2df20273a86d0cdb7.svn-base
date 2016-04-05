<#list list as coupon>
<dd class="coupon-item">
	<div class="cp-cont">
		<p class="cp-jz">优惠劵&nbsp;&yen;&nbsp;<strong>${coupon.money}</strong></p>
		<div class="cp-dpm">
			<p class="cp-dp-name"><#if coupon.tt==0>${coupon.shopname}<#else>全场可用</#if></p>
			<p>满${coupon.limitmoney}可用</p>
		</div>
		<div class="cp-othsm">${coupon.title}</div>
	</div>
	<p class="cp-time"><#if coupon.stat==1>${coupon.createDate?number_to_datetime?string("yyyy-MM-dd HH:mm")}<#else>${coupon.endDate?number_to_datetime?string("yyyy-MM-dd HH:mm")}</#if></p>
</dd>
</#list>