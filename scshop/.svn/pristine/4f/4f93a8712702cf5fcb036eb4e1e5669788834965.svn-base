<#include "/WEB-INF/template/admin/header.ftl" />
<link rel="stylesheet" type="text/css" href="${base}/static/admin/css/fonts/iconfont.css">
	
	<!-- 板块独有内容 -->
	<script>
	$("#wdzy").addClass("on");
	</script>
	<style>
	.dia_table td {
    padding: 10px 0;
    }
    
    .dialog_spec{
	background: #36a65a;
	color: #fff;
	}
	
	.dialog_spec:hover{
		background: #2b8949;
	}
	
	.dia_sinp {
    width: 100px;
    border: 1px solid #ccc;
    padding: 5px 8px;
    font-size: 14px;
    height: 24px;
    }

    .gg-list{display:inline-block;}

    .qxbox{width:100%; height:24px; line-height:24px;}
    .qxbox .qxlabel:first-child{width:110px;}
    .qxlabel{display:inline-block; padding-right:10px; height:24px; line-height:24px; position:relative;}
    .qxlabel input{top:2px; margin-right:2px; position:relative;}
	</style>

	<div class="zxbody">
		<div class="zxbody_title zxbody_title2">
			<a href="javascript:history.back();" class="zxback">
				<img src="${base}/static/admin/img/do_back.png">
			</a>
			添加内容
		</div>
		
		<form id="myform" name="myform" method="post" action="admin!addContent.action" ms-controller="test" ms-widget="validation">
			<div class="zxform">
				<table cellspacing="0" cellpadding="0" width="100%" class="zxtable">
					<tr>
						<td class="zxltd">管理员名称：</td>
						<td><input class="form_inp" ms-duplex-lt="b" min="20" data-duplex-event="change" type="text" placeholder="请输入姓名" id="name" value=""></td>
					</tr>
					<tr>
						<td class="zxltd"><span class="must">*</span>联系电话：</td>
						<td><input class="form_inp" ms-duplex-lt="b" min="20" data-duplex-event="change" type="text" placeholder="请输入联系电话" id="phone" value=""></td>
					</tr>
					<tr>
						<td class="zxltd"><span class="must">*</span>邮箱：</td>
						<td><input class="form_inp" ms-duplex-lt="b" min="20" data-duplex-event="change" type="text" placeholder="请输入邮箱号" id="email" value=""></td>
					</tr>
					<tr>
						<td class="zxltd"><span class="must">*</span>登录账号：</td>
						<td><input class="form_inp" ms-duplex-lt="b" min="20" data-duplex-event="change" type="text" placeholder="请输入管理员登录账号" id="userName" value=""></td>
					</tr>
					<tr>
						<td class="zxltd"><span class="must">*</span>密码：</td>
						<td><input class="form_inp" ms-duplex-lt="b" min="20" data-duplex-event="change" type="password" placeholder="请输入管理员登录密码" id="password1" value=""></td>
					</tr>
					<tr>
						<td class="zxltd"><span class="must">*</span>密码：</td>
						<td><input class="form_inp" ms-duplex-lt="b" min="20" data-duplex-event="change" type="password" placeholder="请再次输入管理员登录密码" id="password2" value=""></td>
					</tr>
					<tr>
						<td class="zxltd">职位：</td>
						<td><input class="form_inp" ms-duplex-lt="b" min="20" data-duplex-event="change" type="text" placeholder="请输入管理员职位" id="position" value=""></td>
					</tr>
					
					<tr>
						<td class="zxltd"><span class="must">*</span>权限：</td>
						<td>
						<!--
							<div class="qxbox">
								<label class='qxlabel'><input disabled='disabled' checked="checked" type="checkbox" />默认有的权限</label>
							</div>
						-->					
							<#if functionitems?index_of(",webinfo,") gte 0>		
								<div class="qxbox">
										<label class='webinfo'><input class="checkall" type="checkbox"  value="webinfo"/>网站配置管理</label>
								</div>
							</#if>

							<#if functionitems?index_of(",ad,") gte 0>
								<div class="qxbox">
									<label class='qxlabel'><input class="checkall" type="checkbox" value="ad"/>首页管理列表</label>
									<#if functionitems?index_of(",adadd,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="adadd"/>添加广告</label>
									</#if>
									<#if functionitems?index_of(",adedit,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="adedit"/>修改广告</label>
									</#if>
										<#if functionitems?index_of(",addel,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="addel" />删除广告</label>
									</#if>
								</div>
							</#if>

							<#if functionitems?index_of(",kuaidi,") gte 0>
								<div class="qxbox">
									<label class='qxlabel'><input class="checkall" type="checkbox" value="kuaidi" />快递管理列表</label>
									<#if functionitems?index_of(",kdadd,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="kdadd"/>添加快递</label>
									</#if>
									<#if functionitems?index_of(",kdedit,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="kdedit"/>修改快递</label>
									</#if>
									<#if functionitems?index_of(",kddel,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="kddel"/>删除快递</label>
									</#if>
								</div>
							</#if>

							<#if functionitems?index_of(",customer,") gte 0>
								<div class="qxbox">
									<label class='qxlabel'><input class="checkall"type="checkbox" value="customer"/>用户管理列表</label>
									<#if functionitems?index_of(",useredit,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="useredit"/>用户编辑</label>
									</#if>
								</div>
							</#if>
							
							<#if functionitems?index_of(",agent,") gte 0>
								<div class="qxbox">
									<label class='qxlabel'><input class="checkall" type="checkbox" value="agent"/>代理等级列表</label>
									<#if functionitems?index_of(",agentadd,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="agentadd"/>代理等级添加</label>
									</#if>
									<#if functionitems?index_of(",agentedit,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="agentedit"/>代理等级修改</label>
									</#if>
									<#if functionitems?index_of(",agentdel,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="agentdel"/>代理等级删除</label>
									</#if>
								</div>
							</#if>

							<#if functionitems?index_of(",agentbill,") gte 0>			
								<div class="qxbox">
									<label class='qxlabel'><input class="checkall" type="checkbox" value="agentbill"/>代理申请列表</label>
									<#if functionitems?index_of(",agentbilledit,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="agentbilledit"/>代理审核</label>
									</#if>
								</div>
							</#if>

							<#if functionitems?index_of(",shop,") gte 0>
								<div class="qxbox">
									<label class='qxlabel'><input class="checkall" type="checkbox" value="shop"/>店铺申请列表</label>
									<#if functionitems?index_of(",shopedit,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="shopedit"/>店铺申请审核</label>
									</#if>
								</div>
							</#if>

							<#if functionitems?index_of(",country,") gte 0>
								<div class="qxbox">
									<label class='qxlabel'><input class="checkall" type="checkbox" value="country"/>国家信息列表</label>
									<#if functionitems?index_of(",countryadd,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="countryadd"/>添加国家</label>
									</#if>
									<#if functionitems?index_of(",countryedit,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="countryedit"/>修改国家信息</label>
									</#if>
									<#if functionitems?index_of(",countrydel,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="countrydel"/>删除国家信息</label>
									</#if>
								</div>
							</#if>
							<!--网站权限结束-->				

							<!--商家权限开始-->
							
							<#if functionitems?index_of(",brand,") gte 0>
								<div class="qxbox">
									<label class='qxlabel'><input class="checkall" type="checkbox" value="brand"/>商城品牌列表</label>
									<#if functionitems?index_of(",badd,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="badd"/>添加品牌</label>
									</#if>
									<#if functionitems?index_of(",bedit,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="bedit"/>修改品牌</label>
									</#if>
									<#if functionitems?index_of(",bdel,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="bdel"/>删除品牌</label>
									</#if>
								</div>
							</#if>

							<#if functionitems?index_of(",coupon,") gte 0>
								<div class="qxbox">
									<label class='qxlabel'><input class="checkall" type="checkbox" value="coupon"/>优惠券管理</label>
									<#if functionitems?index_of(",couponadd,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="couponadd"/>添加优惠券</label>
									</#if>
									<#if functionitems?index_of(",couponedit,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="couponedit"/>修改优惠券</label>
									</#if>
									<#if functionitems?index_of(",coupondel,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="coupondel"/>删除优惠券</label>
									</#if>
								</div>
							</#if>
							
							<#if functionitems?index_of(",myshop,") gte 0>
								<div class="qxbox">
									<label class='qxlabel'><input class="checkall" type="checkbox" value="myshop"/>我的店铺管理</label>
								</div>
							</#if>
							
							<#if functionitems?index_of(",product,") gte 0>
								<div class="qxbox">
									<label class='qxlabel'><input class="checkall" type="checkbox" value="product"/>自营商品列表</label>
									<#if functionitems?index_of(",padd,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="padd"/>添加商品</label>
									</#if>
									<#if functionitems?index_of(",pedit,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="pedit"/>修改商品</label>
									</#if>
									<#if functionitems?index_of(",pdel,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="pdel"/>删除商品</label>
									</#if>
								</div>
							</#if>
							
							<#if functionitems?index_of(",stafflist,") gte 0>
								<div class="qxbox">
									<label class='qxlabel'><input class="checkall" type="checkbox" value="stafflist"/>我的管理员</label>
									<#if functionitems?index_of(",staffedit,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="staffedit"/>职员管理</label>
									</#if>
									<#if functionitems?index_of(",staffadd,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="staffadd"/>创建账号</label>
									</#if>
								</div>
							</#if>
							
							<#if functionitems?index_of(",category,") gte 0>
								<div class="qxbox">
									<label class='qxlabel'><input class="checkall" type="checkbox" value="category"/>分类管理</label>
									<#if functionitems?index_of(",staffedit,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="categoryadd"/>添加分类</label>
									</#if>
									<#if functionitems?index_of(",staffadd,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="categoryedit"/>修改分类</label>
									</#if>
									<#if functionitems?index_of(",staffadd,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="categorydel"/>删除分类</label>
									</#if>
								</div>
							</#if>
							
							<#if functionitems?index_of(",inventory,") gte 0>
								<div class="qxbox">
									<label class='qxlabel'><input class="checkall" type="checkbox" value="inventory"/>库存管理</label>
									<#if functionitems?index_of(",inventoryadd,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="inventoryadd"/>库存出入库</label>
									</#if>
								</div>
							</#if>
							
							<#if functionitems?index_of(",comment,") gte 0>
								<div class="qxbox">
									<label class='qxlabel'><input class="checkall" type="checkbox" value="comment"/>评论管理</label>
									<#if functionitems?index_of(",commentedit,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="commentedit"/>评论回复</label>
									</#if>
									<#if functionitems?index_of(",commentdel,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="commentdel"/>删除评论</label>
									</#if>
								</div>
							</#if>
							<#if functionitems?index_of(",order,") gte 0>
								<div class="qxbox">
									<label class='qxlabel'><input class="checkall" type="checkbox" value="order"/>订单管理列表</label>
									<#if functionitems?index_of(",orderedit,") gte 0>
										<label class='qxlabel'><input name="qxipt" type="checkbox" disabled="disabled" value="orderedit"/>修改订单</label>
									</#if>
								</div>
							</#if>
							
							<!--商家权限结束-->
						</td>
					</tr>
					
					
				</table>
				<div class="pro-specarea">
					<table class="pro-specbox">
						
							<td class="twoadd"></td>
						</tr>
					</table>

					<button type="button" id="subBtn" class="dia_btn dialog_ok">确定</button>
				</div>
		
				
			</div>
			
		</form>
	</div>
