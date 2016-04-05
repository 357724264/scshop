<style type="text/css">
	.dialogarea{width:100%; height:100%; position:relative; overflow:hidden;}
	.dialogarea .dlgright{position:absolute; top:0; right:0; width:65%; height:100%; overflow-y:auto; }
	.ppbox{position:relative;width:100%; height:100%;}
	.pparea{position:absolute; top:0; left:0; width:100%; height:auto; overflow-y:auto;}
	.dialog_body{width:100%; height:100%; box-sizing:border-box; overflow:hidden; position:absolute; top:0; left:0; padding-top:81px; padding-bottom:75px;}
	.dialog_head{position:relative; z-index:2;}
	.dialog_foot{position:absolute; bottom:0; width:100%; z-index:2;}
</style>
<!-- 遮罩层 -->
<div class="mask"></div>

<!-- 新增和修改弹出层 -->
<div class="dialog dialog_add firstSpe_dialog" style="width:900px;height:700px;top:35%;left:43%;">
	<div class="dialog_head">
		<span class="menu_do menu_close"></span>
		<b>新增栏目</b>
	</div>
	<!--隐藏Id-->

	<div class="dialog_body">
		<div class="dialogarea">
		<div class="dialog_left">
			<div class="dialog_upload up500 canhide">
				<img id="avatar2" src="${base}/static/admin/img/img520.jpg" data-default="${base}/static/admin/img/img520.jpg">
				<input type="file" id="file2" name="file" class="dia_file">
				<input type="hidden" id="addPic" name="addPic" value="">
			</div>
			<div class="dialog_tip canhide">
				<h1>点击按钮修改栏目图片</h1>
				<p>
				建议上传图片规则:
				<br>
				尺寸：500*300像素
				<br>
				格式：jpg、jpeg、png
				<br>
				图片大小不超过300kb（太大网站会加载很慢）
				</p>
				
			</div>
			<div class="dialog_tip">
			&nbsp;
			</div>
				<input class="dia_inp" type="hidden" id="finputid"/>
				<input class="dia_inp" type="hidden" id="sinputid"/>
				<input class="dia_inp" type="hidden" id="input_index"/>
		</div>
		<div class="dialog_right dlgright">
					<table cellspacing="0" cellpadding="0" width="100%" class="dia_table">
						<tr>
							<td class="dia_ltd"><span class="must">*</span>规格名称：</td> 
							<td><input placeholder="请输入一级规格名称" type="text" class="dia_inp validate" id="f_name"></td>
						</tr>
						<tr>
							<td class="dia_ltd">商品编号：</td>
							<td><input  type="text" class="dia_inp" id="f_sku"></td>
						</tr>
				<tr>
					<td class="dia_ltd">最小购买量：</td>
					<td>
						<input type="text" class="dia_inp validate" id="f_minPurchaseQuantity">
					</td>
				</tr>
				<tr>
					<td class="dia_ltd">最大购买量：</td>
					<td>
						<input type="text" class="dia_inp validate" id="f_maxPurchaseQuantity">
					</td>
				</tr>
					
						<tr>
							<td class="dia_ltd">库存：</td>
							<td><input  type="text" class="dia_inp validate" id="f_inventory" ></td>
						</tr>
						<tr>
							<td class="dia_ltd">产品售价：</td>
							<td>
								<input type="text" class="dia_inp validate" id="f_price"><span>元</span>
							</td>
						</tr>
							
						<tr>
							<td class="dia_ltd" colspan="2" style="text-align:center; font-size:16px; background-color:#eee;">代理价格</td>
						</tr>
						<#if agentList??>
		                  <#list agentList as agent>
			                  <tr>
			                  	<input type="hidden" class="agentInput" id="agentid${agent_index}" value="${agent.id}" />
			                 	<td>${agent.name}</td>
			                 	<#if priceList??>
				                 	<#list priceList as agentPrice>
				                 		<#if agent_index == agentPrice_index>
				                 		<td><input class="priceInput dia_inp validate" name="agentPrice" id="agentPrice${agent_index}" type="text" value="${agentPrice}"/><span>元</span></td>
				                 		</#if>
				                 	</#list>
			                 	<#else>
			                 		<td><input class="priceInput dia_inp validate"  name="agentPrice" id="agentPrice${agent_index}" type="text" value=""/><span>元</span></td>
			                 	</#if>
			                  </tr>
		                 </#list>
		             </#if>
						
					</table>
		</div>
	</div>	
	</div>
	<div class="dialog_foot">
		<button type="button" class="dia_btn dialog_no">取消</button>
		<button type="button" class="dia_btn dialog_spec">确定</button>
	</div>
</div>

<script type="text/javascript">
var skuCheck = true;
var skuEmpty = true;

$(document).on("blur","#f_sku",function(){
	var sku = $("#f_sku").val();
	sku = sku.replace(/(^\s*)|(\s*$)/g,'');
	$("#f_sku").val(sku);
	var id = '';
	if(level == 1){
		id = $("#finputid").val();
		if(sku.replace(/(^\s*)|(\s*$)/g,'')==""){
		return;
		}
	}else {
		id = $("#sinputid").val();
		if(sku.replace(/(^\s*)|(\s*$)/g,'')==""){
			skuEmpty = true;
			boxalert('二级规格的sku不能为空!');
			return;
		}else {
			skuEmpty = false;
		}
	}
	
	
	$.ajax({
		url : "json/product!checkSku.action",
		type : "post",
		data : {sku:sku,cid:id},
		success : function(data){
			var data = eval("("+data+")");
			if(data.success) {
				skuCheck = true;
			}else {
				skuCheck = false;
				boxalert(data.msg);
			}
		}
	});
	
});

	
$('#avatar2').live('click', function(){
	$("#file2").trigger("click");
});
$('#file2').live("change",function(){
	fileupload2();
});

