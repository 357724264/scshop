<#include "/WEB-INF/template/admin/header.ftl" />
	<!-- 板块独有内容 -->
	<script>
	<#if pid??>
	$("#zysp").addClass("on");
	<#else>
	$("#kcgl").addClass("on");
	</#if>
	</script>
	<style>
	.dialog_btn{
	   margin-right : 20px;
	   width : 90px;
	   border : 0px;
	   height : 26px;
	   cursor : pointer;
	}
	.search_btn {
		margin-left: 10px;
	    height: 22px;
	    width: 50px;
	    font-size: 13px;
	    border: 0;
	}
	.hidden_tr {
		display : none;
	}
	</style>
	<div class="zxbody" style="position:relative;">
		<div class="zxbody_title" style="border-bottom: 1px solid #ccc;"><#if product??>${product.name}的</#if>库存管理</div>
		
		<div class="extend_tab" style="padding-top:10px;padding-bottom:10px;">
			<input id="in_btn" class="dialog_btn" type="button" value="入库"/>
			<input id="out_btn" class="dialog_btn"  type="button" value="出库"/>
			<#if !pid??>
			<input id="keyword" type="text" placeholder="搜索商品编号或名字" />
			<input id="search_button" type="button" class="dialog_btn" value="搜索"/>
			</#if>
		</div>
		
		<div class="extend_list">
			<table cellspacing="0" cellpadding="0" width="100%" class="extend_table" id="table">
				
			</table>
		</div>
			
		<div class="zxbody_page">
			<div class="showPage" id="showPage">
			</div>
		</div>
		
	</div>
</div>

	
<!-- 遮罩层 -->
<div class="mask"></div>
	
<div class="dialog dialog_extend dialog_account increment_dia">
			<div class="dialog_head">
				<span class="menu_do menu_close"></span>
				<b id="title">商品入库</b>
			</div>
			<!--用于区分出入库-->
			<input id="storageType" type="hidden"/>
			<div class="dialog_body">
				<table cellspacing="0" cellpadding="0" width="100%" class="dia_table">
					<tr>
						<td class="dia_ltd">商品编号：</td>
						<td><input placeholder="请填写商品编号"  type="text" class="dia_inp" id="sku" value=""><input class="search_btn" type="button"  value="查询"/></td>
					</tr>
					<tr class="hidden_tr">
						<td class="dia_ltd">商品名称：</td>
						<td><input readonly="readonly"  type="text" class="dia_inp" id="productName" value=""><input id="productid" type="hidden" /></td>
					</tr>
					<tr  class="hidden_tr">
						<td class="dia_ltd">当前库存：</td>
						<td><input readonly="readonly"   type="text" class="dia_inp" id="surplus" value=""></td>
					</tr>
					
					<tr>
						<td class="dia_ltd" id="storageTypeDisplay">入库数量：</td>
						<td><input  type="text" class="dia_inp" id="increment" value=""></td>
					</tr>
					<tr>
						<td class="dia_ltd">备注：</td>
						<td><textarea   class="dia_text" id="remark"  value=""></textarea></td>
					</tr>
					
				</table>
			</div>
			
			<div class="dialog_foot">
				<button type="button" class="dia_btn dialog_no">取消</button>
				<button type="submit" class="dia_btn dialog_ok increment_ok">确定</button>
			</div>
		</div>
<script>

//关闭弹出层
$(document).on("click",".menu_close", function(){
	close_product_dialog();
});
$(document).on("click",".dialog_no", function(){
	close_product_dialog();
});

function close_product_dialog(){
	$("body").removeClass("noscroll");
	$(".dia_inp").val('');
	$(".dia_text").val('');
	$(".mask").fadeOut();
	$(".hidden_tr").hide();
	$(".increment_dia").hide();
}

$(function(){
	
	showPage(1,"");		
	
});
	
function getContentList(pn,keyword){
	var url = "json/inventory!list.action";
    if(pn==0){
        pn=1;
    }
	$.ajax({
		url:url,
		type: "post",
		data:{pn:pn,keyword:keyword,pid:"${pid!}"},
		async:false,
		success:function(html){
			$("#table").html(html);
		}
	});
	
}
	
//生成分页
function showPage(pn,keyword){
	var url = "json/inventory!totalNum.action";
	var showpage = "showPage";
	if(!pn) pn=1;

	$.ajax({
		url: url,
		type:"post", 
		data:{keyword:keyword,pn:pn,pid:"${pid!}"},
		dataType: "json",
		async:false,
		success:function(dat){
			//计算页数
			var pageCount = Math.ceil(dat.total/dat.size);
			if(pageCount < pn){
				pn=pageCount;
			}
			//分页
			$("#"+showpage).createPage({
				dataTotal: dat.total, //数据条数
				pageCount: pageCount, //总页数
				current: pn, //当前页
				backFn: function(pn,keyword){
					//单击回调方法，pn是当前页码
					//获取列表数据
					getContentList(pn,keyword);
					
				}
			});
			//获取列表数据
			getContentList(pn,keyword);
		}
	});
}

//查询
$(document).on("click",".search_btn",function(){
	var sku = $("#sku").val();
	if(sku.replace(/(^\s*)|(\s*$)/g,'')==""){
		boxalert("不能查询为空的sku!");
		return;
	}
	$.ajax({
		url : 'json/inventory!queryProduct.action',
		type : 'post',
		data : {sku:sku},
		success : function(data){
			var data = eval("("+data+")");
			if(data.success) {
				$('#productName').val(data.productName);
				$('#surplus').val(data.surplus);
				$('#productid').val(data.productid);
				$(".hidden_tr").show();
			}else {
				$('#productName').val('');
				$('#surplus').val('');
				$('#productid').val('');
				$(".hidden_tr").hide();
				boxalert(data.msg);
			}
			
		}
	
	});
});



$(document).on("click","#in_btn",function(){
	$("#title").html("商品入库");
	$("#storageTypeDisplay").html("入库数量：");
	$("#storageType").val("in");
	$(".mask").show();
	$(".increment_dia").show();
});

$(document).on("click","#out_btn",function(){
	$("#title").html("商品出库");
	$("#storageTypeDisplay").html("出库数量：");
	$("#storageType").val("out");
	$(".mask").show();
	$(".increment_dia").show();
});

$(document).on("click",".increment_ok",function(){
	var sku = $("#sku").val();
	var num = $("#increment").val();
	var remark = $("#remark").val();
	var productid = $("#productid").val();
	var productName = $("#productName").val();
	var surplus = $("#surplus").val();
	var url = '';
	if($("#storageType").val()=="in"){
		url = 'json/inventory!increase.action';
	}else {
		url = 'json/inventory!decrease.action';
	}
	$.ajax({
		url : url,
		type : 'post',
		data : {sku:sku,num:num,remark:remark,productid:productid,productName:productName,surplus:surplus},
		success : function(data){
			var data = eval("("+data+")");
			if(data.success){
				location.href = data.url;
			}else {
				boxalert(data.msg);			
			}	
		}
	});
});

$(document).on("click","#search_button",function(){
	var keyword = $('#keyword').val();
	showPage(1,keyword);
});
</script>
