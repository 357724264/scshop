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
			    <label for="username" class="col-sm-4 control-label"><i>*</i>原密码</label>
		     	<div class="col-sm-3">
			      	<input type="password" class="form-control" id="password_now" placeholder="输入原密码">
			      	<span class="errors pass-error"></span>
			    </div>			    
		  	</div>
		  	<div class="form-group">
			    <label for="username" class="col-sm-4 control-label"><i>*</i>设置新密码</label>
		     	<div class="col-sm-3">
			      	<input type="password" class="form-control" id="password" placeholder="设置新密码">
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
			      	<button type="button" id="register-btn" onclick="alterpass()" >修改密码</button>
			    </div>
		  	</div>
		</form>	
		<h5 class="text-center">东莞市迈峰乐电子商务有限公司</h5>
	</div>
      <script type="text/javascript">
    
    //修改密码
        function alterpass()
	{
		var pass_now=$("#password_now").val();
		var pass=$("#password").val();
		var pass2=$("#password2").val();
		if(pass_now==""){
		   alert("请输入当前密码！");
		   return;
		}
		if(pass==""){
		   alert("密码不能为空！");
		   return;
		return;
		}
		if(pass!=pass2){
		    alert("两次输入的密码不相同");
		    return;
		}
		
		$.ajax({
			url:"json/customer!alterpass.action",
			type:"post",
			data:{
			      "password_now":pass_now,
			      "password2":pass, },
			success:function(html){
			var json=eval("("+html+")");
			    if(json.error==1){
			        alert("当前密码错误!");
			        return;
			    }
				if(json.success){
					alert("密码修改成功！");
					location.href="product!list.action";
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
