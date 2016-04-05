<#include "/WEB-INF/template/admin/header.ftl" />
	<!-- 板块独有内容 -->
	<script>
	$("#yhgl").addClass("on");
	</script>
	<div class="zxbody" style="position:relative;">
		<div class="extend_tab" align="center">
			<span id="tab1" onclick="window.location.href='agentbill!list.action'" <#if !tt??>class="on selected"</#if>>全部代理</span>
			<span id="tab0" onclick="window.location.href='agentbill!list.action?tt=0'" <#if tt==0>class="on selected"</#if>>申请中</span>
			<span id="tab1" onclick="window.location.href='agentbill!list.action?tt=1'" <#if tt==1>class="on selected"</#if>>已通过</span>
			<span id="tab2" onclick="window.location.href='agentbill!list.action?tt=-1'" <#if tt==-1>class="on selected"</#if> >未通过</span>
		</div>
		<div class="extend_star">
			<span>&nbsp;</span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
<script>
var pn1=1;
var pn2=1;
var pn3=3;

function getQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
}

$(function(){
	var cid = getQueryString("cid");
	showPage(cid, 1);		
	
	//提现跳转
	var tab = getQueryString("tab");
	if(tab){
		f(tab);
	}
	
});
	
function getContentList(cid, pn){
	var url = "agentbill!jsonlist.action";
	var table = "table";
	$.ajax({
		url:url,
		type: "post",
		data:{"pn":pn,tt:"${tt!}"},
		async:false,
		success:function(html){
			$("#"+table).html(html);
		}
	});
	
}


	
//生成分页
function showPage(cid, pn){
	var url = "agentbill!totalNum.action";
	var showpage = "showPage";
	if(!pn) pn=1;

	$.ajax({
		url: url,
		type:"post", 
		data:{tt:"${tt}"},
		dataType: "json",
		async:false,
		success:function(dat){
			//计算页数
			var pageCount = Math.ceil(dat.total/dat.size);
			if(pageCount < pn){
				pn=pageCount;
			}
			if(dat.total !=0){
			//分页
			$("#"+showpage).createPage({
				dataTotal: dat.total, //数据条数
				pageCount: pageCount, //总页数
				current: pn, //当前页
				backFn: function(pn){
					//单击回调方法，pn是当前页码
					//获取列表数据
					getContentList(cid, pn);
					
				}
			});
			}
<!--			//获取列表数据
			getContentList(cid, pn);
-->			
		}
		
	});

	

}
</script>
