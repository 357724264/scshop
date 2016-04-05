<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>用户注册</title>
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
		    <a class="button button-link button-nav pull-left" href="login.action" data-transition='slide-out'>
		      	<span class="icon iconfont icon-xiangzuo2"></span>
		    </a>
	    	<h1 class="title">用户注册</h1>
	  	</header>

	  	<div class="content padd-content">
	  		<div class="registerbox">
	  			<div class="regist-group">
	  				<input type="text" id="phone" class="regist-ipt" 
	  				value="" autocapitalize="off" autocomplete="off" spellcheck="true" placeholder="请输入手机号码" />
	  			</div>
	  			<div class="regist-group">
	  				<input type="number" id="phonecode" class="regist-ipt" oninput="checkTextLength(this,6)" placeholder="请输入验证码" autocapitalize="off" autocomplete="off" spellcheck="true" />
	  				<input type="button" id="identifying-btn" value="获取验证码" />
	  			</div>
	  			<div class="regist-group">
	  				<input type="password" id="pwd"  class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true" placeholder="请设置密码" />
	  			</div>
	  			<div class="regist-group">
	  				<input type="password" id="pwd2" class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true" placeholder="再次确认密码" />
	  			</div>
	  			<div class="regist-group">
	  				<input type="text" id="note" class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true" placeholder="选填，输入备注" />
	  			</div>
	  		</div>

	  		<div class="defaultbtnbox">
	  		    <label class="yhxjcheck">
	  				<input type="checkbox" id="agreen" class="checkbtn"  checked="true" /><i class='iconfont icon-duigou'></i>&nbsp;已阅读并同意<a href="#" class="open-protocol">《用户协议》</a>
	  			</label>
	  			<button type="button" class="defaultbtn" onclick="update()">注册</button>
	  		</div>
	  	</div>
	</div>

	<div class="popup popup-protocol">
	  	<div class="content-block cont">
	  		<a href="#" class="close-popup protocolbtn">&#10005;</a>
	  		<div class='cont-inner'>
	  			${info.user_protocol}
	  		</div>
	  	</div>
	</div>

	<script type='text/javascript' src='${base}/static/js/zepto.min.js' charset='utf-8'></script>
	<script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>
    <script type="text/javascript" src="${base}/static/js/send-identifyingcode.js"></script>  <!-- 间隔时间发送验证码 -->

    <!-- 控制验证码只能输入6位数 -->
    <script type="text/javascript">
    
    //发送验证码
    $(function(){
    	$(document).on('click','#identifying-btn',function(){
    		var phone=$("#phone").val();
    		if (!$("#phone").val().match(/^(((13[0-9]{1})|1[0-9][0-9])+\d{8})$/)) 
		    { 
			$.alert("手机号码格式不正确！");
			return;
		    }
		
			$.ajax({
				url:"json/register!checkPhone.action",
                data:{phone:phone},
				success:function(html){
					var json = eval("("+html+")");
					if(html=="-1"){
					   $.alert("用户已经存在!");
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
		
		//注册验证
	function update()
	{
		var phone=$("#phone").val();
		var pass=$("#pwd").val();
		var pass2=$("#pwd2").val();
		var phonecode=$("#phonecode").val();
		var note = $("#note").val();
		var agreen = $("#agreen").is(':checked');
		if (!agreen == true) 
		{ 
			$.alert("未同意用户协议不能注册");
			return;
		}
		
		if ($("#phone").val() == "") 
		{ 
			$.alert("手机号码不能为空！");
			return;
		}
		if (!$("#phone").val().match(/^(((13[0-9]{1})|1[0-9][0-9])+\d{8})$/)) 
		{ 
			$.alert("手机号码格式不正确！");
			return;
		}
		if (phonecode==""||phonecode==null) 
		{ 
			$.alert("请填写验证码！");
			return;
		}
		
		
		if(pass.length<6)
		{
			$.alert("密码不能小于6位数!")
			return;
		}
		if(pass!=pass2)
		{
			$.alert("两次输入的密码不同!")
			return;
		}
		$.ajax({
			url:"json/register!in.action",
			type:"post",
			data:{
			"phone":phone,
			"pwd":pass,
			"code":phonecode,
			"note":note
			},
			success:function(html){
				if(html=="success"){
					$.alert("用户注册成功！");
					location.href="login.action";
				}else if(html=="-1"){
					$.alert("号码已经存在！");
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
		
		$(document).on('click','.open-protocol', function () {
		  $.popup('.popup-protocol');
		});
    </script>
    <!-- 控制验证码只能输入6位数 -->

</body>
</html>