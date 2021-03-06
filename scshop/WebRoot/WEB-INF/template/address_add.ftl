<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>添加地址</title>
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
		    <a class="button button-link button-nav pull-left" href="address!list.action" data-transition='slide-out'>
		      	<span class="icon iconfont icon-xiangzuo2"></span>
		    </a>
	    	<h1 class="title">添加地址</h1>
		    <button id="identifying-btn1" class="button button-link button-nav pull-right sc-bj"  data-transition='slide-out'>
		          保存
		    </button>
	  	</header>

	  	<div class="content padd-content">
	  		<table class="tjdzbox">
	  			<tbody>
	  				<tr>
	  					<td class="tjdz-label">收货人&nbsp;:&nbsp;</td>
	  					<td><input id="name" type="text" placeholder="请务必填写 真实姓名" /></td>
	  				</tr>
	  				<tr>
	  					<td class="tjdz-label">手机号码&nbsp;:&nbsp;</td>
	  					<td><input id="phone" type="text" placeholder="必填" /></td>
	  				</tr>
	  				<tr>
	  					<td class="tjdz-label">身份证&nbsp;:&nbsp;</td>
	  					<td><input id="identity" type="text" placeholder="请务必填写 真实身份信息" /></td>
	  				</tr>
	  				<tr>
	  					<td class="tjdz-label">所在地区&nbsp;:&nbsp;</td>
	  					<td><input  type="text" id='city-picker' value="广东省 深圳市 龙华新区" /></td>
	  				</tr>
	  				<tr>
	  					<td class="tjdz-label">详细地址&nbsp;:&nbsp;</td>
	  					<td><input id="address_detail" type="text" placeholder="必填" /></td>
	  				</tr>
	  			</tbody>
	  		</table>

	  		<label class="set-default">
	  			<input id="iscommon" type="checkbox"  name = "iscommon" /><i class='iconfont icon-duigou'></i>
	  			设置为默认
	  		</label>
	  	</div>	  	
	</div>
	
	<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>  
    <!-- 地址选择 -->
    <script type="text/javascript" src="${base}/static/js/city.js" charset="utf-8"></script>
    <script type="text/javascript">
    	// 地址选择 
    	$("#city-picker").cityPicker({
		    toolbarTemplate: '<header class="bar bar-nav">\
		    <button class="button button-link pull-right close-picker">确定</button>\
		    <h1 class="title">选择收货地址</h1>\
		    </header>'
		});

		//添加地址
		$(function(){
    	$(document).on('click','#identifying-btn1',function(){
			var name=$("#name").val();
			var phone=$("#phone").val();
			var identity=$("#identity").val();
			var address=$("#city-picker").val();
			var address_detail=$("#address_detail").val();
			var iscommon=$("#iscommon").is(':checked');
			var defaultadd = iscommon?1:0;
			if(name==""){
			    $.alert("收件人不能为空!");
			    return;
			}
			if (!$("#phone").val().match(/^(((13[0-9]{1})|1[0-9][0-9])+\d{8})$/)) 
		    { 
			$.alert("手机号码格式不正确！");
			return;
		    }
		    if(!identity.match(/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/)){
		        $.alert("身份证号码格式不对");
		        return;
		    }
			if (address_detail<10) 
			{ 
				$.alert("详细地址不能少于5个！");
				return;
			}
				
			$.ajax({
				url:"json/address!save.action",
				type:"post",
				data:{"name":name,
				      "iscommon":defaultadd,
				      "phone":phone,
				      "identity":identity,
				      "address":address,
				      "address_detail":address_detail,
				      "oid":"${oid!""}"},
				success:function(html){
					var dat = eval("("+html+")");
					if(dat.success){
						$.alert("添加成功！");
						<#if oid??>
						location.href="pay!sure.action?id=${oid}&aid="+dat.url;
						<#else>
						location.href="address!list.action";
						</#if>
					
					}else{
						$.alert("未知错误！");
					}
				}
			})
		})
	})
	
    </script>

</body>
</html>