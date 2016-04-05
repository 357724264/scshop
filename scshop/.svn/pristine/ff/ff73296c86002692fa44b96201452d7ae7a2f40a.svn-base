var pn;
var cid;
var tablevaljson = eval("(" + tableval + ")");

var editvaljson = null;
var ell = 0;
if (editval != null) {
	editvaljson = eval("(" + editval + ")");
	ell = editvaljson.length;
}

var ll = tablevaljson.length;

var nodata = '<tr><td colspan="' + (ll + 2)
		+ '" class="nodata">暂无内容...</td></tr>';
var th = '<tr>' + '<th width="40">&nbsp;</th>';
for ( var i = 0; i < ll; i++) {
	th = th + '<th width="100">' + tablevaljson[i].name + '</th>';
}
th = th + '<th width="90">操作</th></tr>';
$(function() {
	
	// 初始化列表
	initList();
});

// 初始化列表
function initList() {
	var nodeId = getQueryString("nodeId");

	// 从添加新内容返回，置为高亮
	if (nodeId) {

		$("#nodeId" + nodeId).find("a span").click();

	} else {

		// 有一级分类
		if ($(".zxmenu_type").find("dl dt").length > 0
				|| $("#hiddenclazzId").length > 0) {

			if ($("#hiddenclazzId").length < 1) {

				// 有二级分类
				if ($(".zxmenu_type dl").eq(0).find("dd").length > 0) {
					cid = $(".zxmenu_type dl").eq(0).find("dd").data("id");
					$(".zxmenu_type dl").eq(0).find("dd").eq(0).addClass("on");
				} else {
					cid = $(".zxmenu_type dl").eq(0).find("dt").data("id");
					$(".zxmenu_type dl").eq(0).find("dt").addClass("on");
				}
				$("#clazzId").val(cid);
			} else {
				cid = $("#clazzId").val();
			}

			// 分页
			showPage(cid);
			// 添加新内容拼接链接
			addNewInput();

		} else {

			var li = th;
			li += nodata;
			$(".zxmenu_table").html(li);
			$(".zxmenu_left .zxmenu_tit").append('<div class="do_tip"></div>');

		}
		// 没有分类栏目，则提示不能新增内容
		noAddInput();

	}

}

// 点击下载数据
$(".zxdown_btn").live("click", function() {

	// 下载中显示
	open_download();

	// 下载数据
	$.ajax({
		url : "syn",
		type : "post",
		data : {
			"cls" : cls
		},
		async : false,
		success : function(json) {

			// 下载中隐藏
			close_download();

			if (json == "success") {
				boxalert("下载成功");
				// 重新初始化
				goReload();
			} else {
				boxalert("下载失败，请重新下载");
			}
		}
	});

});

// 点击分类
$(".zxmenu_bar span").live("click", function() {

	var zxmenu_bar = $(this).parent().parent();
	var cid = zxmenu_bar.data("id");
	var canadd = zxmenu_bar.data("canadd");

	// 有二级分类，不能高亮
	if (canadd == "no") {
		return false;
	}

	// 空间专用
	if (!cid) {
		boxalert('请先添加二级分类');
		return false;
	}

	$("#clazzId").val(cid);

	// 分页
	showPage(cid);

	$(".zxmenu_bar").removeClass("on");
	zxmenu_bar.addClass("on");

	// 添加新内容拼接链接
	addNewInput();

});

// 获取列表数据
function getContentList(cid, pn) {

	// 针对自定义功能插件
	var felvelId = $("#felvelId").val();

	// 提交加载中开启
	$("#loading").show();

	$.ajax({
				url : contentList,
				type : "post",
				dataType : "json",
				data : {
					"nodeId" : cid,
					"pn" : pn
				},
				success : function(json) {

					// 提交加载中关闭
					$("#loading").hide();
					var length = json.length;
					var li = th;
					if (length != 0) {
						for (i = 0; i < length; i++) {
							// 针对自定义功能插件
							if (felvelId) {
								var editBtn = '<a href="' + contentView
										+ '?felvelId=' + felvelId + '&cid='
										+ json[i].cid + '">';
							} else {
								var editBtn = '<a href="' + contentView
										+ '?cid=' + json[i].cid + '">';
							}
							li += '<tr data-id="'
									+ json[i]["cid"]
									+ '">'
									+ '<td class="center"><input type="checkbox" class="zxmenu_checkbox"></td>'
							for ( var j = 0; j < ll; j++) {

								li = li + '<td>' + json[i][tablevaljson[j].key]
										+ '</td>';
							}
							li += '<td>'
									+ editBtn
									+ '<b class="menu_do menu_edit" title="编辑"></b>'
									+ '</a>'
									+ '<b class="menu_do menu_del" title="删除"></b>';
							if (ell > 0) {
								for ( var k = 0; k < ell; k++) {
									li += '<b class="menu_do menu_'
											+ editvaljson[k].classname
											+ '" title="'
											+ editvaljson[k].name
											+ '" onclick="'
											+ (editvaljson[k].url == "javascript:;" ? "javascript:void(0)"
													: ("window.location.href=\'"
															+ editvaljson[k].url
															+ "?id="
															+ json[i].cid+"\'"))
											+ '"></b>';
								}

							}

							li += '</td>' + '</tr>';

						}
					} else {
						li += nodata;
					}

					$(".all_checkbox").removeAttr("checked");
					$(".zxmenu_table").html(li);

				}
			});
}

