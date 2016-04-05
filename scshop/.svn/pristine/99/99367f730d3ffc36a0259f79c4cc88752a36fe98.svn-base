
$(function(){
	//加底部版权信息
	addFoot();
});


function trim(str){ //删除左右两端的空格
    return str.replace(/(^\s*)|(\s*$)/g, "");
}
function ltrim(str){ //删除左边的空格
    return str.replace(/(^\s*)/g,"");
}
function rtrim(str){ //删除右边的空格
    return str.replace(/(\s*$)/g,"");
}

//检测手机号
function isphone(phone){
	
	var flag = 0;
	var phone = trim(phone);
	var length = phone.length;
	
	if(length == 11){
		flag = 1;
	}
	
	return flag;
}

//检测密码
function ispw(pw){
	
	var flag = 0;
	var pw = trim(pw);
	var check = /^[\x21-\x7e]{6,}$/;
	
	if(check.test(pw)){
		flag = 1;
	}
	return flag;
}

//真实姓名判断
function ismyname(str){
	
	var flag = 0;
	var str = trim(str);
	var length = str.length;
    var check = /^([\u4E00-\u9FA5]|[·])+$/;
    
    if ((length > 1) && (check.test(str))) {  
    	flag = 1;
	}
    
	return flag; 
	
}

//检测email
function isemail(email){

	var flag = 0;
	var email = trim(email);
	var length = email.length;
	var check = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i;
	if(check.test(email)){
		flag = 1;
	}
	return flag;
}

//错误提示层
function boxalert(error){
	
	if($(".reg_error").length<=0){
		$("body").append('<div class="reg_error"></div>');
	}
	
	$(".reg_error").html(error).show();
	
	setTimeout(function(){
		$(".reg_error").fadeOut(100);	
	},1500);
	
}

//成功提示层
function box_success(msg, url){
	
	if($(".mask_ecard").length<=0){
		$("body").append('<div class="mask_ecard" style="display:block;"></div><div class="ecard_tip" style="display:block;">'+msg+'</div>');
	}else{
		$(".mask_ecard").show();
		$(".ecard_tip").show();
	}
	
	setTimeout(function(){
		$(".mask_ecard").hide();
		$(".ecard_tip").hide();
		if(url){
			location.href=url;	
		}
	},1500);
	
}

//带确定按钮
function boxtip(tip, url){
	
	if(!tip) tip='';
	
	var havaUrl;
	if(url){
		havaUrl = '<button type="button" class="boxBtn" onclick="boxReload(\'' + url + '\')">确定</button>'
	} else {
		havaUrl = '<button type="button" class="boxBtn" onclick="boxReload()">确定</button>'
	}
	
	var html = '<div class="boxTip">'
	 	     +	'<div class="boxtitle">温馨提醒</div>'
			 +	'<div class="boxTip1">'+tip+'</div>'
			 +	'<div class="boxTip2">'
			 +		havaUrl
			 +	'</div>'
			 + '</div>';
	
	$("body").append(html);  
}

//确定弹层
function boxReload(url){
	if(url){
		location.href=url;
	}else{
		$(".boxTip").remove();
	}
}

//带是否按钮
function boxcheck(tip, clazz){
	
	if(!tip) tip='';
	if(!clazz) clazz='';
	
	var html = '<div class="boxCheck '+ clazz +'">'
		 	 +	'<div class="boxtitle"><span class="fr menu_do box_close" style="margin:10px;"></span>温馨提醒</div>'
			 +	'<div class="boxCheck1">'+tip+'</div>'
			 +	'<div class="boxCheck2">'
			 +	'<button type="button" class="boxNo">否</button>'
			 +	'<button type="button" class="boxYes">是</button>'
			 +	'</div>'
			 + '</div>';
	
	$("body").append(html);
}

//关闭弹出层
$(".box_close").live("click", function(){
	$(this).parent().parent().hide();
});

//关闭弹出层
$(".menu_close").live("click", function(){
	close_dialog();
});
//关闭弹出层
$(".menu_close_unclear").live("click", function(){
	$("body").removeClass("noscroll");
	$(".dialog").hide();
});

//关闭弹出层
$(".dialog_no").live("click", function(){
	close_dialog();
});

//栏目显示图片
$(".dialog_upload").live("mouseenter", function(){
	$(this).find(".dia_bg").show();
});

//栏目隐藏图片
$(".dialog_upload").live("mouseleave", function(){
	$(this).find(".dia_bg").hide();
});


//弹出窗开启
function open_dialog(){
	$("body").addClass("noscroll");
	$(".mask").show();
}

//弹出窗关闭
function close_dialog(){
	$("body").removeClass("noscroll");
	
	$(".dialog_upload img").attr("src",$(".dialog_upload img").data("default"));
	$("#file").val('');
	$("#addPic").val('');
	
	$(".dia_inp").val('');
	$(".dia_text").val('');
	
	$(".mask").fadeOut();
	$(".dialog").hide();
}

//获取url参数值
function getQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
}

//加底部版权信息
function addFoot(){
	var today = new Date();
	var year  = today.getFullYear();
	var foot =  '<div class="rgfoot">'
			 +	'<a href="javascript:;" class="khys">客户隐私政策</a>'
			 +	'<span>|</span>'
			 +	'<a href="javascript:;" class="tiaojian">条款和条件</a>'
			 +	'<span>|</span>'
			 +	'Copyright@2013-'+year+' 卖疯了科技有限公司 All Rights Reserved.'
			 +  '<div style="text-align:center;margin-top:3px;"><a href="http://www.miitbeian.gov.cn/" style="color:#666;" target="_blank">粤ICP备</a></div></div>';
	$('body').append(foot);
}