$(document).on("click",".dialog_spec",function(){
	//验证
	$(".validate").trigger('blur');
    var numError = $('.dialog_body').find('.onError').length;
    if(numError){
        return;
    } 
    if(!skuCheck) {
    	boxalert("sku已存在！");
    	return;
    }
    if(level==2 && skuEmpty) {
    	boxalert("二级规格的sku不能为空!");
    	return;
    }
    
    
	var index = $("#input_index").val();
	var finputid = $("#finputid").val();
	var name = $("#f_name").val();
	var sku = $("#f_sku").val();
	var inventory = $("#f_inventory").val();
	var price = $("#f_price").val()
	var minPurchaseQuantity = $("#f_minPurchaseQuantity").val();
	var maxPurchaseQuantity = $("#f_maxPurchaseQuantity").val();
	var agentStr = "{";
	for(var i=0;i<$('.agentInput').length;i++){
		var agentid = $('.agentInput').eq(i).val();
		var agentPrice = $('.priceInput').eq(i).val();
		if(agentPrice==null||agentPrice=="") {
			agentPrice = price;
		}
		agentStr = agentStr + "\"" + agentid + "\":\"" + agentPrice +"\",";
	}
	agentStr = agentStr.substring(0,agentStr.length-1) + "}";
	var pic = $("#addPic").val();
	var inputid = "";
	if(level == 1) {
		inputid = "f_input";
		if(save) {
			index = inputIndex;
			//$(".firstSpec").before('<div class="gg-list"><input  id="f_input'+index+'" readonly="readonly" type="text"  class="f_input dia_sinp" src="/assets/img/search_btn.gif" /><img  attr-input="'+index+'" class="theclose" src="/assets/img/delete.png" style="margin:10px;margin-left:-20px;width:20px;"><img id="s_add'+index+'" class="s_add_btn" src="${base}/assets/img/add.png" style="margin:-10px;margin-left:-30px;width:20px;"></div>');
	
			var td1='<td>'+
						'<input tye="text" class="f_input" id="f_input'+index+'" data-id="new_f'+index+'" readonly="readonly" placeholder="编辑" />'+
						'<i class="delall iconfont icon-shanchu1" attr-id="" ></i>'+
					'</td>';
			var td2='<td>'+
						'<a href="javascript:;" id="pull_down'+index+'" class="twoaddbtn"><i class="iconfont icon-xiangxiashouqi"></i></a>'+
					'</td>';
			$('.oneadd').before(td1);
			$('.twoadd').before(td2);
			inputIndex++;
		}
		
	}else {
		inputid = "s_input";
		if(save) {
			index = inputIndex;
			var htm='<div class="two-level">'+
					'<input type="text"  class="s_input" id="s_input'+index+'" data-id="new_s'+index+'" readonly="readonly"  placeholder="编辑" />'+
					'<i class="dellist iconfont icon-guanbi5" attr-id=""></i>'+
				'</div>';
			var i = $("#finputid").attr("data-index");
			$("#pull_down" + i).before(htm);
			inputIndex++;
		}else {
			var sinputid = $("#sinputid").val();
			$("#"+inputid+index).attr("data-id",sinputid);
		}
		
	}
	$("#"+inputid+index).val(name);
	$("#"+inputid+index).attr("data-parentid",finputid);
	$("#"+inputid+index).attr("data-name",name);
	$("#"+inputid+index).attr("data-sku",sku);	
	$("#"+inputid+index).attr("data-inventory",inventory);	
	$("#"+inputid+index).attr("data-price",price);	
	$("#"+inputid+index).attr("data-agentStr",agentStr);
	$("#"+inputid+index).attr("data-pic",pic);
	$("#"+inputid+index).attr("data-minPurchaseQuantity",minPurchaseQuantity);
	$("#"+inputid+index).attr("data-maxPurchaseQuantity",maxPurchaseQuantity);
	save = false;
	close_product_dialog();
	
});

$('.validate').blur(function(){
 	 if( $(this).is('#f_name') ){
          $(this).required();
     }
     if( $(this).is('#f_price') ){
          $(this).decimal();
     }
     if($(this).hasClass("priceInput")) {
     	$(this).decimalOrNull();
     }
    }).keyup(function(){
       $(this).triggerHandler("blur");
    }).focus(function(){
       $(this).triggerHandler("blur");
    });



function fileupload2(){
$.ajaxFileUpload({
		url:'${base}/upload.action',       //需要链接到服务器地址
		secureuri:false,
		fileElementId:'file2',                            //文件选择框的id属性
		dataType: 'text/html',                                   //服务器返回的格式，可以是json
		fileSize:300,     
		data:{width:'520', length:'250',limit:300},
		success: function (data, textStatus) {
			
			//兼容ie8以及以下版本
        	if(data.success){
        		$("#addPic").val(data.bigurl);
				$("#avatar2").attr("src",data.bigurl);
        	}
            //兼容火狐、谷歌、ie8以上版本
			var dat = eval("("+data+")");
			if(dat.success){
				$("#addPic").val(dat.bigurl);
				$("#avatar2").attr("src",dat.bigurl);
			}
			
			if(data.msg){
				alert(data.msg)
			}
			if(dat.msg){
				alert(dat.msg)
			}
			
			
		}
	});
}


</script>