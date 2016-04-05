<#include "/WEB-INF/template/admin/header.ftl" />
	<style type="text/css">
		.ad_list li{width:8%;}
		.up500{width:80px; height:80px;}
		.dia_bg p{margin:23px 0 0 10px;}
		.img_edit,.img_del{background-size:26px;}
		.img_do{width:26px; height:26px; margin-right:0;}
	</style>
	<!-- 板块独有内容 -->
	<script>
	$("#gjxx").addClass("on");
	</script>
	<div class="zxbody">
		<div class="zxbody_title zxbody_title2">国家信息管理</div>
		<div class="ad_list">
			<ul>
			  <#if list??&&list?size gt 0>
			  <#list list as country>
				<li data-id="${country.id}" id="ad${country.id}">
				
					<input type=hidden  id="orderById${country.id}" value="${country.displayOrder}"/>
					<div class="dialog_upload up500">
						<img src="${country.flagIcon}">
						<div class="dia_bg">
							<p>
							<#if functionitems?index_of(",countryedit,") gte 0><!--是否有修改的权限-->
								<b class="img_do img_edit" title="编辑" data-id="${country.id}"></b>
							</#if>
							<#if functionitems?index_of(",countrydel,") gte 0><!--是否有删除的权限-->
								<b class="img_do img_del" title="删除" data-id="${country.id}"></b>
							</#if>
							</p>
						</div>
						<input type="hidden" id="picUrl${country.id}" name="picUrl${country.id}" value="${country.flagIcon}">
					</div>
					<div class="ad_tit" id="displayName${country.id}">${country.name}</div>
				</li>
				 </#list>
				</#if>
				<#if functionitems?index_of(",countryadd,") gte 0><!--是否有新增的权限-->
					<li>
						<div class="dialog_upload up500">
							<a href="javascript:;" class="ad_add">
								<img src="${base}/static/admin/img/img520.jpg">
							</a>
						</div>
					</li>
				</#if>
				
			</ul>
		</div>
	</div>
</div>	


<!-- 遮罩层 -->
<div class="mask"></div>

<!-- 存放操作节点信息 -->
<div class="hide_id">
	<input id="editId" type="hidden" value="">
	<input id="adNum" type="hidden" value="1">
</div>

<!-- 新增弹出层 -->
<div class="dialog dialog_add">
<form id='form1' action="">
	<div class="dialog_head">
		<span class="menu_do menu_close"></span>
		<b>添加国家信息</b>
	</div>
	<div class="dialog_body">
		<div class="dialog_left">
			<div class="dialog_upload up500">
				<img id="avatar1" src="${base}/static/admin/img/img520.jpg">
				<input type="file" id="file"  name="file" class="dia_file">
				<input type="hidden" id="addPic" name="addPic" value="">
			</div>
			<div class="dialog_tip">
				<h1>点击按钮修改栏目图片</h1>
				<p>
				建议上传图片规则:
				<br>
				尺寸：300*300像素（正方形即可）
				<br>
				格式：jpg、jpeg、png
				<br>
				图片大小不超过300kb（太大网站会加载很慢）
				</p>
			</div>
		</div>
		<div class="dialog_right">
			<table cellspacing="0" cellpadding="0" width="100%" class="dia_table">
				<tr>
					<td class="dia_ltd"><span class="must">*</span>国家名称</td>
					<td><input placeholder="请输入品牌名称" type="text" class="dia_inp"  id="addTitle" ></td>
				</tr>
				
				<tr>
					<td class="dia_ltd">排序</td>
					<td><input placeholder="数字越大越靠前" type="text" class="dia_inp" class="dia_inp"  id="addRank" ></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="dialog_foot">
		<button type="button" class="dia_btn dialog_no">取消</button>
		<button type="button" class="dia_btn dialog_ok">确定</button>
	</div>
	</form>
</div>

<!-- 修改弹出层 -->
<div class="dialog dialog_edit">
<form id='form2' action="">
	<div class="dialog_head">
		<span class="menu_do menu_close"></span>
		<b>修改国家信息</b>
	</div>
	<div class="dialog_body">
		<div class="dialog_left">
			<div class="dialog_upload up500">
				<img id="avatar2" src="${base}/static/admin/img/img520.jpg">
				<input type="file" id="file1"  name="file" class="dia_file">
				<input type="hidden" id="editPic" name="editPic" value="">
			</div>
			<div class="dialog_tip">
				<h1>点击按钮修改栏目图片</h1>
				<p>
				建议上传图片规则:
				<br>
				尺寸：300*300像素（正方形即可）
				<br>
				格式：jpg、jpeg、png
				<br>
				图片大小不超过300kb（太大网站会加载很慢）
				</p>
			</div>
		</div>
		<div class="dialog_right">
			<table cellspacing="0" cellpadding="0" width="100%" class="dia_table">
				<tr>
					<td class="dia_ltd"><span class="must">*</span>国家名称</td>
					<td><input placeholder="请输入品牌名称" type="text" class="dia_inp" ms-duplex-required="a" id="editTitle"></td>
				</tr>
				
				<tr>
					<td class="dia_ltd">排序</td>
					<td><input placeholder="数字越大越靠前" type="text" class="dia_inp" ms-duplex-numeric="b" id="editRank"></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="dialog_foot">
		<button type="button" class="dia_btn dialog_no">取消</button>
		<button type="button" class="dia_btn dialog_ok">确定</button>
	</div>
	</form>
</div>
	
<script type="text/javascript" src="${base}/static/admin/js/yanzheng.js"></script>

