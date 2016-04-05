<#include "/WEB-INF/template/admin/header.ftl" />

	
	<!-- 板块独有内容 -->
	<script>
	$("#wzpz").addClass("on");
	</script>
	<style>
	  .form_text {
	    width: 700px;
	    height: 220px;
  		}
  	  .zxltd{
  	    color:red;
  	  }
	</style>
	<div class="zxbody">
		<div class="zxbody_title zxbody_title2">
			<a href="javascript:history.back();" class="zxback">
				<img src="${base}/static/admin/img/do_back.png">
			</a>
			网站配置
		</div>
		<form id="myform" name="myform" method="post" action="">
			<div class="zxform">
				<table cellspacing="0" cellpadding="0" width="100%" class="zxtable">
					<tr  class="tt-0">
						<td class="zxltd">公众号appid：</td>
						<td><input class="dia_inp" type="text" placeholder=" " id="gzha" name="appid" value="${(info.appid)!}" ></td>
					</tr>
					
					<tr  class="tt-0">
						<td class="zxltd">公众号appsecret：</td>
						<td><input class="dia_inp" type="text" placeholder=" " id="gzhs" name="appkey" value="${(info.appkey)!}" ></td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">微信支付商户号：</td>
						<td><input class="dia_inp" ms-duplex-required="a" type="text" placeholder=" " id="shh"  name="wxno" value="${(info.wxpayno)!}" ></td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">微信支付秘钥：</td>
						<td><input class="dia_inp" ms-duplex-required="a" type="text" placeholder=" " id="zfmy" name="wxsecret" value="${(info.wxpaySecret)!}" ></td>
					</tr>
					
					<tr  class="tt-0">
						<td class="zxltd">多少积分换取一元：</td>
						<td><input class="dia_inp" type="text" placeholder=" " name="point" id="hyy" value="${(info.pointperyuan)!}" ></td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">多少分钟不支付自动删除订单：</td>
						<td><input class="dia_inp" type="text" placeholder=" "  name="unpay" id="zdsc" value="${(info.minuteNoPayDelete)!}" ></td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">多少天不确认收货自动收货：</td>
						<td><input class="dia_inp" type="text" placeholder="" name="send" id="zdsh" value="${(info.dayNoPaySure)!}" ></td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">注册赠送的优惠券：</td>
						<td>
						<select name="couponid">
							<#list list as coupon>
								<option value="${coupon.id}">${coupon.name}</option>
							</#list>
						</select>
						</td>
					</tr>
					<tr class="tt-0">
						<td class="zxltd">用户协议：</td>
						<td><textarea class="form_text" id="user_protocol" placeholder="请填写用户协议" name="intro">${(info.user_protocol)!}</textarea></td>
					</tr>
					<tr class="tt-0">
						<td class="zxltd">供应商须知：</td>
						<td><textarea class="form_text" id="notice" placeholder="请填写须知" >${(info.notice)!}</textarea></td>
					</tr>
					<tr class="tt-0">
						<td class="zxltd">客户隐私政策：</td>
						<td><textarea class="form_text" id="privacy" placeholder="请填写客户隐私政策" >${(info.privacy)!}</textarea></td>
					</tr>
					<tr class="tt-0">
						<td class="zxltd">条款和条件：</td>
						<td><textarea class="form_text" id="clause" placeholder="请填写条款和条件" >${(info.clause)!}</textarea></td>
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
			$('#myform :input').blur(function(){
		         if( $(this).is('#gzha') ){
		              $(this).required();
		         }
		         if( $(this).is('#gzhs') ){
		            $(this).required();
		         }
		         if( $(this).is('#hyy') ){
		            $(this).decimal();
		         }
		         if($(this).is('#zdsc')){
		         	$(this).numb();
		         }
		         if($(this).is('#zdsh')){
		         	$(this).numb();
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
		            var gzha = $("#gzha").val();
		            var gzhs = $("#gzhs").val();
		            var shh = $("#shh").val();
		            var zfmy = $("#zfmy").val();
		            var hyy = $("#hyy").val();
		            var zdsc = $("#zdsc").val();
		            var zdsh = $("#zdsh").val();
		            var notice = $("#notice").val();
		            var privacy = $("#privacy").val();
		            var clause = $("#clause").val();
		            var user_protocol = $("#user_protocol").val();
		            $.ajax({
				               url :"json/webinfo!update.action",
							   data :{
							       appid : gzha,
								   appkey : gzhs,
								   wxno : shh,
								   wxsecret : zfmy,
								   point : hyy,
								   unpay : zdsc,
								   send : zdsh,
								   privacy : privacy,
								   clause : clause,
								   user_protocol:user_protocol,
								   notice : notice
							   },
				               type :"post",
				               success:function(data){
							   close_dialog();
				               window.location.href = 'webinfo.action';
				              }
				        });
		     });
		})
	
</script>

<!-- 表单提交 -->
<#include "/WEB-INF/template/admin/myform.ftl" />