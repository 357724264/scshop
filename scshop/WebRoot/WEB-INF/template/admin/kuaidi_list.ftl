<#include "/WEB-INF/template/admin/header.ftl" />	
	
    <script>
	    function edit(){
			var key = $("#key").val();
			var name = $("#name").val();
			var url = $("#url").val();
			var phone = $("#phone").val();
			$.ajax({
				url:"kuaidi!edit.action",
				data:{key:key,name:name,url:url,phone:phone},
				type:"post",
				success:function(html){
					window.location.href="kuaidi!list.action";
				}
			})
		}
		
		
    </script>
	<!-- 板块独有内容 -->
	<script>
	$("#kdgs").addClass("on");
	</script>
	<link rel="stylesheet" type="text/css" href="${base}/static/admin/css/wxmenu.css" />
	<script type="text/javascript" src="${base}/static/admin/js/wxmenu.js"></script>
	
	<div class="zxbody">
		<div class="access_menu">
			<div style="font-size:20px;">快递公司信息管理</div><br/>
			<div class="access_body">
				<#if functionitems?index_of(",kdadd,") gte 0>
					<div class="access_kright">
						<a href="javascript:;" class="access_btn" id="addkd">
							<span><img src="${base}/static/admin/img/img_edit.png"></span>
							<span>添加快递公司</span>
						</a>
					</div>
				</#if>
				<div class="access_klist">
					<ul>
						<#if list?? && list?size gt 0>
							<#list list as obj>
								<li data-id="${obj.keyid}" data-url="${obj.website}" data-name="${obj.name}" data-phone="${obj.phone}">
									<span>${obj.name}</span>
									<#if functionitems?index_of(",kdedit,") gte 0>
										<a href="javascript:;"><b class="menu_do menu_edit" title="编辑"></b></a>
									</#if>
									<#if functionitems?index_of(",kddel,") gte 0>
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
<form id='form1' action="">
	<div class="dialog_head">
		<span class="menu_do menu_close"></span>
		<b>快递公司编辑</b>
	</div>
	<div class="dialog_body">
		
			<table cellspacing="0" cellpadding="0" width="100%" class="dia_table">
				<tr>
					<td class="dia_ltd">快递标识：</td>
					<td><input placeholder="请填写快递标识"  type="text" class="dia_inp" id="key" name="key" value=""></td>
				</tr>
				<tr>
					<td class="dia_ltd">快递公司名称：</td>
					<td><input placeholder="请填写快递公司名称"  type="text" class="dia_inp" id="name" name="name" value=""></td>
				</tr>
				<tr>
					<td class="dia_ltd">快递公司网站：</td>
					<td><input placeholder="请填写快递公司网站"  type="text" class="dia_inp" id="url" name="url" value=""></td>
				</tr>
				<tr>
					<td class="dia_ltd">快递公司电话：</td>
					<td><input placeholder="请填写快递公司电话"  type="text" class="dia_inp" id="phone" name="phone" value=""></td>
				</tr>
			</table>
		
	</div>
	<div class="dialog_foot">
		<button type="button" class="dia_btn dialog_no">取消</button>
		<button type="submit" class="dia_btn dialog_ok">确定</button>
	</div>
	</form>
</div>
<script type="text/javascript" src="${base}/static/admin/js/yanzheng.js"></script>
<script>
$(function(){
			$('#form1 :input').blur(function(){
		         if( $(this).is('#key') ){
		              $(this).required();
		         }
		         if( $(this).is('#name') ){
		            $(this).required();
		         }
		         if( $(this).is('#url') ){
		            $(this).url();
		         }
		         
		         
		    }).keyup(function(){
		       $(this).triggerHandler("blur");
		    }).focus(function(){
		         $(this).triggerHandler("blur");
		    });	
		    	    
		    //提交，最终验证。
		     $('.dialog_ok').click(function(){
		            $("#form1 :input.required").trigger('blur');
		            var numError = $('#form1 .onError').length;
		            if(numError){
		                return false;
		            } 
		            edit()
		     });
		})


$(function(){
	$("#addkd").bind("click",function(){
		$("#key").val("");
		$("#name").val("");
		$("#url").val("");
	 	$("#phone").val("");
	 	$("#key").removeAttr("readonly");
		$(".dialog_account").show();
	})
	
	
	$(".menu_edit").bind("click",function(){
		var parent = $(this).parent().parent();
		var key = $(parent).attr("data-id");
		var name = $(parent).attr("data-name");
		var url = $(parent).attr("data-url");
		var phone = $(parent).attr("data-phone");
		$("#key").val(key);
		$("#name").val(name);
		$("#url").val(url);
	 	$("#phone").val(phone);
	 	$("#key").attr("readonly","readonly");
	 	$(".dialog_account").show();
	});
	$(".menu_del").bind("click", function(){
		
		if(confirm("是否删除快递信息？")){
			var id= $(this).parent().attr("data-id");
			var _this = $(this);
			$.ajax({
				url: "kuaidi!delete.action",
				data:{"key":id},
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
