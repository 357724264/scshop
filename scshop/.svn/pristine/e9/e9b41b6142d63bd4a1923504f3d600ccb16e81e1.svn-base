<#include "/WEB-INF/template/admin/header.ftl" />
<style type="text/css">
	.menu_jf{background: url(${base}/static/admin/img/iconfont-jifen.png) no-repeat; background-size:20px 20px;}
	.menu_chakan { background: url(/static/admin/img/iconfont-chakan.png) no-repeat; background-size: 22px 22px;}
	.menu_xiaoxituisong { background: url(/static/admin/img/iconfont-xiaoxituisong.png) no-repeat; background-size: 22px 22px;}

</style>
<script src="${base}/static/admin/js/jquery.page-noajax.js"></script>
<script type="text/javascript" src="${base}/static/admin/js/wxmenu.js"></script>
	<!-- 板块独有内容 -->
	<script>
	$("#yhgl").addClass("on");
	</script>
	<div class="zxbody" style="position:relative;">
		
		<div class="extend_tab" align="right" >
			<#if functionitems?index_of(",agentbill,") gte 0>
				<span id="tab1" onclick="window.location.href='agentbill!list.action'" >代理审核</span>
			</#if>
			<#if functionitems?index_of(",agent,") gte 0>
				<span id="tab1" onclick="window.location.href='agent!list.action'" >代理等级管理</span>
			</#if>
		</div>
		<div class="extend_star">
			<span>&nbsp;</span>
			<select id="hasnote">
				<option value>选择备注</option>
				<option value="1" <#if hasnote??&&hasnote==1>selected</#if>>有备注</option>
				<option value="0" <#if hasnote??&&hasnote==0>selected</#if>>无备注</option>
			</select>
			<input type="text" id="search" attr-pro="" aria-controls="sample-table-2" value="${keyword!}" placeholder="输入手机号">
			<input id="searchbtn" type="button" value="搜索一下">
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
<!-- 遮罩层 -->
<div class="mask"></div>
<!-- 增减积分 -->
<div class="dialog dialog_extend dialog_account increment_dia">
			<div class="dialog_head">
				<span class="menu_do menu_close"></span>
				<b id="title">增减积分</b>
			</div>
			<input id="alter_id" type="hidden"/>
			<div class="dialog_body">
				<table cellspacing="0" cellpadding="0" width="100%" class="dia_table">
				
					<tr>
						<td class="dia_ltd">现有积分：</td>
						<td><input    id="nowpoint"  value="" readOnly="true"></input></td>
					</tr>
					<tr>
						<td class="dia_ltd">输入加减分数：</td>
						<td><input    id="point"  value=""></input></td>
					</tr>
					
				</table>
			</div>
			
			<div class="dialog_foot">
				<button type="button" class="dia_btn dialog_no increment_no">减积分</button>
				<button type="submit" class="dia_btn dialog_ok increment_ok">加积分</button>
			</div>
</div>

<!-- 推送 -->
<div class="dialog dialog_extend dialog_account push">
			<div class="dialog_head">
				<span class="menu_do menu_close"></span>
				<b id="title">推送</b>
				<b id="userid"></b>
			</div>
			<input id="alter_id" type="hidden"/>
			<div class="dialog_body">
				<table cellspacing="0" cellpadding="0" width="100%" class="dia_table">
				
					<tr>
					<td class="dia_ltd">标题：</td>
					<td><input placeholder=""  type="text" class="dia_inp" id="tag"  value=""></td>
				</tr>
				<tr>
					<td class="dia_ltd">内容：</td>
					<td><textarea cols="40" rows="6" id="content" > </textarea></td>
				</tr>
				
					
				</table>
			</div>
			
			<div class="dialog_foot">
				<button type="submit" class="dia_btn dialog_ok push_ok">确定</button>
			</div>
</div>
<script>

//推送
$(document).on("click",".push_btn",function(){
	var userid = $(this).attr("data-id");
	$('#userid').text(userid);
	$(".push").show();
});

