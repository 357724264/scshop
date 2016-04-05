<#include "/WEB-INF/template/admin/header.ftl" />	
	
	<!-- 板块独有内容 -->
	<script>
	$("#yhgl").addClass("on");
	</script>
	<link rel="stylesheet" type="text/css" href="${bases}/static/admin/css/wxmenu.css" />
	<script type="text/javascript" src="${base}/static/admin/js/wxmenu.js"></script>
	<div class="zxbody">
		<div class="zxbody_title zxbody_title2">
			<a href="javascript:history.back();" class="zxback">
				<img src="${base}/static/admin/img/do_back.png">
			</a>
			代理等级设置
		</div>
		<div class="access_menu">
			<div class="access_body">
				<#if functionitems?index_of(",agentadd,") gte 0><!--是否有新增的权限-->
					<div class="access_kright">
						<a href="javascript:;" class="access_btn" id="addkd">
							<span><img src="${base}/static/admin/img/img_edit.png"></span>
							<span>添加代理等级</span>
						</a>
					</div>
				</#if>
				<div class="access_klist">
					<ul>
						<#if list?? && list?size gt 0>
							<#list list as age>
								<li data-id="${age.id}" d data-name="${age.name}" >
									<span>${age.name}</span>
									<#if functionitems?index_of(",agentadd,") gte 0><!--是否有编辑的权限-->
										<a href="javascript:;"><b class="menu_do menu_edit" title="编辑"></b></a>
									</#if>
									<#if functionitems?index_of(",agentadd,") gte 0><!--是否有删除的权限-->
										<b class="menu_do menu_del" title="删除"></b>
									</#if>
								</li>
							</#list>
						</#if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 提现账户弹出层 -->
<div class="dialog dialog_extend dialog_account">
	<div class="dialog_head">
		<span class="menu_do menu_close"></span>
		<b>代理等级编辑</b>
	</div>
	<div class="dialog_body">
			<table cellspacing="0" cellpadding="0" width="100%" class="dia_table">
			<!-- 
				<tr>
					<td class="dia_ltd">等级标识：</td>
					<td><input placeholder="请填写代理等级标识" type="text" class="dia_inp" name="aid" value=""> </td>
				</tr>
			-->
				<tr id="aid">
					<td class="dia_ltd">等级名称：</td>
					<td><input placeholder="请填写代理等级名称" type="text" class="dia_inp" id="aname" name="aname" value=""></td>
				</tr>
				
			</table>
	</div>
	<div class="dialog_foot">
		<button type="button" class="dia_btn dialog_no">取消</button>
		<button type="button" class="dia_btn dialog_ok">确定</button>
	</div>
</div>

<script>
$(function(){
	$("#addkd").bind("click",function(){
		$("#aid").val("");
		$("#aname").val("");
	 	$("#id").removeAttr("readonly");
		$(".dialog_account").show();
	})
	
	$(".dialog_ok").bind("click",function(){
		var aid = $("#aid").val();
		var aname = $("#aname").val();
		$.ajax({
			url:"agent!edit.action",
			data:{id:aid,name:aname},
			type:"post",
			success:function(html){
				window.location.href="agent!list.action";
			}
		})
	});
	$(".menu_edit").bind("click",function(){
		var parent = $(this).parent().parent();
		var id = $(parent).attr("data-id");
		var name = $(parent).attr("data-name");
		$("#aid").val(id);
		$("#aname").val(name);
	 	$(".dialog_account").show();
	});
	$(".menu_del").bind("click", function(){
		if(confirm("删除后不能恢复，确定删除吗")){
			var id= $(this).parent().attr("data-id");
			var _this = $(this);
			$.ajax({
				url: "agent!delete.action",
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
