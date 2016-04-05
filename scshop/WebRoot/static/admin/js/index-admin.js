
//英文1个字节，汉字2个字节，返回字节数
function get_length(val) {
    var len = 0;
    for (var i = 0; i < val.length; i++) {
        if (val[i].match(/[^\x00-\xff]/ig) != null) //全角
            len += 2;
        else
            len += 1;
    };
    return len;
}

//一级新增弹出窗开启
function open_dialog1(){
	$(".mask").show();
	$(".dialog1").show();
}

//一级新增弹出窗关闭
function close_dialog1(){
	$(".mask").fadeOut();
	$(".dialog1").hide();
	$("#input1").val("");
	$("#fail1").hide();
}
//二级新增弹出窗开启
function open_dialog2(){
	$(".mask").show();
	$(".dialog2").show();
}

//二级新增弹出窗关闭
function close_dialog2(){
	$(".mask").fadeOut();
	$(".dialog2").hide();
	$("#input2").val("");
	$("#fail2").hide();
}

//一级修改弹出窗开启
function open_dialog3(){
	$(".mask").show();
	$(".dialog3").show();
}

//一级修改弹出窗关闭
function close_dialog3(){
	$(".mask").fadeOut();
	$(".dialog3").hide();
	$("#input3").val("");
	$("#fail3").hide();
}

//二级修改弹出窗开启
function open_dialog4(){
	$(".mask").show();
	$(".dialog4").show();
}

//二级修改弹出窗关闭
function close_dialog4(){
	$(".mask").fadeOut();
	$(".dialog4").hide();
	$("#input4").val("");
	$("#fail4").hide();
}

//一级新增弹出窗关闭
$(".close_dialog1").live("click", function(){
	close_dialog1();
});

//二级新增弹出窗关闭
$(".close_dialog2").live("click", function(){
	close_dialog2();
});

//一级修改弹出窗关闭
$(".close_dialog3").live("click", function(){
	close_dialog3();
});

//二级修改弹出窗关闭
$(".close_dialog4").live("click", function(){
	close_dialog4();
});

//新增一级菜单
$("#addBt").live("click", function(){
	var num = $("#menu_num").val();
	if(num == 3){
		alert("最多可创建3个一级菜单");
		return false;
	}
	
	open_dialog1();
});

//确认新增一级菜单
$(".sub_dialog1").live("click", function(){
	var num = $("#menu_num").val();
	//验证菜单名
	var input = $("#input1").val();
	var length = get_length(input);
	if(input == ""){
		$("#fail1 span").html("输入框内容不能为空");
		$("#fail1").show();
		return false;
	}else if(length > 8){
		$("#fail1 span").html("菜单名称名字不多于4个汉字或8个字母");
		$("#fail1").show();
		return false;
	}
	//一级菜单顺序id
	var menu_id = num * 1 + 1;
	
	//提交数据 获取cid
	postData("0_"+menu_id,"","",input);
	var dataCid = menu_id;
	//一级菜单数量
	var menu_num = parseInt($("#menu_num").val()) + 1;
	
	var menu =  '<dl class="inner_menu jsMenu ui-sortable ui-sortable-disabled" id="menu_block_'+menu_id+'">'
			 +  '<input id="menu_item_'+menu_id+'" type="hidden" value="0">'
			 +  '<input id="menu_num_'+menu_id+'" type="hidden" value="0">'
		     +  '<dt class="inner_menu_item jslevel1" data-id="'+menu_id+'" id="menu_'+menu_id+'">'
			 +  '    <a href="javascript:void(0);" class="inner_menu_link"><strong id="title_'+menu_id+'">'+input+'</strong></a>'
			 +  '    <span class="menu_opr">'
			 +  '        <a href="javascript:void(0);" data-id="'+menu_id+'" class="icon14_common add_gray jsAddBt">添加</a>'
			 +  '        <a href="javascript:void(0);" data-id="'+menu_id+'" class="icon14_common edit_gray jsEditBt">编辑</a>'
			 +  '        <a href="javascript:void(0);" data-id="'+menu_id+'" class="icon14_common del_gray jsDelBt">删除</a>'
			 +  '        <a href="javascript:void(0);" data-id="'+menu_id+'" class="icon14_common sort_gray jsOrderBt" style="display:none">排序</a>'
			 +  '    </span>'
			 +  '</dt>'
			 +  '</dl>';
	
	//显示新加菜单
	$("#menu_id").val(menu_id);
	$("#menu_num").val(menu_num);
	$("#menuList").append(menu);
	
	close_dialog1();
	$("#menu_"+menu_id).click();
	
});
//修改一级菜单
$(".jsEditBt").live("click", function(){
	open_dialog3();
	var id = $(this).data("id");
	$("#edit_id").val(id);
	var title = $("#title_"+id).html();
	$("#input3").val(title);
});

