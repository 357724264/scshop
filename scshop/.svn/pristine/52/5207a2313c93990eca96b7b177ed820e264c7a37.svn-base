<#list list as order>
<dd >
	<div class="qrdd-odrbox">
		<div class="qrdd-dpame">
			<span class="ord-state">
				<#if order.payStat==0>
					未支付
				</#if>
				<#if order.payStat==1>
					待发货
				</#if>
				<#if order.payStat==2>
					已发货
				</#if>
				<#if order.payStat==3>
					已收货
				</#if>
				<#if order.payStat==4>
					已评论
				</#if>
			</span>
			<div class="ordo-s-b <#if order.payStat==0>countdown" data-start="${.now?string("yyyy-MM-dd HH:mm:ss")}" data-end="${order.statOverdueTime?number_to_datetime?string("yyyy/MM/dd HH:mm")}</#if>">${order.createDate?number_to_datetime?string("yyyy-MM-dd HH:mm:ss")}</div>
		</div>
		<div class="qrdd-pro-box">
			<#assign num=0 />
			<#list order.orderItems as item>
			<#assign num = num+1 />
			<a href="order.action?id=${order.id}" class='external qrdd-prolist'>
				<div class="qrdd-proimg">
					<img src="${item.pic}" />
				</div>
				<div class="qrdd-procont">
					<h5 class="qrdd-proname">${item.name}</h5>
					<div class="qrdd-proprice">&yen;&nbsp;${item.price}</div>
					<div>x${item.num}</div>
				</div>
			</a>
			</#list>
		</div>
	</div>
	<div class="ord-price">
		<div class="ord-p-1">使用${order.point}积分(抵扣${order.pointMoney}元)</div>
		<div class="ord-p-1">
			共${num}件&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;实付<span>&nbsp;&yen;&nbsp;${order.realmoney}<#if order.promotions??&&order.promotions==1>(含运费:&yen;${order.postage})</#if></span>
		</div>
	</div>
	<div class="ord-btnbox">
		<#if order.payStat==2>
		<a href="#" id="sureBtn" data-id="${order.id}">确认收货</a>
		<a class="external" href="order!checkExpressage.action?id=${order.id}" >查看物流</a>
		</#if>
		<#if order.payStat==0>			  			
		<a href="#" id="cancelBtn" class="cancelorder" data-id="${order.id}">取消订单</a>
		<a  class="external" data-id="${order.id}" id="topayBtn">去支付</a>
		</#if>	
		<#if order.payStat==3>			  			
		<a class="external" href="order!comment.action?id=${order.id}">订单评论</a>
		</#if>					  			
	</div>
</dd>
</#list>	  					