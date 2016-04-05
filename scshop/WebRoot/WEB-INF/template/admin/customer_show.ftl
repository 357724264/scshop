<#include "/WEB-INF/template/admin/header.ftl" />

	
	<!-- 板块独有内容 -->
	<script>
	$("#yhgl").addClass("on");
	</script>
	<div class="zxbody">
		<div class="zxbody_title zxbody_title2">
			<a href="javascript:history.back();" class="zxback">
				<img src="${base}/static/admin/img/do_back.png">
			</a>
			用户详情
		</div>
		 <#if customer??>
             
		<form id="myform" name="myform" method="post" action="json/customer!update.action?${customer.id}">
			<div class="zxform">
				<table cellspacing="0" cellpadding="0" width="100%" class="zxtable">
					
					
					<tr>
						<td class="zxltd">用户头像：</td>
						<td>
							<table cellspacing="0" cellpadding="0" width="100%" class="form_table">
								<tr>
									<td class="imgtd">
										<div class="dialog_upload">
											<img class="editable" alt="" id="avatar1" src="<#if customer.pic!=null>${(customer.pic)!}<#else>${base}/static/admin/img/img520.jpg</#if>" />
											<input type="hidden" id="picUrl" name="picUrl" value="${(customer.pic)!}" >
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					
					
					<tr  class="tt-0">
						<td class="zxltd">用户名称：</td>
						<td><input class="dia_inp" ms-duplex-required="a" type="text" placeholder=" " id="bn" name="bn" value="${customer.name}"  readonly="readonly" ></td>
					</tr>
					
					<tr  class="tt-0">
						<td class="zxltd">手机号：</td>
						<td><input class="dia_inp" type="text" placeholder=" " id="bn" name="bn" value="${customer.phone}"  readonly="readonly"></td>
					</tr>
					
					<tr  class="tt-0">
						<td class="zxltd">微信号：</td>
						<td><input class="dia_inp" type="text" placeholder=" " id="bn" name="bn" value="<#if customer.weixinnum??>${customer.weixinnum}<#else>---</#if>"  readonly="readonly"></td>
					</tr>
					
					<tr  class="tt-0">
						<td class="zxltd">性  别：</td>
						<td><input class="dia_inp" type="text" placeholder=" " id="bn" name="bn" value="<#if customer.sex??> <#if customer.sex==0>女<#else>男</#if> <#else>男</#if>"  readonly="readonly"></td>
					</tr>
					
					<tr  class="tt-0">
						<td class="zxltd">电子邮箱：</td>
						<td><input class="dia_inp" type="text" placeholder=" " id="bn" name="bn" value="<#if customer.email??>${customer.email}<#else>---</#if>"  readonly="readonly"></td>
					</tr>
					
					<tr  class="tt-0">
						<td class="zxltd">剩余积分：</td>
						<td><input class="dia_inp" type="text" placeholder=" " id="bn" name="bn" value="<#if customer.point??>${customer.point}<#else>0.00</#if>"  readonly="readonly"></td>
					</tr>
					
					<tr  class="tt-0">
						<td class="zxltd">已用积分：</td>
						<td><input class="dia_inp" type="text" placeholder=" " id="bn" name="bn" value="<#if customer.hispoint??>${customer.hispoint}<#else>0.00</#if>"  readonly="readonly"></td>
					</tr>
				
					<tr  class="tt-0">
						<td class="zxltd">是否已关注  <br/>公众号 ：</td>
						<td><input class="dia_inp" type="text" placeholder=" " id="bn" name="bn" value="<#if customer.issub??> <#if customer.issub==1>已关注<#else>未关注</#if> <#else>未关注</#if>"  readonly="readonly"></td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd"> 用户备注：</td>
						<td><input class="dia_inp" type="text" placeholder=" " id="note" name="note" value="${customer.usernote}"></td>
					</tr>
					
					<!--用户是否代理，代理级别-->
					<tr  class="tt-0">
						<td class="zxltd"><span class="must">*</span>代理等级：</td>
						<td>
							<select id="agentid">
								<option value>普通用户</option>
								<#list alist as agent>
									<option value="${agent.id}" <#if customer.agentid??&&customer.agentid==agent.id>selected</#if>>${agent.name}</option>
								</#list>
							</select><span onclick="changeagent()" style="background:grey">修改</span>
						</td>
					</tr>
					
					<!--若注册为商家，则显示-->
					<#if customer.istrader==1&&customer.traderid??>
						<td class="zxltd"><span class="must">*</span>已注册为商户 <br/>商户ID  ：</td>
						<td><input class="dia_inp" type="text" placeholder=" " id="bn" name="bn" value="${customer.traderid}"  readonly="readonly"></td>
					</#if>
					
					<tr  class="tt-0">
						<td class="zxltd">用户地址：</td>
						<td>
								<#list addslist as add>${add.province} ${add.city} ${add.qu} ${add.address}--<电话>：${add.phone}--<姓名>${add.name}<br/></#list>
						</td>
					</tr>
					
					<tr  class="tt-0">
						<td class="zxltd">备注：</td>
						<td><input class="form_inp" type="text" placeholder="---" name="url" value="<#if customer.note??> ${customer.note} <#else>---</#if>"  readonly="readonly"></td>
					</tr>
					
					
					<!--
					<tr class="tt-1">
						<td class="zxltd"><span class="must">*</span>外链地址：</td>
						<td><input class="form_inp" type="text" placeholder="请输入产品外链地址" name="url" value=""></td>
					</tr>
					
					<tr class="tt-0">
						<td class="zxltd"><span class="must">*</span>内容简述：</td>
						<td><textarea class="form_text validate[required]" placeholder="请填写内容简述" name="intro">   </textarea></td>
					</tr>
					-->

					
					
					<tr>
						<td></td>
						<td class="btntd">
							<a href="javascript:history.go(-1)"><button type="button" class="dia_btn dialog_ok form_ok" ms-click="checkAll" >返回列表</button></a>
						</td>
					</tr>
				</table>
			</div>
			
		</form>
		
		<#else>
		 id不正确，没有这个人。请勿直接在地址栏填写id。
		</#if>
		
	</div>
