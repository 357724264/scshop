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
    <link rel="stylesheet" type="text/css" href="${base}/static/admin/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${base}/static/admin/css/agency.css">

    <script type="text/javascript" src="${base}/static/admin/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${base}/static/admin/js/send-identifyingcode.js"></script>  <!-- 间隔时间发送验证码 -->

</head>
<body>
	<div class="container-fluid">
		<div class="row" style="border-bottom:1px solid #ba3a17">
			<div class='logo-area'>
				<img src="${base}/static/images/agency-logo.png" alt="卖乐疯" />
			</div>
		</div>	
		<form class="form-horizontal register-area">
		  	<div class="form-group">
			    <label for="username" class="col-sm-4 control-label"><i>*</i>手机号码或邮箱</label>
		     	<div class="col-sm-3">
			      	<input type="text" class="form-control" id="phone_mail" placeholder="必填">
			      	<span class="errors user-error"></span>
			    </div>			    
		  	</div>
		  	<div class="form-group">
			    <label for="username" class="col-sm-4 control-label"><i>*</i>验证码</label>
		     	<div class="col-sm-3 ident">
			      	<input type="text" class="form-control" maxlength="6" id="phone_mailCode" placeholder="请输入收到的验证码">
			      	<input type="button" id="identifying-btn" value="获取验证码"  />
			      	<span class="errors ident-error"></span>
			    </div>			    
		  	</div>		  	
		  	<div class="form-group">
			    <label for="username" class="col-sm-4 control-label"><i>*</i>设置密码</label>
		     	<div class="col-sm-3">
			      	<input type="password" class="form-control" id="password" placeholder="设置密码">
			      	<span class="errors pass-error"></span>
			    </div>			    
		  	</div>
		  	<div class="form-group">
			    <label for="username" class="col-sm-4 control-label"><i>*</i>确认密码</label>
		     	<div class="col-sm-3">
			      	<input type="password" class="form-control" id="password2" placeholder="请再输入一次">
			      	<span class="errors repass-error"></span>
			    </div>			    
		  	</div> 	
		  	
		  	<div class="form-group">
			    <div class="col-sm-offset-4 col-sm-3">
			      	<button type="button" id="register-btn" onclick="update()">修改密码</button>
			    </div>
		  	</div>
		</form>	
		<h5 class="text-center"></h5>
	</div>
      <script type="text/javascript">
        //发送验证码
    $(function(){
    	$(document).on('click','#identifying-btn',function(){
    		var phone_mail=$("#phone_mail").val();
    	if (!$("#phone_mail").val().match(/([a-zA-Z0-9]{1,10}@[a-zA-Z0-9]{1,5}\.[a-zA-Z0-9]{1,5})|(((1[0-9][0-9])+\d{8}))/)) 
		{ 
			alert("手机号码 或邮箱格式不正确！");
			return;
		}	
    		
		if($("#phone_mail").val().match(/([a-zA-Z0-9]{1,10}@[a-zA-Z0-9]{1,5}\.[a-zA-Z0-9]{1,5})/)){
		   var url='json/login!checkemail.action';
		   
		}else if($("#phone_mail").val().match(/(((1[0-9][0-9])+\d{8}))/)){
		   var url='json/login!checkPhone.action';
		}
		
			$.ajax({
				type:'POST',
				url:url,
                data:{phone_mail:phone_mail},
				success:function(data){
					var data = eval("("+data+")");
					if(data=="-1"){
					    alert("用户不存在!");
					}else if(data.success){
						sendMessage();
						flag = false;
					}else{
						alert(data.code);
					}
				},
				error:function(data){
					alert('未知错误!');
				}
				
			})
    	})
    })
    
    //修改密码
        function update()
	{
		var phone_mail=$("#phone_mail").val();
		var pass=$("#password").val();
		var pass2=$("#password2").val();
		var phone_mailcode=$("#phone_mailCode").val();
		
		if (!$("#phone_mail").val().match(/([a-zA-Z0-9]{1,10}@[a-zA-Z0-9]{1,5}\.[a-zA-Z0-9]{1,5})|(((1[0-9][0-9])+\d{8}))/)) 
		{ 
			alert("手机号码 或邮箱格式不正确！");
			return;
		}	
    		
		if($("#phone_mail").val().match(/([a-zA-Z0-9]{1,10}@[a-zA-Z0-9]{1,5}\.[a-zA-Z0-9]{1,5})/)){
		   var url='json/login!alterpassby_e.action';
		   
		}else if($("#phone_mail").val().match(/(((1[0-9][0-9])+\d{8}))/)){
		   var url="json/login!alterpassby_p.action";
		}
		if(pass == ""||pass2 == ""){
		    alert("密码不能为空");
		    return;
		}
		
		if(pass!=pass2){
		    alert("两次输入的密码不相同");
		    return;
		}                   
		
		if (phone_mailcode==""||phone_mailcode==null) 
		{ 
			alert("请填写验证码！");
			return;
		}
		
		$.ajax({
			url:url,
			type:"post",
			data:{"phone_mail":phone_mail,
			      "pwd":pass,
			      "code":phone_mailcode
			      },
			success:function(html){
				if(html=="success"){
					alert("密码修改成功！");
					location.href="login.action";
				}else if(html=="-1"){
					alert("手机号码或邮箱存在！");
				}else if(html=="error"){
					alert("验证码错误！");
				}else{
					alert("未知错误！");
				}
			}
		})
	}
    
    	function checkTextLength(obj, length){      
           if(obj.value.length > length){                
               obj.value = obj.value.substr(0, length);   
           }   
		}
    </script>
</body>
</html>
