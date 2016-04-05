<!-- 遮罩层 -->
<div class="mask"></div>

<!-- 存放操作节点信息 -->
<div class="hide_id">
	<!-- 新增还是修改 -->
	<input id="addOrEdit" type="hidden" value="">
	
	<!-- 用于点击新增、修改时候，存放点击对应的nodeId -->
	<input id="inputId" name="inputId" type="hidden" value="">

	<!-- 选中高亮的分类id -->
	<input id="clazzId" type="hidden" value="">
	<input id="parentid" name="parentid" type="hidden" value="">

</div>

<!-- 新增和修改弹出层 -->
<div class="dialog dialog_add">
	<div class="dialog_head">
		<span class="menu_do menu_close"></span>
		<b>新增栏目</b>
	</div>
	<div class="dialog_body">
		<div class="dialog_left">
			<div class="dialog_upload up500">
				<img id="avatar1" src="${base}/static/admin/img/img520.jpg" data-default="${base}/static/admin/img/img520.jpg">
				<input type="file" id="file" name="file" class="dia_file">
				<input type="hidden" id="addPic" name="addPic" value="">
			</div>
			<div class="dialog_tip">
				<h1>点击按钮修改栏目图片</h1>
				<p>
				建议上传图片规则:
				<br>
				尺寸：500*300像素
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
					<td class="dia_ltd"><span class="must">*</span>栏目名称</td> 
					<td><input placeholder="请输入栏目名称" type="text" class="dia_inp" id="addName"></td>
				</tr>
				<!--<tr>
					<td class="dia_ltd">栏目描述</td>
					<td><textarea placeholder="请用1-22个字对栏目进行描述" class="dia_text" id="addInfo"></textarea></td>
				</tr>
				-->
				<tr>
					<td class="dia_ltd">排序</td>
					<td><input placeholder="数字越大越靠前" type="text" class="dia_inp" id="addRank" ></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="dialog_foot">
		<button type="button" class="dia_btn dialog_no">取消</button>
		<button type="button" class="dia_btn dialog_ok">确定</button>
	</div>
</div>



<!-- 删除一级弹出层 -->
<div class="dialog dialog_delete">
	<div class="dialog_head">
		<span class="menu_do menu_close"></span>
		<b>温馨提醒</b>
	</div>
	<div class="dia_tip">
		<table cellspacing="0" cellpadding="0" width="100%">
			<tr>
				<td rowspan="2" width="77"><img src="${base}/static/admin/img/img_tip.png"></td>
				<td><h1>无法删除</h1></td>
			</tr>
			<tr>
				<td><p>栏目下面有内容，你需要删除所有内容后才能删除此栏目！</p></td>
			</tr>
		</table>
	</div>
	<div class="dialog_foot">
		<button type="button" class="dia_btn dialog_no">取消</button>
		<button type="button" class="dia_btn dialog_ok">确定</button>
	</div>
</div>

<!-- 删除二级弹出层 -->
<div class="dialog dialog_confirm">
	<div class="dialog_head">
		<span class="menu_do menu_close"></span>
		<b>温馨提醒</b>
	</div>
	<div class="dia_tip">
		<table cellspacing="0" cellpadding="0" width="100%">
			<tr>
				<td rowspan="2" width="77"><img src="${base}/static/admin/img/img_tip.png"></td>
				<td><h1>确认删除</h1></td>
			</tr>
			<tr>
				<td><p>删除后该栏目将无法恢复，请慎重后再确认！</p></td>
			</tr>
		</table>
	</div>
	<div class="dialog_foot">
		<button type="button" class="dia_btn dialog_no">取消</button>
		<button type="button" class="dia_btn dialog_ok">确定</button>
	</div>
</div>



<!-- 有内容，禁止新增二级分类弹出层 -->
<div class="dialog dialog_noadd">
	<div class="dialog_head">
		<span class="menu_do menu_close"></span>
		<b>温馨提醒</b>
	</div>
	<div class="dia_tip">
		<table cellspacing="0" cellpadding="0" width="100%">
			<tr>
				<td rowspan="2" width="77"><img src="${base}/static/admin/img/img_tip.png"></td>
				<td><p>栏目下面有内容，不能新增二级栏目！</p></td>
			</tr>
		</table>
	</div>
	<div class="dialog_foot">
		<button type="button" class="dia_btn dialog_no">取消</button>
		<button type="button" class="dia_btn dialog_ok">确定</button>
	</div>
</div>


<!-- 下载数据提示 -->
<div class="mask_ecard downing"></div>
<div class="data_load downing">
	<div class="data_all">
		<img src="${base}/static/admin/img/loading3.gif">
		<h1>正在下载数据...<br>需要1-2分钟的时间，请勿关闭此页面！</h1>
	</div>
</div>



<script>
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

//下载数据提示
function downloadHtml(){
	var img = "${base}/static/admin/img/img_tip.png";
	var html = '<div class="zxdown">'
			 + '<p class="zxdown1"><span><img src="'+ img +'"></span><span>请下载更新最新数据。</span></p>'
			 + '<p class="zxdown2"><button type="button" class="zxdown_btn">立即下载</button></p>'
			 + '</div>';
	$(".zxbody .zxbody_title").after(html);
}

//开启下载中
function open_download(){
	$(".downing").show();
	$("body").addClass("noscroll");
}

//关闭下载中
function close_download(){
	$(".downing").show();
	$("body").removeClass("noscroll");
}
</script>