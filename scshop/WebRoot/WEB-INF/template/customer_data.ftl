<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>个人信息</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.5.6/css/sm.min.css">
<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.5.6/css/sm-extend.min.css">
<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.5.6/css/sm-extend.min.css">
<link rel="stylesheet" href="${base}/static/fonts/iconfont.css">
<link rel="stylesheet" href="${base}/static/css/myapp.css">

</head>
<body>
	<div class="page">
	  	<header class="bar bar-nav" id="second-bar">
		    <a class="button button-link button-nav pull-left" href="center.action" data-transition='slide-out'>
		      	<span class="icon iconfont icon-xiangzuo2"></span>
		    </a>
	    	<h1 class="title">个人信息</h1>
	  	</header>

	  	<div class="content padd-content">
	  		<div class="grxx-box">
	  			<table>
	  				<tbody>
	  					<tr>
	  						<td class="td1">头像</td>
	  						<td class="td2">
	  							<div class="abm-img">
	  								<input type="file" id="upimg" />
	  								<img id="avatar1" src="${customer.pic}" />
	  							</div>
	  						</td>
	  					</tr>
	  					<tr>
	  						<td class="td1">昵称</td>
	  						<td class="td2"><a class="external" href="customer!nickname.action">
	  						<#if !customer.name??>${customer.phone}<#else>${customer.name}</#if></a></td>
	  					</tr>
	  				</tbody>
	  			</table>
	  		</div>

	  		<h5 class="obm-tit">安全管理</h5>
	  		<div class="grxx-box">
	  			<table>
	  				<tbody>
	  					<tr>
	  						<td class="td1">手机号码</td>
	  						<td class="td2"><a class="external" href="customer!changephone.action">${customer.phone}</a></td>
	  					</tr>
	  					<tr>
	  						<td class="td1">电子邮箱</td>
	  						<td class="td2">
	  					    <a class="external" href="login!email.action">
	  		                   <#if customer.emailtest==1>
				                             已认证
				               </#if>
				               <#if customer.emailtest==0>
				               未认证
				               </#if>
				           </a></td>
	  					</tr>
	  					<tr>
	  						<td class="td1">登陆密码</td>
	  						<td class="td2"><a class="external"  href="customer!alterpass.action">修改</a></td>
	  					</tr>
	  					<tr>
	  						<td class="td1">代理申请</td>
	  						<td class="td2"><a href="customer!toagent.action">申请</a></td>
	  					</tr>
	  				</tbody>
	  			</table>
	  		</div>
	  	</div>	  	
	</div>
	
	<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script> 
    
    <script type="text/javascript" src="${base}/static/admin/js/jquery.ajaxfileupload.js"></script>
    
     <script type='text/javascript' >
     
     // 上传图片

$(function() {
   //another option is using modals
	$('#avatar1').live('click', function(){
		$("#upimg").trigger("click");
	});
	$('#upimg').live("change",function(){
		fileupload();
	});
	
});

function fileupload(){
	$.ajaxFileUpload({
			url:'${base}/upload.action',       //需要链接到服务器地址
			secureuri:false,
			fileElementId:'upimg',                            //文件选择框的id属性
			dataType: 'text/html',                                   //服务器返回的格式，可以是json
			fileSize:300,     
			data:{width:'520', length:'250',limit:300},
			success: function (data, textStatus) {
				//兼容ie8以及以下版本
	        	if(data.success){
	        		$("#addImages").val(data.bigurl);
					$("#avatar1").attr("src",data.bigurl);
	        	}
	            //兼容火狐、谷歌、ie8以上版本
				var dat = eval("("+data+")");
				if(dat.success){
					$("#addImages").val(dat.bigurl);
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
     
     </script> 
</body>
</html>