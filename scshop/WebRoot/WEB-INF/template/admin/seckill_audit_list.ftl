<#include "/WEB-INF/template/admin/header.ftl" />
<script src="${base}/static/admin/js/jquery.page-noajax.js"></script>
	<!-- 板块独有内容 -->
	<script>
	$("#yhhd").addClass("on");
	</script>
	<div class="zxbody" style="position:relative;">
		
			<div class="extend_tab">
				<span id="tab1" class="stat_tab on selected"  data-stat="" >全部申请</span>
				<span id="tab1" class="stat_tab" data-stat="0" >未审核</span>
				<span id="tab1" class="stat_tab" data-stat="1" >已通过</span>
				<span id="tab2" class="stat_tab" data-stat="-1">未通过</span>
				<span id="tab2" class="stat_tab" data-stat="2">已取消</span>
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
$(document).on("click",".stat_tab",function(){
	var stat = $(this).attr("data-stat");
	$(this).siblings().removeClass("on selected");
	$(this).addClass("on selected");
	showPage(1,stat);		
});

$(function(){
	
	showPage(1,"");		
	
});
	
function getContentList(pn,stat){
	var url = "json/seckill!auditList.action";
    if(pn==0){
        pn=1;
    }
	$.ajax({
		url:url,
		type: "post",
		data:{pn:pn,stat:stat},
		async:false,
		success:function(html){
			$("#table").html(html);
		}
	});
	
}
	
//生成分页
function showPage(pn,stat){
	var url = "json/seckill!auditTotalNum.action";
	var showpage = "showPage";
	if(!pn) pn=1;

	$.ajax({
		url: url,
		type:"post", 
		data:{pn:pn,stat:stat},
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
				backFn: function(pn,stat){
					//单击回调方法，pn是当前页码
					//获取列表数据
					getContentList(pn,stat);
					
				}
			});
			//获取列表数据
			getContentList(pn,stat);
		}
	});
}
</script>
