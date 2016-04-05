<#include "/WEB-INF/template/admin/header.ftl" />
	<style type="text/css">
		.dialog{border:1px solid #ddd;}
		.odul{height:100%;}
		.odul li{position:relative;}
		.odul:after{clear: both; content: ""; display:block;}
		.dia_btn{width:110px;}
		#xgje{position:absolute; top:0; right:0; line-height:30px; background-color:#1fa761; padding:0 5px; color:#fff;}
		.hidden_ele{display:none;}
	</style>
	
	<script>
		$("#zysp").addClass("on");
		 
	</script>
	<div class="zxbody">
		<div class="zxbody_title zxbody_title2">
			<a href="javascript:history.back();" class="zxback">
				<img src="${base}/static/admin/img/do_back.png">
			</a>
			促销申请
		</div>
	 <form id="myform" name="myform" method="post" action="seckill!save.action">
			<input type="hidden" id="subProductJson" name="subProductJson" />
			<input type="hidden" id="cid" name="cid" value="${product.id}"/>
			<input type="hidden" id="productName" name="productName" value="${product.name}"/>
			<div class="zxform">
				<table cellspacing="0" cellpadding="0" width="100%" class="zxtable">
				<tr>
					<td class="zxltd">商品名称：</td>
					<td>${product.name}</td>
				</tr>
				
				<tr>
					<td class="zxltd">促销类型：</td>
					<td>
						<select id="productType" name="productType">
							<option value="1">秒杀</option>
							<option value="2">限时购</option>	
						</select>
					</td>
				</tr>
				<tr>
					<td class="zxltd">邮费：</td>
					<td><input class="dia_inp" id="postage" type="text" name="postage" ></td>
				</tr>
				<tr>
					<td class="zxltd">开始时间：</td>
					<td><input id="beginTime" class="dia_inp time" id="beginTime" type="text" name="beginTime"></td>
				</tr>
				<tr class="hidden_ele">
					<td class="zxltd">结束时间：</td>
					<td><input id="endTime" class="dia_inp time" id="endTime" type="text" name="endTime"></td>
				</tr>
				<tr class="hidden_ele">
					<td class="zxltd">限购数量：</td>
					<td><input class="dia_inp" id="num" type="text" name="num"></td>
				</tr>
				
				<tr>
					<td class="zxltd">申请简述：</td>
					<td><textarea class="form_text"  placeholder=" " id="remark" name="remark"></textarea></td>
				</tr>
				
					</table>
						<div class="extend_list" style="margin:10px 0">
			<table cellspacing="0" cellpadding="0" width="100%" class="extend_table" id="table1">
				<#if list??>
					<tr>
        				<th width="60">商品编号</th>
        				<th width="140">商品名称</th>
						<th width="60">原价</th>
						<th width="60">库存</th>
						<th width="60">促销数量</th>
						<th class="hidden_ele" width="60">限时购价格</th>
    				</tr>
					<#list list as subProduct>
						<tr>
							<td>${subProduct.sku}</td>
							<td>${subProduct.fullName}</td>
							<td>${subProduct.price}</td>
							<td id="inventory${subProduct_index}">${subProduct.inventory}</td>
							<td><input id="seckillNum${subProduct_index}" class="pro_inp seckillNum" type="text" style="width:40px;height:15px;"/></td>
							<td class="hidden_ele"><input id="seckillPrice${subProduct_index}" class="pro_inp" type="text" style="width:40px;height:15px;"/></td>
						</tr>
						<input type="hidden" class="val_inp" value="${subProduct_index}" data-id="${subProduct.id}" data-name="${subProduct.fullName}"
							data-sku="${subProduct.sku}" data-price="${subProduct.price}" data-inventory="${subProduct.inventory}" />
					</#list>
					
				</#if>
			</table>
		</div>
		<div class="dialog_foot">
			<button type="button" class="dia_btn dialog_ok">确定</button>
		</div>
				</div>
				
				
			</div>
			
		
		</form>
	</div>
</div>
<!-- 表单提交 -->
<#include "/WEB-INF/template/admin/myform.ftl" />

<script>
	$('.time').datetimepicker({lang:'ch'});
	$(document).on('change','#productType',function(){
		var value = $(this).val();
		if(value==1) {
			$('.hidden_ele').hide();
		}else {
			$('.hidden_ele').show();
		}
	});
	
	$(document).on("click",".dialog_ok",function(){
		var productType = $("#productType").val();
		var ary = [];
		var flag = false;
		var breakFlag = false;
		var i = 0;
		$(".val_inp").each(function(){
			var beginTime = $("#beginTime").val();
			if(!beginTime) {
				boxalert("活动开始时间不能为空!");
				breakFlag = true;
				return false;
			}
			if(productType == "2") {
				var endTime = $("#endTime").val();
				if(!endTime) {
					boxalert("活动结束时间不能为空!");
					breakFlag = true;
					return false;
				}
			}
		
			var seckillNum = $('#seckillNum'+$(this).val()).val();
			if(seckillNum) {
				var obj = {};
				obj.id = $(this).attr("data-id");
				obj.name = $(this).attr("data-name");
				obj.sku = $(this).attr("data-sku");
				obj.price = $(this).attr("data-price");
				obj.inventory = $(this).attr("data-inventory");
				obj.seckillNum = seckillNum;
				if(obj.seckillNum) {
					flag = true;
				}
				if(productType == "2") {
					obj.seckillPrice = $('#seckillPrice'+$(this).val()).val();
				}
				ary[i++] = obj;
			}
		});
		if(breakFlag) {
			return false;
		}
		if(!flag) {
			boxalert("至少要有一个商品设置了促销数量!");
			return false;
		}
		var subProductJson = JSON.stringify(ary);
		$("#subProductJson").val(subProductJson);
		$("#myform").submit();
	});
	
	$(document).on('blur','.seckillNum',function(){
		var seckillNum = $(this).val();
		var reg = /^[1-9]{1}\d*$/;
		if(seckillNum.match(reg)==null){
				$(this).val('');
		}
		var inventory = $('#inventory'+$(this).attr("id").replace("seckillNum","")).html();
		if((!inventory&&seckillNum)||(parseInt(inventory)<parseInt(seckillNum))){
			boxalert("库存不足,请先添加库存!");
			$(this).val('');
		}
	});
</script>