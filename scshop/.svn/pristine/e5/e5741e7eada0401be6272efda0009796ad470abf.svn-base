x<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>收货地址</title>
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
		    <a class="button button-link button-nav pull-left external" href="center.action" data-transition='slide-out'>
		      	<span class="icon iconfont icon-xiangzuo2"></span>
		    </a>
	    	<h1 class="title">收货地址</h1>
	  	</header>

	  	<nav class="bar bar-tab" id="shdz-nav">
	  		<a href="address!add.action<#if oid??>?oid=${oid}</#if>" class="tjdz-link external">添加新地址</a>
	  	</nav>

	  	<div class="content padd-content">
	  		<dl class="shdz-box">
	  			
	  			<#if list??>
				<#list list as address>
	  			<dd class="shdz-list">	
	  				<div class="shdz-setbox">
	  					<label class="shdz-dqdz">
	  						<input id="checkbox_${address.id}" class="checkInput" type="checkbox" <#if address.id==defaultid>checked="checked" disabled="disabled"</#if> value="${address.id}"/><i class='iconfont icon-duigou'></i>设置为收货地址
	  					</label>
	  					<a href="#" class="shdz-det confirm-ok" id="del_${address.id}"><i class="iconfont icon-shanchu"></i></a>
	  				</div>
	  				<div class="shdz-addrinfobox">
	  					<a class="external" href="<#if oid??>pay!sure.action?aid=${address.id}&id=${oid}<#else>address!edit.action?aid=${address.id}</#if>">
		  					<div class="shdz-addrinfo">
		  						${address.province} ${address.city} ${address.qu}  ${address.address}<br>${address.name}&nbsp;${address.phone}
		  					</div>
		  					<div class="shdz-jt">
		  						<i class="iconfont icon-xiangyou1"></i>
		  					</div>
		  				</a>
	  				</div>
	  			</dd>
				</#list>
	  			<#else>还没地址，请添加新地址
	  			</#if>
	  		</dl>
	  	</div>	  	
	</div>
	<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>
   	<script type="text/javascript">
   	
   	    //注册验证
	function update()
	{
		var phonecode=$("#phonecode").val();
		
		$.ajax({
			url:"json/register!in.action",
			type:"post",
			data:{"phone":phone,"pwd":pass,"code":phonecode},
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
	
	$(document).on('change','.checkInput',function(){
		
		var addressid = $(this).val();
		$(".checkInput").prop('checked',false).removeAttr("disabled");
		$(this).prop('checked',true);
		$(this).attr("disabled","disabled");
		$.ajax({
		
			url: 'json/address!setDefaultAddress.action',
			type: 'post',
			data: {defaultid:addressid},
			success:function(data) {
				
			}
		});
				
	});
   	    
   		$(document).on('click','.confirm-ok', function () {
   			var ele = $(this);
   			var addressid = $(this).attr("id").replace("del_","");
   			var isChecked = $("#checkbox_" + addressid).is(":checked");
   			//if(isChecked) {
   			//	$.alert("默认地址不能删除");
   			//	return;
   			//}
   			$.confirm('你确定要删除吗?', function () {
          		$.ajax({
          			url:"json/address!delete.action",
          			type:"post",
          			data:{id:addressid},
          			success:function(data){
          				var dat = eval("("+data+")");
          				if(dat.success) {
          					ele.parent().parent().remove();
          				}
          			}
          		
          		});
          	});
  		});
  		
  	
   	</script>  
</body>
</html>