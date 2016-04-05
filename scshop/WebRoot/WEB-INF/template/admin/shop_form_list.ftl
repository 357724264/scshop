<#include "/WEB-INF/template/admin/header.ftl" />
	<!-- 板块独有内容 -->
	<script src="${base}/static/admin/js/jquery.page-noajax.js"></script>
	<script>
	$("#dpsh").addClass("on");
	</script>
	<div class="zxbody" style="position:relative;">
		
			<div class="extend_tab">
				<span id="tab1" onclick="window.location.href='shop_form!list.action'" <#if !tt??>class="on selected"</#if>>全部申请</span>
				<span id="tab1" onclick="window.location.href='shop_form!list.action?tt=0'" <#if tt==0>class="on selected"</#if>>未审核</span>
				<span id="tab1" onclick="window.location.href='shop_form!list.action?tt=1'" <#if tt==1>class="on selected"</#if>>已通过</span>
				<span id="tab2" onclick="window.location.href='shop_form!list.action?tt=-1'" <#if tt==-1>class="on selected"</#if> >未通过</span>
			</div>
			<br>
			<div class="extend_list">
				<table cellspacing="0" cellpadding="0" width="100%" class="extend_table" id="table">
					
				</table>
			</div>
			<div class="zxbody_page">
					<div class="showPage" id="showPage">
					</div>
			</div>
			
	</div>
<script>

$(function(){
	urlinfo=window.location.href;
	len=urlinfo.length;
	offset=urlinfo.indexOf("?");
	newsidinfo=urlinfo.substr(offset,len);
	newsids=newsidinfo.split("=");
	newsid=newsids[1];
	
	showPage(1,newsid);		
	
	var sku = $("#functionitems").val();
	//alert(sku);	
	
});
	
function getContentList(pn,tt){
	var url = "json/shopform!list.action";
    if(pn==0){
        pn=1;
    }
	$.ajax({
		url:url,
		type: "post",
		data:{pn:pn,tt:tt},
		async:false,
		success:function(html){
			$("#table").html(html);
		}
	});
	
}
	
//生成分页
function showPage(pn,tt){
	var url = "json/shopform!totalNum.action";
	var showpage = "showPage";
	if(!pn) pn=1;

	$.ajax({
		url: url,
		type:"post", 
		data:{tt:tt},
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
				backFn: function(pn){
					//单击回调方法，pn是当前页码
					//获取列表数据
					getContentList(pn,tt);
					
				}
			});
			//获取列表数据
			getContentList(pn,tt);
		}
	});
}	
</script>