//确认修改一级菜单
$(".sub_dialog3").live("click", function(){
	
	//验证菜单名
	var input = $("#input3").val();
	var length = get_length(input);
	if(input == ""){
		$("#fail3 span").html("输入框内容不能为空");
		$("#fail3").show();
		return false;
	}else if(length > 8){
		$("#fail3 span").html("菜单名称名字不多于4个汉字或8个字母");
		$("#fail3").show();
		return false;
	}
	
	var id = $("#edit_id").val();
	$("#title_"+id).html(input);
	close_dialog3();
	postData(id,"","",input);
});

//删除一级菜单
$(".jsDelBt").live("click", function(){
	
	if(confirm('删除该一级菜单，它所包括的二级菜单也会删除，确定删除吗？')){
		
		//移除节点
		var id = $(this).data("id");
		var menu = 'menu_block_' + id;
		$("#"+menu).remove();
		
		//一级菜单数量
		var menu_num = parseInt($("#menu_num").val()) - 1;
		$("#menu_num").val(menu_num);

		//设置动作
		$(".action_content").hide();
		$("#none").show();
		
		$("#del_type").val("1");
		delData(id);
	}
	
});




//新增二级菜单
$(".jsAddBt").live("click", function(){
	//所属一级菜单
	var id = $(this).data("id");

	var num = $("#menu_num_"+id).val();
	if(num == 5){
		alert("最多可创建5个二级菜单");
		return false;
	}
	
	//一级菜单是否已经设置动作
	var detail = $("#detail_"+id).val();
	var url = $("#url_"+id).val();
	
	if(detail || url){
		if(confirm("使用二级菜单后,当前编辑的消息将会被清除。确定使用二级菜单?")){
			$("#detail_"+id).remove();
			$("#url_"+id).remove();
			
			$("#none p").html("已有子菜单，无法设置动作");
			$(".action_content").hide();
			$("#none").show();
		}else{
			return false;
		}
	}
	
	$("#edit_id").val(id);
	open_dialog2();
});

//确认新增二级菜单
$(".sub_dialog2").live("click", function(){
	
	
	

	//所属一级菜单
	var id = $("#edit_id").val();
	
	var num = $("#menu_num_"+id).val();
	
	//验证菜单名
	var input = $("#input2").val();
	var length = get_length(input);
	if(input == ""){
		$("#fail2 span").html("输入框内容不能为空");
		$("#fail2").show();
		return false;
	}else if(length > 16){
		$("#fail2 span").html("菜单名称名字不多于8个汉字或16个字母");
		$("#fail2").show();
		return false;
	}
	
	//二级内部的顺序id
	var menu_item_id = num*1+1;
	//二级菜单数量
	var menu_num_id = parseInt($("#menu_num_"+id).val()) + 1;
	
	//二级菜单结构
	var menu =  '<dd class="inner_menu_item jslevel2" data-id="'+id+'_'+menu_item_id+'" id="menu_'+id+'_'+menu_item_id+'">'
	         +  '<i class="icon_dot">●</i>'
	         +  '<a href="javascript:void(0);" class="inner_menu_link">'
	         +      '<strong id="title_'+id+'_'+menu_item_id+'">'+input+'</strong>'
	         +  '</a>'
	         +  '<span class="menu_opr">'
	         +'&nbsp;<a href="javascript:void(0);" data-id="'+id+'_'+menu_item_id+'" data-father="'+id+'" class="icon14_common edit_gray jsSubEditBt">编辑</a>'
	         +  	'<a href="javascript:void(0);" data-id="'+id+'_'+menu_item_id+'" data-father="'+id+'" class="icon14_common del_gray jsSubDelBt">删除</a>'
	         +  	'<a href="javascript:void(0);" data-id="'+id+'_'+menu_item_id+'" data-father="'+id+'" class="icon14_common sort_gray jsOrderBt" style="display:none">排序</a>'
	         +  '</span>'
	         +  '</dd>';
	
	//显示新加菜单
	$("#menu_item_"+id).val(menu_item_id);
	$("#menu_num_"+id).val(menu_num_id);
	$("#menu_block_"+id).append(menu);
	
	close_dialog2();
	$("#menu_"+id+"_"+menu_item_id).click();
	//提交数据
	postData(id+"_"+menu_item_id,"","",input);
	
});

