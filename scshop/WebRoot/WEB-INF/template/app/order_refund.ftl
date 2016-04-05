<#list list as order>
<dd >
	<div class="qrdd-odrbox">
		<div class="qrdd-dpame">
			<span class="ord-state">
				<#if order.payStat==1>
					待发货
				</#if>
				<#if order.payStat==2>
					已发货
				</#if>
				<#if order.payStat==6>
					退款中
				</#if>
				<#if order.payStat==7>
					已退款
				</#if>
			</span>
			<div class="ordo-s-b">${order.createDate?number_to_datetime?string("yyyy-MM-dd HH:mm:ss")}</div>
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
		<#if order.payStat==2 || order.payStat==1>
		<a class="external" href="#" onclick="openWinWithParam('refund_apply',{'orderid':'${order.id}','total':'${order.realmoney}'})" >申请退款</a>
		</#if>
		<#if order.payStat==6>
		<a class="external" href="#" onclick="openWinWithParam('refund_edit',{'orderid':'${order.id}','total':'${order.realmoney}'})">修改退款信息</a>
		</#if>
	</div>
</dd>
</#list>	  					