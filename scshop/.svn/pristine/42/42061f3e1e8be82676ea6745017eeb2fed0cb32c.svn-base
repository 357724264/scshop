<script>
//表单验证
$('form').validationEngine(); 

$(function() {
	
	$('#avatar1').live('click', function(){
		$("#file").trigger("click");
	});
	$('#file').live("change",function(){
		fileupload();
	});
	
	
	$("#myform").ajaxForm({
		type:"post",
		dataType:"json",
		beforeSubmit: function(){
			//提交加载中开启
			$("#loading").show();
		},
		success: function(data){
		
			//提交加载中关闭
			$("#loading").hide();
			
			if(data.success){
				boxalert("提交成功！");
				location.href=data.url;
			}else{
				boxtip(data.msg);
			}
			return false;
		}
	});
});

function fileupload(){
$.ajaxFileUpload({
		url:'${base}/upload.action',       //需要链接到服务器地址
		secureuri:false,
		fileElementId:'file',                            //文件选择框的id属性
		dataType: 'text/html',                                   //服务器返回的格式，可以是json
		fileSize:300,     
		data:{width:'520', length:'250',limit:300},
		success: function (data, textStatus) {

			
			//兼容ie8以及以下版本
        	if(data.success){
        		$("#picUrl").val(data.bigurl);
				$("#avatar1").attr("src",data.bigurl);
        	}
            //兼容火狐、谷歌、ie8以上版本
			var dat = eval("("+data+")");
			if(dat.success){
				$("#picUrl").val(dat.bigurl);
				$("#avatar1").attr("src",dat.bigurl);
			}
			
			if(data.msg){
				alert(data.msg);
			}
			if(dat.msg){
				alert(dat.msg);
			}
			
			
		}
	});
}
</script>