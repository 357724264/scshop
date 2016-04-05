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
	if(i==0) {
		th = th + '<th width="30">' + tablevaljson[i].name + '</th>';
	}else if(i==4){
		th = th + '<th width="30">' + tablevaljson[i].name + '</th>';
	}else {
		th = th + '<th width="100">' + tablevaljson[i].name + '</th>';
	}
}
th = th + '<th width="110">操作</th></tr>';
$(function() {
	
	// 初始化列表
	query(1);
});

// 初始化列表
function query(pn) {
	var flevel = $("#flevel").val();
	var slevel = $("#slevel").val();
	var brandid = $("#brandid").val();
	var country = $("#country").val();
	var keyword = $("#keyword").val();
	var stat = $("#stat").val();
	// 分页
	showPage(flevel,slevel,brandid,country,keyword,stat,pn);

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



// 获取列表数据
function getContentList(flevel,slevel,brandid,country,keyword,stat, pn) {


	// 提交加载中开启
	$("#loading").show();

	$.ajax({
				url : contentList,
				type : "post",
				dataType : "json",
				data : {
					"flevel" : flevel,
					"slevel" : slevel,
					"brandid" : brandid,
					"country" : country,
					"keyword" : keyword,
					"stat" : stat,
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
							var editBtn = '<a class="edit_btn" href="#" data-url="' + contentView
									+ '?cid=' + json[i].cid + '">';
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
									li += '<b data-id='+json[i].cid+' class="menu_do menu_'
											+ editvaljson[k].classname
											+ '" title="'
											+ editvaljson[k].name
											+ '" onclick="'
											+ (editvaljson[k].url == "javascript:;" ? "javascript:void(0)"
													: ("window.location.href=\'"
															+ editvaljson[k].url
															+ "?cid="
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
function showPage(flevel,slevel,brandid,country,keyword,stat, pn) {

	if (!pn)
		pn = 1;

	// 提交加载中开启
	$("#loading").show();

	$.ajax({
		url : totalNum,
		type : "post",
		dataType : "json",
		data : {
			"flevel" : flevel,
			"slevel" : slevel,
			"brandid" : brandid,
			"country" : country,
			"keyword" : keyword,
			"stat"	: stat,
			"pn" : pn
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
			var totalCount = dat.total;
			// 分页
			$(".showPage").createPage({
				dataTotal : totalCount,
				pageCount : pageCount, // 总页数
				current : pn, // 当前页
				backFn : function(pn) {
					// 单击回调方法，pn是当前页码
					// 获取列表数据
					getContentList(flevel,slevel,brandid,country,keyword,stat,pn);

				}
			});
			//$(".showPage").append('<span>跳到<input id="page_num" style="width:30px;" type="text"/>页<a href="javascript:;" id="jump">确定</a></span>');
			// 获取列表数据
			getContentList(flevel,slevel,brandid,country,keyword,stat, pn);

		}

	});

}



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
		url : deleteAllContent,
		type : "post",
		data : {
			"batchCid" : allid
		},
		success : function(data) {

			// 提交加载中关闭
			$("#loading").hide();

			if (data == "success") {
				boxalert("删除成功");
				pn = $(".showPage .current").html();
				var flevel = $("#flevel").val();
				var slevel = $("#slevel").val();
				var brandid = $("#brandid").val();
				var country = $("#country").val();
				var keyword = $("#keyword").val();
				var stat = $("#stat").val();
				// 分页
				showPage(flevel,slevel,brandid,country,keyword,stat);

			}else if(data == "couponsuccess"){
				 window.location.reload();
			}else {
				var data = eval("("+data+")");
				alert(data.msg);
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
				var flevel = $("#flevel").val();
				var slevel = $("#slevel").val();
				var brandid = $("#brandid").val();
				var country = $("#country").val();
				var keyword = $("#keyword").val();
				var stat = $("#stat").val();
				// 分页
				showPage(flevel,slevel,brandid,country,keyword,stat);

			}else {
				var data = eval("("+data+")");
				boxalert(data.msg);
			}
		}
	});

});





// 重新初始化
function goReload() {
	var thisUrl = document.URL;
	if (thisUrl.indexOf("?") > 0) {

			thisUrl = thisUrl.substring(0, thisUrl.indexOf("?"));

	}

	window.location.href = thisUrl;
}