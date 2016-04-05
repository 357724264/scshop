<#include "/WEB-INF/template/admin/header.ftl" />	
	

	  
		

	<!-- 板块独有内容 -->
	<script>
	$("#djgl").addClass("on");
	</script>
	<link rel="stylesheet" type="text/css" href="${base}/static/admin/css/wxmenu.css" />
	<script type="text/javascript" src="${base}/static/admin/js/wxmenu.js"></script>
	
	<div class="zxbody">
		<div class="access_menu">
			<div style="font-size:20px;">会员等级制度管理</div><br/>
			<div class="access_body">
				<div class="access_kright">
					<a href="javascript:;" class="access_btn" id="addkd">
						<span><img src="${base}/static/admin/img/img_edit.png"></span>
						<span>添加会员制度</span>
					</a>
				</div>
				<div class="access_klist">
					<ul>
						<#if list?? && list?size gt 0>
							<#list list as obj>
								<li data-id="${obj.id}" data-name="${obj.name}" data-orderbyid="${obj.orderbyid}" data-mixpoint="${obj.mixpoint}" data-maxpoint="${obj.maxpoint}" data-note="${obj.note}" >
									<span>${obj.name}  (${obj.mixpoint}~${obj.maxpoint})</span>
									<a href="javascript:;"><b class="menu_do menu_edit" title="编辑"></b></a>
									<b class="menu_do menu_del" title="删除"></b>
								</li>
							</#list>
						<#else>
							<li style=" text-align:center;"><a >未设置会员等级（请点击添加）</a></li>
						</#if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 弹出层 -->
<div class="dialog dialog_extend dialog_add">
<form id='form1' action="">
	<div class="dialog_head">
		<span class="menu_do menu_close"></span>
		<b>会员制度添加</b>
	</div>
	<div class="dialog_body">
		
			<table cellspacing="0" cellpadding="0" width="100%" class="dia_table">
				<tr>
					<td class="dia_ltd">等级名称：</td>
					<td><input placeholder="请填写快递标识"  type="text" class="dia_inp" id="name" name="name" value=""></td>
				</tr>
				<tr>
					<td class="dia_ltd">等级排序：</td>
					<td><input placeholder="请填写等级排序"  type="text" class="dia_inp" id="orderbyid" name="orderbyid" value=""></td>
				</tr>
				<tr>
					<td class="dia_ltd">该等级最小值：</td>
					<td><input placeholder="请填写该等级最小值"  type="text" class="dia_inp" id="mixpoint" name="mixpoint" value=""></td>
				</tr>
				<tr>
					<td class="dia_ltd">该等级最大值：</td>
					<td><input placeholder="请填写该等级最大值"  type="text" class="dia_inp" id="maxpoint" name="maxpoint" value=""></td>
				</tr>
				<tr>
					<td class="dia_ltd">等级说明：</td>
					<td><input placeholder="请填写该等级说明"  type="text" class="dia_inp" id="note" name="note" value=""></td>
				</tr>
			</table>
		
	</div>
	<div class="dialog_foot">
		<button type="button" class="dia_btn dialog_no">取消</button>
		<button type="button" id="addMember" class="dia_btn dialog_ok">确定</button>
	</div>
	</form>
</div>
<!-- 修改弹出层 -->
<div class="dialog dialog_extend dialog_edit">
<form id='form1' action="">
	<div class="dialog_head">
		<span class="menu_do menu_close"></span>
		<b>会员制度编辑</b>
	</div>
	<div class="dialog_body">
		
			<table cellspacing="0" cellpadding="0" width="100%" class="dia_table">
				
					<input placeholder="请填写快递标识"  type="hidden" class="dia_inp" id="memberId" name="name" value="">
				
					<td class="dia_ltd">等级名称：</td>
					<td><input placeholder="请填写快递标识"  type="text" class="dia_inp" id="name2" name="name" value=""></td>
				</tr>
				<tr>
					<td class="dia_ltd">等级排序：</td>
					<td><input placeholder="请填写等级排序"  type="text" class="dia_inp" id="orderbyid2" name="orderbyid" value=""></td>
				</tr>
				<tr>
					<td class="dia_ltd">该等级最小值：</td>
					<td><input placeholder="请填写该等级最小值"  type="text" class="dia_inp" id="mixpoint2" name="mixpoint" value=""></td>
				</tr>
				<tr>
					<td class="dia_ltd">该等级最大值：</td>
					<td><input placeholder="请填写该等级最大值"  type="text" class="dia_inp" id="maxpoint2" name="maxpoint" value=""></td>
				</tr>
				<tr>
					<td class="dia_ltd">等级说明：</td>
					<td><input placeholder="请填写该等级说明"  type="text" class="dia_inp" id="note2" name="note" value=""></td>
				</tr>
			</table>
		
	</div>
	<div class="dialog_foot">
		<button type="button" class="dia_btn dialog_no">取消</button>
		<button type="button" id="editMember" class="dia_btn dialog_ok">确定</button>
	</div>
	</form>