</div>
<script src="${base}/static/admin/avalon.js"></script>
 <script src="${base}/static/admin/highlight/shCore.js"></script>
<script>
	$(function(){
		$("#tt").bind("change",function(){
		var tval = $(this).val();
		if(tval==0){
			$(".tt-0").show();
			$(".tt-1").hide();
		}else{
			$(".tt-0").hide();
			$(".tt-1").show();
		}
		});
		$("#tt").trigger("change");
	})
	$('.delete').live('click',function(){
		$(this).parent().remove();
	});
	

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
	
	//js验证
	require(["validation/avalon.validation", "ready!"], function() {
            var validationVM

            function showError(el, data) {
                var next = el.nextSibling
                if (!(next && next.className === "error-tip")) {
                    next = document.createElement("div")
                    next.className = "error-tip"
                    el.parentNode.appendChild(next)
                }
                next.innerHTML = data.getMessage()
            }
            function removeError(el) {
                var next = el.nextSibling
                if (next && next.className === "error-tip") {
                    el.parentNode.removeChild(next)
                }
            }
            avalon.define({
                $id: "test",
                $skipArray: ["validation"],
                a: "",
                b: "a",
                c: "d",
                d: "",
                e: "",
                f: "",
                g: "",
                reset: function() {
                    validationVM && validationVM.resetAll()
                },
                validation: {
                    onInit: function(v) {
                        validationVM = v
                    },
                    onReset: function() {
                        avalon(this).removeClass("error success")
                        removeError(this)
                    },
                    onError: function(reasons) {
                        reasons.forEach(function(reason) {
                            avalon(this).removeClass("success").addClass("error")
                            showError(this, reason)
                        }, this)
                    },
                    onSuccess: function() {
                        avalon(this).removeClass("error").addClass("success")
                        removeError(this)
                    },
                    onValidateAll: function(reasons) {
                        reasons.forEach(function(reason) {
                            avalon(reason.element).removeClass("success").addClass("error")
                            showError(reason.element, reason)
                        })
                        if (reasons.length === 0) {
                            avalon.log("全部验证成功！")
                        }
                    }
                }
            })
            avalon.scan()
        });
        function changeagent(){
        	var agentid = $("#agentid").val();
        	$.ajax({
        		url:"json/customer!agent.action",
        		data:{agentid:agentid,id:${id}},
        		success:function(html){
        			var dat = eval("("+html+")");
        			if(dat.success){
        				alert("修改代理等级成功");
        			}
        		}
        	})
        }
</script>

<!-- 表单提交 -->
<#include "/WEB-INF/template/admin/myform.ftl" />