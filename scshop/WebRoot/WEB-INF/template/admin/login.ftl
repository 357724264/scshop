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

    <script type="text/javascript" src="${base}/static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${base}/static/js/login.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class='logo-area'>
			</div>
		</div>
		<div class="row login-area" style="background:url('${base}/static/images/bck.jpg'); background-size:cover;">
			<div class='col-md-5 col-md-offset-7'>
				<div class="login-box">
					<form>
						<h5>商家入驻</h5>
						<div class="form-group">
						    <label for="username" class="sr-only">用户名</label>
						    <input type="text" class="form-control" autocomplete="off" id="username" placeholder="用户名/手机号/邮箱">
						    <span class="errors user-error"></span>
					  	</div>
					  	<div class="form-group">
					    	<label for="password" class="sr-only">密码</label>
					    	<input type="password" class="form-control" id="password" placeholder="密码">
					    	<span class="errors pass-error"></span>
					  	</div>
					  	<button type="button" id="submit-btn" class="btn-zdy">登&nbsp;&nbsp;录</button>
					  	<div class="other">
					  		<a href="login!forgetpass.action" class="pull-left">忘记密码</a>
					  		<a href="shop_form!register.action" class="pull-right">商家注册</a>
					  	</div>
					</form>
				</div>
			</div>
		</div>

		<h5 class='sign'>海外购商城</h5>
	</div>

	<script type="text/javascript" src="${base}/static/js/bootstrap.min.js"></script>
</body>
</html>
