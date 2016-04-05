<#include "/WEB-INF/template/admin/header.ftl" />
<script src="${base}/static/admin/js/jquery.page-noajax.js"></script>
	<!-- 板块独有内容 -->
	<script>
	$("#wdzy").addClass("on");
	</script>
	<div class="zxbody" style="position:relative;">
		<div style="font-size:20px;">我的管理员</div><br/>
		<#if functionitems?index_of(",staffadd,") gte 0>
			<div class="access_kright">
				<a href="admin!input.action" class="access_btn" id="addkd">
					<span><img src="${base}/static/admin/img/img_edit.png"></span>
					<span>添加员工账号</span>
				</a>
			</div>
		</#if>
		<br/>
		<div class="extend_list">
			<table cellspacing="0" cellpadding="0" width="100%" class="extend_table" id="table">
				<tr>
			        <th width="100">姓名</th>
			        <th width="120">电话</th>
			        <th width="80">职务</th>
			        <th width="160">权限</th>
					<th width="50">操作</th>
    			</tr>
				<#list list as admin>
    			<tr>
					<td>${admin.name}</td>
					<td>${admin.phone}</td>
					<td>${admin.position}</td>
					<td>
						<#if admin.functionitems?index_of(",webinfo,") gte 0>网站配置.</#if>
						<#if admin.functionitems?index_of(",ad,") gte 0>首页管理.</#if>
						<#if admin.functionitems?index_of(",kuaidi,") gte 0>快递公司.</#if>
						<#if admin.functionitems?index_of(",member,") gte 0>会员等级.</#if>
						<#if admin.functionitems?index_of(",shop_form,") gte 0>店铺审核.</#if>
						<#if admin.functionitems?index_of(",customer,") gte 0>用户管理.</#if>
						<#if admin.functionitems?index_of(",shop,") gte 0>店铺管理.</#if>
						<#if admin.functionitems?index_of(",country,") gte 0>国家信息管理.</#if>
						<#if admin.functionitems?index_of(",brand,") gte 0>商城品牌管理.</#if>
						<#if admin.functionitems?index_of(",myshop,") gte 0>我的店铺.</#if>
						<#if admin.functionitems?index_of(",stafflist,") gte 0>我的管理员.</#if>
						<#if admin.functionitems?index_of(",product,") gte 0>自营商品管理.</#if>
						<#if admin.functionitems?index_of(",coupon,") gte 0>优惠券管理.</#if>
						<#if admin.functionitems?index_of(",order,") gte 0>订单管理.</#if>
					</td>
					<td>
					       
						<#if functionitems?index_of(",staffedit,") gte 0>
							<a href="admin!edit.action?id=${admin.id}"><b class="menu_do menu_edit" title="修改"></b></a>
							<b data-id="${admin.id}" class="menu_do menu_del" title="删除"></b>&nbsp;
						<#else>
							无权限
						</#if>
						
					</td>
				</#list>	
			</table>
		</div>
		<div class="zxbody_page">
			<div class="showPage" id="showPage">
			</div>
		</div>
	</div>
</div>
<script>
$(".menu_del").bind("click", function(){
		
		if(confirm("是否删除快递信息？")){
			var id= $(this).attr("data-id");
			alert(id);
			var _this = $(this);
			$.ajax({
				url: "json/admin!delete.action",
				data:{id:id},
				async: false,
				type: "post",
				success: function(data){
					if(data == "success") {
						_this.parent().parent().remove();
						boxalert("删除成功！");				
					} else {
						boxalert("删除失败！");
					}
				}
			});	
		}
		
	});

$("#showPage").createNoajaxPage({
				dataTotal:${tn}, //数据条数
				pageCount: ${size}, //总页数
				current: ${pn}, //当前页
				backFn: function(pn){
					//单击回调方法，pn是当前页码
					//获取列表数据
					getContentList(cid, pn);
					
				}
			});	
</script>
