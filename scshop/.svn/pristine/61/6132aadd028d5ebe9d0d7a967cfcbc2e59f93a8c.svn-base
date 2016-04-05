<#list list as coupon>
<dd class="coupon-item">
	<div class="cp-cont">
		<p class="cp-jz">优惠劵&nbsp;&yen;&nbsp;<strong>${coupon.money}</strong></p>
		<div class="cp-dpm">
			<a href='#' class="yhjlqbtn <#if coupon.leftnum lte 0>clicked</#if>" data-id="${coupon.id}"><#if coupon.leftnum lte 0>已领取完<#else>立即领取</#if></a>
		</div>
		<div class="cp-othsm">${coupon.name}</div>
	</div>
	<p class="cp-time"><#if coupon.endDate==stack.findValue("@com.wudianyi.wb.scshop.entity.Coupon@FOREVERY_TIME")>不限时间<#else>${coupon.endDate?number_to_datetime?string("yyyy-MM-dd HH:mm")}</#if></p>
</dd>
</#list>