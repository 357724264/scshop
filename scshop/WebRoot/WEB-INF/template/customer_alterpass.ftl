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
		    <a class="button button-link button-nav pull-left back" href="center.action#router2" data-transition='slide-out'>
		      	<span class="icon iconfont icon-xiangzuo2"></span>
		    </a>
	    	<h1 class="title">修改密码</h1>
	  	</header>

	  	<div class="content padd-content">
	  		<div class="registerbox">
	  			<div class="regist-group">
	  				<input type="password" id="pwd" class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true" placeholder="请输入旧密码" />
	  			</div>
	  			<div class="regist-group">
	  				<input type="password" id="pwd2" class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true" placeholder="请设置新密码" />
	  			</div>
	  			<div class="regist-group">
	  				<input type="password" id="pwd3" class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true" placeholder="再次确认密码" />
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
        
    
    //修改密码
        function update()
	{
		var pass=$("#pwd").val();
		var pass2=$("#pwd2").val();
		var pass3=$("#pwd3").val();
		if (pass== ""||pass2== ""||pass3== "") 
		{ 
			$.alert("密码不能为空！");
			return;
		}
		if (pass2!=pass3){
			$.alert("两次输入密码不同");
			return;
		}
		
		$.ajax({
			url:"json/customer!alterpass.action",
			type:"post",
			data:{"pwd":pass,"pwd2":pass2},
			success:function(html){
				if(html=="success"){
					$.alert("密码修改成功！");
					location.href="center.action#router2";
				}else if(html=="-1"){
					$.alert("密码错误！");
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