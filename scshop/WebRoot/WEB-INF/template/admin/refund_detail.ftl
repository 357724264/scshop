
<#include "/WEB-INF/template/admin/header.ftl" />
    <style>
    .up500{height: 150px;width: 265px;}
    </style>
	<input type="hidden" id="refundStatus" value="${(refund.refundStatus)!}">
	<div class="zxbody">
		<div class="zxbody_title zxbody_title2">
			<a href="javascript:history.back();" class="zxback">
				<img src="${base}/static/admin/img/do_back.png">
			</a>
			退款审核
		</div>

			<div class="zxform">
				<form id="myform" name="myform" method="post" action="">
				<input type="hidden" id="refundid" value="${refund.id}"/>
				<table cellspacing="0" cellpadding="0" width="100%" class="zxtable">
					<tr  class="tt-0">
						<td class="zxltd">用户ID：</td>
						<td id="userid">${(refund.userid)!}</td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">用户真实姓名：</td>
						<td>${(refund.realName)!}</td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">退款申请时间：</td>
						<td>${(refund.createDate?number_to_datetime?string("yyyy-MM-dd HH:mm"))!}</td>
					</tr>
					<tr>
					<td class="zxltd">退款金额：</td>
					<td>${(refund.total)!}元</td>
				    </tr>
				    <tr>
					<td class="zxltd">实付金额：</td>
					<td>${(refund.realMoney)!}元</td>
				    </tr>
				    <tr>
					<td class="zxltd">消费积分：</td>
					<td>${(refund.point)!}</td>
				    </tr>
					<tr  class="tt-0">
						<td class="zxltd">退款理由：</td>
						<td>${refund.reason}</td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">退款途径：</td>
						<td> 
						<#if refund.refundWay== 0>
						            		  微信钱包
						     <#elseif refund.refundWay== 1>
						           		  银行卡
						     </#if>
			            </td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">手机号：</td>
						<td>${refund.phone}</td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">微信号：</td>
						<td>${refund.wxAccount}</td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">银行卡信息：</td>
						<td>${refund.cardInfo}</td>
					</tr>
					
					<tr class="tt-0">
						<td class="zxltd">订单详情：</td>
						
						<td><div class="extend_list">
						<table cellspacing="0" cellpadding="0" width="100%" class="extend_table" id="table1">
								<tr>
	        						<th width="140">商品图片</th>
	        						<th width="140">商品名称</th>
	        						<th width="60">数量</th>
									<th width="60">原价</th>
	    						</tr>
								<#list items as item>
									<tr>
										<td><img src="${item.pic}@40w_40h"</td>
										<td>${item.name}</td>
										<td>${item.num}</td>
										<td>${item.price}</td>
									</tr>
								</#list>
						
						</table>
						</div></td>
					</tr>
					<tr class="tt-0">
						<td></td>
						<td id="wrap">
							<label><input class="radioItem" name="stat" type="radio"  value="1" checked/>同意退款</label>&nbsp;&nbsp;&nbsp;&nbsp;
							<label><input class="radioItem" name="stat" type="radio"  value="-1"  />不同意退款</label>
						</td>
					</tr>
					<tr  class="tt-0 feedback">
						<td class="zxltd">拒绝理由</td>
						<td><textarea  rows="4" cols="45"  name="reason" id="reason" >${refund.refuseReason!}</textarea></td>
					</tr>
					<tr>
						<td></td>
						<td class="btntd">
								<#if functionitems?index_of(",refundedit,") gte 0>
									<button type="button" class="dia_btn dialog_ok form_ok"  >确定</button>
								<#else>
									<button>无操作权限</button>
								</#if>
							<b style='color:red;' id = "tip"></b>
						</td>
					</tr>
			</table>
			</form>
			</div>
		
</div>
<script src="${base}/static/admin/avalon.js"></script>
<script src="${base}/static/admin/highlight/shCore.js"></script>
<script type="text/javascript" src="${base}/static/admin/js/yanzheng.js"></script>
<script>

    //弹出退款理由输入框
    $(document).on("change","input[name='stat']:checked",function(){
                     var stat = $("input[name='stat']:checked").val();
                     if(stat==-1){
                        $(".feedback").fadeIn();
                     }else{
                        $(".feedback").fadeOut();
                     }
    })
    $(function(){
      $(".feedback").fadeOut();
      var refundStatus = $("#refundStatus").val();
      if(refundStatus=="success"){
          $("input[name='stat']").attr("disabled","disabled");
      }
    })
    
	$(document).on("click",".form_ok",function(){
		var stat = $(":checked").val();
		var reason = $("#reason").val();
		var refundid = $("#refundid").val();
		$.ajax({
			url:'json/refund!statchange.action',
			type: "post",
			data:{stat:stat,reason:reason,id:refundid},
			success:function(data){
			    json = eval("("+data+")");
			      if(json.success){
			         boxalert("已修改");
			         location.href='refund!list.action';
			      }
		    }
	   })
		
	});
	
</script>

<!-- 表单提交 -->
<#include "/WEB-INF/template/admin/myform.ftl" />