	<#include "/WEB-INF/template/admin/header.ftl" />
	<style>
	.zxmenu_middel {
	    margin: 20px;
	    height : 20px;
	}
	.zxmenu_middel span{
	   margin-right : 20px;
	}
	
	.search_btn{
	   margin-right : 20px;
	   width : 90px;
	   border : 0px;
	   height : 26px;
	}
	.menu_do{
	  width : 18px;
	  height : 18px;
	}
	
	</style>
	<!-- 板块独有内容 -->
	<script>
	$("#yhq").addClass("on");
	
	
	</script>
	<div class="zxbody">
		<div class="zxbody_title">促销管理</div>
		<div class="zxbody_menu">
			<div class="zxmenu">
				
				<div class="zxmenu">
					<div class="zxmenu_tit">
						<span>优惠券管理</span>
						<a href="coupon!edit.action" target="_blank">
							<img class="menu_new" src="${base}/static/admin/img/do_new.png">
						</a>
					</div>
					<div class="zxmenu_list">
						<table cellspacing="0" cellpadding="0" width="100%" class="zxmenu_table">
							
						</table>
						<div class="zxmenu_page">
							<div class="page_left">
								<b><input type="checkbox" class="all_checkbox"></b>
								<b>全选</b>
								<b id="deleteAll" class="menu_do menu_del" title="删除"></b>
							</div>
							<div class="page_right">
								<div class="showPage">
								
								</div>
							</div>
						</div>
					</div>
				</div>	
			</div>			
		</div>
	</div> 
	
</div>
<div class="dialog dialog_extend dialog_account">
	<div class="dialog_head">
		<span class="menu_do menu_close"></span>
		<b>增加或减少优惠券数量</b>
	</div>
	<div class="dialog_body">
			<table cellspacing="0" cellpadding="0" width="100%" class="dia_table">
				<input type="hidden" id="popid" value="" /> 
				<tr>
					<td class="dia_ltd">优惠券名称：</td>
					<td><input type="text" class="dia_inp" disabled="disabled" value="" id="popname"></td>
				</tr>
				<tr>
					<td class="dia_ltd">总优惠券数量：</td>
					<td><input type="text" class="dia_inp" disabled="disabled" value="" id="popall"></td>
				</tr>
				<tr>
					<td class="dia_ltd">现有数量：</td>
					<td><input type="text" class="dia_inp" disabled="disabled" value="" id="popnow"></td>
				</tr>
				<tr>
					<td class="dia_ltd">增加或删除：</td>
					<td>
						<select id="changetype">
							<option value="1">增加</option>
							<option value="-1">减少</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="dia_ltd">改变的数量：</td>
					<td><input placeholder="请填写改变的数量" type="text" class="dia_inp" id="changenum" value=""></td>
				</tr>
			</table>
	</div>
	<div class="dialog_foot">
		<button type="button" class="dia_btn dialog_no">取消</button>
		<button type="button" class="dia_btn dialog_ok">确定</button>
	</div>
</div>



<script>
//获取内容列表
var contentList = "json/coupon!list.action";
//获取内容总数
var totalNum = "json/coupon!totalNum.action";
//修改内容链接
var contentView = "coupon!edit.action";
//删除全部选中内容
var deleteAllContent = "json/coupon!deleteAll.action";
//删除单条内容
var deleteContent = "json/coupon!delete.action";

//标识下载数据的参数类型
var cls = "product";
var tableval = "[{'name':'优惠券名字','key':'name'},{'name':'发布时间','key':'createDate'},{'name':'數量','key':'num'},{'name':'说明','key':'desc'},{'name':'领取状态','key':'stop'}]"
var editval = "[{'classname':'stop','url':'javascript:;','name':'停止领取'},{'classname':'change','url':'javascript:;','name':'增/减优惠券数量'}]";
</script>
<script type="text/javascript" src="${base}/static/admin/js/product_menu.js"></script>
<script type="text/javascript">
$(document).on("click",".menu_stop",function(){
		
		var _thisparent = $(this).parent().parent();
		var id = $(_thisparent).attr("data-id");
		if(confirm("确定要改变该优惠券的领取状态吗？")){
			$.ajax({
				url:"json/coupon!stop.action?cid="+id,
				success:function(html){
					var dat = eval("("+html+")");
					if(dat.success){
						alert("状态更新成功!");
						if(dat.url=="1"){
							$(_thisparent).find("td").eq(5).html("停止领取");
						}else{
							$(_thisparent).find("td").eq(5).html("正常");
						}
					}
				}
			})
		}
});


$(document).on("click",".edit_btn",function(){
	var url = $(this).attr("data-url");
	window.open(url);
});
$(document).on("click",".menu_change",function(){
	var _thisparent = $(this).parent().parent();
	var id = $(_thisparent).attr("data-id");
	var num = $(_thisparent).find("td").eq(3).html();
	var nums = num.split("/");
	$("#popnow").val(nums[0]);
	$("#popname").val($(_thisparent).find("td").eq(1).html());
	$("#popid").val(id);
	$("#popall").val(nums[1]);
	$(".dialog_account").show();
});
$(document).on("click",".dialog_ok",function(){
	var id = $("#popid").val();
	var nownum =$("#popnow").val();
	var all = $("#popall").val();
	var changetype =$("#changetype").val();
	var changenum = $("#changenum").val();
	var after = 0;
	var afterall = 0;
	if(changetype == -1){
		if(changenum*1 > nownum*1){
			alert("不能减少的数量大于现在的数量");
			return false;
		}
		after = nownum - changenum;
		afterall = all - changenum;
	}else{
		after = nownum*1 +  changenum*1;
		afterall = all*1 + changenum*1;
	}
	$.ajax({
		url:"json/coupon!changenum.action",
		type:"post",
		data:{num:changenum,tt:changetype,cid:id},
		success:function(html){
			var dat = eval("("+html+")");
			if(dat.success){
				alert("改变数量成功");
				$("tr[data-id='"+id+"']").find("td").eq(3).html(after+"/"+afterall);
			}
		}
	})
	$(".dialog_account").hide();
});
</script>

