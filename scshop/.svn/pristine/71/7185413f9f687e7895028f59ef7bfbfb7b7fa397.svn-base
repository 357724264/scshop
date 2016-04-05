<#include "/WEB-INF/template/admin/header.ftl" />
	<style type="text/css">
		.dialog{border:1px solid #ddd;}
		.odul{height:100%;}
		.odul li{position:relative;}
		.odul:after{clear: both; content: ""; display:block;}
		.dia_btn{width:110px;}
		#xgje{position:absolute; top:0; right:0; line-height:30px; background-color:#1fa761; padding:0 5px; color:#fff;}
	</style>
	
	<!-- 板块独有内容 -->
	<script>
	$("#scdd").addClass("on");
	</script>
	<div class="zxbody" style="position:relative;">
	
		<div class="zxbody_title">
		订单信息
		<#if order.payStat == 1><a href="javascript:;" class="zxbody_tright zxbody_cash" id="kdinput">填写快递信息并发货</a></#if>
		<#if order.payStat == 2><a href="javascript:;" class="zxbody_tright zxbody_cash" id="kdinput">修改快递信息</a></#if>
		</div>
		<div class="tui_total">
			<ul class="odul">
				<li class="hasborder">
					<h1>${order.orderSn}</h1>
					<p>订单编号</p>
				</li>
				<li class="hasborder">
					<h1>${order.realmoney}元</h1>
					<p>订单金额(含${order.postage}元邮费)
							<#if order.edittime gt 0>(已修改${order.edittime}次)</#if></p>
					<#if order.payStat == 0>
						<a href="javascript:;" id="xgje">
							<span >修改金额</span>
						</a>
					</#if>
				</li>
				<li>
					<h1>
					<#if order.payStat == 0>
					未支付
					</#if>
					<#if order.payStat == 1>
					已支付
					</#if>
					<#if order.payStat == 2>
					已发货
					</#if>
					<#if order.payStat == 3>
					已确认
					</#if>
					<#if order.payStat == 4>
					交易完成
					</#if>
					</h1>
					<p>订单状态</p>
				</li>
			</ul>
		</div>
		<div class="zxbody_intro" style="margin:10px 0">
			<p>收货地址:${order.address}</p>
			<p>收件人信息:${order.name}&nbsp;${order.phone}&nbsp;<#if order.identity??>身份证号:${(order.identity)!}</#if></P>
			<p>买家留言:${(order.leavemessage)!}</P>
			<p>物流信息:</p>	<ul class="storey">
	  				<#if resultList??&&(resultList?size gt 0)>
	  				<#list resultList as item>
	  				<li <#if item_index==0>class="on"</#if>>
	  					<i class="iconfont icon-yuandian2"></i>
	  					<div class="wlinfo">${item.context}</div>
	  					<span class="wltime">${item.time}</span>
	  				</li>
	  				</#list>
	  				</#if>
	  			</ul>
			<p>快递公司:${order.postCompany}--快递编号:${order.postNum}</p>
		</div>
		<div class="extend_list" style="margin:10px 0">
			<table cellspacing="0" cellpadding="0" width="100%" class="extend_table" id="table1">
				  <tr>
		<th width="160">商品图片</th>
		<th width="160">商品SKU</th>
        <th width="160">商品信息</th>
        <th width="80">商品单价</th>
        <th width="80">商品数量</th>
    			</tr>
    			<#list items as item>
    			<tr>
    				<td><img src="${item.pic}@40w_40h"  /></td>
    				<td>${item.sku}</td>
        			<td>
        				${item.name}<#if item.model??>${item.model}</#if>
        			</td>
        			<td>${item.price}</td>
        			<td>${item.num}</td>
    			</tr>
    			</#list>
			</table>
		</div>
	</div>
</div>
<!-- 确认发货并填写快递信息弹出层 -->
<div class="dialog dialog_extend dialog_cash" style="height:466px;">
	<div class="dialog_head">
		<span class="menu_do menu_close_unclear"></span>
		<b>确认发货</b>
	</div>
	<div class="dialog_body">
			<table cellspacing="0" cellpadding="0" width="80%" class="dia_table">
				<tr>
					<td class="dia_ltd">快递公司：</td>
					<td>
						<select class="dia_select" id="cc">
							<#list kuaidis as kd>
							<option value="${kd.keyid}" <#if order.carrcompanykey??&&order.carrcompanykey==kd.keyid>selected="selected"</#if> >${kd.name}</option>
							</#list>
					<!--		<option  id="other1" href="javascript:;" <#if order.postCompany??&&order.postCompany=="other">selected="selected"</#if>>其他快递</option> -->
						</select>
					</td>
				</tr>
				<tr>
					<td class="dia_ltd">快递单号：</td>
					<td><input placeholder="请填写快递单号" type="text" class="dia_inp" id="no" name="no" value="${(order.postNum)!}"></td>
				</tr>
			</table>
	</div>
	<div class="dialog_foot">
		<button type="button" class="dia_btn dialog_no">取消</button>
		<button type="button" class="dia_btn dialog_ok" id="kdsure">确定<#if order.paymentStatus=="paid">发货</#if></button>
	</div>
</div>

<!-- 未发货时修改金额弹出层 -->
<div class="dialog dialog_extend dialog_money" style="height:466px;">
	<div class="dialog_head">
		<span class="menu_do menu_close_unclear"></span>
		<b>修改金额</b>
	</div>
	<div class="dialog_body">
			<table cellspacing="0" cellpadding="0" width="100%" class="dia_table">
				<tr>
					<td width="126px">原本需支付金额：</td>
					<td>${order.realmoney}</td>
				</tr>
				<tr>
					<td>修改后需支付金额：</td>
					<td><input placeholder="请填写新的金额" type="text" class="dia_inp" id="newmoney" name="no" ></td>
				</tr>
				
			</table>
	</div>
	<div class="dialog_foot">
		<button type="button" class="dia_btn dialog_no">取消</button>
		<button type="button" class="dia_btn money_ok" >确定修改金额</button>
	</div>
</div>
<script>
	$(function(){
		$("#kdinput").bind("click",function(){
			$(".dialog_cash").show();
		});
		
		
		$("#other1").bind("click",function(){
			$("#other2").style="";
		});
		
		
		$("#kdsure").bind("click",function(){
			var cc = $("#cc").val();
			var ot = $("#ot").val();
			var no = $("#no").val();
			$.ajax({
				url:"json/order!send.action",
				data:{cc:cc,no:no,id:"${id}"<#if order.payStat==1>,tt:"1"</#if>},
				type:"post",
				success:function(data){
					var data = eval("("+data+")");
					if(data.success){
						window.location.href = data.url;
					}else{
						alert(data.msg);
					}
				}
			})
		})
		
		
		
		$("#xgje").bind("click",function(){
			$(".dialog_money").show();
		});
		
		$(".money_ok").bind("click",function(){
			var newmoney = $("#newmoney").val();
			
			$.ajax({
				url:"json/order!changemoney.action",
				data:{'newmoney':newmoney,'id':'${id}'},
				type:"post",
				success:function(html){
					if(html=='success'){
						alert("修改成功");
						window.location.href='order.action?id=${id}';
					}else{
						alert("修改失败，请重新登录再做修改");
					}
					
				},
				error:function(html){
					alert('数据错误！')
				}
			})
		})
		
	})
	
	
	
	
</script>

