	<#include "/WEB-INF/template/admin/header.ftl" />
	<!-- 板块独有内容 -->
	<script>
	$("#flgl").addClass("on");
	</script>
	<style>
		.slevel_li{cursor:pointer}
		.zxmenu_link.on{background-color:#36a65a;}
		.zxmenu_link.on span{color:#fff !important;}
		.access_klist{width:100%; height:100%; margin:0; padding-top:20px;}
		.access_klist ul{}
		.access_klist ul:after{clear:both; content:""; display:block;}
		.access_klist ul li{width:250px !important;}
		.dialog_adddh{text-align:center; color:#333}
		.dialog{border:1px solid #ddd;}
		.addhli{height:52px !important; line-height:52px; padding-top:0 !important; padding-bottom:0 !important;}
		.ggbox{width:100%; position:relative;}
		.ggbox:after{clear: both; content:""; display:block;}
		.ggbox li{margin:5px 0 5px 5px; float:left;}
	</style>
	<div class="zxbody">
		<div class="zxbody_title">分类管理</div>
		<div class="zxbody_menu">
			<div class="zxmenu">
				<div class="zxmenu_left">
					<div class="zxmenu_tit">
						<span>一级分类</span>
						<#if functionitems?index_of(",categoryadd,") gte 0>
						<b class="menu_do menu_add" title="新增一级栏目"></b>
						</#if>
					</div>
					<div class="zxmenu_type">
					<#if list?? && list?size gt 0>
						<#list list as entity>
						<dl>
							<dt id="nodeId${entity.id}" class="zxmenu_bar" data-id="${entity.id}">
								<a href="javascript:;" data-id="${entity.id}" class="zxmenu_link <#if index??><#if entity.id==index>on</#if><#else><#if entity_index==0>on</#if></#if>" >
									<span>${entity.name}</span>
									<strong>
										<#if functionitems?index_of(",categoryedit,") gte 0>
											<b class="menu_do menu_edit flevel_edit" title="编辑" data-id="${entity.id}" ></b>
										</#if>
										<#if functionitems?index_of(",categorydel,") gte 0>
											<b class="menu_do menu_del flevel_del" title="删除" data-id="${entity.id}" data-length="<#if entity.downList??>${entity.downList?size}<#else>0</#if>"></b>
										</#if>
									</strong>
								</a>
							</dt>
						</dl>
						<#if index??>
						<#if entity.id==index><#assign slevel=entity></#if>
						<#else>
						<#if entity_index==0><#assign slevel=entity></#if>
						</#if>
						</#list>
					</#if>
					</div>
				</div>	
				<div class="zxmenu_right">
					<div class="zxmenu_tit">
						<span>二级分类</span>
					</div>
				
					<div class="access_klist">
			  					<ul id="slevel_ul">
				  					<#if slevel??&&(slevel.downList?size gt 0)>
				  						<#list slevel.downList as dh>
											<li class="slevel_li">
												<span>${dh.name}</span>
												<#if functionitems?index_of(",categoryedit,") gte 0>
													<b class="menu_do menu_edit slevel_edit" title="编辑" data-id="${dh.id}" ></b>
												</#if>
												<#if functionitems?index_of(",categorydel,") gte 0>
													<b class="menu_do menu_del slevel_del" title="删除" data-id="${dh.id}" ></b>
												</#if>
											</li>
					 					</#list>
									</#if>
									<#if list?? && list?size gt 0>
									<#if functionitems?index_of(",categoryadd,") gte 0>
									<li class="slevel_li slevel_add" data-id="<#if slevel>${slevel.id}</#if>">
										添加二级分类
									</li>
									</#if>
									</#if>
								</ul>
					</div>
				
			</div>			
		</div>
	</div> 
	
</div>


<!-- 新增、修改、删除弹窗 -->
<#include "/WEB-INF/template/admin/dialog.ftl" />


<script>
//获取分类信息
var clazzView = "json/category!classView.action";


</script>
<!--<script type="text/javascript" src="${base}/static/admin/js/product_menu.js"></script>-->
<script type="text/javascript">
$(document).on("click",".zxmenu_bar",function(){
	$(".zxmenu_link").removeClass("on");
	$(this).find("a").addClass("on");
	$(".slevel_li").remove();
	var id = $(this).attr("data-id");
	
	$.ajax({
		url:"json/category!getChildLevel.action",
		type:"post",
		data:{id:id},
		success:function(data){
			var data = eval("("+data+")");
			var html = "";
			for(var i=0;i<data.length;i++) {
				html += '<li class="slevel_li"><span>'+data[i].name+'</span>'+
						'<b class="menu_do menu_edit slevel_edit" title="编辑" data-id="'+data[i].id+'"></b>'+
						'<b class="menu_do menu_del slevel_del" title="删除" data-id="'+data[i].id+'"></b></li>'
					
				
			}
			html += '<li class="slevel_li slevel_add" data-id="'+id+'">添加二级分类</li>'
			$("#slevel_ul").html(html);
			
		}
	});
});

// 点击新增一级分类
$(document).on("click",".zxmenu_tit .menu_add", function() {

	
	open_dialog();
	$(".dialog_add").show();
	var index = $(".zxmenu_link.on").attr("data-id");
	$("#parentid").val(index);
	// 存放新增还是修改
	$("#addOrEdit").val('add1');

	$(".dialog_add .dialog_head b").html('新增栏目');

});

// 点击新增二级分类
$(document).on("click",".slevel_add", function() {
	//获取父类id
	var cid = $(this).attr("data-id");
	$("#inputId").val(cid);
	var index = $(".zxmenu_link.on").attr("data-id");
	$("#parentid").val(index);
	// 存放新增还是修改
	$("#addOrEdit").val('add2');

	open_dialog();
	$(".dialog_add").show();

});



// 确定新增和修改
$(".dialog_add .dialog_ok").live("click", function() {

	var inputId = $("#inputId").val();
	var addPic = $("#addPic").val();
	var addName = $("#addName").val();
	var addInfo = $("#addInfo").val();
	var addRank = $("#addRank").val();
	var parentid = $("#parentid").val();
	if (!addName) {
		boxalert('栏目名称不能为空');
		$("#addName").focus();
		return false;
	}

	var addOrEdit = $("#addOrEdit").val();
	
	// 新增一级分类，不需要父级cid
	if (addOrEdit == "add1") {
		inputId = null;
	}


	// 提交加载中开启
	$("#loading").show();
	
	$.ajax({
		url : "json/category!saveProductClass.action?index="+parentid,
		type : "post",
		data : {
			"cid" : inputId,
			"displayName" : addName,
			"picUrl" : addPic,
			"intro" : addInfo,
			"orderById" : addRank,
			"addOrEdit" : addOrEdit
			
			
		},
		success : function(data) {
			// 提交加载中关闭
			$("#loading").hide();
			var data = eval("("+data+")");
			if (data.success) {
				// 火狐必须清空输入框
				close_dialog();
				boxalert("提交成功！");

				// 重新初始化
				location.href = data.url;

			} else {
				boxalert("提交失败！");
			}
		}
	});

});

// 点击修改一级分类
$(document).on("click",".flevel_edit",function() {


	// 获取分类信息
	var cid = $(this).attr("data-id");
	$("#inputId").val(cid);
	$("#parentid").val(cid);
	clazzInfo(cid);

	// 存放新增还是修改
	$("#addOrEdit").val('edit1');
	open_dialog();
	$(".dialog_add").show();

	$(".dialog_add .dialog_head b").html('修改栏目');

});

// 点击修改二级分类
$(document).on("click",".slevel_edit",function(){
	var cid = $(this).attr("data-id");
	$("#inputId").val(cid);
	var index = $(".zxmenu_link.on").attr("data-id");
	$("#parentid").val(index);
	// 存放新增还是修改
	$("#addOrEdit").val('edit2');
	clazzInfo(cid);
	open_dialog();
	$(".dialog_add").show();

	$(".dialog_add .dialog_head b").html('修改栏目');
		
});

// 点击删除一级分类
$(document).on("click",".flevel_del", function() {

	// 该分类id
	var cid = $(this).attr("data-id");
	var length = $(this).attr("data-length");
	$("#inputId").val(cid);
	$("#parentid").val(cid);
	// 存放一级还是二级
	open_dialog();

	// 下面是否有二级分类
	if (length > 0) {
		// 有二级，不能删除
		$(".dialog_delete").show();
	} else {
		// 没有二级，是否有内容
		haveContentJs(cid,"flevel");

	}

});

// 点击删除二级分类
$(document).on("click",".slevel_del" ,function() {

	// 该分类id
	var cid = $(this).attr("data-id");
	$("#inputId").val(cid);
	var index = $(".zxmenu_link.on").attr("data-id");
	$("#parentid").val(index);
	open_dialog();

	// 是否有内容
	haveContentJs(cid,"slevel");

});

// 不能删除有内容！！！！！！的分类
$(".dialog_delete .dialog_ok").live("click", function() {
	close_dialog();
});

// 确定删除没内容的分类
$(".dialog_confirm .dialog_ok").live("click", function() {

	// 该分类id
	var cid = $("#inputId").val();
	var parentid = $("#parentid").val();
	// 提交加载中开启
	$("#loading").show();

	$.ajax({
		url : "json/category!deleteCoumn.action?index="+parentid,
		type : "post",
		data : {
			"cid" : cid
		},
		success : function(data) {

			// 提交加载中关闭
			$("#loading").hide();
			var data = eval("("+data+")");
			if (data.success) {

				close_dialog();
				boxalert("删除成功");
				// 重新初始化
				location.href = data.url;

			} else {
				boxalert("删除失败");
			}
		}

	});

});

// 发送请求获取要修改的分类信息
function clazzInfo(clazzid) {

	$.ajax({
		url : clazzView,
		type : "post",
		data : {
			"cid" : clazzid
		},
		dataType : "json",
		success : function(json) {

			// 葆婴查看密码

			$("#inputId").val(json.cid);
			$("#addName").val(json.displayName);
			$("#addInfo").val(json.intro);
			$("#addRank").val(json.orderById);
			if (json.picUrl != "") {
				$("#avatar1").attr("src", json.picUrl);
				$("#addPic").val(json.picUrl);
			}
		}
	});
}

// 判断该分类是否有内容
function haveContentJs(cid,level) {
	var fid = 0;
	var sid = 0;
	if(level=="flevel") {
		fid = cid;
	}
	if(level=="slevel") {
		sid = cid;
	}
	
	$.ajax({
		url : "json/product!totalNum.action",
		type : "post",
		data : {slevel:sid,flevel:fid},
		success : function(data){
			
			var total = eval("("+data+")").total;
			if(total>0) {
				//有内容，不能删除
				$(".dialog_delete").show();
			}else {
				// 没内容，需要确认
				$(".dialog_confirm").show();
			}
		}
	});

}

</script>

