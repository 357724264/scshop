<#include "/WEB-INF/template/admin/header-hidden.ftl" />

<!doctype html>
<html>
<head>
    
	<title>首页</title>
	<meta charset="utf-8">
	<meta name="keywords" content=""> <!-- seo网站关键字 -->
	<meta name="description" content=""> <!-- seo对网站的文字描述 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<!-- IE使用最新渲染模式，chrome框架使用webkit内核 -->
	<meta name='renderer' content="webkit">
	<!-- 让360浏览器使用webkit内核 -->
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<!-- 让屏幕1：1缩放，并且在移动设备上禁止放大缩小 -->

	<!-- 以下两个插件用于在IE8以及以下版本浏览器支持HTML5元素和媒体查询，如果不需要用可以移除 -->
	<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->    
    <link rel="stylesheet" type="text/css" href="${base}/static/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${base}/static/css/agency.css">
    <script type="text/javascript" src="${base}/static/admin/js/jquery-1.7.1.js"></script>
    <style>
	    i{color:red;margin-right:3px;}
       .tccbox{width:70%; height:80%; background:#fff; box-shadow:1px 1px 2px #ddd,-1px -1px 2px #ddd; position:fixed;top:10%; left:15%; padding:10px; z-index:802; display:none;}
       .tccbox .tcc-scroll{width:100%; height:100%; padding-top:30px; overflow:hidden; position:relative;}
       .tccbox .tcc-scroll .scroll-area{width:100%;height:100%; position:relative;}
       .tccbox .tcc-scroll .tcc-wrapper{width:100%; height:100%; position:absolute;top:0px; left:0; bottom:0; overflow-x:hidden; overflow-y:auto; z-index:1; word-wrap: break-word; word-break:break-all; line-height:18px; font-size:13px;}
       .tccbox .tcc-close{display:inline-block; width:30px; height:30px; font-size:18px; float:right; text-align:center; position:absolute; top:0; right:0; z-index:2; color:#666;}
       .pop{position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,.4);
    z-index:800;
    visibility: hidden;
    opacity: 0;
    -webkit-transition-duration: .3s;
    -moz-transition-duration: .3s;
    -o-transition-duration: .3s;
    -ms-transition-duration: .3s;
    transition-duration: .3s;}
    .pop-visible{
	    visibility:visible;
	    opacity:1;
	}
	.khyslr,.tj{visibility:hidden; opacity:0;position: fixed;}
    </style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class='logo-area'>
				<img src="${base}/static/images/login-logo.png" alt="卖疯乐" />
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class='row scshopshzcbox'>
					<form class="form-horizontal">
					  	
					  	<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"><i>*</i>店铺名称</label>
						    <div class="col-sm-5">
						      	<input type="email" class="form-control" id="shopName" placeholder="请输入店铺名称">
						      	<span class="errors"></span>
						    </div>
					  	</div>
					  	<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"><i>*</i>用户名/账号</label>
						    <div class="col-sm-5">
						      	<input type="text" class="form-control" id="account" placeholder="请输入您的账号">
						      	<span class="errors"></span>
						    </div>
					  	</div>
					  	<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"><i>*</i>输入密码</label>
						    <div class="col-sm-5">
						      	<input type="password" class="form-control" id="password" placeholder="请输入您的密码">
						      	<span class="errors"></span>
						    </div>
					  	</div>
					  	<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"><i>*</i>重新输入密码</label>
						    <div class="col-sm-5">
						      	<input type="password" class="form-control" id="password2" placeholder="请输入您的密码">
						      	<span class="errors"></span>
						    </div>
					  	</div>
					  	<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"><i>*</i>联系人姓名</label>
						    <div class="col-sm-5">
						      	<input type="email" class="form-control" id="contactsName" placeholder="">
						      	<span class="errors"></span>
						    </div>
					  	</div>
					  	<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"><i>*</i>联系人电话</label>
						    <div class="col-sm-5">
						      	<input type="email" class="form-control" id="phone" placeholder="手机邮箱 选填其一">
						      	<span class="errors"></span>
						    </div>
					  	</div>
					  	<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"><i>*</i>联系人邮箱:</label>
						    <div class="col-sm-5">
						      	<input type="email" class="form-control" id="email" placeholder="手机邮箱 选填其一">
						      	<span class="errors"></span>
						    </div>
					  	</div>
					  	<div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label"><i>*</i>公司名称</label>
						    <div class="col-sm-5">
						      	<input type="email" class="form-control" id="companyname" placeholder="需与营业执照一致">
						      	<span class="errors"></span>
						    </div>
					  	</div>
			<!--	  	<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">身份证号码</label>
						    <div class="col-sm-5">
						      	<input type="text" class="form-control" id="idnum" placeholder="请输入您的身份证号码">
						      	<span class="errors"></span>
						    </div>
					  	</div>
					  	<div class="form-group">
						       <label for="inputPassword3" class="col-sm-2 control-label">身份证图片</label>
							   <div class="dialog_upload up500" style="margin-left:215px;">
									<img id="avatar1" src="${base}/static/admin/img/img520.jpg">
									<input type="file" id="file"  name="file" class="dia_file">
									<input type="hidden" id="idcardImages" name="idcardImages" value="">
								</div>
								<div class="dialog_tip form_tip" style="margin-left:215px;">
													点击上传上传身份证图片<p>
													格式：jpg、jpeg、png
													<br>
													图片大小不超过300kb（太大网站会加载很慢）
													</p>
								</div>
					  	</div>  -->
					  	
					  	<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"><i>*</i>营业执照/公司证件号</label>
						    <div class="col-sm-5">
						      	<input type="text" class="form-control" id="registernum" placeholder="请输入贵公司营业执照注册号">
						      	<span class="errors"></span>
						    </div>
					  	</div>
					  	<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"><i>*</i>公司注册文件/营业执照电子版</label>
						   <div class="dialog_upload up500" style="margin-left:215px;">
								<img id="avatar2" src="${base}/static/admin/img/img520.jpg">
								<input type="file" id="file1"  name="file" class="dia_file">
								<input type="hidden" id="enterpriseImages" name="enterpriseImages" value="">
							</div>
							<div class="dialog_tip form_tip" style="margin-left:215px;">
												点击上传上传企业证书图片<p>
												
												格式：jpg、jpeg、png
												<br>
												图片大小不超过300kb（太大网站会加载很慢）
												</p>
							</div>
					  	</div>
					  	<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"><i>*</i>计划入驻商品类别:</label>
						    <div class="col-sm-5">
						      	<input type="text" class="form-control" id="commoditycatagory" placeholder="计划入驻商品类别:">
						      	<span class="errors"></span>
						    </div>
					  	</div>
					  	<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">是否有品牌代理:</label>
						    <div class="col-sm-5">
						      	<input type="checkbox" style="height:40px;" id="agent" class="agent" >
						      	<span class="errors"></span>
						    </div>
					  	</div>
					  	<div class="form-group" id="zizhi" style="display:none;">
						       <label for="inputPassword3" class="col-sm-2 control-label">相关资质证件:</label>
							   <div class="dialog_upload up500" style="margin-left:215px;">
									<img id="avatar1" src="${base}/static/admin/img/img520.jpg">
									<input type="file" id="file"  name="file" class="dia_file">
									<input type="hidden" id="agentImages" name="agentImages" value="">
								</div>
								<div class="dialog_tip form_tip" style="margin-left:215px;">
													点击上传 (如何食品流通许可证、商标注册证件、品牌授权证书等)<p>
													格式：jpg、jpeg、png
													<br>
													图片大小不超过300kb（太大网站会加载很慢）
													</p>
								</div>
					  	</div>
					  	<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">其他供应渠道连接:</label>
						    <div class="col-sm-5">
						      	<input type="text" class="form-control" id="link" placeholder="">
						      	<span class="errors"></span>
						    </div>
					  	</div>
					  	<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"><i>*</i>国内售后联系地址:</label>
						    <div class="col-sm-5">
						      	<input type="text" class="form-control" id="inlandAddress" placeholder="">
						      	<span class="errors"></span>
						    </div>
					  	</div>
					  	<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">邮编:</label>
						    <div class="col-sm-5">
						      	<input type="text" class="form-control" id="postcode" placeholder="">
						      	<span class="errors"></span>
						    </div>
					  	</div>
					  	<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">联系电话:</label>
						    <div class="col-sm-5">
						      	<input type="text" class="form-control" id="contactsPhone" placeholder="">
						      	<span class="errors"></span>
						    </div>
					  	</div>
					  	<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">联系人:</label>
						    <div class="col-sm-5">
						      	<input type="text" class="form-control" id="contactsPeople" placeholder="">
						      	<span class="errors"></span>
						    </div>
					  	</div>
					  	
					</form>
				</div>

			</div>
		</div>
		<div class="col-sm-offset-3 col-sm-6 zjzbtnbox">
			<button type="button" id="register-btn" class="dia_btn dialog_ok">立即注册</button>
		</div>
		<div class="col-sm-12">
		</div>
		
	</div>
	<div class="tccbox">
		<a href="javascript:;" class="tcc-close">&#10005;</a>
		<div class="tcc-scroll">
			<div class="scroll-area">
				<div class='tcc-wrapper'>
					
				</div>
			</div>
		</div>
	</div>
    
    <div class="pop"></div>
    <p class="khyslr">${info.privacy}</p>
    <p class="tj">${info.clause}</p>
     <script type="text/javascript" src="${base}/static/js/jquery.ajaxfileupload.js"></script>
	<script type="text/javascript">
	
	//相关资质证件
	$("#agent").change(function(){
	   if($("#agent").is(':checked')){
	    $("#zizhi").fadeIn();
	   }else{
	    $("#zizhi").fadeOut();
	   }
	});
	  	
		$(function(){
			$(document).on('click','.khys',function(){
				var khys=$('.khyslr').html();
				$('.tcc-wrapper').html(khys);
				$('.pop').addClass('pop-visible');
				$('.tccbox').fadeIn();
			})
			$(document).on('click','.tiaojian',function(){
				var tj=$('.tj').html();
				$('.tcc-wrapper').html(tj);
				$('.pop').addClass('pop-visible');
				$('.tccbox').fadeIn();
			})
			$(document).on('click','.tcc-close',function(){
				$('.tccbox').fadeOut();
				$('.pop').removeClass('pop-visible');
			})
		})
		
		
//确定新增
       $(function(){
			
		    //提交，最终验证。
		     $(".dialog_ok").click(function(){
				var shopName = $("#shopName").val();
				var account = $("#account").val();
				var password = $("#password").val();
				var password2 = $("#password2").val();
				var contactsName = $("#contactsName").val();
				var phone = $("#phone").val();
				var email = $("#email").val();
	            var companyname = $("#companyname").val();
				var registernum = $("#registernum").val();
				var enterpriseImages = $("#enterpriseImages").val();
				var commoditycatagory = $("#commoditycatagory").val();
				var agent = $("#agent").is(':checked');
				var agentImages = $("#agentImages").attr('value');
				var link = $("#link").val();
				var postcode = $("#postcode").val();
				var contactsPhone = $("#contactsPhone").val();
				var contactsPeople = $("#contactsPeople").val();
				var inlandAddress = $("#inlandAddress").val();
				var enterpriseImages = $("#enterpriseImages").attr('value');
				
				//条件判断
				if(shopName==""){boxalert("请填写店铺名称!");return;}
				if(account==""){boxalert("请填写用户名/账号!");return;}
				if(password.length<8) {boxalert("密码不能小于8位数!"); return;}
				if(password!=password2){boxalert("两次密码输入不同！");return;}
				if(contactsName==""){boxalert("请填写联系人姓名!");return;}
				if(phone!=""){
					if (!$("#phone").val().match(/^(((13[0-9]{1})|1[0-9][0-9])+\d{8})$/)) { 
							boxalert("手机号码 格式不正确！");
							return;
					}
				}
				if(email!=""){
					if(!$("#email").val().match(/^([A-Z0-9]+[_|\_|\.]?)*[A-Z0-9]+@([A-Z0-9]+[_|\_|\.]?)*[A-Z0-9]+\.[A-Z]{2,3}$/i)){
					        boxalert("邮箱格式不正确");
					        return;
					}
				}
				if(email==""&&phone==""){
				    boxalert("手机 或 邮箱不能为空");
				    return;
				}
				if(companyname==""){boxalert("请填写公司名称!");return;}
				if(registernum==""){boxalert("请填写营业执照/公司证件号!");return;}
				if(enterpriseImages==""){boxalert("请上传营业执照!");return;}
				if(commoditycatagory==""){boxalert("请填写计划入驻商品类别!");return;}
				if(agent){if(agentImages==""){ boxalert("请上传 相关资质证件!") ;return;}}
				if(inlandAddress==""){boxalert("请填写国内售后地址!");return;}
				
				//检查身份证号码是否符合规范，包括长度，类型  
    			//身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X  
				//var reg = /(^\d{15}$)|(^\d{17}(\d|X)$)/;  
				//if(reg.test(idnum) === false)  {  
				//	alert("身份证不合规范，请输入正确的身份证号码!")
				//	return;  
   				//}  
				
				
				
					$.ajax({
			               url :"json/shopform!save.action",
			               type :"post",
						   data :{
								    shopName :shopName,
									account :account,
									password :password,
									contactsName :contactsName,
									phone :phone,
									email :email,
						            companyname :companyname,
									registernum :registernum,
									enterpriseImages :enterpriseImages,
									commoditycatagory :commoditycatagory,
									agent :agent,
									agentImages :agentImages,
									link :link,
									postcode :postcode,
									contactsPhone :contactsPhone,
									contactsPeople :contactsPeople,
									inlandAddress :inlandAddress,
						     },			              
							success:function(html){
								if(html=='success'){
									alert("申请成功，请耐心等待审核。");
									window.location.href = 'login.action';
								}else{
								alert(html);
								}
			              }
			        });
			     });
			})
//新增结束
		
		
 // 上传身份证图片

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
        		$("#agentImages").val(data.bigurl);
				$("#avatar1").attr("src",data.bigurl);
        	}
            //兼容火狐、谷歌、ie8以上版本
			var dat = eval("("+data+")");
			if(dat.success){
				$("#agentImages").val(dat.bigurl);
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

 // 上传企业证书图片

$(function() {
//another option is using modals
	$('#avatar2').live('click', function(){
		$("#file1").trigger("click");
	});
	$('#file1').live("change",function(){
		fileupload2();
	});
	
});

function fileupload2(){
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
        		$("#enterpriseImages").val(data.bigurl);
				$("#avatar2").attr("src",data.bigurl);
        	}
            //兼容火狐、谷歌、ie8以上版本
			var dat = eval("("+data+")");
			if(dat.success){
				$("#enterpriseImages").val(dat.bigurl);
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
		
	</script>
</body>
</html>