// 生成分页
function showPage(cid, pn) {

	if (!pn)
		pn = 1;

	// 提交加载中开启
	$("#loading").show();

	$.ajax({
		url : totalNum,
		type : "post",
		dataType : "json",
		data : {
			"nodeId" : cid
		},
		success : function(dat) {

			// 提交加载中关闭
			$("#loading").hide();

			if ($(".zxmenu_right .zxmenu_tit span b").length > 0) {
				$(".zxmenu_right .zxmenu_tit span b").html(
						'(共' + dat.total + '条数据)');
			} else {
				$(".zxmenu_right .zxmenu_tit span").append(
						'<b>(共' + dat.total + '条数据)</b>');
			}

			// 计算页数
			var pageCount = Math.ceil(dat.total / dat.size);
			if (pageCount < pn) {
				pn = pageCount;
			}

			// 分页
			$(".showPage").createPage({
				pageCount : pageCount, // 总页数
				current : pn, // 当前页
				backFn : function(pn) {
					// 单击回调方法，pn是当前页码
					// 获取列表数据
					getContentList($("#clazzId").val(), pn);

				}
			});

			// 获取列表数据
			getContentList(cid, pn);

		}

	});

}

// 点击新增一级分类
$(".zxmenu_tit .menu_add").live("click", function() {

	// 葆婴查看密码
	var felvelId = getQueryString('felvelId');
	if (felvelId == '3000070') {
		$(".addpw_tr").show();
	}

	open_dialog();
	$(".dialog_add").show();

	// 存放新增还是修改
	$("#addOrEdit").val('add1');

	$(".dialog_add .dialog_head b").html('新增栏目');

});

// 点击新增二级分类
$(".zxmenu_type .menu_add").live("click", function() {
	
	// 葆婴查看密码
	$(".addpw_tr").hide();

	// 获取并填充父级id
	var fatherId = $(this).parent().parent().parent().data("id");
	var cid = $(this).parent().parent().parent().data("id");
	$("#inputId").val(cid);

	// 针对个人空间
	// 获取并填充父级stype
	var stype = $(this).parent().parent().parent().data("stype");
	$("#stype").val(stype);

	// 存放新增还是修改
	$("#addOrEdit").val('add2');

	open_dialog();
	$(".dialog_add").show();

});

// 确定新增和修改
$(".dialog_add .dialog_ok").live("click", function() {
	// 葆婴查看密码功能
	var addpw = $("#addpw").val();

	var inputId = $("#inputId").val();
	var addPic = $("#addPic").val();
	var addName = $("#addName").val();
	var addInfo = $("#addInfo").val();
	var addRank = $("#addRank").val();
	
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

	// 针对自定义功能插件
	var felvelId = $("#felvelId").val();

	// 针对个人空间
	// 获取并填充父级stype
	var stype = $("#stype").val();

	// 提交加载中开启
	$("#loading").show();

	$.ajax({
		url : inputClazz,
		type : "post",
		data : {
			"cid" : inputId,
			"displayName" : addName,
			"picUrl" : addPic,
			"intro" : addInfo,
			"orderById" : addRank,
			"addOrEdit" : addOrEdit,
			"stype" : stype,
			"felvelId" : felvelId,
			"password" : addpw
			
			
		},
		success : function(data) {

			// 提交加载中关闭
			$("#loading").hide();

			if (data == "success") {
				// 火狐必须清空输入框
				close_dialog();
				boxalert("提交成功！");

				// 重新初始化
				goReload();

			} else if (data == "haveContent") {
				boxalert("该分类下有内容，无法添加二级分类！");
			} else {
				boxalert("提交失败！");
			}
		}
	});

});

// 点击修改一级分类
$("dt .menu_edit").live("click", function() {

	// 葆婴查看密码
	var felvelId = getQueryString('felvelId');
	if (felvelId == '3000070') {
		$(".addpw_tr").show();
	}

	// 获取分类信息
	var cid = $(this).parent().parent().parent().data("id");
	$("#inputId").val(cid);
	clazzInfo(cid);

	// 存放新增还是修改
	$("#addOrEdit").val('edit1');

	open_dialog();
	$(".dialog_add").show();

	$(".dialog_add .dialog_head b").html('修改栏目');

});

// 点击修改二级分类
$("dd .menu_edit").live("click", function() {

	// 葆婴查看密码
	$(".addpw_tr").hide();

	// 获取分类信息
	var cid = $(this).parent().parent().parent().data("id");
	clazzInfo(cid);
	$("#inputId").val(cid);

	// 存放新增还是修改
	$("#addOrEdit").val('edit2');

	open_dialog();
	$(".dialog_add").show();

	$(".dialog_add .dialog_head b").html('修改栏目');

});

