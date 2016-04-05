	<#include "/WEB-INF/template/admin/header.ftl" />
	<style>
	.zxhead{overflow:visible !important;}
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
	.menu_pl{background: url(${base}/static/admin/img/iconfont-pinglun.png) no-repeat; background-size:20px 20px;}
	.menu_cx{background: url(${base}/static/admin/img/iconfont-cuxiao.png) no-repeat; background-size:20px 20px;}
	.menu_kucun{background: url(${base}/static/admin/img/iconfont-kucun.png) no-repeat; background-size:20px 20px;}
	</style>
	<!-- 板块独有内容 -->
	<script>
	$("#zysp").addClass("on");
	
	
	</script>
	<div class="zxbody">
		<div class="zxbody_title">商城管理</div>
		<div class="zxbody_menu">
			<div class="zxmenu">
				
				<div class="zxmenu">
					<div class="zxmenu_tit">
						<span>产品管理</span>
						<#if functionitems?index_of(",padd,") gte 0>
							<a href="product!contentProduct.action" target="_blank">
								<img class="menu_new" src="${base}/static/admin/img/do_new.png">
							</a>
						</#if>
					</div>
					<div class="zxmenu_middel">
					<span>
						<select id="flevel">
						<option value="0">一级分类</option>
						<#list flevelList as flevel>
							<option value="${flevel.id}">${flevel.name}</option>
						</#list>
						</select>
					</span>
					<span>
						<select id="slevel">
						<option value="0">二级分类</option>
						</select>
					</span>
					
					<span>
						<select id="brandid">
						<option value="0">选择品牌 </option>
						<#if brandList??>
						<#assign letter="0">
						<#list brandList as brand>
							<#if brand.pinyin??&&brand.pinyin?substring(0,1)!=letter>
							<#assign letter=brand.pinyin?substring(0,1)>
							<option disabled="">------------${letter}------------</option>
							</#if>
							<option value="${brand.id}">${brand.name}</option>
							
							
						</#list>
						</#if>
						</select>
					</span>
					<span> 
						<select id="country">
						<option value="">国家 </option>
						<#if countryList??>
						<#list countryList as country>
							<option value="${country.name}">${country.name}</option>
						</#list>
						</#if>
						</select>
					</span>
					<span> 
						<select id="stat">
							<option value="">商品状态 </option>
							<option value="0">上架</option>
							<option value="-1">下架 </option>
							<option value="1">草稿 </option>
						</select>
					</span>
					<span>
						<input type="text" id="keyword" placeholder="搜索商品的名称或编号"/>
					</span>
					
					<input id="search_btn" class="search_btn" type="button" value="搜索" />
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
//var contentList = "json/product!getColumnProduct.action";
var contentList = "json/product!list.action";
//获取内容总数
var totalNum = "json/product!totalNum.action";
//修改内容链接
var contentView = "product!contentProduct.action";
//删除全部选中内容
var deleteAllContent = "json/product!deleteAllContent.action";
//删除单条内容
var deleteContent = "json/product!deleteProduct.action";

//标识下载数据的参数类型
var cls = "product";
var tableval = "[{'name':'序号','key':'index'},{'name':'产品名字','key':'name'},{'name':'价格','key':'price'},{'name':'创建时间','key':'modifydate'},{'name':'上架','key':'stat'}]"
var editval = "[{'classname':'paixu','url':'javascript:;','name':'上/下架'},{'classname':'pl pinglun','url':'javascript:;','name':'评论'}<#if permission==1>,{'classname':'cx apply_btn','url':'javascript:;','name':'申请促销'}</#if>,{'classname':'kucun','url':'javascript:;','name':'库存信息'}]";
</script>
<script type="text/javascript" src="${base}/static/admin/js/product_menu.js"></script>
<script type="text/javascript">

$(document).on("click",".apply_btn",function(){
	var id = $(this).attr("data-id");
	$.ajax({
		url : 'json/seckill!checkStatus.action',
		type : 'post',
		data : {id:id},
		success : function(data){
			var data = eval("("+data+")");
			if(data.success) {
				location.href = data.url;
			}else {
				boxalert(data.msg);
			}
		}
	});
});
//查看评论
$(document).on("click",".pinglun",function(){
	var id = $(this).attr("data-id");
	$.ajax({
		url : 'comment!listid.action',
		type : 'post',
		data : {productid:id},
		success : function(data){
			var data = eval("("+data+")");
			if(data.success) {
				location.href = data.url;
			}
		}
	});
});

$(document).on("click","#search_btn",function(){
	query(1);
});

$(document).on("change","#flevel",function(){
	var id = $(this).val();
	if(id=="0") {
		$("#slevel").html('<option value="0">二级分类</option>');
		return false;
	}
	$.ajax({
		url : 'json/category!getChildLevel.action',
		type : 'post',
		data : {id:id},
		success : function(data){
			var data = eval("("+data+")");
			$("#slevel").html('<option value="0">二级分类</option>');
			for(var i=0;i<data.length;i++) {
				$("#slevel").append('<option value=' + data[i].id + '>' + data[i].name + '</option>')
			}
		}
	
	});
	
});


$(".menu_paixu").live("click",function(){
	if(confirm("是否修改商品状态？")){
	var id = $(this).parent().parent().attr("data-id");
	if($(this).hasClass("clicked")){
		return false;
	}
	$(this).addClass("clicked");
	var now = $(this).parent().parent().children().eq(5).html();
	var that = $(this);
	$.ajax({
		url:"json/product!changestat.action",
		data:{cid:id},
		type:"post",
		success:function(data){
			if(data=="success"){
				boxalert("修改状态成功");
				if(now=="是"){
					$(that).parent().parent().children().eq(5).html("否");
				}else{
					$(that).parent().parent().children().eq(5).html("是");
				}
			}else {
				boxalert(eval("("+data+")").msg);
			}
			$(that).removeClass("clicked");
		}
	})
	}
})

$(document).on("click",".edit_btn",function(){
	var url = $(this).attr("data-url");
	window.open(url);
});
$(document).on("click",".edit_btn",function(){
	var url = $(this).attr("data-url");
	window.open(url);
});

$(document).on("click",".menu_kucun",function(){
	var id = $(this).parent().parent().attr("data-id");
	window.open("inventory!list.action?pid="+id);
});

</script>

