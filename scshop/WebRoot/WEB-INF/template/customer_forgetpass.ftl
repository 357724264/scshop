<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>修改密码</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link rel="stylesheet" href="http://g.alicdn.com/msui/sm/0.5.6/css/sm.min.css">
<link rel="stylesheet" href="http://g.alicdn.com/msui/sm/0.5.6/css/sm-extend.min.css">
<link rel="stylesheet" href="http://g.alicdn.com/msui/sm/0.5.6/css/sm-extend.min.css">
<link rel="stylesheet" href="${base}/static/fonts/iconfont.css">
<link rel="stylesheet" href="${base}/static/css/myapp.css">
</head>
<body>
	<div class="page">
	  	<header class="bar bar-nav" id="second-bar">
		    <a class="button button-link button-nav pull-left back" href="#" data-transition='slide-out'>
		      	<span class="icon iconfont icon-xiangzuo2"></span>
		    </a>
	    	<h1 class="title">修改密码</h1>
	  	</header>

	  	<div class="content padd-content">
	  		<div class="registerbox">
	  			<div class="regist-group">
	  				<input type="text" id="phone" value="" class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true" placeholder="请输入手机号码" />
	  			</div>
	  			<div class="regist-group">
	  				<input type="number" id="phonecode" class="regist-ipt" oninput="checkTextLength(this,6)" placeholder="请输入验证码" autocapitalize="off" autocomplete="off" spellcheck="true" />
	  				<input type="button" id="identifying-btn"  value="获取验证码" />
	  			</div>
	  			<div class="regist-group">
	  				<input type="password" id="pwd" class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true" placeholder="请设置新密码" />
	  			</div>
	  			<div class="regist-group">
	  				<input type="password" id="pwd2" class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true" placeholder="再次确认密码" />
	  			</div>
	  		</div>

	  		<div class="defaultbtnbox">
	  			<button type="button" onclick="update()" class="defaultbtn">修改密码</button>

	  		</div>
	  	</div>
	</div>

	<script type='text/javascript' src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>
    <script type="text/javascript" src="${base}/static/js/send-identifyingcode.js"></script>  <!-- 间隔时间发送验证码 -->

    <!-- 控制验证码只能输入6位数 -->
    <script type="text/javascript">
        //发送验证码
    $(function(){
    	$(document).on('click','#identifying-btn',function(){
    		var phone=$("#phone").val();
		
			$.ajax({
				url:"json/user!checkPhone.action",
                data:{phone:phone},
				success:function(html){
				
					var json = eval("("+html+")");
					if(html=="-1"){
					   $.alert("用户不存在!");
					}else if(json.success){
						sendMessage();
						flag = false;
					}else{
						alert(json.code);
					}
				}, 
				error:function(html){
					alert('未知错误!');
				}
				
			})
    	})
    })
    
    //修改密码
        function update()
	{
		var phone=$("#phone").val();
		var pass=$("#pwd").val();
		var pass2=$("#pwd2").val();
		var phonecode=$("#phonecode").val();
		
		if ($("#phone").val() == ""){ 
			$.alert("手机号码不能为空！");
			return;
		}
		if (!$("#phone").val().match(/^(((13[0-9]{1})|1[0-9][0-9])+\d{8})$/)){ 
			$.alert("手机号码格式不正确！");
			return;
		}
		if (phonecode==""||phonecode==null) 
		{ 
			$.alert("请填写验证码！");
			return;
		}
		if(pass == ""||pass2 == ""){
		    $.alert("密码不能为空");
		    return;
		}
		if(pass != pass2){
		    $.alert("两次密码输入不同");
		    return;
		}
		$.ajax({
			url:"json/user!alterpass.action",
			type:"post",
			data:{"phone":phone,"pwd":pass,"code":phonecode},
			success:function(html){
				if(html=="success"){
					$.alert("密码修改成功！");
					location.href="login.action";
				}else if(html=="-1"){
					$.alert("号码不存在！");
				}else if(html=="error"){
					$.alert("验证码错误！");
				}else{
					$.alert("未知错误！");
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
    <!-- 控制验证码只能输入6位数 -->
</body>
</html>