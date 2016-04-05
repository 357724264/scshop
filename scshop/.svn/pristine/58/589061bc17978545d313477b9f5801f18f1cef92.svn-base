<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>修改昵称</title>
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
	    	<h1 class="title">修改昵称</h1>
	  	</header>

	  	<div class="content padd-content">
	  		<div class="registerbox">
	  			<div class="regist-group">
	  				<input type="text" id="nick" class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true" value="${name}" />
	  			</div>
	  		</div>

	  		<div class="defaultbtnbox">
	  			<button type="button" onclick="update()" class="defaultbtn">修改昵称</button>

	  		</div>
	  	</div>
	</div>

	<script type='text/javascript' src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>
    <script type="text/javascript" src="${base}/static/js/send-identifyingcode.js"></script>  <!-- 间隔时间发送验证码 -->

    <!-- 控制验证码只能输入6位数 -->
    <script type="text/javascript">
        
        function update(){
             var name = $("#nick").val();
             
             
             $.ajax({
			    url:"json/customer!altername.action",
			    type:"post",
			    data:{"name":name},
			    success:function(html){
				if(html=="success"){
					$.alert("昵称修改成功！");
					location.href="center.action#router2";
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