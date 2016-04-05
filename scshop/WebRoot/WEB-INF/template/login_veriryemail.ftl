<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>邮箱验证</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
</head>
<html>
<body>
    <!-- 控制验证码只能输入6位数 -->
    <script type="text/javascript">
    </script>
    	<#if error==1>
    		alert("验证错误，请检查验证码是否过期或者重新发送");
    		<#else>
    		alert("验证成功");
    	<#if>
    
    <!-- 控制验证码只能输入6位数 -->
</body>
</html>