<script>


        
//广告删除
$(".ad_list .img_del").live("click", function(){
	var cid = $(this).data("id");
	if(confirm("确认删除吗!")){
		$.ajax({
               url :"json/country!delete.action",
			   data :{
				   cid : cid
			   },
               type :"post",
               success:function(data){
               if(data=="success"){
               window.location.href = 'country!list.action';
               }else{
				   boxalert("删除失败!");
			   }
             }
        });
	}
});

//广告新增弹出层
$(".ad_list .ad_add").live("click", function(){
	
	open_dialog();
	$(".dialog_add").show();
	
});

//广告修改弹出层
$(".ad_list .img_edit").live("click", function(){
	
	var cid = $(this).data("id");
	var linkUrl = "#linkUrl" + cid;
	var title = "#displayName"+cid;
	var orderById="#orderById"+cid;
	var picUrl="#picUrl"+cid;
	
	 $("#editId").val(cid);
	$("#editLink").val($(linkUrl).val());
	$("#editTitle").val($(title).html());
	$("#editRank").val($(orderById).val());
	$("#editPic").val($(picUrl).val());
	$("#avatar2").attr("src",$("#editPic").val());

	open_dialog();
	$(".dialog_edit").show();
	
});

//新增上传广告图片
$(function() {
//another option is using modals
	$('#avatar1').live('click', function(){
		$("#file").trigger("click");
	});
	$('#file').live("change",function(){
		fileupload();
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
        		$("#addPic").val(data.bigurl);
				$("#avatar1").attr("src",data.bigurl);
        	}
            //兼容火狐、谷歌、ie8以上版本
			var dat = eval("("+data+")");
			if(dat.success){
				$("#addPic").val(dat.bigurl);
				$("#avatar1").attr("src",dat.bigurl);
			}
			
			if(data.msg){
				alert(data.msg)
			}
			if(dat.msg){
				alert(dat.msg)
			}
			
			
		}
	});
}

//修改广告  上传图片


$(function() {
//another option is using modals
	$('#avatar2').live('click', function(){
	
		$("#file1").trigger("click");
	});
	$('#file1').live("change",function(){
		fileupload1();
	});
	
});

function fileupload1(){
$.ajaxFileUpload({
		url:'${base}/upload.action',       //需要链接到服务器地址
		secureuri:false,
		fileElementId:'file1',                            //文件选择框的id属性
		dataType: 'text/html',                                   //服务器返回的格式，可以是json
		fileSize:300,     
		data:{width:'520', length:'250',limit:300},
		success: function (data, textStatus) {
			//兼容ie8以及以下版本
        	if(data.success){
        		$("#editPic").val(data.bigurl);
				$("#avatar2").attr("src",data.bigurl);
        	}
            //兼容火狐、谷歌、ie8以上版本
			var dat = eval("("+data+")");
			if(dat.success){
				$("#editPic").val(dat.bigurl);
				$("#avatar2").attr("src",dat.bigurl);
			}
			
			if(data.msg){
				alert(data.msg)
			}
			if(dat.msg){
				alert(dat.msg)
			}
			
			
		}
	});
}

//确定新增
      $(function(){
			$('#form1 :input').blur(function(){
		         if( $(this).is('#addTitle') ){
		              $(this).required();
		         }
		         if( $(this).is('#addRank') ){
		            $(this).numb();
		         }
		        
		    }).keyup(function(){
		       $(this).triggerHandler("blur");
		    }).focus(function(){
		         $(this).triggerHandler("blur");
		    });	
		    	    
		    //提交，最终验证。
		     $('.dialog_add .dialog_ok').click(function(){
		            $("#form1 :input.required").trigger('blur');
		            var numError = $('#form1 .onError').length;
		            if(numError){
		                return false;
		            } 
		            var addTitle = $("#addTitle").val();
					var addLink = $("#addLink").val();
					var addRank = $("#addRank").val();
					var addPic = $("#addPic").val();

					if(!addTitle){
						boxalert('广告标题不能为空');
						$("#addTitle").focus();
						return false;
					}
						$.ajax({
				               url :"json/country!save.action",
							   data :{
								   countryName : addTitle,
								   displayOrder : addRank,
								   flagIcon : addPic
							   },
				               type :"post",
				               success:function(data){
							   close_dialog();
				               window.location.href = 'country!list.action';
				              }
				        });
		     });
		})

//确定修改
     $(function(){
			$('#form2 :input').blur(function(){
		         if( $(this).is('#editTitle') ){
		              $(this).required();
		         }
		         if( $(this).is('#editRank') ){
		            $(this).numb();
		         }
		         
		    }).keyup(function(){
		       $(this).triggerHandler("blur");
		    }).focus(function(){
		         $(this).triggerHandler("blur");
		    });	
		    	    
		    //提交，最终验证。
		     $('.dialog_edit .dialog_ok').click(function(){
		            $("#form2 :input.required").trigger('blur');
		            var numError = $('#form2 .onError').length;
		            if(numError){
		                return false;
		            } 
		            var id = $("#editId").val();
					var editTitle = $("#editTitle").val();
					var editLink = $("#editLink").val();
					var editRank = $("#editRank").val();
					var editPic = $("#editPic").val();
					if(!editTitle){
						boxalert('广告标题不能为空');
						$("#editTitle").focus();
						return false;
					}
					$.ajax({
				               url :"json/country!update.action",
							   data :{
							       cid : id,
								   countryName : editTitle,
								   displayOrder : editRank,
								   flagIcon : editPic
							   },
				               type :"post",
				               success:function(data){
							   close_dialog();
				               window.location.href = 'country!list.action';
				              }
				        });
		     });
		})

</script>

	
	
	