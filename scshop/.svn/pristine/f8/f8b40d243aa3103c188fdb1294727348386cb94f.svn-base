
<#include "/WEB-INF/template/admin/header.ftl" />
    <style>
    .up500{
	    height: 150px;
	    width: 265px;
}
    }
    </style>
	
	<!-- 板块独有内容 -->
	<script>
	$("#dpsh").addClass("on");
	</script>
	<div class="zxbody">
		<div class="zxbody_title zxbody_title2">
			<a href="javascript:history.back();" class="zxback">
				<img src="${base}/static/admin/img/do_back.png">
			</a>
			店铺审核
		</div>
		<form id="myform" name="myform" method="post" action="">
			<div class="zxform">
				<table cellspacing="0" cellpadding="0" width="100%" class="zxtable">
					<tr  class="tt-0">
						<td class="zxltd">公司名称：</td>
						<td><input class="dia_inp" type="text" placeholder=" " id="gzha" name="companyname" value="${(shopForm.companyname)!}" readonly="readonly" ></td>
					</tr>
					
					<tr  class="tt-0">
						<td class="zxltd">店铺名称：</td>
						<td><input class="dia_inp" type="text" placeholder=" " id="gzhs" name="shopName" value="${(shopForm.shopName)!}" readonly="readonly" ></td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">手机号码：</td>
						<td><input class="dia_inp" ms-duplex-required="a" type="text" placeholder=" " id="phone"  name="phone" value="${(shopForm.phone)!}" readonly="readonly" ></td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">邮箱：</td>
						<td><input class="dia_inp" ms-duplex-required="a" type="text" placeholder=" " id="email"  name="phone" value="${(shopForm.email)!}" readonly="readonly" ></td>
					</tr>
					
				<!--	<tr  class="tt-0">
						<td class="zxltd">身份证号码：</td>
						<td><input class="dia_inp" type="text" placeholder=" " name="point" id="idnum" value="${(shopForm.idnum)!}" readonly="readonly"></td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">身份证件图片：</td>
						<td><img id="avatar1" class="up500" src="${shopForm.idcardImages}" readonly="readonly"></td>
					</tr> -->
					
					<tr  class="tt-0">
						<td class="zxltd">相关资质证件：</td>
						<td><img id="avatar1" class="up500" src="${shopForm.agentImages}" readonly="readonly"></td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">企业注册号</td>
						<td><input class="dia_inp" type="text" placeholder=" "  name="unpay" id="registernum" value="${(shopForm.registernum)!}" readonly="readonly"></td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">企业证件图片：</td>
						<td><img class="up500" id="avatar2" src="${shopForm.enterpriseImages}" readonly="readonly"></td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">内容简述</td>
						<td><input class="dia_inp" type="text" placeholder=" "  name="description" id="description" value="${(shopForm.description)!}" readonly="readonly"></td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">信息反馈</td>
						<td><textarea  rows="4" cols="45"  name="reason" id="reason" ></textarea></td>
					</tr>
					<tr class="tt-0">
						<td></td>
						<td id="wrap">
							<label><input class="radioItem" name="stat" type="radio"  value="1" checked/>通过</label>
							<label><input class="radioItem" name="stat" type="radio"  value="-1"  />不通过</label>
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
		</form>
	</div>
</div>
<script src="${base}/static/admin/avalon.js"></script>
<script src="${base}/static/admin/highlight/shCore.js"></script>
<script type="text/javascript" src="${base}/static/admin/js/yanzheng.js"></script>
<script>

    $(function(){
      $('#reason').text("${feedback1}");
       $('#wrap  input[name="stat"]').click(function(){
         var selectstat = $('#wrap  input[name="stat"]:checked ').val();
         if(selectstat==1){
            $('#reason').text("${feedback1}");
         }else{
            $('#reason').text("${feedback2}");
         }
      });
    })
   
	
	$(function(){
		    	    
		    //提交，最终验证。
		     $('.dialog_ok').click(function(){
		            $("#myform :input.required").trigger('blur');
		            var numError = $('#myform .onError').length;
		            if(numError){
		                return false;
		            } 
		      
					var stat = $('#wrap  input[name="stat"]:checked ').val(); 
					var reason = $('#reason').text();
					var id = ${shopForm.id};
					var phone = $("#phone").val();
					var reason = $("#reason").val();
					var email = $("#email").val();
					if(stat == 1){
					  var feedback1 = reason;
					}else{
					  var feedback2 = reason;
					}
				    
					if (stat  == "") { 
						$.alert("请选择是否通过！");
						return;
					}
				
				
		            $.ajax({
				               url :"shop_form!update.action",
							   data :{
							   "stat":stat,
								"id":id,
								"phone":phone,
								"reason":reason,
								email:email,
								feedback1:feedback1,
								feedback2:feedback2
							   },
				               type :"post",
				               success:function(data){
							   close_dialog();
				               window.location.href = 'shop_form!list.action';
				              }
				        });
		     });
		})
	
</script>

<!-- 表单提交 -->
<#include "/WEB-INF/template/admin/myform.ftl" />