<#include "/WEB-INF/template/admin/header.ftl" />
<link rel="stylesheet" type="text/css" href="${base}/static/admin/css/fonts/iconfont.css">
	
	<!-- 板块独有内容 -->
	<script>
	$("#yhsc").addClass("on");
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
    .emoughbuy{
    	display:none
    }

    .gg-list{display:inline-block;}
    
	</style>

	<div class="zxbody">
		<div class="zxbody_title zxbody_title2">
			<a href="coupon!list.action" class="zxback">
				<img src="${base}/static/admin/img/do_back.png">
			</a>
			添加内容
		</div>
		
		<form id="myform" name="myform" method="post" action="<#if cid??>json/coupon!update.action<#else>json/coupon!save.action</#if>" ms-controller="test" ms-widget="validation">
			<input type="hidden" name="cid" value="${cid!}"/>
			<div class="zxform">
				<table cellspacing="0" cellpadding="0" width="100%" class="zxtable">
					<tr>
						<td class="zxltd">封面图片：</td>
						<td>
							<table cellspacing="0" cellpadding="0" width="100%" class="form_table">
								<tr>
									<td class="imgtd">
										<div class="dialog_upload">
											<img class="editable" alt="请上传封面图片" id="avatar1" src="${(coupon.pic)!}" />
											<input type="file"  id="file" name="file" class="dia_file" />
											<input type="hidden" id="picUrl" name="cover" value="" >
										</div>
									</td>
									<td class="tiptd">
										<div class="dialog_tip form_tip">
											<h1>点击上传封面图片</h1>
											<p>
											建议上传图片规则:
											<br>
											尺寸：700*400像素
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
						<td class="zxltd"><span class="must">*</span>优惠券名称：</td>
						<td><input class="form_inp" type="text" placeholder="请输入优惠券名称" id="name" name="name" value="${(coupon.name)!}" <#if cid??>disabled</#if>></td>
					</tr>
					<tr>
						<td class="zxltd"><span class="must">*</span>优惠券标题：</td>
						<td><input class="form_inp" type="text" placeholder="请输入优惠券标题" id="title" name="title" value="${(coupon.title)!}" <#if cid??>disabled</#if>></td>
					</tr>
					<#if cid??>
					<tr>
						<td class="zxltd"><span class="must">*</span>剩余数量</td>
						<td><input class="form_inp" type="text" value="<#if coupon.num==-1>无限量<#else>${coupon.leftnum}</#if>"  <#if cid??>disabled</#if>></td>
					</tr>
					</#if>
					<tr>
						<td class="zxltd"><span class="must">*</span>发行张数：</td>
						<td><input class="form_inp" type="text" placeholder="请输入发行张数,-1代表无限量" id="num" name="num" value="<#if coupon??><#if coupon.num==-1>无限量<#else>${coupon.num}</#if></#if>" <#if cid??>disabled</#if>></td>
					</tr>
					<tr>
						<td class="zxltd"><span class="must">*</span>是否不限时间：</td>
						<td>
							<#if cid??>
							<input type="checkbox" <#if coupon.endDate==-1>checked="chedked"</#if> disabled />是
							<#else>
							<input type="checkbox" name="timeout" id="timeout" value="1" />是
							</#if>
							
						</td>
					</tr>
					<#if !(cid??&&coupon.endDate==-1)>
					<tr id="deadlinetr">
						<td class="zxltd" style="width: 126px;"><span class="must">*</span>优惠券使用期限：</td>
						<td><input id="deadline" class="dia_inp bootstrap-timepicker" type="text" placeholder="" 
							name="endtime" value="<#if coupon??>${coupon.endDate?number_to_datetime?string("yyyy-MM-dd HH:mm:ss")}</#if>" <#if cid??>disabled</#if>></td>
					</tr>
					</#if>
					<tr>
						<td class="zxltd"><span class="must">*</span>最长有效期（天）：</td>
						<td><input class="form_inp" type="text" placeholder="请输入优惠券最长有效期，-1代表直到使用期限" id="time" name="day" value="${(coupon.day)!}" <#if cid??>disabled</#if>></td>
					</tr>
					<tr>
						<td class="zxltd"><span class="must">*</span>最低消费（元）：</td>
						<td><input class="form_inp" type="text" placeholder="最低消费" id="limit" name="limit" value="${(coupon.limitmoney)!}" <#if cid??>disabled</#if>></td>
					</tr>
					<tr>
						<td class="zxltd"><span class="must">*</span>面值（元）：</td>
						<td><input class="form_inp" type="text" placeholder="面值" id="money" name="money" value="${(coupon.money)!}" <#if cid??>disabled</#if>></td>
					</tr>
					<#if cid??>
					<tr>
						<td class="zxltd"><span class="must">*</span>状态：</td>
						<td>
						<select>
							<#if coupon.stat=0>
							<option>正常</option>
							</#if>
							<#if coupon.stat=1>
							<option>下线</option>
							</#if>
						</select>
						</td>
					</tr>
					<#else>
					<tr>
						<td class="zxltd"><span class="must">*</span>状态：</td>
						<td>
						<select name="stat" >
							<option value="0">正常</option>
							<option value="1">下线</option>
						</select>
						</td>
					</tr>
					</#if>
					<#if permission==0>
					<tr>
						<td class="zxltd"><span class="must">*</span>可使用范围：</td>
						<td>
							<#if cid??>
							<input type="checkbox" <#if coupon.tt==1>checked="chedked"</#if> disabled />全商城通用券
							<#else>
							<input type="checkbox" name="tt" value="1" />全商城通用券
							</#if>
							
						</td>
					</tr>
					</#if>
					<tr>
						<td class="zxltd"><span class="must">*</span>可使用范围：</td>
						<td>
							<#if cid??>
							<select name="range" id="range">
								<#if coupon.userange==0>
								<option value="0">全场可用</option>
								</#if>
								<#if coupon.userange==1>
								<option value="1">指定品牌</option>
								</#if>
								<#if coupon.userange==2>
								<option value="2">指定分类</option>
								</#if>
							</select>
							<#else>
							<select name="range" id="range">
								<option value="0">全场可用</option>
								<option value="1">指定品牌</option>
								<option value="2">指定分类</option>
							</select>
							</#if>
							
						</td>
					</tr>
					<#if cid??&&coupon.userange==2>
					<tr>
						<td class="zxltd"><span class="must">*</span>分类范围：</td>
						<td>
						<select>
							<option>${coupon.firstCategory}</option>
						</select>
						<select>
							<option><#if coupon.secondCategory??>${coupon.secondCategory}<#else>全部</#if></option>
						</select>
						</td>
					</tr>
					<#else>
					<tr id="classchoice" style="display:none">
						<td class="zxltd"><span class="must">*</span>分类范围：</td>
						<td>
						<select name="flevel" id="shopFlevel" class="firstlevel">
						</select>
						<select id="shopSlevel" name="slevel">
						</select>
						</td>
					</tr>
					</#if>
					<#if cid??&&coupon.userange==1>
					<tr >
						<td class="zxltd"><span class="must">*</span>品牌：</td>
						<td>
						<select>
							<option>${coupon.favourablename}</option>
						</select>
						</td>
					</tr>
					<#else>
					<tr id="brandchoice" style="display:none">
						<td class="zxltd"><span class="must">*</span>品牌：</td>
						<td>
						<select name="brandid" id="brandSelect" >
						</select>
						</td>
					</tr>
					</#if>
					<tr>
						<td class="zxltd"><span class="must">*</span>是否满送：</td>
						<td>
							<#if cid??>
							<input type="checkbox" <#if coupon.howtoget==1>checked="chedked"</#if> disabled />是
							<#else>
							<input type="checkbox" name="full" id="full" value="1" />是
							</#if>
							
						</td>
					</tr>
					<#if cid??>
					<#if coupon.brandorclass??>
					<tr>
						<td class="zxltd"><span class="must">*</span>购买赠送此优惠券：</td>
						<td>
							<select>
								<#if coupon.brandorclass==0>
								<option>指定品牌</option>
								</#if>
								<#if coupon.brandorclass==1>
								<option>指定分类</option>
								</#if>
							</select>
						</td>
					</tr>
					</#if>
					<#else>
					<tr class="emoughbuy">
						<td class="zxltd"><span class="must">*</span>购买赠送此优惠券：</td>
						<td>
							<select name="erange" id="rangeenough">
								<option value="0">指定品牌</option>
								<option value="1">指定分类</option>
							</select>
						</td>
					</tr>
					</#if>
					<#if cid??>
					<#if coupon.brandorclass??&&coupon.whichEnoughName??>
					<tr id="eclasschoice">
						<td class="zxltd"><span class="must">*</span>分类范围：</td>
						<td>
						<select>
							<option>${coupon.efirstCategory}</option>
						</select>
						<select>
							<option>${coupon.esecondCategory}</option>	
						</select>
						</td>
					</tr>
					</#if>
					<#else>
					<tr id="eclasschoice" style="display:none" >
						<td class="zxltd"><span class="must">*</span>分类范围：</td>
						<td>
						<select name="eflevel" id="eshopFlevel" class="firstlevel">
						</select>
						<select id="eshopSlevel" name="eslevel">
						</select>
						</td>
					</tr>
					</#if>
					<tr id="ebrandchoice" style="display:none">
						<td class="zxltd"><span class="must">*</span>品牌：</td>
						<td>
						<select name="ebrandid" id="ebrandSelect" >
						</select>
						</td>
					</tr>
					<#if cid??>
					<#if coupon.brandorclass??&&coupon.enoughMoney??>
					<tr>
						<td class="zxltd"><span class="enoughmoney">*</span>最低购买（元）：</td>
						<td><input class="form_inp" type="text" value="${coupon.enoughMoney}"  disabled></td>
					</tr>
					</#if>
					<#else>
					<tr class="emoughbuy">
						<td class="zxltd"><span class="enoughmoney">*</span>最低购买（元）：</td>
						<td><input class="form_inp" type="text" placeholder="最低购买" id="elimit" name="elimit" value="" ></td>
					</tr>
					</#if>
							
					<tr  class="">
						<td class="zxltd">优惠券说明全文：</td>
						<td>
							<script type="text/plain" id="mycentent" style="width:700px;height:240px;">
								${(coupon.content)!}
							</script>
							<textarea style="display:none" id="txt-content" name="content" >
								${(coupon.content)!}
							</textarea>
							<script>
							var ue = UE.getEditor('mycentent');
							ue.addListener('blur',function(){
								$("#txt-content").val(ue.getContent());
							});
							</script>
						</td>
					</tr>
					<tr>
						<td></td>
						<td class="btntd">
							<button type="submit" class="dia_btn dialog_ok form_ok"><#if cid??>修改描述<#else>添加优惠券</#if></button>
						</td>
					</tr>
					
				</table>
			</div>
		</form>
	</div>
