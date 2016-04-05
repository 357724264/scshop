<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>申请代理</title>
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
	    	<h1 class="title">申请代理</h1>
	  	</header>

	  	<div class="content padd-content">
	  		<div class="registerbox">
	  			<div class="regist-group">
	  				<input type="text" id="phone" value="" class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true" placeholder="请输入手机号码" />
	  			</div>
	  			<div class="regist-group">
	  				<input type="text" id="name" value="" class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true" placeholder="请输入真实姓名" />
	  			</div>
	  			<div class="regist-group">
	  				<input type="text" id="idnum" value="" class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true" placeholder="请输入身份证号码" />
	  			</div>
	  			<div class="regist-group">
	  				<input type="text" id="nowaddress" value="" class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true" placeholder="请输入可联系地址" />
	  			</div>
	  			
	  			
	  			
	  		</div>

	  		<div class="defaultbtnbox">
	  			<button type="button" class="dia_btn dialog_ok defaultbtn">提交申请</button>

	  		</div>
	  	</div>
	</div>

	<script type='text/javascript' src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>


    <script type="text/javascript">
    //提交申请
    
$(function(){
        
        $(".dialog_ok").click(function(){
			var phone=$("#phone").val();
			var name=$("#name").val();
			var idnum=$("#idnum").val();
			var nowaddress=$("#nowaddress").val();
			if ($("#phone").val() == "") { 
				$.alert("手机号码不能为空！");
				return;
			}
			if (!$("#phone").val().match(/^(((13[0-9]{1})|1[0-9][0-9])+\d{8})$/)) { 
				$.alert("手机号码格式不正确！");
				return;
			}
			if (name==""||name==null) { 
				$.alert("请填写姓名！");
				return;
			}
			if (idnum==""||idnum==null) { 
				$.alert("请填写身份证号！");
				return;
			}
			if (nowaddress==""||nowaddress==null) { 
				$.alert("请填写联系地址！");
				return;
			}
		
			$.ajax({
				url:"json/customer!submitagent.action",
				type:"post",
				data:{"phone":phone,"name":name,"idnum":idnum,"nowaddress":nowaddress},
				success:function(html){
					if(html=="success"){
						$.alert("申请成功！");
						location.href="center.action#router2";
					}else if(html=="have"){
						$.alert("已申请过！请耐心等待");
					}else{
						$.alert("未知错误！");
					}
				}
			});
	 	});
})
    
    	function checkTextLength(obj, length){      
           if(obj.value.length > length){                
               obj.value = obj.value.substr(0, length);   
           }   
		}
    </script>

</body>
</html>