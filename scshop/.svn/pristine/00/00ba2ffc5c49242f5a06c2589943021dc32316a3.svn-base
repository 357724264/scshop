	<#include "/WEB-INF/template/admin/header.ftl" />
	<!-- 板块独有内容 -->
	<script>
	$("#zysp").addClass("on");
	
	
	</script>
	<div class="zxbody">
		<div class="zxbody_title">商城管理</div>
		<div class="zxbody_menu">
			<div class="zxmenu">
				<div class="zxmenu_left">
					<div class="zxmenu_tit">
						<span>商品分类</span>
						<b class="menu_do menu_add" title="新增一级栏目"></b>
					</div>
					<div class="zxmenu_type">
					<#if list?? && list?size gt 0>
						<#list list as entity>
						<dl>
							<dt id="nodeId${entity.id}" class="zxmenu_bar" data-id="${entity.id}" data-canadd="<#if entity.downList?size gt 0>no</#if>">
								<a href="javascript:;" class="zxmenu_link on">
									<span>${entity.name}</span>
									<strong>
										<b class="menu_do menu_add" title="新增二级栏目"></b>
										<b class="menu_do menu_edit" title="编辑"></b>
										<b class="menu_do menu_del" title="删除"></b>
									</strong>
								</a>
							</dt>
							<#if entity.downList?? && entity.downList?size gt 0>
							<#list entity.downList as down>
							<dd id="nodeId${down.id}" class="zxmenu_bar" data-id="${down.id}">
								<a href="javascript:;" class="zxmenu_link">
									<span>${down.name}</span>
									<strong>
										<b class="menu_do menu_edit" title="编辑"></b>
										<b class="menu_do menu_del" title="删除"></b>
									</strong>
								</a>
							</dd>
							</#list>
							</#if>
						</dl>
						</#list>
					</#if>
					</div>
				</div>	
				<div class="zxmenu_right">
					<div class="zxmenu_tit">
						<span>内容管理</span>
						<a href="product!contentProduct">
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


<!-- 新增、修改、删除弹窗 -->
<#include "/WEB-INF/template/admin/dialog.ftl" />


<script>
//获取分类信息
var clazzView = "json/product!classView.action";
//添加或修改分类
var inputClazz = "json/product!saveProductClass.action";
//删除分类
var deleteClazz = "json/product!deleteCoumn.action";
//获取内容列表
var contentList = "json/product!getColumnProduct.action";
//获取内容总数
var totalNum = "json/product!totalNum.action";
//修改内容链接
var contentView = "product!contentProduct.action";
//删除全部选中内容
var deleteAllContent = "json/product!deleteAll";
//删除单条内容
var deleteContent = "json/product!deleteProduct.action";

//标识下载数据的参数类型
var cls = "product";
var tableval = "[{'name':'产品名字','key':'name'},{'name':'价格','key':'price'},{'name':'上架','key':'stat'}]"
var editval = "[{'classname':'paixu','url':'javascript:;','name':'上/下架'}]";
</script>
<script type="text/javascript" src="${base}/static/admin/js/menu.js"></script>
<script type="text/javascript">
$(".menu_paixu").live("click",function(){
	if(confirm("是否修改商品状态？")){
	var id = $(this).parent().parent().attr("data-id");
	if($(this).hasClass("clicked")){
		return false;
	}
	$(this).addClass("clicked");
	var now = $(this).parent().parent().children().eq(3).html();
	var that = $(this);
	$.ajax({
		url:"json/product!changestat.action",
		data:{cid:id},
		type:"post",
		success:function(data){
			if(data=="success"){
				alert("修改状态成功");
				if(now=="是"){
					$(that).parent().parent().children().eq(3).html("否");
				}else{
					$(that).parent().parent().children().eq(3).html("是");
				}
			}
			$(that).removeClass("clicked");
		}
	})
	}
})
</script>

