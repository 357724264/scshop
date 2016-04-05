<#include "/WEB-INF/template/admin/header.ftl" />

	<style type="text/css">
		.dialog_upload1{width:180px !important; height:80px !important;}
		.dialog_upload2{height:134px !important;}
		.dialog_tip{margin-left:0 !important;}
	</style>
	<!-- 板块独有内容 -->
	
	<script>
	$("#dpgl").addClass("on");
	</script>
	<div class="zxbody">
		<div class="zxbody_title zxbody_title2">
			<a href="javascript:history.back();" class="zxback">
				<img src="${base}/static/admin/img/do_back.png">
			</a>
			店铺管理
		</div>
	 <form id="myform" name="myform" method="post" action="">
			
			<div class="zxform">
				<table cellspacing="0" cellpadding="0" width="100%" class="zxtable">
				<tr>
					<td class="zxltd">店铺名称：</td>
					<td><input class="dia_inp" type="text" placeholder=" " id="name" name="name" value="${(shop.name)!}" ></td>
				</tr>
				
				<tr>
					<td class="zxltd">公司名称：</td>
					<td><input class="dia_inp" type="text" placeholder=" " id="companyName" name="companyName" value="${(shop.companyname)!}" ></td>
				</tr>
				
				<tr>
					<td class="zxltd">联系电话：</td>
					<td><input class="dia_inp" ms-duplex-required="a" type="text" placeholder=" " id="phone" name="phone" value="${(shop.phone)!}" ></td>
				</tr>
				
				<tr>
					<td class="zxltd">店铺描述：</td>
					<td><textarea class="dia_text"  placeholder=" " id="description" name="description">${(shop.description)!}</textarea></td>
				</tr>
				
				<tr>
						<td class="zxltd">店铺图片：</td>
						<td>
							<table cellspacing="0" cellpadding="0" width="100%" class="form_table">
								<tr>
									<td class="imgtd">
										<div class="dialog_upload dialog_upload1">
											<img id="avatar1" src="${(shop.logo)!}">
											<input type="file" id="file"  name="file" class="dia_file">
											<input type="hidden" id="addImages" name="addImages" value="">
										</div>
									</td>
									<td class="tiptd">
										<div class="dialog_tip form_tip">
											<h1>点击上传封面图片</h1>
											<p>
											建议上传图片规则:
											<br>
											尺寸：180*65像素
											<br>
											格式：jpg、jpeg、png
											<br>
											图片大小不超过300kb（太大网站会加载很慢）
											</p>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td class="zxltd">背景图片：</td>
						<td>
							<table cellspacing="0" cellpadding="0" width="100%" class="form_table">
								<tr>
									<td class="imgtd">
										<div class="dialog_upload dialog_upload2">
											<img id="avatar2" src="${(shop.bground)!}">
											<input type="file" id="file2"  name="file" class="dia_file" >
											<input type="hidden" id="addbground" name="addImages" value="">
										</div>
									</td>
									<td class="tiptd">
										<div class="dialog_tip form_tip">
											<h1>点击上传封面图片</h1>
											<p>
											建议上传图片规则:
											<br>
											尺寸：720*240像素
											<br>
											格式：jpg、jpeg、png
											<br>
											图片大小不超过300kb（太大网站会加载很慢）
											</p>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td></td>
						<td class="btntd">
							<button type="button" class="dia_btn dialog_ok form_ok"  >确定</button>
						</td>
					</tr>
					</table>
					
				</div>
		
				
			</div>
		</form>
	</div>
</div>
<script src="${base}/static/admin/avalon.js"></script>
<script src="${base}/static/admin/highlight/shCore.js"></script>
<script type="text/javascript" src="${base}/static/admin/js/yanzheng.js"></script>
<script>

// 上传图片1


$(function() {
//another option is using modals
	$('#avatar1').live('click', function(){ $("#file").trigger("click"); });
	$('#file').live("change",function(){ fileupload(); });
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
        		$("#addImages").val(data.bigurl);
				$("#avatar1").attr("src",data.bigurl);}
            //兼容火狐、谷歌、ie8以上版本
			var dat = eval("("+data+")");
			if(dat.success){
				$("#addImages").val(dat.bigurl);
				$("#avatar1").attr("src",dat.bigurl);
			}
			if(data.msg){alert(data.msg)}
			if(dat.msg){alert(dat.msg)}
		}
	});
}

// 上传图片2

$(function() {
//another option is using modals
	$('#avatar2').live('click', function(){ $("#file2").trigger("click"); });
	$('#file2').live("change",function(){ fileupload1(); });
});

function fileupload1(){
$.ajaxFileUpload({
		url:'${base}/upload.action',       //需要链接到服务器地址
		secureuri:false,
		fileElementId:'file2',                            //文件选择框的id属性
		dataType: 'text/html',                                   //服务器返回的格式，可以是json
		fileSize:300,     
		data:{width:'520', length:'250',limit:300},
		success: function (data, textStatus) {
			//兼容ie8以及以下版本
        	if(data.success){
        		$("#addbground").val(data.bigurl);
				$("#avatar2").attr("src",data.bigurl);}
            //兼容火狐、谷歌、ie8以上版本
			var dat = eval("("+data+")");
			if(dat.success){
				$("#addbground").val(dat.bigurl);
				$("#avatar2").attr("src",dat.bigurl);
			}
			if(data.msg){alert(data.msg)}
			if(dat.msg){alert(dat.msg)}
		}
	});
}
	//js验证
	$(function(){
			$('#myform :input').blur(function(){
		         if( $(this).is('#name') ){
		              $(this).required();
		         }
		         if( $(this).is('#description') ){
		            $(this).required();
		         }
		         if( $(this).is('#phone') ){
		            $(this).phone();
		         }
		        
		    }).keyup(function(){
		       $(this).triggerHandler("blur");
		    }).focus(function(){
		         $(this).triggerHandler("blur");
		    });	
		    	    
		    //提交，最终验证。
		     $('.dialog_ok').click(function(){
		            $("#myform :input.required").trigger('blur');
		            var numError = $('#myform .onError').length;
		            if(numError){
		                return false;
		            } 
		            var name = $("#name").val();
		            var description = $("#description").val();
		            var phone = $("#phone").val();
		            var companyName = $("#companyName").val();
		            var addImages = $("#avatar1").attr("src");
		            var addbground = $("#avatar2").attr("src");
		            $.ajax({
				               url :"json/shop!update.action",
							   data :{
							       name : name,
								   description : description,
								   phone : phone,
								   logo:addImages,
								   bground:addbground,
								   companyName : companyName
							   },
				               type :"post",
				               success:function(data){
				                  location.href = 'shop!list.action';
							   
				              }
				        });
		     });
		})
	
</script>

<!-- 表单提交 -->
<#include "/WEB-INF/template/admin/myform.ftl" />