//修改二级菜单
$(".jsSubEditBt").live("click", function(){
	open_dialog4();
	var id = $(this).data("id");
	$("#edit_id").val(id);
	var title = $("#title_"+id).html();
	$("#input4").val(title);
});

//确认修改二级菜单
$(".sub_dialog4").live("click", function(){
	
	//验证菜单名
	var input = $("#input4").val();
	var length = get_length(input);
	if(input == ""){
		$("#fail4 span").html("输入框内容不能为空");
		$("#fail4").show();
		return false;
	}else if(length > 16){
		$("#fail4 span").html("菜单名称名字不多于8个汉字或16个字母");
		$("#fail4").show();
		return false;
	}
	
	var id = $("#edit_id").val();
	$("#title_"+id).html(input);
	close_dialog4();
	postData(id,"","",input);
});


//删除二级菜单
$(".jsSubDelBt").live("click", function(){
	
	if(confirm('确定删除该二级菜单吗？')){
		
		//移除节点
		var id = $(this).data("id");
		var menu = '#menu_' + id;
		$(menu).remove();
		
		//二级菜单数量
		var father = $(this).data("father");
		var menu_num_father = $("#menu_num_"+father);
		var menu_num = parseInt((menu_num_father).val()) - 1;
		$(menu_num_father).val(menu_num);

		//设置动作
		$(".action_content").hide();
		$("#none").show();
		
		$("#del_type").val("1");
		delData(id);
	}
	
});



//一级菜单设置动作
$(".jslevel1").live("click", function(){

	//执行删除，则停止
	if($("#del_type").val() == "1"){
		$("#none p").html("请选择一个菜单进行设置动作");
		$("#del_type").val("");
		return false;
	}
	
	var _this = $(this);
	
	var id = $(this).data("id");
	$("#edit_id").val(id);
	
	//选定菜单，添加高亮
	$(".inner_menu_item").removeClass("selected");
	_this.addClass("selected");
	
	//是否已有二级菜单
	var length = _this.parent().find(".jslevel2").length;
	
	//有二级菜单
	if(length != "0"){
		$("#none p").html("已有子菜单，无法设置动作");
		$(".action_content").hide();
		$("#none").show();
	}else{
		
		$(".action_content").hide();
		
		//是否已经设置动作
		var detail = $("#detail_"+id).val();
		var url = $("#url_"+id).val();
		if(detail){
			$("#viewDiv").html(detail);
			$("#view").show();
		}else if(url){
			$("#viewDiv_url").html(url);
			$("#view_url").show();
		}else{
			$("#index").show();
		}
		
	}
	
});

//二级菜单设置动作
$(".jslevel2").live("click", function(){
	
	//执行删除，则停止
	if($("#del_type").val() == "1"){
		$("#none p").html("请选择一个菜单进行设置动作");
		$("#del_type").val("");
		return false;
	}
	
	var _this = $(this);
	
	var id = $(this).data("id");
	$("#edit_id").val(id);
	
	//选定菜单，添加高亮
	$(".inner_menu_item").removeClass("selected");
	_this.addClass("selected");
	
	//输入框清空
	$("#urlText").val("");
	$("#editDetail").val("");
	
	$(".action_content").hide();
	
	//是否已经设置动作
	var detail = $("#detail_"+id).val();
	var url = $("#url_"+id).val();
	if(detail){
		$("#viewDiv").html(detail);
		$("#view").show();
	}else if(url){
		$("#viewDiv_url").html(url);
		$("#view_url").show();
	}else{
		$("#index").show();
	}
});

//进入发送消息
$("#sendMsg").live("click", function(){
	$(".action_content").hide();
	$("#edit").show();
});

//保存发送消息
$("#editSave").live("click", function(){
	//验证信息
	var detail = $("#editDetail").val();
	if(detail == ""){
		alert("该信息内容不能为空");
		return false;
	}
	
	//保存和显示信息
	var edit_id = $("#edit_id").val();
	var detail_id = "#detail_"+edit_id;
	if($(detail_id).val()){
		$(detail_id).val(detail);
	}else{
		var textarea = '<textarea style="display:none;" id="detail_'+edit_id+'">'+detail+'</textarea>';
		//方便删除
		$("#menu_"+edit_id).append(textarea);
	}
	$("#viewDiv").html(detail);
	$("#editDetail").val("");
	
	$(".action_content").hide();
	$("#view").show();
	
	//提交数据
	postData(edit_id,detail,"click",$("#title_"+edit_id).html())
	
});

