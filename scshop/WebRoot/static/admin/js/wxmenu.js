//增加一个图文
$(".ml_add").live("click", function(){
	
	//左侧数量
	var count = parseInt($('#count').val());
	if(count >= 8){
		alert('最多只能添加8条数据哦！');
		return false;
	}
	var new_count = count + 1;
	$('#count').val(new_count);
	
	var item_num_last = parseInt($("#item_num").val());
	var item_num = item_num_last + 1;
	var item = '<div id="appmsgItem'+item_num+'" data-fileid="" data-id="'+item_num+'" class="appmsg_item js_appmsg_item ">'
			 + ''
			 + '<input id="picname'+item_num+'" type="hidden" name="picname" >'
			 + '<input id="picurl'+item_num+'" type="hidden" name="picurl" >'
			 + '<input id="gourl'+item_num+'" type="hidden" name="gourl" >'
			 + ''
			 + '    <img class="js_appmsg_thumb appmsg_thumb" src="" id="picurl_'+item_num+'" alt="缩略图" >'
			 + '    <i class="appmsg_thumb default">缩略图</i>'
			 + '    <h4 class="appmsg_title"><a onclick="return false;" href="javascript:void(0);" target="_blank">标题</a></h4>'
			 + '    <div class="appmsg_edit_mask">'
			 + '        <a class="icon18_common edit_gray js_edit" data-id="'+item_num+'" onclick="return false;" href="javascript:void(0);">编辑</a>'
			 + '        <a class="icon18_common del_gray js_del" data-id="'+item_num+'" onclick="return false;" href="javascript:void(0);">删除</a>'
			 + '    </div>'
			 + '</div>';
			 
	$("#js_appmsg_preview").append(item);
	$("#item_num").val(item_num);
	
});

//删除一个图文
$(".js_del").live("click", function(){
	
	if(!confirm("删除后不能恢复,确定删除吗?")){
		return false;
	}
	
	var id = $(this).data("id");
	var item_del = '#appmsgItem' + id;
	
	$(item_del).remove();
	
	//右侧重新定位
	var edit_num = $("#edit_num").val();
	if(edit_num == id){
		$(".appmsg_editor").css({"marginTop":"0"});
	}else{
		var item = '#appmsgItem' + edit_num;
		var item_top = $(item).offset().top;
		var left_top = $('#js_appmsg_preview').offset().top;
		var marginTop = parseInt(item_top) - parseInt(left_top);
		$(".appmsg_editor").css({"marginTop":marginTop});
	}
	
	//左侧数量
	var count = parseInt($('#count').val());
	var new_count = count - 1;
	$('#count').val(new_count);
	
	//文本框赋值
	var title = "#picname" + 1;
	var url = "#gourl" + 1;
	var img = "#picurl" + 1;
	$("#file").val('');
	$("#my_title").val($(title).val());
	$("#my_url").val($(url).val());
	
	var img_val = $(img).val();
    if(img_val){
    	$("#img").attr("src",img_val).show(); 
    }else{
    	$("#img").hide();
    }
});

//编辑图文，右侧定位
$(".js_edit").live("click", function(){
	var id = parseInt($(this).data("id"));
	var item = '#appmsgItem' + id;
	var item_top = $(item).offset().top;
	var left_top = $('#js_appmsg_preview').offset().top;
	var marginTop = parseInt(item_top) - parseInt(left_top);
	
	$("#edit_num").val(id);
	$(".appmsg_editor").css({"marginTop":marginTop});
	
	//文本框赋值
	var title = "#picname" + id;
	var url = "#gourl" + id;
	var img = "#picurl" + id;
	$("#file").val('');
	$("#my_title").val($(title).val());
	$("#my_url").val($(url).val());
	var img_val = $(img).val();
    if(img_val){
    	$("#img").attr("src",img_val).show(); 
    }else{
    	$("#img").hide();
    }
    
    if(id == 0){
    	$('#img_tip').html('（大图片建议尺寸：900像素*500像素）');
    }else{
    	$('#img_tip').html('（小图片建议尺寸：200像素*200像素）');
    }
});

//右侧编辑，左边赋值
$("#my_title").live("keyup", function(){
	var text = $(this).val();
	if(text == ''){
		text = '标题';
	}
	var edit_num = $("#edit_num").val();
	var item = '#appmsgItem' + edit_num;
	$(item).find(".appmsg_title a").html(text);
	
	var title = "#picname" + edit_num;
	$(title).val(text);
});

//链接赋值
$("#my_url").live("keyup", function(){
	var text = $(this).val();
	var edit_num = $("#edit_num").val();
	var url = "#gourl" + edit_num;
	$(url).val(text);
});

////上传图片
//$("#file").live('change', function(){
//	$("#upload_form").submit();
//});

//显示图片
function callback(message,success){  
    if(success==false){  
        alert(message);
    }else{  

    	var edit_num = $("#edit_num").val();
    	var img = "#img" + edit_num;
    	var pic = "#pic" + edit_num;
    	
    	$(img).val(message);
    	$(pic).parent().find("i").hide();
    	$(pic).attr("src",message).show(); 
        $("#img").css({"marginBottom":"7px"}).attr("src",message).show();  
        
    }  
}