</div>
<script type="text/javascript" src="${base}/static/admin/js/yanzheng.js"></script>
<script>
$(function(){
		
		    	    
		    //新增 提交，最终验证。
		     $('#addMember').click(function(){
		          	var name = $("#name").val();
					var orderbyid = $("#orderbyid").val();
					var mixpoint = $("#mixpoint").val();
					var maxpoint = $("#maxpoint").val();
					var note = $("#note").val();
					if(name==""){
					   boxalert("必须填写等级名称");
					   return;
					}
					if(!orderbyid.match(/^\d+$/)){
					   boxalert("等级排序需是正整数");
					   return;
					}
					if(!mixpoint.match(/^\d+$/)){
					   boxalert("等级最小值为正整数");
					   return;
					}
					if(!maxpoint.match(/^\d+$/)){
					   boxalert("等级最大值为正整数");
					   return;
					}
					$.ajax({
						url:"json/member!save.action",
						data:{
							name:name,
							orderbyid:orderbyid,
							mixpoint:mixpoint,
							maxpoint:maxpoint,
							note:note
						},
						type:"post",
						success:function(html){
							window.location.href="member!list.action";
						}
					})
		     });
		     
	
		     
		     //修改 提交，最终验证。
		     $('#editMember').click(function(){
		        	var id = $("#memberId").val();
					var name = $("#name2").val();
					var orderbyid = $("#orderbyid2").val();
					var mixpoint = $("#mixpoint2").val();
					var maxpoint = $("#maxpoint2").val();
					var note = $("#note2").val();
					if(name==""){
					   boxalert("必须填写等级名称");
					   return;
					}
					if(!orderbyid.match(/^\d+$/)){
					   boxalert("等级排序需是正整数");
					   return;
					}
					if(!mixpoint.match(/^\d+$/)){
					   boxalert("等级最小值为正整数");
					   return;
					}
					if(!maxpoint.match(/^\d+$/)){
					   boxalert("等级最大值为正整数");
					   return;
					}
					$.ajax({
						url:"json/member!edit.action",
						data:{
							id:id,
							name:name,
							orderbyid:orderbyid,
							mixpoint:mixpoint,
							maxpoint:maxpoint,
							note:note
						},
						type:"post",
						success:function(html){
							window.location.href="member!list.action";
						}
					})
		     });
		     
		})


$(function(){
	$("#addkd").bind("click",function(){
		$("#name").val("");
		$("#orderbyid").val("");
		$("#mixpoint").val("");
	 	$("#maxpoint").val("");
	 	$("#note").val("");
		$(".dialog_add").show();
	})
	
	
	$(".menu_edit").bind("click",function(){
		var parent = $(this).parent().parent();
		var memberId = $(parent).attr("data-id");
		var name = $(parent).attr("data-name");
		var orderbyid = $(parent).attr("data-orderbyid");
		var mixpoint = $(parent).attr("data-mixpoint");
		var maxpoint = $(parent).attr("data-maxpoint");
		var note = $(parent).attr("data-note");
		$("#memberId").val(memberId);
		$("#name2").val(name);
		$("#orderbyid2").val(orderbyid);
	 	$("#mixpoint2").val(mixpoint);
	 	$("#maxpoint2").val(maxpoint);
	 	$("#note2").val(note);
	 	$(".dialog_edit").show();
	});
	
	$(".menu_del").bind("click", function(){
		
		if(confirm("是否删除快递信息？")){
			var id= $(this).parent().attr("data-id");
			var _this = $(this);
			$.ajax({
				url: "json/member!delete.action",
				data:{"id":id},
				async: false,
				type: "post",
				success: function(data){
					if(data == "success") {
						_this.parent().remove();
						boxalert("删除成功！");				
					} else {
						boxalert("删除失败！");
					}
				}
			});	
		}
		
	});
})
</script>