</div>



<script>

	$(function(){
		$('.checkall').each(function(){
			$(this).on('click',function(){
				if($(this).is(':checked')){
					$(this).parent().parent().find('[name=qxipt]:checkbox').removeAttr("disabled");
				}else{
					$(this).parent().parent().find('[name=qxipt]:checkbox').attr("disabled","disabled");
					$(this).parent().parent().find('[name=qxipt]:checkbox').attr("checked",false);
				}				
			})
		})
		
		
		//保存新同事
		$(document).on("click",'.dialog_ok',function(){
			
			var nodes = $('.qxbox').find('input:checkbox[checked]');
			var fun =",";
			for(var i=0;i<nodes.length;i++){ 				
				fun = fun + nodes[i].getAttribute('value') + ",";
			}
			var name = $("#name").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			var userName = $("#userName").val();
			var password1 = $("#password1").val();
			var password2 = $("#password2").val();
			var position = $("#position").val();
			if(name==""){
			   alert("用户不能为空");
			   return;
			}
			if(phone==""){
			   alert("手机号码不能为空");
			   return;
			}
			if (!$("#phone").val().match(/^(((13[0-9]{1})|1[0-9][0-9])+\d{8})$/)) { 
						alert("手机号码格式不正确！");
						return;
				}
			if(userName<6){
			   alert("登陆账号不能少于6位");
			   return;
			}
			
			if(password1==""){
			    alert("密码不能为空");
			    return;
			}
			
			if(password1!=password2){
				boxalert('两次输入的密码不相同');
				$("#password1").focus();
				return false;
			}
			
			
			$.ajax({
				url :"json/admin!save.action",
				data :{
					functionitems : fun,
					name : name,
					username : userName,
					phone : phone,
					email:email,
					password : password1,
					position : position,
				},
				type :"post",
				success:function(html){
				var json = eval("("+html+")");
				
              			if(json.success){
							alert("创建成功");
							window.location.href = 'admin!list.action';
						}else if(json.error2 == 2){
						    alert("登陆账号重复！");
						    return;
						}else if(json.error == 1){
							alert("手机号码已存在");
							return;
						}else{
						    alert("未知错误");
						}
				 }
				 
			});
			
		});
		
		
		
		
	})
	

	function fileuploadimg(){
		i++;
		//alert(i);
		$.ajaxFileUpload({
				url:'${base}/upload.action',       //需要链接到服务器地址
				secureuri:false,
				fileElementId:'newfile',                            //文件选择框的id属性
				dataType: 'text/html',                                   //服务器返回的格式，可以是json
				fileSize:300,     
				data:{width:'520', length:'250',limit:300},
				success: function (data, textStatus) {
					//兼容ie8以及以下版本
					
		        	if(data.success){		        		
						var $html=$(
							'<li class="file-item">'+
							'<img class="img" width="150px" height="150px" src="'+data.bigurl+'" id="img'+i+'" />'+
							'<input id="file'+i+'" class="fileInput" type="file" name="file" onChange="fileupdata('+i+')"  />'+
							'<input type="hidden" id="pic'+i+'" name="pic" value="'+data.bigurl+'">'+
							'<span class="delete">x</span>'+
							'</li>'
						);
						$('#filePicker').before($html);

		        	}
		            //兼容火狐、谷歌、ie8以上版本
					var dat = eval("("+data+")");
					if(dat.success){
						
						var $html=$(
							'<li class="file-item">'+
							'<img class="img" src="'+dat.bigurl+'@150w_150h_2e" id="img'+i+'" />'+
							'<input id="file'+i+'" class="fileInput" type="file" name="file" onChange="fileupdata('+i+')"  />'+
							'<input type="hidden" id="pic'+i+'" name="pic" value="'+dat.bigurl+'"/>'+
							'<span class="delete">x</span>'+
							'</li>'
						);
						$('#filePicker').before($html);

					}
					
					if(data.msg){
						alert(data.msg);
					}
					if(dat.msg){
						alert(dat.msg);
					}				
					//i++;
				}
		});
	}

	function fileupdata(id){
		$.ajaxFileUpload({
				url:'${base}/upload.action',       //需要链接到服务器地址
				secureuri:false,
				fileElementId:'file'+id,                            //文件选择框的id属性
				dataType: 'text/html',                                   //服务器返回的格式，可以是json
				fileSize:300,     
				data:{width:'520', length:'250',limit:300},
				success: function (data, textStatus) {
					//兼容ie8以及以下版本
		        	if(data.success){
		        		$("#img"+id).attr("src",data.bigurl);
		        		$("#pic"+id).val(dat.bigurl);		
		        	}
		            //兼容火狐、谷歌、ie8以上版本
					var dat = eval("("+data+")");
					if(dat.success){
						$("#img"+id).attr("src",dat.bigurl+'@150w_150h_2e');	
						$("#pic"+id).val(dat.bigurl);				
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