$(document).on("click",".push_ok",function(){
    var userid = $.trim($('#userid').text());
    var title = $('#tag').val();
	var content =  $('#content').val();
	$.ajax({
		url : 'json/shop!pushmessage.action',
		type : 'post',
		data : {userid:userid,title:title,content:content,},
		success : function(ret){
		var data = eval("("+ret+")");
			if(data.success){
				$(".push").hide();
			}
		}
	});
});



//增减积分
$(document).on("click",".reply_btn",function(){
	var id = $(this).attr("data-id");
	var point = $('#point_'+id).html();
	$('#nowpoint').val(point);
	$('#alter_id').val(id);
	
	$(".increment_dia").show();
});
//加积分
$(document).on("click",".increment_ok",function(){
	var id = $('#alter_id').val();
	var point_old = $('#point_'+id).html();
	var point_input = $('#point').val();
	var point = parseInt(point_input)+parseInt(point_old);
	var pointtype = 1;
	$.ajax({
		url : 'json/customer!alterpoint.action',
		type : 'post',
		data : {id:id,point:point,oldpoint:point_old,intpoint:point_input,pointtype:pointtype},
		success : function(data){
			var data = eval("("+data+")");
			if(data.success){
				$('#point_'+id).html(point);
				$(".increment_dia").hide();
			}
		}
	});
});
//减积分
$(document).on("click",".increment_no",function(){
	var id = $('#alter_id').val();
	var point_old = $('#point_'+id).html();
	var point_input = $('#point').val();
	var point = parseInt(point_old)-parseInt(point_input);
	var pointtype = 0;
	if(point<0){boxalert("积分不能为负数");  return;}
	$.ajax({
		url : 'json/customer!alterpoint.action',
		type : 'post',
		data : {id:id,point:point,oldpoint:point_old,intpoint:point_input,pointtype:pointtype},
		success : function(data){
			var data = eval("("+data+")");
			if(data.success){
				$('#point_'+id).html(point);
				$(".increment_dia").hide();
			}
		}
	});
});

$(function(){
	showPage(1,"");		
});
	
function getContentList(pn,stat){
	var url = "json/customer!list.action";
	var search=$('#search').val();
	var hasnote=$('#hasnote').val();
    if(pn==0){
        pn=1;
    }
	$.ajax({
		url:url,
		type: "post",
		data:{pn:pn,stat:stat,keyword:search,hasnote:hasnote},
		async:false,
		success:function(html){
			$("#table").html(html);
		}
	});
}

//搜索提交
$(function(){
	var now="";
	$("#searchbtn").bind("click",function(){
		var id=1;
		var pro = $("#search").attr("attr-pro");
		var keyword=$("#search").val();
		var hasnote = $("#hasnote").val();
		//if(keyword == now){
			//return false;
		//}else{
			now = keyword;
		//}
	var data={}, hash;
		if(window.location.href.indexOf('?')>=0){
		var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
		}else{
			hashes = {};
		}
		var url = window.location.href.slice(0,window.location.href.indexOf('?')+1);
		for(var i = 0; i < hashes.length; i++)
		{
			hash = hashes[i].split('=');
			data[hash[0]] = hash[1];
		}
		data["pn"] = id;
		data["ps"]=0;
		data["pro"] = pro;
		data["keyword"] = keyword;
		data["hasnote"] = hasnote;
		var param = "";
		for(var key in data){
			param+=(key+"="+data[key]+"&");
		}
		
		param = param.substring(0,param.length-1);
		if(window.location.href.indexOf('?')>=0){
			window.location.href=url+param;
		}else{
		window.location.href=url+"?"+param;
		}
	
	});
	
})

	
//生成分页
function showPage(pn,stat){
    var keyword = $("#search").val();
    var hasnote =  $("#hasnote").val();
	var url = "json/customer!totalNum.action";
	var showpage = "showPage";
	if(!pn) pn=1;

	$.ajax({
		url: url,
		type:"post", 
		data:{  pn:pn,
				stat:stat,
				keyword:keyword,hasnote:hasnote},
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