//返回发送消息
$("#editBack").live("click", function(){
	
	var id = $("#edit_id").val();
	//是否已经设置动作
	var detail = $("#detail_"+id).val();
	if(detail){
		$("#viewDiv").html(detail);
		$(".action_content").hide();
		$("#view").show();
	}else{
		$(".action_content").hide();
		$("#index").show();
	}
	
});

//修改发送消息
$("#changeBt").live("click", function(){
	
	var edit_id = $("#edit_id").val();
	var detail = $("#detail_"+edit_id).val();
	$("#editDetail").val(detail);
	
	$(".action_content").hide();
	$("#edit").show();
});

//进入跳转网页
$("#goPage").live("click", function(){
	$(".action_content").hide();
	$("#url").show();
});

//保存跳转网页
$("#urlSave").live("click", function(){
	
	//验证信息
	var detail = $("#urlText").val();
	if(detail == ""){
		alert("该链接不能为空");
		return false;
	}
	
	//正则网址格式判断
//	var strRegex = /^((https|http|ftp|rtsp|mms)?:\/\/)?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?(([0-9]{1,3}\.){3}[0-9]{1,3}|([0-9a-z_!~*'()-]+\.)*([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\.[a-z]{2,6})(:[0-9]{1,4})?((\/?)|(\/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+\/?)$/;
//    var re=new RegExp(strRegex);
//    if (!re.test(detail)){
//		alert('请输入一个正确的链接');
//		return false;
//    }
	//保存和显示信息
	var edit_id = $("#edit_id").val();
	
	var url_id = "#url_"+edit_id;
	if($(url_id).val()){
		$(url_id).val(detail);
	}else{
		var textarea = '<textarea style="display:none;" id="url_'+edit_id+'">'+detail+'</textarea>';
		//方便删除
		$("#menu_"+edit_id).append(textarea);
	}
	
	$("#viewDiv_url").html(detail);
	$("#urlText").val("");
	
	$(".action_content").hide();
	$("#view_url").show();
	
	postData(edit_id,detail,"view",$("#title_"+edit_id).html())
});

//返回跳转网页
$("#urlBack").live("click", function(){
	
	var id = $("#edit_id").val();
	//是否已经设置动作
	var detail = $("#url_"+id).val();
	if(detail){
		$("#urlText").val(detail);
		$(".action_content").hide();
		$("#view_url").show();
	}else{
		$(".action_content").hide();
		$("#index").show();
	}
	
});

//修改跳转网页
$("#changeBt_url").live("click", function(){
	
	var edit_id = $("#edit_id").val();
	var detail = $("#url_"+edit_id).val();
	$("#urlText").val(detail);
	
	$(".action_content").hide();
	$("#url").show();
});


/**
 * 林浩旋 2014年10月15日 14:35:48
 * 请求后台数据修改或增加
 * @param idstr	父类和子类的id 字符串   59_63 （59父 63子）  如果只有一个  那就是父类
 * @param val	修改的值
 * @param type	修改的类型	click（回复值）跟view（链接地址）
 * @param displayName 标题名称
 */
function postData(idstr,val,type,displayName)
{
	var nodeid = 0;
	idstr = idstr+"";
	var cid = idstr;
	if(idstr.indexOf("_")>=0)
	{
		nodeid = idstr.substr(0,idstr.indexOf("_"));
		cid = idstr.substr(idstr.indexOf("_")+1,idstr.length);
	}
	var dataJson = {"cid":cid,"nodeid":nodeid,"type":type,"displayName":displayName,"url":val}
	if(type=="click")
	{
		dataJson = {"cid":cid,"nodeid":nodeid,"type":type,"displayName":displayName,"keyword":val}
	}
	var data = $.ajax({
		   url: "wxmenu!modify.action",
		   type:"post",
		   data:dataJson,
		   async: false
		 }).responseText; 
	return data;
//	$.ajax({
//		url:"wxmenu!modify",
//		data:dataJson,
//		type:"post",
//		async: false,
//		success:function(data){
//			return data;
//		}
//	});
}

function delData(idstr)
{
	idstr = idstr+"";
	var cid = idstr;
	//如果是子集  获取子集ID
	if(idstr.indexOf("_")>=0)
	{
		cid = idstr.substr(idstr.indexOf("_")+1,idstr.length);
	}
	var dataJson = {"cid":cid};
	$.ajax({
		url:"wxmenu!delete.action",
		data:dataJson,
		type:"post",
		success:function(data){
			$("#menu_"+cid).remove();
		}
	});
}