// 点击删除一级分类
$("dt .menu_del").live("click", function() {

	// 该分类id
	var cid = $(this).parent().parent().parent().data('id');
	$("#inputId").val(cid);

	// 存放一级还是二级
	open_dialog();

	// 下面是否有二级分类
	if ($(this).parent().parent().parent().parent().find("dd").length > 0) {
		// 有二级，不能删除
		$(".dialog_delete").show();
	} else {
		// 没有二级，是否有内容
		haveContentJs(cid);

	}

});

// 点击删除二级分类
$("dd .menu_del").live("click", function() {

	// 该分类id
	var cid = $(this).parent().parent().parent().data('id');
	$("#inputId").val(cid);

	open_dialog();

	// 是否有内容
	haveContentJs(cid);

});

// 不能删除有内容！！！！！！的分类
$(".dialog_delete .dialog_ok").live("click", function() {
	close_dialog();
});

// 确定删除没内容的分类
$(".dialog_confirm .dialog_ok").live("click", function() {

	// 该分类id
	var cid = $("#inputId").val();

	// 提交加载中开启
	$("#loading").show();

	$.ajax({
		url : deleteClazz,
		type : "post",
		data : {
			"cid" : cid
		},
		success : function(data) {

			// 提交加载中关闭
			$("#loading").hide();

			if (data == "success") {

				close_dialog();
				boxalert("删除成功");

				// 重新初始化
				goReload();

			} else {
				boxalert("删除失败");
			}
		}

	});

});

// 全部选中
$(".all_checkbox").live("click", function() {

	if ($(this).is(':checked')) {
		$(".zxmenu_checkbox").attr("checked", true);
	} else {
		$(".zxmenu_checkbox").attr("checked", false);
	}

});

// 删除全部选中
$("#deleteAll").live("click", function() {

	if ($(".zxmenu_checkbox").length <= 0) {
		return false;
	}

	var allid = '';
	var id = '';

	$(".zxmenu_checkbox").each(function() {
		if ($(this).is(':checked')) {
			id = $(this).parent().parent().data('id');
			allid += id + ',';
		}
	});

	if (allid == '') {
		return false;
	}

	if (!confirm('删除后不能恢复，确定删除吗？')) {
		return false;
	}

	// 提交加载中开启
	$("#loading").show();

	$.ajax({
		url : "json/product!deleteAllContent.action",
		type : "post",
		data : {
			"batchCid" : allid
		},
		success : function(data) {

			// 提交加载中关闭
			$("#loading").hide();

			if (data == "success") {
				boxalert("删除成功");
				cid = $("#clazzId").val();
				pn = $(".showPage .current").html();
				showPage(cid, pn);
			}
		}
	});

});

// 单个删除
$(".zxmenu_table .menu_del").live("click", function() {

	if (!confirm('删除后不能恢复，确定删除吗？')) {
		return false;
	}

	var id = $(this).parent().parent().data('id');
	pn = $(".showPage .current").html();

	// 提交加载中开启
	$("#loading").show();

	$.ajax({
		url : deleteContent,
		type : "post",
		data : {
			"cid" : id,
			"pn" : pn
		},
		success : function(data) {

			// 提交加载中关闭
			$("#loading").hide();

			if (data == "success") {
				boxalert("删除成功");
				cid = $("#clazzId").val();
				showPage(cid, pn);
			}
		}
	});

});

// 添加新内容链接拼接
function addNewInput() {

	var nodeId = $("#clazzId").val();
	var inputUrl = contentView + '?nodeId=' + nodeId;

	// 针对自定义功能插件
	var felvelId = $("#felvelId").val();
	if (felvelId) {
		var inputUrl = contentView + '?felvelId=' + felvelId + '&nodeId='
				+ nodeId;
	}
	$(".zxmenu_right .zxmenu_tit a").attr("href", inputUrl);

}

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
			$("#addpw").val(json.password);

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
function haveContentJs(cid) {
	
	$.ajax({
		url : "json/product!totalNum.action",
		type : "post",
		data : {"nodeId" : cid},
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

// 没有分类栏目，则提示不能新增内容
function noAddInput() {

	// 没有分类栏目
	if ($(".zxmenu_type").find("dl dt").length <= 0) {
		// 没有分类，则不能新增内容
		$(".zxmenu_right .zxmenu_tit a").attr("href",
				"javascript:boxalert('请先添加栏目，才能添加新内容');");
	}
}

// 栏目下面有内容，不能新增二级栏目
$(".dialog_noadd .dialog_ok").live("click", function() {
	close_dialog();
});

// 重新初始化
function goReload() {
	var thisUrl = document.URL;
	if (thisUrl.indexOf("?") > 0) {

		if (thisUrl.indexOf("felvelId") > 0) {
			if (thisUrl.indexOf("&") > 0) {
				thisUrl = thisUrl.substring(0, thisUrl.indexOf("&"));
			}
		} else {
			thisUrl = thisUrl.substring(0, thisUrl.indexOf("?"));
		}

	}

	window.location.href = thisUrl;
}