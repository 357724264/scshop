<#include "/WEB-INF/template/admin/header.ftl" />

	
	<!-- 板块独有内容 -->
	<script>
	$("#yhgl").addClass("on");
	</script>
	<style>
   #cpcs-box th, #cpcs-box td{
    border:0;
    border:1px solid #c1c1c1;
  } 
  #cpcs-box .col-3{
    width:205px;
  }
  #cpcs-box input{
    border:0;
    width:100%;
    height:100%;
    padding:0;
    box-sizing:border-box;
    outline:none;
    -webkit-appearance:none;
  }
  #cpcs-box .c-btnbox{
    border:0;
  }
  .close-cpcsbtn{
    width:40px;
    color:#fff;
    text-align:center !important;
    cursor:pointer;
    background-color:#CC3333;
  }
  #cpcs-box .c-btnbox button{
    width:100%;
    height:40px;
  }
</style>
	<div class="zxbody">
		<div class="zxbody_title zxbody_title2">
			<a href="javascript:history.back();" class="zxback">
				<img src="${base}/static/admin/img/do_back.png">
			</a>
			代理申请详情
		</div>
		
			<div class="zxform">
				<table cellspacing="0" cellpadding="0" width="100%" class="zxtable">
					
					<#if agentbill.idpic??>
					<tr>
						<td class="zxltd">身份证照片：</td>
						<td>
							<table cellspacing="0" cellpadding="0" width="100%" class="form_table">
								<tr>
									<td class="imgtd">
										<div class="dialog_upload">
											<img class="editable" alt="" id="avatar1" src="<#if agentbill.pic!=null>${(agentbill.idpic)!}<#else>${base}/static/admin/img/img520.jpg</#if>" />
											<input type="hidden" id="idpic" name="idpic" value="${(agentbill.idpic)!}" >
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					</#if>
					
					<tr  class="tt-0">
						<td class="zxltd">用户名称：</td>
						<td><input class="dia_inp" type="text" placeholder=" " id="name" name="name" value="${agentbill.name}" readOnly="true"></td>
					</tr>
					
					<tr  class="tt-0">
						<td class="zxltd">手机号：</td>
						<td><input class="dia_inp" type="text" placeholder=" " id="phone" name="phone" value="${agentbill.phone}" readOnly="true"></td>
					</tr>
					
					<tr  class="tt-0">
						<td class="zxltd">身份证：</td>
						<td><input class="dia_inp" type="text" placeholder=" " id="idnum" name="idnum" value="${agentbill.idnum}" readOnly="true"></td>
					</tr>
					
					<tr  class="tt-0">
						<td class="zxltd">住址：</td>
						<td><input class="dia_inp" type="text" placeholder=" " id="nowaddress" name="nowaddress" value="${agentbill.nowaddress}" readOnly="true"></td>
					</tr>
					
					
					
					<input type="hidden" value="${agentbill.userid}" id="userid"/>
					<input type="hidden" value="${agentbill.id}" id="agentbillid"/>
					<!--是否通过-->
					<tr>
						<td class="zxltd"><span class="must">*</span>是否同意：</td>
						<td>
						<select name="applystate" id="applystate" >
							<option value="-1" <#if agentbill??&&agentbill.applystate==-1>selected="selected"</#if> >不同意</option>
							<option value="1" <#if agentbill??&&agentbill.applystate==1>selected="selected"</#if> >同意</option>
						</select>
						</td>
					</tr>

					<!--用户是否代理，代理级别-->
					<tr  class="tt-0">
						<td class="zxltd"><span class="must">*</span>代理等级：</td>
						<td>						
							<select name="agentid" id="agentid0" class="erj"  >
								<option value="0" >非代理</option>
							</select>
							<select name="agentid" id="agentid" class="erj" >
								<#list agentlist as agent>
									<option value="${agent.id}"  <#if agent??&&agent.id==agentbill.agentid>selected="selected"</#if>>${agent.name}</option>
								</#list>
							</select>
						</td>
					</tr>
					
					<tr  class="tt-0">
						<td class="zxltd">信息反馈</td>
						<td><textarea  rows="4" cols="45"  name="reason" id="reason" ></textarea></td>
					</tr>
					
					
					<tr>
						<td></td>
						<td class="btntd">
							
							<button type="button" id="subBtn" class="dia_btn dialog_ok ">确定</button>
						</td>
					</tr>
				</table>
				
		
				
			</div>
			
	</div>
</div>
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
		
		$("#brandSelect").bind("change",function(){
			
			var brandName = $(this).find("option:selected").text();
			$("#brandName").val(brandName);
		});
		
		$("#countrySelect").bind("change",function(){
			
			var countryName = $(this).find("option:selected").text();
			$("#countryName").val(countryName);
		});
		
	
		
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
	
	$(document).ready(function(){
       $("#applystate").change(function(){
           $("#applystate option").each(function(i,o){
               if($(this).attr("selected"))
               {
                   $(".erj").hide();
                   $(".erj").eq(i).show();
               }
           });
       });
       $("#applystate").change();
   });
	
	
	$("#subBtn").bind("click",function(){
		
		
		$("#myform").submit();
		
	});
	
		
		$(".dialog_ok").bind("click",function(){
		var agentbillid = $("#agentbillid").val();
		var userid = $("#userid").val();
		var applystate = $("#applystate").val();
		var reason = $("#reason").val();
		var phone = $("#phone").val();
		var agentid = parseInt($("#agentid").val());
		
		$.ajax({
			url:"agentbill!update.action",
			data:{applystate:applystate,agentid:agentid,userid:userid,agentbillid:agentbillid,phone:phone,reason:reason},
			type:"post",
			success:function(data){
				alert("修改成功!");
				close_dialog();
				 window.location.href = 'agentbill!list.action'
			}
		})
	});
		
		



</script>

<!-- 表单提交 -->
<#include "/WEB-INF/template/admin/myform.ftl" />