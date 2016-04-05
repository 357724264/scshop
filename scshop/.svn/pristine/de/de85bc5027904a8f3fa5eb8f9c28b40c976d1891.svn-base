<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>邮箱验证</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link rel="stylesheet" href="http://g.alicdn.com/msui/sm/0.5.6/css/sm.min.css">
<link rel="stylesheet" href="http://g.alicdn.com/msui/sm/0.5.6/css/sm-extend.min.css">
<link rel="stylesheet" href="http://g.alicdn.com/msui/sm/0.5.6/css/sm-extend.min.css">
<link rel="stylesheet" href="${base}/static/fonts/iconfont.css">
<link rel="stylesheet" href="${base}/static/css/myapp.css">
<style type="text/css">
	.ques{width:100%; padding:0 .8rem; font-size:.75rem; margin-top:.5rem;}
</style>
</head>
<body>
  <#if yiyanz="1">
          验证通过
   <#elseif yiyanz="2">
         验证出错
   <#else>
	<div class="page">
	  	<header class="bar bar-nav" id="second-bar">
		    <a class="button button-link button-nav pull-left back" href="center.action#router2" data-transition='slide-out'>
		      	<span class="icon iconfont icon-xiangzuo2"></span>
		    </a>
		    <#if emailtest=1>
	    	<h1 class="title"> 修改邮箱</h1>
	    	<#else>
	    	<h1 class="title"> 邮箱验证</h1>
	    	</#if>
	  	</header>

	  	<div class="content padd-content">
	  		
	  		<div class="registerbox">
	  			<div class="regist-group">
	  				<input type="text" id="email" value="${email}" class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true"  />
	  				<input type="button" id="identifying-btn"  value="验证邮箱" />
	  			</div>
	  		</div>
	  		<div class="defaultbtnbox">
	  			<button type="button" onclick="update()" class="defaultbtn">修改邮箱</button>
	  		</div>
			<p class="ques">收不到邮件？可以去邮箱中的“垃圾箱”看看。</p>
	  	</div>
	</div>
	</#if>

	<script type='text/javascript' src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>
    <script type="text/javascript" src="${base}/static/js/send-identifyingcode.js"></script>  <!-- 间隔时间发送验证码 -->

    <!-- 控制验证码只能输入6位数 -->
    <script type="text/javascript">
    	function checkTextLength(obj, length){      
           if(obj.value.length > length){                
               obj.value = obj.value.substr(0, length);   
           }   
		}
    </script>
    <!-- 控制验证码只能输入6位数 -->
</body>
</html>
    <!-- 控制验证码只能输入6位数 -->
    <script type="text/javascript">
        //发送验证码
    $(function(){
    	$(document).on('click','#identifying-btn',function(){
    		var email=$("#email").val();
		    if(email==""){
		     $.alert("邮箱不能为空!");
		     return;
		    }
			$.ajax({
				url:"json/login!sendemail.action",
		     
                data:{"email":email},
				success:function(html){
				    if(html=="success"){
						sendMessage();
						$.alert("验证码已发送");
					}
				}, 
				error:function(html){
					$.alert('未知错误!');
				}
				
			})
    	})
    })
    
    //改变手机
        function update()
	{
		var email=$("#email").val();
		if (email == "") 
		{ 
			$.alert("邮箱不能为空！");
			return;
		}
		$.ajax({
			url:"json/login!updateemail.action",
			type:"post",
			data:{"email":email},
			success:function(html){
				if(html=="success"){
					$.alert("邮箱修改成功！");
					window.location.href = 'center.action#router2'
				}else{
					$.alert("未知错误！");
				}
			}
		})
	}
    	
    </script>
    
    
    <!-- 控制验证码只能输入6位数 -->
</body>
</html>