</div>


<script type="text/javascript" src="${base}/static/admin/js/yanzheng.js"></script>
<script type="text/javascript">
$('#deadline').datetimepicker({
	format:'Y-m-d H:i:s',
	lang:'ch'
});
var classchoicefirst = true;
var brandchoicefirst = true;
var ebrandchoicefirst = true;
var eclasschoicefirst = true;

$(function(){
	$("#rangeenough").bind("change",function(){
		var val = $(this).val();
		if(val==0){
			if(ebrandchoicefirst){
				$.ajax({
					url:"json/brand!list.action?rettype=select",
					success:function(html){
						$("#ebrandSelect").html(html);	
						ebrandchoicefirst=false;
					}
				})	
			}
			$("#eclasschoice").hide();
			$("#ebrandchoice").show();
		}else if(val==1){
			if(eclasschoicefirst){
				$.ajax({
					url:"json/category!list.action?rettype=select&nodeId=0",
					success:function(html){
						$("#eshopFlevel").html(html);
						eclasschoicefirst = false;
						$("#eshopFlevel").trigger("change");	
					}
				});	
			}
			$("#ebrandchoice").hide();
			$("#eclasschoice").show();
		}else{
			$("#ebrandchoice").hide();
			$("#eclasschoice").hide();
		}
	});
	$(".firstlevel").bind("change",function(){
		var nodeId = $(this).val();
		if(nodeId==null||nodeId=="null"){
			nodeId = 0;
		}
		var _this = $(this);
		$.ajax({
			url:"json/category!list.action?rettype=select&nodeId="+nodeId,
			success:function(html){
				$(_this).siblings("select").html(html);
				//$("#shopSlevel").html(html);
			}
		});	
	});
	$("#range").bind("change",function(){
		var val = $(this).val();
		if(val==1){
			if(brandchoicefirst){
				$.ajax({
					url:"json/brand!list.action?rettype=select",
					success:function(html){
						$("#brandSelect").html(html);	
						brandchoicefirst=false;
					}
				})	
			}
			$("#classchoice").hide();
			$("#brandchoice").show();
		}else if(val==2){
			if(classchoicefirst){
				$.ajax({
					url:"json/category!list.action?rettype=select&nodeId=0",
					success:function(html){
						$("#shopFlevel").html(html);
						classchoicefirst = false;
						$("#shopFlevel").trigger("change");	
					}
				});	
			}
			$("#brandchoice").hide();
			$("#classchoice").show();
		}else{
			$("#brandchoice").hide();
			$("#classchoice").hide();
		}
	});
	$("#shopFlevel").bind("change",function(){
		var nodeId = $(this).val();
		if(nodeId == null ||nodeId=="null"){
			nodeId = 0;
		}
		$.ajax({
			url:"json/category!list.action?rettype=select&nodeId="+nodeId,
			success:function(html){
				$("#shopSlevel").html(html);
			}
		});	
	});
	$("#timeout").bind("click",function(){
		if($(this).is(":checked")){
			$("#deadlinetr").hide();
			$("#deadline").removeClass("validate[required]");
		}else{
			$("#deadlinetr").show();
			$("#deadline").addClass("validate[required]");
		}
	});
	$("#full").bind("change",function(){
		if($(this).is(":checked")){
			$(".emoughbuy").show();
			$("#rangeenough").trigger("change");
		}else{
			$(".emoughbuy").hide();
		}
	})
	
	
})
</script>

<!-- 表单提交 -->
<#include "/WEB-INF/template/admin/myform.ftl" />
