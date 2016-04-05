
<#include "/WEB-INF/template/admin/header.ftl" />
    <style>
    .up500{
	    height: 150px;
	    width: 265px;
}
    }
    </style>
	
	<!-- 板块独有内容 -->
	<script>
	<#if permission==0>
	$("#yhhd").addClass("on");
	<#else>
	$("#myyh").addClass("on");
	</#if>
	</script>
	<div class="zxbody">
		<div class="zxbody_title zxbody_title2">
			<a href="javascript:history.back();" class="zxback">
				<img src="${base}/static/admin/img/do_back.png">
			</a>
			优惠活动审核
		</div>

			<div class="zxform">
				<form id="myform" name="myform" method="post" action="">
				<input type="hidden" name="id" value="${seckill.id}"/>
				<table cellspacing="0" cellpadding="0" width="100%" class="zxtable">
					<tr  class="tt-0">
						<td class="zxltd">店铺名称：</td>
						<td>${(seckill.shopName)!}</td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">商品名称：</td>
						<td>${(seckill.productName)!}</td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">促销类型：</td>
						<td><#if seckill.productType==1>秒杀</#if><#if seckill.productType==2>限时购</#if></td>
					</tr>
					<tr>
					<td class="zxltd">邮费：</td>
					<td>${(seckill.postage)!}元</td>
				</tr>
					<tr  class="tt-0">
						<td class="zxltd">开始时间：</td>
						<td><#if seckill.beginTime??>${seckill.beginTime?number_to_datetime?string("yyyy-MM-dd HH:mm")}<#else>-</#if></td>
					</tr>
					<#if seckill.productType==2>
					<tr  class="tt-0">
						<td class="zxltd">结束时间：</td>
						<td><#if seckill.endTime??>${seckill.endTime?number_to_datetime?string("yyyy-MM-dd HH:mm")}<#else>-</#if></td>
					</tr>
					</#if>
					<tr  class="tt-0">
						<td class="zxltd">申请简述：</td>
						<td>${(seckill.remark)!}</td>
					</tr>
					
					<tr class="tt-0">
						<td class="zxltd">商品详情：</td>
						
						<td><div class="extend_list">
						<table cellspacing="0" cellpadding="0" width="100%" class="extend_table" id="table1">
								<tr>
	        						<th width="60">商品编号</th>
	        						<th width="140">商品名称</th>
									<th width="60">原价</th>
									<th width="60">库存</th>
									<th width="60">促销数量</th>
									<#if seckill.productType==2><th width="60">限时购价格</th></#if>
	    						</tr>
								<#list voList as vo>
									<tr>
										<td>${vo.sku}</td>
										<td>${vo.name}</td>
										<td>${vo.price}</td>
										<td>${vo.inventory}</td>
										<td>${vo.seckillNum}</td>
									<#if seckill.productType==2><td>${vo.seckillPrice}</td></#if>
									</tr>
								</#list>
						
						</table>
						</div></td>
					</tr>
				<#if permission==0>
					<tr class="tt-0">
						<td  class="zxltd">审核结果：</td>
						<td><label><input <#if seckill.stat==2||seckill.stat=-1>disabled</#if> id="radio1" name="stat" type="radio" value="1" <#if seckill.stat==1>checked</#if>/>通过</label>
							<#if seckill.stat==0||seckill.stat==-1><label><input <#if seckill.stat!=0>disabled</#if> name="stat" type="radio" value="-1" <#if seckill.stat==0||seckill.stat==-1>checked</#if> />拒绝</label></#if>
							<#if seckill.stat==1||seckill.stat==2><label><input <#if seckill.stat==2>disabled</#if> name="stat" type="radio" value="2" <#if seckill.stat==2>checked</#if> />取消</label></#if>
							</td>
					</tr>
				<#if seckill.stat==0||seckill.stat==-1><tr class="tt-0 refuse_tr">
						<td  class="zxltd">拒绝理由：</td>
						<td><textarea class="dia_text"  <#if seckill.stat==-1>disabled</#if>  name="rejectReason" id="reason">${(seckill.rejectReason)!}</textarea></td>
					</tr>
				</#if>
				<#if seckill.stat==1||seckill.stat=2><tr class="tt-0 cancel_tr">
						<td  class="zxltd">取消理由：</td>
						<td><textarea class="dia_text"  <#if seckill.stat==2>disabled</#if>  name="cancelReason" id="cancelReason">${(seckill.cancelReason)!}</textarea></td>
					</tr>
				</#if>
				<#else>
					<tr class="tt-0">
						<td  class="zxltd">审核结果：</td>
						<td><#if seckill.stat==-1>不通过</#if><#if seckill.stat==0>未审核</#if><#if seckill.stat==1>通过</#if><#if seckill.stat==2>已取消</#if></td>
					</tr>
					<#if seckill.stat==-1>
					<td  class="zxltd">拒绝理由：</td>
						<td><textarea class="dia_text"  disabled  name="rejectReason" id="reason">${seckill.rejectReason}</textarea></td>
					</tr>
					</#if>
					<#if seckill.stat=2><tr class="tt-0 cancel_tr">
						<td  class="zxltd">取消理由：</td>
						<td><textarea class="dia_text"  <#if seckill.stat==2>disabled</#if>  name="cancelReason" id="cancelReason">${(seckill.cancelReason)!}</textarea></td>
					</tr>
				</#if>
				</#if>
			</table>
				<#if permission==0&&seckill.stat==1><div class="cancel_tr" style="margin-left:40px;"><button type="button" class="dia_btn dialog_ok form_cancel">确定</button></div></#if>
				<#if permission==0&&seckill.stat==0><div style="margin-left:40px;"><button type="button" class="dia_btn dialog_ok form_ok">确定</button></div></#if>
			</form>
			</div>
						
		
</div>
<script src="${base}/static/admin/avalon.js"></script>
<script src="${base}/static/admin/highlight/shCore.js"></script>
<script type="text/javascript" src="${base}/static/admin/js/yanzheng.js"></script>
<script>
	$(function(){
		$("input[name='stat']:checked").trigger("change");
	});
	
	$(document).on("click",".form_ok",function(){
		var stat = $("input[name='stat']:checked").val();
		if(stat==1) {
			$("#myform").attr("action","seckill!approve.action").submit();
		}else if(stat==2){
			$("#myform").attr("action","seckill!cancel.action").submit();
		}else if(stat=-1) {
			$("#myform").attr("action","seckill!refuse.action").submit();
		}
		
	});
	
	$(document).on("click",".form_cancel",function(){
		$("#myform").attr("action","seckill!cancel.action").submit();
	});
	
	$(document).on("change","input[name='stat']",function(){
		var stat = $(this).val();
		if(stat==-1) {
			$(".refuse_tr").show();
		}else {
			$(".refuse_tr").hide();
			$("#reason").val('');
		}
		if(stat==2) {
			$(".cancel_tr").show();
		}else {
			$(".cancel_tr").hide();
			$("#cancelReason").val('');
		}
	});
	
</script>

<!-- 表单提交 -->
<#include "/WEB-INF/template/admin/myform.ftl" />